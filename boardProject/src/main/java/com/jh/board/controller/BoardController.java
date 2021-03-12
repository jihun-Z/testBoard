package com.jh.board.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jh.board.model.service.BoardService;
import com.jh.board.model.vo.Account;
import com.jh.board.model.vo.Custom;

@Controller
public class BoardController {
	
	@Autowired
	BoardService service;
	
	//등록
	@ResponseBody
	@RequestMapping("/customerEnllo.do")
	public int enrollMember(Custom custom,Account account,String lang) {
		int result;
		String lan=lang.trim();
		if(custom.getBusiNum().equals("")||custom.getBusiNum()==null||
				custom.getCustom().equals("")||custom.getCustom()==null) {
			return result=0;
		}
		if(lan.equals("한국어")) {
			custom.setCountry_kor(lan);
		}else {
			custom.setCountry_eng(lan);
		}
		System.out.println(""+lan);
		
		 result=service.enrollMember(custom,account);
		return result;
	}
	//검색
	@ResponseBody
	@RequestMapping("/searchMember.do")
	public List<Map> searchCustom(Custom custom){
		System.out.println("custom"+custom);
		
		List<Map> map=service.searchCustom(custom);
		
		return map;
	}
	//searchCustominfo
	@ResponseBody
	@RequestMapping("/selectMemberinfo.do")
	public Custom selectCustomInfo(String busiNum) {
		System.out.println("b");
		
		Custom custom=service.selectCustomInfo(busiNum);
		return custom;
	}
	
	//update
	@ResponseBody
	@RequestMapping("/updateMember.do")
	public int updateCustom(Custom custom,Account account,String lang) {
		int result;

			
			if(!lang.equals("한국어")) {
				custom.setCountry_eng(lang);
			}else {
				custom.setCountry_kor(lang);
			}
			System.out.println(custom);
			 result=service.updateCustom(custom,account);
		
		
		return result;
	}
	
	//delete
	@ResponseBody
	@RequestMapping("/deleteMember.do")
	public List<Map> deleteCustom(String busiNum) {
		List<Map> map= null;
		int result=service.deleteCustom(busiNum);
		if(result == 1) {
			map=service.selectCustomList(busiNum);
		}
		return map;
	}
	//팝업창
	@RequestMapping("/popup.do")
	public String popup() {
		return "popup";
	}
	
}
