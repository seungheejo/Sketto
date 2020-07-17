package org.jsp.board;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

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
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Inject
	MemberDAO memdao;

	@Autowired
	PjmemlistDAO pjmemlistdao;

	@Inject
	ProjectDAO pjdao;

	@RequestMapping(value = "/", method = { RequestMethod.GET, RequestMethod.POST })
	public String home(Locale locale, HttpSession session, Model model, String skettoLoginId, String skettoLoginPW) {

		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		// ID, 비밀번호가 null이 아닌경우에 로그인
		if (skettoLoginId != null && skettoLoginPW != null) {

			Member mem = new Member(skettoLoginId, skettoLoginPW, null);

			Member loginMem = memdao.login(mem);

			if (loginMem.getId().equals(skettoLoginId) && loginMem.getPw().equals(skettoLoginPW)) {
				session.setAttribute("loginid", skettoLoginId);
			}
		}

		model.addAttribute("serverTime", formattedDate);

		String id = (String) session.getAttribute("loginid");

		// 세션에 id가 있는경우
		if (id != null) {
			// 세션에 저장된 id를 확인하기 위해
			logger.debug("세션에 저장된 아이디 : " + id);

			Member mem = memdao.selectMember(id);

			ArrayList<Project> list = null;

			// id에 따라 진행중인 프로젝트 정보를 가져옴
			list = pjdao.selectPjlistJoined(id);

			model.addAttribute("member", mem);
			model.addAttribute("list", list);
		}

		session.removeAttribute("pjno");

		return "home";
	}

	// 에러 페이지로 이동
	@RequestMapping("error")
	public String error() {

		return "error";
	}

}
