package org.jsp.board.service;

import java.util.ArrayList;

import org.jsp.board.vo.Project;

public interface ProjectMapper {


	public int insertProject(Project pj);
	
	public Project selectAProject(int pjno); 
	
	public ArrayList<Project> selectPjlistLeader(String id);
	
	public ArrayList<Project> selectPjlistJoined(String id);
	
	public ArrayList<Project> selectPjlist(String id);
	
	public int updateProject(Project pj);
	
	public int deleteProject(Project pj);
	
}
