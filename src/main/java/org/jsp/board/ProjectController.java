package org.jsp.board;

import java.util.ArrayList;
import java.util.Calendar;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.jsp.board.service.MemberDAO;
import org.jsp.board.service.PjmemlistDAO;
import org.jsp.board.service.ProjectDAO;
import org.jsp.board.vo.Member;
import org.jsp.board.vo.Pjmemlist;
import org.jsp.board.vo.Project;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ProjectController {

	Calendar cal = Calendar.getInstance();

	@Inject
	ProjectDAO pdao;

	@Autowired
	MemberDAO memdao;

	@Autowired
	PjmemlistDAO pjmemlistdao;

	private static final Logger logger = LoggerFactory.getLogger(ProjectController.class);

	// プロジェクトの始まる日を今日に設定
	@SuppressWarnings("deprecation")
	@RequestMapping(value = "/goproject", method = RequestMethod.GET)
	public String goproject(Model m, HttpSession ss) {
		ss.removeAttribute("pjno");
		String id = (String) ss.getAttribute("loginid");
		Member mem = memdao.selectMember(id);
		m.addAttribute("member", mem);

		int year = cal.get(cal.YEAR);
		int intmonth = cal.get(cal.MONTH) + 1;
		int intdate = cal.get(cal.DATE);

		logger.info("위에서 받아온 값" + intdate);

		String month = "" + intmonth;
		if (intmonth <= 9) {
			month = "0" + intmonth;
		}
		String date = "" + intdate;
		if (intdate <= 9) {
			date = "0" + intdate;
		}

		String today = year + "-" + month + "-" + date;

		System.out.println("today : " + today);
		m.addAttribute("today", today);

		return "/jsp/project/projectCreate";
	}

	@RequestMapping(value = "project", method = RequestMethod.GET)
	public String projectdetail(int pjno, Model m, HttpSession ss) {
		// セッションにあるプロジェクトのpjnoを削除
		ss.removeAttribute("pjno");
		ss.removeAttribute("mt");

		// プロジェクトのメンバーが違い場合はメインページに移動
		String id = (String) ss.getAttribute("loginid");
		Project thispj = pdao.selectAProject(pjno);
		ArrayList<Pjmemlist> pjmemlist = pjmemlistdao.pjmemlist(pjno);
		logger.debug("" + pjmemlist);
		System.out.println(pjmemlist);

		for (int i = 0; i < pjmemlist.size(); i++) {
			if (pjmemlist.get(i).getId().equals(id)) {
				m.addAttribute("pj", thispj);
				m.addAttribute("pjno", pjno);
				ss.setAttribute("pjno", pjno);
				return "/jsp/project/projectDetail";
			}
		}
		return "redirect:./";
	}

	// プロジェクトを管理するためにプロジェクトの情報を伝える
	@RequestMapping(value = "/gopjmanage", method = RequestMethod.GET)
	public String gopjmanage(int pjno, Model m, HttpSession ss) {
		String id = (String) ss.getAttribute("loginid");
		Project thispj = pdao.selectAProject(pjno);
		ArrayList<Pjmemlist> pjmemlist = pjmemlistdao.pjmemlist(pjno);
		logger.debug("pjemelist" + pjmemlist);
		System.out.println(pjmemlist);
		m.addAttribute("pjmemlist", pjmemlist);

		for (int i = 0; i < pjmemlist.size(); i++) {
			if (pjmemlist.get(i).getId().equals(id)) {
				m.addAttribute("pj", thispj);
				return "/jsp/project/projectManager";
			}
		}
		return "redirect:./";

	}

	// プロジェクトを作る
	@RequestMapping(value = "/createpj", method = RequestMethod.POST)
	public String createpj(Project pj, Model m, HttpSession ss) {
		logger.info("{}", pj);

		int result = 0;
		try {
			result = pdao.insertProject(pj);
			if (result == 0) {
				logger.info("실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		// プロジェクトの招待画面に移動部分
		Project thispj;

		ArrayList<Project> pjlist = pdao.selectPjlistLeader(pj.getId());
		System.out.println(pjlist);
		for (int i = 0; i < pjlist.size(); i++) {
			if (pj.getPjtitle().equals(pjlist.get(i).getPjtitle())) {
				thispj = pdao.selectAProject(pjlist.get(i).getPjno());
				logger.debug("잘 불러 왔나 : ", thispj);

				// リーダーもプロジェクトメンバーのリストに追加しなければならない
				Pjmemlist leader = new Pjmemlist(pj.getId(), pjlist.get(i).getPjno());
				try {
					result = pjmemlistdao.insertPjmem(leader);
					if (result == 0) {
						logger.info("실패");
						;
					}
				} catch (Exception e) {
					e.printStackTrace();
				}

				m.addAttribute("pj", thispj);
				ss.setAttribute("pjno", thispj.getPjno());
				return "/jsp/project/projectInvite";
			}
		}

		return "/jsp/project/projectInvite";
	}

	// プロジェクトをアップデート
	@RequestMapping(value = "/updatepj", method = RequestMethod.POST)
	public String updatepj(Project pj, Model m, HttpSession ss) {
		logger.info("{}", pj);

		int result = 0;
		try {
			result = pdao.updateProject(pj);
			if (result == 0) {
				logger.info("실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		m.addAttribute("pj", pj);
		return "redirect:/project?pjno=" + pj.getPjno();

	}

	// プロジェクトの内容を見る
	@RequestMapping(value = "project", method = RequestMethod.POST)
	public String projectdetailPost(Model m, HttpSession ss) {
		int pjno = (int) ss.getAttribute("pjno");
		Project thispj = pdao.selectAProject(pjno);
		m.addAttribute("pj", thispj);
		m.addAttribute("pjno", pjno);
		ss.setAttribute("pjno", pjno);

		return "/jsp/project/projectDetail";
	}

	// プロジェクトを削除
	@RequestMapping(value = "/deletepj", method = RequestMethod.POST)
	public String deletepj(HttpSession ss) {
		int pjno = (int) ss.getAttribute("pjno");
		Project thispj = pdao.selectAProject(pjno);
		pdao.deleteProject(thispj);

		return "redirect:./";
	}

}
