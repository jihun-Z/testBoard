package com.jh.board.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jh.board.model.dao.BoardDao;
import com.jh.board.model.vo.Account;
import com.jh.board.model.vo.Custom;

@Service
public class BoardServiceIm implements BoardService {

	
	@Autowired
	SqlSession session;
	@Autowired
	BoardDao dao;
	
	
	@Override
	public int enrollMember(Custom custom, Account account) {
		// TODO Auto-generated method stub
		int result=dao.enrollMember(session,custom);
		if(result>0) {
			result=dao.insertAccount(session,account);
		}
		return result;
	}


	@Override
	public List<Map> searchCustom(Custom custom) {
		// TODO Auto-generated method stub
		return dao.searchCustom(session,custom);
	}


	@Override
	public int updateCustom(Custom custom, Account account) {
		// TODO Auto-generated method stub
		int result=dao.updateCustom(session,custom);
		if(result>0) {
			result=dao.updateAccount(session,account);
		}
		return result;
	}


	@Override
	public int deleteCustom(String busiNum) {
		// TODO Auto-generated method stub
		int result=dao.deleteAccount(session,busiNum);
		if(result>0) {
			result=dao.deleteCustom(session,busiNum);
		}
		return result;
	}


	@Override
	public Custom selectCustomInfo(String busiNum) {
		// TODO Auto-generated method stub
		return dao.selectCustomInfo(session,busiNum);
	}
}
