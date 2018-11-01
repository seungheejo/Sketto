package org.jsp.board.service;

import java.util.ArrayList;

import org.jsp.board.vo.Plan;

public interface PlanMapper {

	public int insertPlan(Plan plan);

	public ArrayList<Plan> selectPlanList(int pjno);

	public ArrayList<Plan> selectPlanListById(Plan plan);

	public ArrayList<Plan> selectPlanListByPriority(int pjno);

	public Plan selectPlan(int pno);

	public int deletePlan(int pno);

	public int updatePlan(Plan plan);

}
