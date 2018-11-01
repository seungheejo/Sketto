package org.jsp.board.service;

import java.util.ArrayList;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.jsp.board.vo.CheckBox;
import org.springframework.stereotype.Repository;

@Repository
public class CheckBoxDAO implements CheckBoxMapper {

	@Inject
	private SqlSession session;
	
	@Override
	public int insertCheckBox(CheckBox ch) {
		return session.getMapper(CheckBoxMapper.class).insertCheckBox(ch);
	}

	@Override
	public ArrayList<CheckBox> selectCheckBoxList(int pno) {
		return session.getMapper(CheckBoxMapper.class).selectCheckBoxList(pno);
	}

	@Override
	public int updateCheckBox(CheckBox ch) {
		return session.getMapper(CheckBoxMapper.class).updateCheckBox(ch);
	}

	@Override
	public int deleteCheckBox(int cno) {
		return session.getMapper(CheckBoxMapper.class).deleteCheckBox(cno);
	}

	@Override
	public CheckBox selectCheckBox(int cno) {
		return session.getMapper(CheckBoxMapper.class).selectCheckBox(cno);
	}

}
