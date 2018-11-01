package org.jsp.board;

import java.util.ArrayList;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.jsp.board.service.PjinvitedlistDAO;
import org.jsp.board.service.PjmemlistDAO;
import org.jsp.board.service.ProjectDAO;
import org.jsp.board.vo.Pjinvitedlist;
import org.jsp.board.vo.Pjmemlist;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MailController {

	@Autowired
	private JavaMailSenderImpl javaMailSenderImpl;

	@Inject
	PjinvitedlistDAO ivtdao;

	@Autowired
	ProjectDAO pjdao;

	@Autowired
	PjmemlistDAO pjmemlistdao;

	@RequestMapping(value = "/gosendmail", method = RequestMethod.GET)
	public String goSendMail() {

		return "/sendmail";
	}

	@RequestMapping(value = "/sendmail", method = RequestMethod.GET)
	public String SendMail() throws Exception {

		// テストのためのメール
		SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
		simpleMailMessage.setFrom("skettomanager@gmail.com");
		simpleMailMessage.setTo("thggbtmb@gmail.com");
		simpleMailMessage.setSubject("Sketto 테스트 메일");
		simpleMailMessage.setText("Sketto: 본 메일은 테스트 메일입니다. \n http://10.10.8.186:8888/board/");
		javaMailSenderImpl.send(simpleMailMessage);
		System.out.println("메일 발송");

		return "redirect:gosendmail";
	}

	// プロジェクトの招待メール送信
	@ResponseBody
	@RequestMapping(value = "/sendinvitedmail", method = RequestMethod.POST, produces = "application/json")
	public Boolean SendMailTest(int pjno, String id) throws Exception {
		// 一般テキストメール
		SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
		simpleMailMessage.setFrom("skettomanager@gmail.com");
		simpleMailMessage.setTo(id);
		simpleMailMessage.setSubject("Sketto 초대 메일");
		simpleMailMessage
				.setText("Sketto에서 초대 메일이 발송되었습니다. 아래의 링크로 접속해 가입을 진행해 주세요. \n http://10.10.8.186:8888/board/");
		javaMailSenderImpl.send(simpleMailMessage);
		System.out.println("Sketto 초대메일 발송");
		Pjinvitedlist ivtlist = new Pjinvitedlist(id, pjno);
		System.out.println(ivtlist);

		ArrayList<Pjinvitedlist> pjivtlist = ivtdao.invitedList(pjno);

		boolean okToInvite = true;

		// 招待が成功しなかった場合
		for (Pjinvitedlist toinvite : pjivtlist) {
			if (toinvite.getId().equals(id)) {
				okToInvite = false;
				System.out.println("초대 리스트에 새로 저장은 하지 않음");
			}
		}

		// 招待が成功した場合リストに保存
		if (okToInvite) {
			ivtdao.inviteToPj(ivtlist);
			System.out.println("invitedlist에 새로 저장");
		}

		return true;
	}

	@ResponseBody
	@RequestMapping(value = "insertintopj", method = RequestMethod.POST, produces = "application/json")
	public Boolean insertintopj(int pjno, String id, HttpSession session) {

		ArrayList<Pjmemlist> pjmemnow = pjmemlistdao.pjmemlist(pjno);

		boolean okToInsert = true;

		// もうプロジェクトのメンバーである場合
		for (Pjmemlist pjm : pjmemnow) {
			if (pjm.getId().equals(id)) {
				okToInsert = false;
			}
		}

		// プロジェクトのメンバーでない場合プロジェクトに招待
		if (okToInsert) {

			Pjmemlist pjmem = new Pjmemlist(id, pjno);
			pjmemlistdao.insertPjmem(pjmem);
			Pjinvitedlist invitedmem = new Pjinvitedlist(id, pjno);
			ivtdao.inviteToPj(invitedmem);

			SimpleMailMessage simpleMailMessage = new SimpleMailMessage();

			simpleMailMessage.setFrom("skettomanager@gmail.com");
			simpleMailMessage.setTo(id);
			simpleMailMessage.setSubject("Sketto 프로젝트 초대 메일");
			simpleMailMessage.setText(session.getAttribute("loginname") + "(" + session.getAttribute("loginid") + ")"
					+ "님께서 프로젝트로 귀하를 초대하였습니다. \n프로젝트 진행은 Sketto! \n\nhttp://10.10.8.186:8888/board/");
			javaMailSenderImpl.send(simpleMailMessage);
			System.out.println("프로젝트 메일 발송");

			System.out.println(pjno + "번 프로젝트에 " + id + "를 초대");
		}

		return true;
	}

}
