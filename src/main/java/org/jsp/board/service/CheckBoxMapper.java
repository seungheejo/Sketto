package org.jsp.board.service;

import java.util.ArrayList;

import org.jsp.board.vo.CheckBox;

public interface CheckBoxMapper {

	public int insertCheckBox(CheckBox ch);

	public CheckBox selectCheckBox(int cno);

	public ArrayList<CheckBox> selectCheckBoxList(int pno);

	public int updateCheckBox(CheckBox ch);

	public int deleteCheckBox(int cno);

}
