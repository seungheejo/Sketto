package org.jsp.board;

import java.util.ArrayList;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.jsp.board.service.MemberDAO;
import org.jsp.board.service.PjmemlistDAO;
import org.jsp.board.service.ProjectDAO;
import org.jsp.board.vo.Member;
import org.jsp.board.vo.Project;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class DashBoardController {

	@Autowired
	MemberDAO memdao;

	@Autowired
	PjmemlistDAO pjmemlistdao;

	@Inject
	ProjectDAO pjdao;

	private static final Logger logger = LoggerFactory.getLogger(DashBoardController.class);

	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public String godashboard(Model m, HttpSession ss) {

		String id = (String) ss.getAttribute("loginid");

		// 세션에 저장된 id를 확인하기 위해
		logger.debug("세션에 저장된 아이디 : " + id);
		Member mem = memdao.selectMember(id);

		ArrayList<Project> list = null;

		// id에 따라 진행중인 프로젝트 정보를 가져옴
		list = pjdao.selectPjlistJoined(id);

		m.addAttribute("member", mem);
		m.addAttribute("list", list);

		return "/jsp/project/dashboard";
	}

}
