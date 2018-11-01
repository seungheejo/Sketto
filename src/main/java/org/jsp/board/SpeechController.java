package org.jsp.board;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jsp.board.service.ChatlibraryDAO;
import org.jsp.board.service.MeetingDAO;
import org.jsp.board.service.MeetingmemlistDAO;
import org.jsp.board.service.PjmemlistDAO;
import org.jsp.board.service.ProjectDAO;
import org.jsp.board.util.FileService;
import org.jsp.board.vo.Chatlibrary;
import org.jsp.board.vo.Meeting;
import org.jsp.board.vo.Meetingmemlist;
import org.jsp.board.vo.Pjmemlist;
import org.jsp.board.vo.Project;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class SpeechController {

	@Autowired
	private JavaMailSenderImpl javaMailSenderImpl;

	@Autowired
	ProjectDAO pjdao;

	@Autowired
	MeetingmemlistDAO mmldao;

	@Autowired
	PjmemlistDAO memlistdao;

	@Autowired
	MeetingDAO mtdao;

	@Autowired
	ChatlibraryDAO chdao;

	@RequestMapping(value = "speechDemo", method = RequestMethod.GET)
	public String speech() {
		return "/speech";
	}

	// 会議の作るおよび選択フォームに移動(リーダー限定)
	@RequestMapping(value = "meetingForm", method = RequestMethod.GET)
	public String meetingForm(Model model, HttpSession session) {
		session.removeAttribute("plist");
		session.removeAttribute("mt");

		ArrayList<Meeting> pjMeetingList = new ArrayList<>();
		int pjno = (int) session.getAttribute("pjno");
		Project pj = pjdao.selectAProject(pjno);

		session.setAttribute("pj", pj);
		pjMeetingList = mtdao.selectPjMeetings(pjno);
		model.addAttribute("pjmlist", pjMeetingList);

		return "/meetingForm";
	}

	// 会議の作る(リーダー限定)
	@RequestMapping(value = "makemeeting", method = RequestMethod.POST)
	public String makeMeeting(Meeting mt, HttpSession session, Model model) {
		File originalFile, folder;
		FileOutputStream fos = null;
		session.removeAttribute("errormsg");

		if (mtdao.selectMeetingTitle(mt) == null) {
			mtdao.insertMeeting(mt); // <selectKey>タグを使用してmeetingnoを自動に持って来ることができる
			mt = mtdao.selectOneMeeting(mt);
			System.out.println("회의 생성: " + mt);

			// 会議録ファイル作る及びデータベースに会議録ファイルの名前(経路を含む)保存
			try {
				folder = new File("C:\\SkettoMeeting");
				if (!folder.exists()) {
					folder.mkdirs();
					System.out.println("폴더 생성");
				}
				originalFile = new File("C:/SkettoMeeting/SkettoMeetingText" + mt.getPjno() + "_" + mt.getMeetingno()
						+ "_" + mt.getMeetingdate() + ".txt");
				fos = new FileOutputStream(originalFile);

				if (!originalFile.exists()) {
					originalFile.createNewFile();
					System.out.println("파일 생성");
				}

				if (mt.getMeetingtext() == null) {
					mt.setMeetingtext(originalFile.toString());
					mtdao.updateMeetingtext(mt);
				}

			} catch (IOException e) {
				e.printStackTrace();
			}

		} else {
			String errormsg = "중복되지 않는 새로운 회의명을 입력해 주세요.";
			session.setAttribute("errormsg", errormsg);
		}

		return "redirect:meetingForm";
	}

	// アラートとメールでのお知らせは30分、10分、1分前に発送
	@ResponseBody
	@RequestMapping(value = "alarm30101", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	public String alarm30(HttpSession session) {
		String alarmMsg = null;

		Calendar calCurrent = Calendar.getInstance();
		java.util.Date dateCurrent = calCurrent.getTime();
		String today = (new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss").format(dateCurrent));
		System.out.println(today);
		int pjno = (int) session.getAttribute("pjno");
		ArrayList<Meeting> pjmtlist = mtdao.selectPjMeetings(pjno);
		ArrayList<Pjmemlist> pjmemlist = memlistdao.pjmemlist(pjno);

		for (Meeting m : pjmtlist) {
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss");
			Date toDate = new Date();
			try {
				toDate = transFormat.parse(m.getMeetingdate());
			} catch (ParseException e) {
				e.printStackTrace();
			}

			System.out.println(dateCurrent + "  " + toDate);

			long diff = toDate.getTime() - dateCurrent.getTime();
			long diffToMinute = diff / 60000;

			if (diffToMinute == 30) {
				// ウェブではアラートが表示される
				alarmMsg = m.getMeetingtitle() + " 회의가 약 30분 남았습니다.";
				System.out.println(alarmMsg);

				// メールにお知らせが届く
				for (Pjmemlist pjmem : pjmemlist) {
					SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
					simpleMailMessage.setFrom("skettomanager@gmail.com");
					simpleMailMessage.setTo(pjmem.getId());
					simpleMailMessage.setSubject("Sketto 회의 참여 알람: " + m.getMeetingtitle());
					simpleMailMessage
							.setText("Sketto에서 회의 참여 알람이 도착했습니다. 로그인하여 회의에 참여해 주세요. \n http://10.10.8.186:8888/board/");
					javaMailSenderImpl.send(simpleMailMessage);
				}

			}

			if (diffToMinute == 10) {
				alarmMsg = m.getMeetingtitle() + " 회의가 약 10분 남았습니다. 준비해주세요.";
				System.out.println(alarmMsg);

				for (Pjmemlist pjmem : pjmemlist) {
					SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
					simpleMailMessage.setFrom("skettomanager@gmail.com");
					simpleMailMessage.setTo(pjmem.getId());
					simpleMailMessage.setSubject("Sketto 회의 참여 알람: " + m.getMeetingtitle());
					simpleMailMessage
							.setText("Sketto에서 회의 참여 알람이 도착했습니다. 로그인하여 회의에 참여해 주세요. \n http://10.10.8.186:8888/board/");
					javaMailSenderImpl.send(simpleMailMessage);
				}
			}

			if (diffToMinute == 1) {
				alarmMsg = m.getMeetingtitle() + " 회의가 약 1분 남았습니다. 서둘러서 접속해주세요.";
				System.out.println(alarmMsg);

				for (Pjmemlist pjmem : pjmemlist) {
					SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
					simpleMailMessage.setFrom("skettomanager@gmail.com");
					simpleMailMessage.setTo(pjmem.getId());
					simpleMailMessage.setSubject("Sketto 회의 참여 알람: " + m.getMeetingtitle());
					simpleMailMessage
							.setText("Sketto에서 회의 참여 알람이 도착했습니다. 로그인하여 회의에 참여해 주세요. \n http://10.10.8.186:8888/board/");
					javaMailSenderImpl.send(simpleMailMessage);
				}
			}
		}

		return alarmMsg;
	}

	// 選択した会議に移動(リーダー限定)
	@RequestMapping(value = "speech", method = RequestMethod.GET)
	public String startSpeech(Meeting mt, Model model, HttpSession session) {
		mt = mtdao.selectOneMeeting(mt);
		System.out.println("회의 입장: " + mt);
		session.setAttribute("mt", mt);

		Meetingmemlist mml = new Meetingmemlist(mt.getMeetingno(), (String) session.getAttribute("loginid"),
				(String) session.getAttribute("loginname"));
		mmldao.deleteMml(mml);
		mmldao.insertMml(mml);
		ArrayList<String> plistFormal = mmldao.selectNames(mt.getMeetingno());

		ArrayList<String> plist = new ArrayList<>();
		for (int i = 0; i < plistFormal.size(); i++) {
			if (!plist.contains(plistFormal.get(i))) {
				plist.add(plistFormal.get(i));
			}
		}
		System.out.println(plist);
		session.setAttribute("plist", plist);

		return "speech";
	}

	// 音声をテキストに変換
	@ResponseBody
	@RequestMapping(value = "voice", method = RequestMethod.GET)
	public String voice(Meeting mt, String voice, Model model, HttpSession session) {
		File originalFile, folder;
		FileOutputStream fos = null;

		if (voice.isEmpty()) {
			voice += ">>텍스트 재현 불안";
		}

		System.out.println(voice);

		mt = (Meeting) session.getAttribute("mt");

		try {
			folder = new File("C:\\SkettoMeeting");
			if (!folder.exists()) {
				folder.mkdirs();
				System.out.println("폴더 생성");
			}
			originalFile = new File("C:/SkettoMeeting/SkettoMeetingText" + mt.getPjno() + "_" + mt.getMeetingno() + "_"
					+ mt.getMeetingdate() + ".txt");
			fos = new FileOutputStream(originalFile, true);

			if (!originalFile.exists()) {
				originalFile.createNewFile();
				System.out.println("파일 생성");
			}

			if (mt.getMeetingtext() == null) {
				mt.setMeetingtext(originalFile.toString());
				mtdao.updateMeetingtext(mt);
			}

			byte[] meetingTextInBytes = voice.getBytes("UTF-8");

			fos.write(meetingTextInBytes);
			fos.flush();
			fos.close();

		} catch (IOException e) {
			e.printStackTrace();
		}

		return voice;
	}

	// ファイルのアップロード経路
	final String uploadPath = "C:\\SkettoMeeting\\filesUploaded";
	ArrayList<Chatlibrary> downloadsList = new ArrayList<>();

	// ファイルをアップロード
	@ResponseBody
	@RequestMapping(value = "/uploadFile")
	public Chatlibrary uploadFile(Chatlibrary ch, MultipartFile upload, HttpSession session, Model model) {

		/*
		 * 添付ファイルがある場合は指定された経路に保存し 
		 * 原本ファイル名と保存されたファイル名をchオブジェクトに設定
		 */
		if (!upload.isEmpty()) {
			String savedfile = FileService.saveFile(upload, uploadPath);
			ch.setOriginalfile(upload.getOriginalFilename());
			ch.setSavedfile(savedfile);
		} else {
			System.out.println("파일 전송 실패");
		}
		chdao.insertFile(ch);
		ch = chdao.selectOneFile(ch);
		System.out.println("파일 업로드: " + ch);

		return ch;
	}

	// ダウンロードボタンをクリックすると新しいウィンドウが開く
	@RequestMapping(value = "download", method = RequestMethod.GET)
	public String download(Model model, HttpSession session) {
		Meeting mt = (Meeting) session.getAttribute("mt");
		Chatlibrary ch = new Chatlibrary();

		ch.setMeetingno(mt.getMeetingno());
		downloadsList = chdao.selectAllFiles(ch);

		model.addAttribute("dlist", downloadsList);
		return "/download";
	}

	// ファイルをダウンロード
	@RequestMapping(value = "/downloadFile", method = RequestMethod.GET)
	public Chatlibrary downloadFile(Chatlibrary filenumOnly, int filenum, Model model, HttpServletResponse response) {
		filenumOnly.setFilenum(filenum);
		Chatlibrary ch = chdao.selectOneFile(filenumOnly);

		// 元のファイル名を持って来る
		String originalfile = new String(ch.getOriginalfile());
		try {
			response.setHeader("Content-Disposition",
					" attachment;filename=" + URLEncoder.encode(originalfile, "UTF-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		// 保存されたファイルの経路
		String fullpath = uploadPath + "\\" + ch.getSavedfile();

		FileInputStream filein = null;
		ServletOutputStream fileout = null;

		try {
			filein = new FileInputStream(fullpath);
			fileout = response.getOutputStream();

			FileCopyUtils.copy(filein, fileout);

			filein.close();
			fileout.close();

			System.out.println("파일 다운로드: " + ch);
		} catch (IOException e) {
			e.printStackTrace();
		}

		return null;
	}

	// 会議録のダウンロード
	@RequestMapping(value = "/hitherto", method = RequestMethod.GET)
	public Meeting downloadHitherto(Meeting mt, Model model, HttpSession session, HttpServletResponse response) {
		mt = (Meeting) session.getAttribute("mt");

		String originalfile = new String(mt.getMeetingtext().replaceAll("\\\\", "//").split("//")[2]);
		System.out.println("기존 회의록 다운로드: " + originalfile);
		try {
			response.setHeader("Content-Disposition",
					" attachment;filename=" + URLEncoder.encode(originalfile, "UTF-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		String fullpath = mt.getMeetingtext();

		FileInputStream filein = null;
		ServletOutputStream fileout = null;

		try {
			filein = new FileInputStream(fullpath);
			fileout = response.getOutputStream();

			FileCopyUtils.copy(filein, fileout);

			filein.close();
			fileout.close();

		} catch (IOException e) {
			e.printStackTrace();
		}

		return null;
	}

	// 会議のテキストを保存
	@RequestMapping(value = "saveMeetingText", method = RequestMethod.GET)
	public String saveMeetingText(Meeting mt, HttpSession session) {
		Meeting mtt = (Meeting) session.getAttribute("mt");

		Meetingmemlist mml = new Meetingmemlist(mtt.getMeetingno(), (String) session.getAttribute("loginid"), null);

		mmldao.deleteMml(mml);

		session.removeAttribute("plist");
		session.removeAttribute("mt");

		return "redirect:/meetingForm";
	}

}
