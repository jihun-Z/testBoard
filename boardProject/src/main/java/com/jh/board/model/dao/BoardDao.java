package com.jh.board.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.jh.board.model.vo.Account;
import com.jh.board.model.vo.Custom;

public interface BoardDao {

	int enrollMember(SqlSession session, Custom custom);

	int insertAccount(SqlSession session, Account account);

	int deleteAccount(SqlSession session, String busiNum);

	int deleteCustom(SqlSession session, String busiNum);

	Custom selectCustomInfo(SqlSession session, String busiNum);

	int updateCustom(SqlSession session, Custom custom);

	int updateAccount(SqlSession session, Account account);

	List<Map> searchCustom(SqlSession session, Custom custom);

	List<Map> selectCustomList(String busiNum, SqlSession session);

}
