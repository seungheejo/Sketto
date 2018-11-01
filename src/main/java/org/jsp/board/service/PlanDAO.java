package org.jsp.board.service;

import java.util.ArrayList;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.jsp.board.vo.Plan;
import org.springframework.stereotype.Repository;

@Repository
public class PlanDAO implements PlanMapper {

	@Inject
	SqlSession session;

	@Override
	public int insertPlan(Plan plan) {
		return session.getMapper(PlanMapper.class).insertPlan(plan);
	}

	@Override
	public ArrayList<Plan> selectPlanList(int pjno) {
		return session.getMapper(PlanMapper.class).selectPlanList(pjno);
	}

	@Override
	public ArrayList<Plan> selectPlanListById(Plan plan) {
		return session.getMapper(PlanMapper.class).selectPlanListById(plan);
	}

	@Override
	public ArrayList<Plan> selectPlanListByPriority(int pjno) {
		return session.getMapper(PlanMapper.class).selectPlanListByPriority(pjno);
	}

	@Override
	public Plan selectPlan(int pno) {
		return session.getMapper(PlanMapper.class).selectPlan(pno);
	}

	@Override
	public int deletePlan(int pno) {
		return session.getMapper(PlanMapper.class).deletePlan(pno);
	}

	@Override
	public int updatePlan(Plan plan) {
		return session.getMapper(PlanMapper.class).updatePlan(plan);
	}
}
