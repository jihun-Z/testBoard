package com.jh.board.model.vo;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Component
public class Account {
    private String busiNum;
    private String factory;
    private String tradeBank;
    private String accountNum;
	
	
	
}
