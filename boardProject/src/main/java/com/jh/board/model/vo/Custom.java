package com.jh.board.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Component

public class Custom {
	
	private String busiNum;
	private String custom;
	private String nickname;
	private String ceo;
	private String charge_Person;
	private String busi_condition;
	private String item;
	private String postNum;
	private String addr1;
	private String addr2;
	private String tel;
	private String fax;
	private String homepage;
	private String co_YN;
	private String foreign_YN;
	private String tax_YN;
	private String country_eng;
	private String country_kor;
	private String special_relation;
	private String trade_stop;
	//json으로 수정화면으로 바뀌게하려면 JSon포맷을 해줘야한다.
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")

	private Date contractPeriod_S;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
	private Date contractPeriod_E;
	private String regi_info_person;
	private Date regi_info_day;
	private String modi_info_person;
	private Date modi_info_day;
	
	private Account account;

	

}
