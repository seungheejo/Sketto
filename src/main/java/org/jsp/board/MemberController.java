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
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MemberController {

	@Autowired
	PjinvitedlistDAO ivtdao;

	@Autowired
	MemberDAO memdao;

	@Autowired
	ProjectDAO pdao;

	@Autowired
	PjmemlistDAO pjmemlistdao;

	private static final Logger logger = LoggerFactory.getLogger(ProjectController.class);

	// メンバー登録ページに移動
	@RequestMapping("/joinform")
	public String gojoinform(Model m) {

		Member member = new Member();
		m.addAttribute("member", member);

		return "/jsp/member/JoinForm";
	}

	// idがもう存在するか確認
	@ResponseBody
	@RequestMapping(value = "idcheck", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	public String idcheck(String id) {

		String msg = null;
		System.out.println(id);

		if (memdao.checkId(id) != null) {
			msg = id + "는(은) 이미 존재하는 아이디입니다.";
			System.out.println("ID 중복체크 - 중복");
		} else {
			msg = id + "는(은) 사용할 수 있습니다.";
			System.out.println("ID 중복체크 - 사용 가능");
		}

		return msg;
	}

	// ログインフォームに移動
	@RequestMapping(value = "/skettologin")
	public String gologinForm(HttpSession session) {

		session.removeAttribute("errormsg");

		return "/jsp/member/skettoLogin";
	}

	// ログアウト
	@RequestMapping("/logout")
	public String logout(HttpSession session) {

		session.removeAttribute("loginid");
		session.removeAttribute("loginname");
		session.removeAttribute("pjno");
		session.removeAttribute("mt");
		session.removeAttribute("plist");

		return "redirect:./";
	}

	// メンバー登録
	@RequestMapping(value = "/joinmember", method = RequestMethod.POST)
	public String joincustomer(Member mem, Model model) {

		memdao.joinMember(mem);
		logger.debug("member: ", mem);

		ArrayList<Pjinvitedlist> hadinvited = null;

		try {

			hadinvited = ivtdao.pjnolistById(mem.getId());

		} catch (Exception e) {

			e.printStackTrace();

		}

		System.out.println("초대되었던 프로젝트: " + hadinvited);

		// 招待されたプロジェクトがある場合
		if (hadinvited != null) {
			for (Pjinvitedlist invitedpjno : hadinvited) {

				logger.debug("mem.getId(): " + mem.getId());
				logger.debug("invitedpjno.getPjno(): " + invitedpjno.getPjno());

				Pjmemlist pjmem = new Pjmemlist(mem.getId(), invitedpjno.getPjno());
				pjmemlistdao.insertPjmem(pjmem);
			}
		}

		logger.debug("초대되었던 프로젝트", hadinvited);

		return "redirect:./";
	}

	// ログイン
	@RequestMapping(value = "logintoSketto", method = RequestMethod.POST)
	public String logintoSketto(String id, String password, Model m, HttpSession session) {

		Member member = memdao.selectMember(id);
		System.out.println(member);

		if (member != null && member.getPw().equals(password)) {
			session.setAttribute("loginid", member.getId());
			session.setAttribute("loginname", member.getName());
			session.removeAttribute("errormsg");
		} else {
			session.setAttribute("errormsg", "ID 또는 비밀번호가 틀립니다.");
		}

		return "redirect:/";
	}

	@RequestMapping(value = "/memberlist", method = RequestMethod.POST)
	@ResponseBody
	public ArrayList<Member> memberlist(String searchText, HttpSession ss) {

		int pjno = (int) ss.getAttribute("pjno");
		logger.debug("pjno" + pjno);

		System.out.println(searchText);

		ArrayList<Member> memlist = memdao.MemberList(searchText);
		logger.debug("memlist" + memlist);

		ArrayList<Pjmemlist> pjmemlist = pjmemlistdao.pjmemlist(pjno);
		logger.debug("pjmemlist" + pjmemlist);

		// memlist - pjmemlist
		// 全てのメンバーの中でプロジェクトに参加中のメンバー以外のメンバー
		for (int i = 0; i < memlist.size(); i++) {
			for (int j = 0; j < pjmemlist.size(); j++) {
				if (memlist.get(i).getId().equals(pjmemlist.get(j).getId())) {
					memlist.remove(memlist.get(i));
				}
			}
		}

		logger.debug("차집합 memlist: " + memlist);

		return memlist;
	}

}
