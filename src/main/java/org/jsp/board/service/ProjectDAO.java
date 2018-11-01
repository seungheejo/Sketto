package org.jsp.board.service;

import java.util.ArrayList;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.jsp.board.vo.Project;
import org.springframework.stereotype.Repository;

@Repository
public class ProjectDAO implements ProjectMapper {

	@Inject
	SqlSession session;

	@Override
	public int insertProject(Project pj) {
		return session.getMapper(ProjectMapper.class).insertProject(pj);
	}

	@Override
	public Project selectAProject(int pjno) {
		return session.getMapper(ProjectMapper.class).selectAProject(pjno);
	}

	@Override
	public ArrayList<Project> selectPjlistLeader(String id) {
		return session.getMapper(ProjectMapper.class).selectPjlistLeader(id);
	}

	@Override
	public ArrayList<Project> selectPjlistJoined(String id) {
		return session.getMapper(ProjectMapper.class).selectPjlistJoined(id);
	}

	@Override
	public ArrayList<Project> selectPjlist(String id) {
		return session.getMapper(ProjectMapper.class).selectPjlist(id);
	}

	@Override
	public int updateProject(Project pj) {
		return session.getMapper(ProjectMapper.class).updateProject(pj);
	}

	@Override
	public int deleteProject(Project pj) {
		return session.getMapper(ProjectMapper.class).deleteProject(pj);
	}

}
