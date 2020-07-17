package org.jsp.board;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.jsp.board.service.MemberDAO;
import org.jsp.board.service.PjinvitedlistDAO;
import org.jsp.board.service.PjmemlistDAO;
import org.jsp.board.service.ProjectDAO;
import org.jsp.board.vo.Member;
import org.jsp.board.vo.Pjinvitedlist;
import org.jsp.board.vo.Pjmemlist;
import org.jsp.board.vo.Project;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class PjinviteController {

	@Autowired
	PjinvitedlistDAO ivtdao;

	@Autowired
	MemberDAO memdao;

	@Autowired
	ProjectDAO pdao;

	@Autowired
	PjmemlistDAO pjmemlistdao;

	private static final Logger logger = LoggerFactory.getLogger(ProjectController.class);

	@RequestMapping(value = "/invitetopj", method = RequestMethod.POST)
	public String invitedtopj(int pjno, Model m, HttpSession ss) {

		// 이 프로젝트의 리더만 접근가능
		String id = (String) ss.getAttribute("loginid");
		Project thispj = pdao.selectAProject(pjno);
		logger.debug("", thispj);

		if (!id.equals(thispj.getId())) {
			return "redirect:./";
		}

		// 프로젝트 초대화면으로 이동
		m.addAttribute("pj", pdao);

		return "/jsp/project/projectInvite";
	}

	@RequestMapping(value = "membermanager", method = RequestMethod.GET)
	public String membermamger(Model m, HttpSession ss) {

		int pjno = (int) ss.getAttribute("pjno");

		Project pj = pdao.selectAProject(pjno);
		m.addAttribute("pj", pj);

		ArrayList<Member> memberlist = null;

		try {
			memberlist = memdao.AllMember();
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(memberlist);

		ArrayList<Pjinvitedlist> invitedlist = null;

		try {
			invitedlist = ivtdao.invitedList(pjno);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(invitedlist);

		/*
		 * 프로젝트멤버와 프로젝트에 초대된 멤버의 id가 같을경우 checklist에 이 id를 넣음
		 */
		ArrayList<String> checklist = new ArrayList<>();

		try {
			for (int i = 0; i < memberlist.size(); i++) {
				for (int j = 0; j < invitedlist.size(); j++) {
					if (memberlist.get(i).getId().equals(invitedlist.get(j).getId())) {
						System.out.println("멤버리스트 아이디 : " + memberlist.get(i).getId());
						System.out.println("초대리스트 아이디 : " + invitedlist.get(j).getId());
						String id = memberlist.get(i).getId();
						System.out.println(id);
						checklist.add(id);
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(checklist);

		ArrayList<Pjmemlist> pjmemlist = pjmemlistdao.pjmemlist(pjno);

		m.addAttribute("invitedlist", invitedlist);
		m.addAttribute("memberlist", memberlist);
		m.addAttribute("checklist", checklist);
		m.addAttribute("pjmemlist", pjmemlist);

		return "/jsp/project/memberManager";
	}

	// 프로젝트에 초대된 멤버를 가져옴
	@RequestMapping(value = "/invitedlist", method = RequestMethod.POST)
	@ResponseBody
	public ArrayList<Pjinvitedlist> invitedlist(int pjno) {

		ArrayList<Pjinvitedlist> list = ivtdao.invitedList(pjno);

		for (Pjinvitedlist invitedlist : list) {
			System.out.println(invitedlist);
		}

		return list;
	}

	// 프로젝트 리더가 멤버를 제명
	@RequestMapping(value = "deletePjmem", method = RequestMethod.POST)
	public String deletedmem(int pjno, String id, HttpSession ss, Model m) {

		logger.debug("pjno" + pjno);
		logger.debug("id" + id);

		Pjmemlist pjmem = new Pjmemlist(id, pjno);

		try {
			pjmemlistdao.deletePjmem(pjmem);
		} catch (Exception e) {
			e.printStackTrace();
		}

		ArrayList<Pjmemlist> pjmemlist = pjmemlistdao.pjmemlist(pjno);

		for (Pjmemlist pjmemlistobj : pjmemlist) {
			System.out.println(pjmemlistobj);
		}

		Project pj = pdao.selectAProject(pjno);

		m.addAttribute("pjmemlist", pjmemlist);
		m.addAttribute("pj", pj);

		return "redirect:/gopjmanage?pjno=" + pj.getPjno();
	}

}
