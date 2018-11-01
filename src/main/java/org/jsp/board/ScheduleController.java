package org.jsp.board;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.jsp.board.service.CheckBoxDAO;
import org.jsp.board.service.MemberDAO;
import org.jsp.board.service.PjmemlistDAO;
import org.jsp.board.service.PlanDAO;
import org.jsp.board.service.ProjectDAO;
import org.jsp.board.vo.*;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Controller
public class ScheduleController {

	@Inject
	PlanDAO planDAO;

	@Inject
	ProjectDAO pjDAO;

	@Inject
	PjmemlistDAO pjmDAO;

	@Inject
	MemberDAO mDAO;

	@Inject
	CheckBoxDAO checkboxDAO;

	// プランを作る
	@ResponseBody
	@RequestMapping(value = "/insertJ", method = RequestMethod.GET)
	public List<Plan> reloadJ(Locale locale, Model model, String jsonString) {

		System.out.println("======================");
		System.out.println(jsonString);
		System.out.println("======================");

		// schedule.jspからプランの情報をajaxで送って受ける
		// 'jsonString' : JSON.stringify(planInsJSON)
		// jsonStringを受けて構文解析(parsing)
		JsonParser parser = new JsonParser();
		Object obj = parser.parse(jsonString);
		JsonObject jsonObj = (JsonObject) obj;

		Gson gson = new Gson();

		String id = gson.toJson(jsonObj.get("id"));

		int pNO = Integer.parseInt(String.valueOf(jsonObj.get("PNO")));
		String planName = String.valueOf(jsonObj.get("planName"));
		String pStartDate = String.valueOf(jsonObj.get("pStartDate"));
		String pEndDate = String.valueOf(jsonObj.get("pEndDate"));

		System.out.println(pStartDate);
		System.out.println(pEndDate);

		SimpleDateFormat format = new SimpleDateFormat("\"yyyy-MM-dd-HH-mm-ss\"");
		SimpleDateFormat sqlformat = new SimpleDateFormat("yyyy/MM/dd, HH:mm");

		Date parsed = null;
		String theDateString = null;

		// デートをsqlフォーマットに適用するために変換
		try {
			parsed = format.parse(pStartDate);
			theDateString = sqlformat.format(parsed);
			pStartDate = theDateString;
		} catch (ParseException e) {
			e.printStackTrace();
		}
		System.out.println("sql에 맞춰 변환 된 값 : " + pStartDate);

		try {
			parsed = format.parse(pEndDate);
			theDateString = sqlformat.format(parsed);
			pEndDate = theDateString;
		} catch (ParseException e) {
			e.printStackTrace();
		}
		System.out.println("sql에 맞춰 변환 된 값 : " + pEndDate);

		int pJNo = Integer.parseInt(String.valueOf(jsonObj.get("PJNo")));
		int priority = Integer.parseInt(String.valueOf(jsonObj.get("Priority")).replaceAll("\"", ""));
		double progress = Double.parseDouble(String.valueOf(jsonObj.get("Progress")));
		String color = String.valueOf(jsonObj.get("color"));

		Plan newPlanIns = new Plan(pNO, planName, pStartDate, pEndDate, pJNo, id, priority, progress, color);

		System.out.println(planDAO.insertPlan(newPlanIns));

		ArrayList<Plan> planList = new ArrayList<Plan>();
		planList = planDAO.selectPlanList(pJNo);

		model.addAttribute("planList", planList);

		return planList;
	}

	// プランの情報にアクセス
	@RequestMapping(value = "/goplan", method = RequestMethod.GET)
	public String goJ(Locale locale, Model model, HttpSession session, int pjno) {

		ArrayList<Plan> planList = new ArrayList<Plan>();
		ArrayList<Pjmemlist> pjmList = new ArrayList<>();
		ArrayList<Member> memberList = new ArrayList<>();

		// pjnoでプランの情報をデータベースから持って来る
		pjmList = pjmDAO.pjmemlist(pjno);

		for (Pjmemlist pjmember : pjmList) {
			Member memberIns = mDAO.selectMember(pjmember.getId());
			memberList.add(memberIns);
		}

		planList = planDAO.selectPlanList(pjno);
		System.out.println(planList);

		model.addAttribute("pjno", pjno);
		model.addAttribute("pj", pjDAO.selectAProject(pjno));
		model.addAttribute("planList", planList);
		model.addAttribute("memberList", memberList);

		return "schedule";
	}

	// プランをカレンダーで見る
	@RequestMapping(value = "/goplanCalendar", method = RequestMethod.GET)
	public String goplanCalendar(Locale locale, Model model, int pjno) {

		ArrayList<Plan> planList = new ArrayList<Plan>();

		planList = planDAO.selectPlanList(pjno);
		System.out.println(planList);

		model.addAttribute("pjNO", pjno);
		model.addAttribute("pj", pjDAO.selectAProject(pjno));
		model.addAttribute("planList", planList);

		return "schedule_calendar";
	}

	// プランをガントチャートで見る
	@RequestMapping(value = "/goplanGant", method = RequestMethod.GET)
	public String goplanGant(Locale locale, Model model, int pjno) {

		ArrayList<Plan> planList = new ArrayList<Plan>();
		ArrayList<Pjmemlist> pjmList = new ArrayList<>();
		ArrayList<Member> memberList = new ArrayList<>();

		pjmList = pjmDAO.pjmemlist(pjno);

		for (Pjmemlist pjmember : pjmList) {
			Member memberIns = mDAO.selectMember(pjmember.getId());
			memberList.add(memberIns);
		}

		planList = planDAO.selectPlanList(pjno);
		System.out.println(planList);

		model.addAttribute("pjNO", pjno);
		model.addAttribute("pj", pjDAO.selectAProject(pjno));
		model.addAttribute("planList", planList);

		return "schedule_gant";
	}

	// idによってプランをガントチャートで見る
	@RequestMapping(value = "/goplanGantById", method = RequestMethod.GET)
	public String goplanGantById(Locale locale, Model model, int pjno, String loginname) {

		ArrayList<Plan> planList = new ArrayList<Plan>();
		ArrayList<Pjmemlist> pjmList = new ArrayList<>();
		ArrayList<Member> memberList = new ArrayList<>();

		pjmList = pjmDAO.pjmemlist(pjno);

		for (Pjmemlist pjmember : pjmList) {
			Member memberIns = mDAO.selectMember(pjmember.getId());
			memberList.add(memberIns);
		}

		Plan planIns = new Plan(0, null, null, null, pjno, loginname, 0, 0, null);

		planList = planDAO.selectPlanListById(planIns);
		System.out.println(planList);

		model.addAttribute("pjNO", pjno);
		model.addAttribute("pj", pjDAO.selectAProject(pjno));
		model.addAttribute("planList", planList);

		return "schedule_gant";
	}

	// 優先度を適用するガントチャート
	@RequestMapping(value = "/goplanGantByPriority", method = RequestMethod.GET)
	public String goplanGantByPriority(Locale locale, Model model, int pjno) {

		ArrayList<Plan> planList = new ArrayList<Plan>();
		ArrayList<Pjmemlist> pjmList = new ArrayList<>();
		ArrayList<Member> memberList = new ArrayList<>();

		pjmList = pjmDAO.pjmemlist(pjno);

		for (Pjmemlist pjmember : pjmList) {
			Member memberIns = mDAO.selectMember(pjmember.getId());
			memberList.add(memberIns);
		}

		planList = planDAO.selectPlanListByPriority(pjno);

		System.out.println(planList);

		model.addAttribute("pjNO", pjno);
		model.addAttribute("pj", pjDAO.selectAProject(pjno));
		model.addAttribute("planList", planList);

		return "schedule_gant";
	}

	// 今日のスケジュールを時間別に確認
	@RequestMapping(value = "/myScheduleToday", method = RequestMethod.GET)
	public String schedule_myScheduleToday(Locale locale, Model model, int pjno) {

		ArrayList<Plan> planList = new ArrayList<Plan>();

		planList = planDAO.selectPlanList(pjno);
		System.out.println(planList);

		model.addAttribute("pjNO", pjno);
		model.addAttribute("pj", pjDAO.selectAProject(pjno));
		model.addAttribute("planList", planList);

		return "schedule_myScheduleToday";
	}

	/*
	 * スケジュール棒グラフをクリックすると
	 * そのスケジュールの内容をデータベースから持ってきてウィンドウで見る
	 */
	@RequestMapping(value = "/getThePlan", method = RequestMethod.GET)
	public String getThePlan(Model model, String pno) {

		Plan plan = new Plan();

		ArrayList<CheckBox> checkboxList = new ArrayList<>();

		/*
		 * データベースからcheckboxの情報を持ってきて引用符マーク(”)を削除し 
		 * nullを空白(" ")に見せるためにcheckboxListTextを作る
		 */
		ArrayList<String> checkboxListText = new ArrayList<>();
		ArrayList<Pjmemlist> pjmList = new ArrayList<>();
		ArrayList<Member> memberList = new ArrayList<>();

		plan = planDAO.selectPlan(Integer.parseInt(pno));
		int pjNO = plan.getPjno();

		checkboxList = checkboxDAO.selectCheckBoxList(Integer.parseInt(pno));
		pjmList = pjmDAO.pjmemlist(pjNO);

		String text = "";

		for (int i = 0; i < checkboxList.size(); i++) {

			if (checkboxList.get(i).getText().equals("null")) {

				text = " ";
				checkboxListText.add(text);

			} else {

				text = checkboxList.get(i).getText().replaceAll("\"", "");
				checkboxListText.add(text);
			}

		}

		for (Pjmemlist pjmember : pjmList) {
			Member memberIns = mDAO.selectMember(pjmember.getId());
			memberList.add(memberIns);
		}

		System.out.println("=====================================");
		System.out.println("====================" + memberList);
		System.out.println("=====================================");

		String planname = plan.getPlanname().replace("\"", "");
		String color = plan.getColor().replace("\"", "");

		plan = new Plan(plan.getPno(), planname, plan.getPstartdate(), plan.getPenddate(), plan.getPjno(), plan.getId(),
				plan.getPriority(), plan.getProgress(), color);

		model.addAttribute("checkboxListText", checkboxListText);
		model.addAttribute("checkboxList", checkboxList);
		model.addAttribute("memberList", memberList);
		model.addAttribute("plan", plan);

		return "getThePlan";

	}

	// プランをアップデート
	@ResponseBody
	@RequestMapping(value = "/updatePlan", method = RequestMethod.GET)
	public String updatePlan(Locale locale, Model model, String jsonString) {

		System.out.println("======업데이트테스트======");
		System.out.println(jsonString);
		System.out.println("=======================");

		JsonParser parser = new JsonParser();
		Object obj = parser.parse(jsonString);
		JsonObject jsonObj = (JsonObject) obj;

		Gson gson = new Gson();

		String id = gson.toJson(jsonObj.get("id")).replaceAll("\"", "");
		int pno = Integer.parseInt(String.valueOf(jsonObj.get("pno")).replace("\"", ""));
		String planname = String.valueOf(jsonObj.get("planname"));
		String pStartDate = String.valueOf(jsonObj.get("pstartdate"));
		String pEndDate = String.valueOf(jsonObj.get("penddate"));

		System.out.println(pStartDate);
		System.out.println(pEndDate);

		SimpleDateFormat format = new SimpleDateFormat("\"yyyy-MM-dd-HH-mm-ss\"");
		SimpleDateFormat sqlformat = new SimpleDateFormat("yyyy/MM/dd, HH:mm");
		Date parsed = null;
		String theDateString = null;

		try {
			parsed = format.parse(pStartDate);
			theDateString = sqlformat.format(parsed);
			pStartDate = theDateString;
		} catch (ParseException e) {
			e.printStackTrace();
		}
		System.out.println("sql에 맞춰 변환 된 값 : " + pStartDate);

		try {
			parsed = format.parse(pEndDate);
			theDateString = sqlformat.format(parsed);
			pEndDate = theDateString;
		} catch (ParseException e) {
			e.printStackTrace();
		}
		System.out.println("sql에 맞춰 변환 된 값 : " + pEndDate);

		/*
		 * integerなのでajaxのJSONで送って受けた時 
		 * データのそばにある引用符マーク(”)を削除のために
		 */
		int pjno = Integer.parseInt(String.valueOf(jsonObj.get("pjno")).replaceAll("\"", ""));
		int priority = Integer.parseInt(String.valueOf(jsonObj.get("priority")).replace("\"", ""));
		double progress = Double.parseDouble(String.valueOf(jsonObj.get("progress")).replaceAll("\"", ""));
		String color = String.valueOf(jsonObj.get("color"));

		// 新しいアップデートされたリストを持って来る
		Plan newPlanIns = new Plan(pno, planname, pStartDate, pEndDate, pjno, id, priority, progress, color);

		System.out.println(newPlanIns);
		System.out.println(planDAO.updatePlan(newPlanIns));

		return "goplan";
	}

	// プランを削除
	@ResponseBody
	@RequestMapping(value = "/deletePlan", method = RequestMethod.GET)
	public String deletePlan(Locale locale, Model model, String pno) {

		planDAO.deletePlan(Integer.parseInt(String.valueOf(pno).replace("\"", "")));

		return "goplan";
	}

	/*
	 * チェックボックスの情報を持って来て データベースに入れる
	 */
	@ResponseBody
	@RequestMapping(value = "/insertCheckBox", method = RequestMethod.GET)
	public String insertCheckBox(Locale locale, Model model, String jsonString) {

		System.out.println("=insertCheckBox=====================");
		System.out.println(jsonString);
		System.out.println("============insertCheckBox==========");

		JsonParser parser = new JsonParser();
		Object obj = parser.parse(jsonString);
		JsonArray jsonArr = (JsonArray) obj;

		int cno = 7777;
		int pno = 0;
		int pjno = 0;
		String text = "";
		int checked = 0;

		CheckBox cb = null;

		for (int i = 0; i < jsonArr.size(); i++) {

			try {

				JsonObject jsonObject = (JsonObject) jsonArr.get(i);

				cno = Integer.parseInt(String.valueOf(jsonObject.get("cno")).replaceAll("\"", ""));
				pno = Integer.parseInt(String.valueOf(jsonObject.get("pno")).replaceAll("\"", ""));
				pjno = Integer.parseInt(String.valueOf(jsonObject.get("pjno")).replaceAll("\"", ""));
				text = String.valueOf(jsonObject.get("text")).replaceAll("\"", "");
				checked = Integer.parseInt(String.valueOf(jsonObject.get("checked")).replaceAll("\"", ""));

				System.out.println("cno : " + cno);

			} catch (Exception e) {

				System.out.println(e + "안되는데");
			}

			cb = new CheckBox(cno, pno, pjno, text, checked);

			if (checkboxDAO.selectCheckBox(cno) == null) {
				if (cb.getCno() == 0) {
					System.out.println("checkbox to insert : " + cb);
					checkboxDAO.insertCheckBox(cb);
				}
			} else if (cb.getText().equals("") || cb.getText() == null) {
				System.out.println("checkbox to delete : " + cb);
				checkboxDAO.deleteCheckBox(cno);
			} else {
				System.out.println("checkbox to update : " + cb);
				checkboxDAO.updateCheckBox(cb);
			}

			if (i == jsonArr.size() - 1) {
				return null;
			}
		}

		return null;
	}

}
