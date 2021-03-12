package com.jh.board.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jh.board.model.service.BoardService;
import com.jh.board.model.vo.Account;
import com.jh.board.model.vo.Custom;

@Repository
public class BoardDaoIm implements BoardDao {
	
	@Autowired
	BoardService service;

	@Override
	public int enrollMember(SqlSession session, Custom custom) {
		// TODO Auto-generated method stub
		return session.insert("custom.enrollMember",custom);
	}

	@Override
	public int insertAccount(SqlSession session, Account account) {
		// TODO Auto-generated method stub
		return session.insert("custom.insertAccount",account);
	}

	@Override
	public int deleteAccount(SqlSession session, String busiNum) {
		// TODO Auto-generated method stub
		return session.delete("custom.deleteAccount",busiNum);
	}

	@Override
	public int deleteCustom(SqlSession session, String busiNum) {
		// TODO Auto-generated method stub
		return session.delete("custom.deleteCustom",busiNum);
	}

	@Override
	public Custom selectCustomInfo(SqlSession session, String busiNum) {
		// TODO Auto-generated method stub
		return session.selectOne("custom.selectCustomInfo",busiNum);
	}

	@Override
	public int updateCustom(SqlSession session, Custom custom) {
		// TODO Auto-generated method stub
		return session.update("custom.updateCustom",custom);
	}

	@Override
	public int updateAccount(SqlSession session, Account account) {
		// TODO Auto-generated method stub
		return session.update("custom.updateAccount",account);
	}

	@Override
	public List<Map> searchCustom(SqlSession session, Custom custom) {
		// TODO Auto-generated method stub
		return session.selectList("custom.searchCustom",custom);
	}

	@Override
	public List<Map> selectCustomList(String busiNum, SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList("custom.selectCustomList",busiNum);
	}
	
	

}
