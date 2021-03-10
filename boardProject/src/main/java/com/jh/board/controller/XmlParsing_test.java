package com.jh.board.controller;


import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class XmlParsing_test {
	//tag값의 정보를 가져오는 메소드
	
	private static String getTagValue(String tag,Element element) {
		NodeList nlList= element.getElementsByTagName(tag).item(0).getChildNodes();
	
	Node nNvalue=(Node)nlList.item(0);
	if(nNvalue == null) return null;
	
	return nNvalue.getNodeValue();
	}
	
	public static void main(String[] args) {
		int page= 20; // 조회할 데이터수  
		int pageNo=1;// 페이지번호
		String mode="K";//법인구분 K:코스닥 Y:유가,N(코넥스),E(기타) 
		String name="B";//대문자  A:정기공시 B:주요사항보고 C:발행공시 D:지분공시 E:기타공시 F:외부감사관련 G:펀드공시 H:자산 유동화 I:거래소공시 j:공정위공시
		String startDate="20210310";// 검색 시작일
		String endDate="20210310";// 검색 마지막일
		String userKey="6c833ac72efbe6f05bac4c1226a70d1682645561";
		
		try {
			while(true) {
				//parsing할 url지정 (api키 포함)
				String url="https://opendart.fss.or.kr/api/list.xml?crtfc_key="+userKey+"&bgn_de="+startDate+"&end_de="+endDate+"&pblntf_ty="+name+"&corp_cls="+mode+"&page_no="+pageNo+"&page_count="+page;
				
				DocumentBuilderFactory dbFactoty=DocumentBuilderFactory.newInstance();
				DocumentBuilder dBuilder=dbFactoty.newDocumentBuilder();
				Document doc=dBuilder.parse(url);
				
				// root tag
				
				doc.getDocumentElement().normalize();
				System.out.println("Root element:"+doc.getDocumentElement().getNodeName());
				
				//파싱할 tag
				NodeList nList=doc.getElementsByTagName("list");
				//System.out.println("파싱할 리스트 수 : "+nList.getLength());
				
				for(int temp=0; temp < nList.getLength();temp++) {
					Node nNode= nList.item(temp);
					if(nNode.getNodeType() == Node.ELEMENT_NODE) {
						Element eElement =(Element)nNode;
						System.out.println("##########");
						System.out.println("회사코드: " + getTagValue("corp_code", eElement));
						System.out.println("회사 명  : " + getTagValue("corp_name", eElement));
						System.out.println("증권 코드 : " + getTagValue("stock_code", eElement));
						System.out.println("리포트 제목  : " + getTagValue("report_nm", eElement));
						System.out.println("리포트 넘버  : " + getTagValue("rcept_no", eElement));
						System.out.println("회사명   : " + getTagValue("flr_nm", eElement));
						System.out.println("공시 날짜  : " + getTagValue("rcept_dt", eElement));
					}// if end
				}//for end
				System.out.println();
				page += 1;
				System.out.println("page number:"+page);
				if(page > 12) {
					break;
				}
			}//while end
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
