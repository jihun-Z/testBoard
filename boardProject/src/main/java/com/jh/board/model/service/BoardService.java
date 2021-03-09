package com.jh.board.model.service;

import java.util.List;
import java.util.Map;

import com.jh.board.model.vo.Account;
import com.jh.board.model.vo.Custom;


public interface BoardService {

	int enrollMember(Custom custom, Account account);

	List<Map> searchCustom(Custom custom);

	int updateCustom(Custom custom, Account account);

	int deleteCustom(String busiNum);

	Custom selectCustomInfo(String busiNum);
	


}
