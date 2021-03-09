<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
     <c:set var="path" value="${pageContext.request.contextPath }"/>

     
     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>실기 test 거래처 관리</title>
<link rel="stylesheet" href="${path }/resources/css/style.css"/>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="${path }/resources/js/jquery-3.5.1.min.js"></script>
<!-- jQuery 기본 js파일 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script> 
<!-- jQuery UI 라이브러리 js파일 -->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script> 
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</head>
<body>
     <c:set var="map" value="${map}"/>
<%-- <div>111111111<c:out value="${map.busiNum}"/><c:out value="${map.nickname}"/></div> --%>

<div class="search-List-container">
		<div class="search-box">
				사업자 번호:<input type="text" id="searchMember" name="busiNum" ></br>
				거래처명: <input type="text" id="searchname" name="custom">
					<button type="button" id="search-btn" onclick="searchBtn(event)">검색</button>
		</div>
	
	
	
	<div class="List-container">
		
		<table>
				<thead>
						<th style="width:200px; height: 30px; text-align: center;">사업자 번호</th>
						<th style="width:200px; height: 30px; text-align: center;">거래처명 </th>
				</thead>
				<tbody id="append">
					
					
				</tbody>
		</table>
	
	
	</div>


</div>




<form  name="updateform" >
	<div class="form-box">
		<div class="button-container">
			<button type="button" class="btn" id="enrollBtn" onclick="enlloBtn();">등록</button>
			<button type="button" id="updateBtn" style="display:none;" onclick="updatefn();">수정</button>
			<button type="button"  onclick="deleteFn();">삭제</button>
		
		</div>
	  <div id="updateContainer">
	  
		
		<div class="input-container" >
			
			사업자 번호:<input type="text" class="input-text" id="busiNum" name="busiNum" value="${custom.BUSI_NUM }" placeholder="사업자 번호  ex) 111-11-111"/>
			
			거래처명:<input type="text" class="input-text" id="custom" name="custom" placeholder="거래처명"/>
			약칭 :<input type="text" class="input-text" id="nickname" name="nickname" placeholder="약칭"/>
			대표자:<input type="text" class="input-text" id="ceo" name="ceo" placeholder="대표자"/>
			담당자:<input type="text" class="input-text" id="charge_Person" name="charge_Person" placeholder="담당자"/>
			업태: <input type="text" class="input-text" id="busi_condition" name="busi_condition" placeholder="업태"/>
			종목: <input type="text" class="input-text" id="item" name="item" placeholder="종목"/>
			
			<div class="post-container">
				우편번호:<input type="text" class="input-text" id="postcode" name="postNum" placeholder="우편번호"/>
				<span><input type="button" onclick="fn_address()" value="검색"/></span>
				주소:	<input type="text" class="input-text" id="addr1" name="addr1" placeholder="상세주소1"/>
				주소2:<input type="text" class="input-text"  id="addr2" name="addr2" placeholder="상세주소 2"/>
			
			</div>
			<div class="number-container">
			
			전화번호:<input type="text" class="input-text" id="tel" name="tel" placeholder="전화번호 ex:02XXXXYYYY"/><br>
			팩스: &nbsp;&nbsp;&nbsp;&nbsp;	<input type="text" id="fax" class="input-text" name="fax" placeholder="팩스번호 ex:070XXXXYYYY"/><br>
			홈페이지:<input type="email" class="input-text" id="homePage" name="homepage" placeholder="홈페이지"/><br>
			</div>
		</div>	
			<div class="co-container">
				<div class="co-box">
				<h3>법인여부</h3>
				
					<input type="radio" class="input-text"  id="co_Y" name="co_YN" value="y"/>법인
					<input type="radio" class="input-text" id="co_N" name="co_YN" value="n"/>개인
		
				</div>
			<div class="foreing-container">
			<h3>해외여부</h3>
				<span><input type="radio" class="foreign_Y" id="foreign_Y" name="foreign_YN" value="y"/>국내</span>
				<span><input type="radio" class="foreign_N" id="foreign_N" name="foreign_YN" value="n"/>해외</span>
			
			</div>
			<select name="tax_YN" id="tax_YN">
				<option value="y">과세</option>
				<option value="n">면세</option>
			</select>
			<h5>국가</h5>
			<input type="text" class="lang" name="lang" id="lang"/>
			<button type="button"  id="langSearch">검색</button>
			
			<select  name="langs" id="langs" style="display:none;">
				<option value="한국어">한국어</option>
				<option value="영어">영어</option>
				<option value="일본어">일본어</option>
				<option value="중국어">중국어</option>
				<option value="스페인어">스페인어</option>
			</select>
			
			
			
			<input type="checkbox" class="special_relation" name="special_relation" /><label for="special_relation" class="">특수관계자</label>&nbsp;
			 <input type="checkbox" class="trade_stop" name="trade_stop" /><label for="special_relation" class="">거래중지</label>&nbsp;
			<div class="date_container">
			<h4>계약기간</h4>
				   <input type="date" class="input--text" id="contractPeriod_S" name="contractPeriod_S" placeholder="시작일" id="startDate" onclick="fn_datepicker();" onchange="fn_triggerEnd(event)"  autocomplete="off" enabled required/>
				   <input type="date" class="input--text" id="contractPeriod_E" name="contractPeriod_E" placeholder="마감일" id="endDate"  autocomplete="off" disabled required>
			
			</div>
				<div class="person-container">
						<input type="text" id="modi_info_person" name="modi_info_person" placeholder="등록인"/>
						<input type="text" id="regi_info_person" name="regi_info_person" placeholder="변경인"/>
				
				</div>
				
		</div>
		
		<h2>거래처 거래정보</h2>
		<div class="table-box">
			<table>
				<thead>
					<tr>
						<th>사무소</th>
						<th>은  행 </th>
						<th>계좌 정보</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" id="factory" name="factory" placeholder="사무소이름"></td>
						<td><input type="text" id="tradeBank" name="tradeBank" placeholder="은행이름"></td>
						<td><input type="text" id="accountNum" name="accountNum" placeholder="계좌번호"></td>
					</tr>
					
				</tbody>
				
			</table>
			
		
		</div>
		
	</div>
		
	</div>
</form>
<script type="text/javascript">

//사업자 검색 기능 

function searchBtn(e){
	const searchMember=$("#searchMember").val().trim();
	const searchName=$("#searchname").val().trim();
/* 	if($("#searchMember").val()===""){
		alert("사업자 번호를써주세요 ");
		$("#searchMember").focus();
		return false;
	}
	if($("#searchname").val() ===""){
		alert("거래처명를써주세요 ");
		$("#searchname").focus();
		return false;
	} */
	if(searchMember != null || searchName != null){
		
		$.ajax({
			type:'get',
			url:'${path}/searchMember.do',
			data:{
				busiNum:searchMember,
				custom:searchName
			},
			dataType:"json",
			success:function(data){
				 let out="";
				
				for(let i=0;i<data.length;i++){
					out +="<tr>";
					out +="<td id='AcNum' style='width:200px; height: 30px; text-align: center;' onclick='selectCustom("+data[i].BUSI_NUM+",event);'>"+data[i].BUSI_NUM+"</td>";
					out +="<td style='width:200px; height: 30px; text-align: center;' onclick='selectCustom("+data[i].CUSTOM+");'>"+data[i].CUSTOM+"</td>";
					out +="</tr>";	
				console.log(""+data[i].BUSI_NUM);
				}
				$("#append").html(out); 
			},
			erro:function(){
				alert("updateError");
			}
		});
	}else{
		alert(" 사업자 번호 또는 거래처명을 입력하셔야합니다.");
	}
		
}; 



//우편 번호 다음 api
function fn_address(){
	
    new daum.Postcode({
        oncomplete: function(data) {
        	//e.preventDefault();
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
        let address=data.address;
        // 각 주소의 노출 규칙에 따라 주소를 조합한다.
        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
        var addr = ''; // 주소 변수
        var extraAddr = ''; // 참고항목 변수

        //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
        if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
            addr = data.roadAddress;
        } else { // 사용자가 지번 주소를 선택했을 경우(J)
            addr = data.jibunAddress;
        }

        // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
        if(data.userSelectedType === 'R'){
            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
                extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("addr1").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("addr2").focus();
       			 }
       		 }
      }).open();
};

//체크박스 값

  $(document).on('click',".special_relation",function(){
	if($("input:checkbox[name:special_relation]").is(":checked") === true){
		$(".special_relation").val("y");
	}else{
		$(".special_relation").val("n");
	}
});

$(document).on('click',".trade_stop",function(){
	if($("input:checkbox[name:trade_stop]").is(":checked") === true){
		$(".trade_stop").val("y");
	}else{
		$(".trade_stop").val("n");
	}
});  

function checkedFn(){
	if($("input:checkbox[name:trade_stop]").is(":checked") === true){
		$(".trade_stop").val("y");
	}else{
		$(".trade_stop").val("n");
	}
	if($("input:checkbox[name:special_relation]").is(":checked") === true){
		$(".special_relation").val("y");
	}else{
		$(".special_relation").val("n");
	}
};

		


	$("#tax_YN").change(function(){
		 let tax=$(this).val();
	});
	$(document).on('click','#langSearch',function(){
		console.log("안");
		$("#langs").toggle();
		$("#langs").change(function(){
			let lang=$(this).val();
			$("#lang").val(lang);
		});
		
	});

/* db에서 as */
$(document).ready(function(){
	$("#enrollBtn").click(function(){
		//alert("등록되었습니다.");
	});
});




//updateBtn 
function updatefn(number){
	const form=$("form[name=updateform]").serialize();
	console.log(form);
	$.ajax({
		url:"${path}/updateMember.do",
		type:"post",
		dataType:'json',
		data:form,
		success:function(result){
			if(result === 1){
				$("#updateBtn").hide();
				alert("수정되었습니다.");
			}else{
				alert("실패하였습니다.")
			}
		}
	});
}

//enlloBtn 
function enlloBtn(){
		if($("#busiNum").val()===""){
				alert("사업자 번호를써주세요 ");
				$("#busiNum").focus();
				return false;
			}
			if($("#custom").val() ===""){
				alert("거래처 명를써주세요 ");
				$("#busiNum").focus();
				return false;
			} 
			if($("#contractPeriod_S").val ===null){
				alert("날짜를 입력해주세요.");
				$("#contractPeriod_S").focus();
				return false;
			}
			if($("#contractPeriod_E").val ===null){
				alert("날짜를 입력해주세요.");
				$("#contractPeriod_E").focus();
				return false;
			}
	const form=$("form[name=updateform]").serialize();
	console.log(form);
	$.ajax({
		url:"${path}/customerEnllo.do",
		type:"post",
		dataType:'json',
		data:form,
		success:function(result){
			if(result === 1){
				alert("등록 되었습니다.");
			}else{
				alert("실패하였습니다.")
			}
		}
	});
}

//delete
function deleteFn(){
	let busiNum=$("#busiNum").val();
	$.ajax({
		url:"${path}/deleteMember.do",
		type:"get",
		contentType:"application/json",
		dataType:'json',
		data:{
			busiNum:busiNum
		},
		success:function(result){
			if(result === 1){
				alert("삭제 되었습니다.");
			}else{
				alert("실패하였습니다.")
			}
		}
	});
	
}		

function selectCustom(busiNum,e){
	let number=$(e.target).text();
	console.log("number"+number);
 	$.ajax({
		type:'get',
		url:'${path}/selectMemberinfo.do',
		data:{
			busiNum:number
		},
		contentType: "application/json;",
        dataType: "json",
		success:function(data){
			console.log(data);
			let ff="";	
				$("#updateBtn").show();
				$("#enrollBtn").hide();
		//for(let i in data){
				let value=data;
			//for(let i=0; i<data.length;i++){
				ff +='<div class="input-container" >';
				ff +='사업자 번호:<input type="text" class="input-text" id="busiNum" name="busiNum" value="'+value.busiNum +'"/>';
				ff +='거래처명:<input type="text" class="input-text" id="custom" name="custom" value="'+value.custom +'"/>';
				ff +='약칭 :<input type="text" class="input-text" id="nickname" name="nickname" value="'+value.nickname +'"/>';
				ff +='대표자:<input type="text" class="input-text" id="ceo" name="ceo" value="'+value.ceo +'"/>';
				ff +='담당자:<input type="text" class="input-text" id="charge_Person" name="charge_Person" value="'+value.charge_Person +'"/>';
				ff +='업태: <input type="text" class="input-text" id="busi_condition" name="busi_condition" value="'+value.busi_condition +'"/>';
				ff +='종목: <input type="text" class="input-text" id="item" name="item" value="'+value.item +'"/>';
				ff +='<div class="post-container">';
				ff +='우편번호:<input type="text" class="input-text" id="postcode" name="postNum" value="'+value.postNum +'"/>';
				ff +='<span><input type="button" onclick="fn_address()" value="검색"/></span>';
				ff +='주소:	<input type="text" class="input-text" id="addr1" name="addr1" value="'+value.addr1 +'"/>';
				ff +='주소2:<input type="text" class="input-text"  id="addr2" name="addr2" value="'+value.addr2 +'"/>';
				ff +='</div>';
				ff +='<div class="number-container">';
				ff +='전화번호:<input type="text" class="input-text" id="tel" name="tel" value="'+value.tel +'"/><br>';
				ff +='팩스: &nbsp;&nbsp;&nbsp;&nbsp;	<input type="text" id="fax" class="input-text" name="fax" value="'+value.fax +'"/><br>';
				ff +='홈페이지:<input type="email" class="input-text" id="homePage" name="homepage" value="'+value.homepage +'"/><br>';
				ff +='</div>';
				ff +='</div>';
				ff +='<div class="co-container">';
				ff +='<div class="co-box">';
				ff +='<h3>법인여부</h3>';
				ff +='<input type="radio" class="input-text"  id="co_Y" name="co_YN" value="y" '+(value.co_YN === "y"?"checked":"" )+' />법인';
				ff +='<input type="radio" class="input-text" id="co_N" name="co_YN" value="n" '+(value.co_YN === "n"?"checked":"") +'/>개인';
				ff +='</div>';
				ff +='<div class="foreing-container">';
				ff +='<h3>해외여부</h3>';
				ff +='<span><input type="radio" class="foreign_Y" id="foreign_Y" name="foreign_YN" value="y" '+(value.foreign_YN === "y"?"checked":"")+'/>국내</span>';
				ff +='<span><input type="radio" class="foreign_N" id="foreign_N" name="foreign_YN" value="n" '+(value.foreign_YN === "n"?"checked":"") +'/>해외</span>';
				ff +='</div>';
				ff +='<select name="tax_YN" id="tax_YN">';
				ff +='<option >과세/면세</option>';
				ff +='<option value="y" '+(value.tax_YN === "y"?"selected":"") +'>과세</option>';
				ff +='<option value="n" '+(value.tax_YN === "n"?"selected":"") +'>면세</option>';
				ff +='</select>';
				ff +='<h5>국가</h5>';
				ff +='<input type="text" class="lang" name="lang" id="lang" value="'+(value.conutry_kor !== null?""+value.conutry_kor+"":""+value.conutry_eng+"")+'"/>';
				ff +='<button type="button"  id="langSearch">검색</button>';
				ff +='<select  name="langs" id="langs" style="display:none;">';
				ff +='<option >언어</option>';
				ff +='<option value="한국어" '+(value.conutry_kor ==="한국어"?"selected":"")+'>한국어</option>';
				ff +='<option value="영어" '+(value.conutry_eng ==="영어"?"selected":"")+'>영어</option>';
				ff +='<option value="일본어" '+(value.conutry_eng ==="일본어"?"selected":"")+'>일본어</option>';
				ff +='<option value="중국어" '+(value.conutry_eng ==="중국어"?"selected":"")+'>중국어</option>';
				ff +='<option value="스페인어" '+(value.conutry_eng ==="스페인어"?"selected":"")+'>스페인어</option>';
				ff +='</select>';
				ff +='<input type="checkbox" class="special_relation" name="special_relation" value=""'+(value.special_relation === 'y'?"checked":"")+'><label for="special_relation" class="">특수관계자</label>&nbsp;';
				ff +='<input type="checkbox" class="trade_stop" name="trade_stop" value=""'+(value.trade_stop === 'y'?"checked":"")+'><label for="special_relation" class="">거래중지</label>&nbsp;';
				ff +='<div class="date_container">';
				ff +='<h4>계약기간</h4>';
				ff +=' <input type="date" class="input--text" id="contractPeriod_S" name="contractPeriod_S"  id="startDate" onchange="fn_triggerEnd(event)" autocomplete="off" value="'+value.contractPeriod_S +'" required/>';
				ff +='<input type="date" class="input--text" id="contractPeriod_E" name="contractPeriod_E"  id="endDate" value="'+value.contractPeriod_E +'" autocomplete="off"  required>';
				ff +='</div>';
				ff +='<div class="person-container">';
				ff +='<input type="text" id="modi_info_person" name="modi_info_person" value="'+value.modi_info_person +'"/>';
				ff +='<input type="text" id="regi_info_person" name="regi_info_person" value="'+value.regi_info_person +'"/>';
				ff +='</div>';
				ff +='</div>';
				ff +='<h2>거래처 거래정보</h2>';
				ff +='<div class="table-box">';
				ff +='<table>';
				ff +='<thead>';
				ff +='<tr>'
				ff +='<th>사무소</th>';
				ff +='<th>은  행 </th>';
				ff +='<th>계좌 정보</th>';
				ff +='</tr>'
				ff +='</thead>';
				ff +='<tbody>';
				ff +='<tr>';
				ff +='<td><input type="text" id="factory" name="factory" value="'+value.account.factory+'"></td>';
				ff +='<td><input type="text" id="tradeBank" name="tradeBank" value="'+value.account.tradeBank +'"></td>';
				ff +='<td><input type="text" id="accountNum" name="accountNum" value="'+value.account.accountNum +'"></td>';
				ff +='</tr>';
				ff +='</tbody>';
				ff +='</table>';
				ff +='</div>';
		
			$("#updateContainer").html(ff);
			$("#enrollBtn").show();
			searchBtn(e);
		}
	
	});
	
} 
function fn_datepicker(){		
	/* datepicker 개시일에 생성 */
    $("#startDate").datepicker({
        dateFormat: 'yy-mm-dd',
        prevText:'이전 달',
        nextText:'다음 달',
        currentText:'오늘',
        monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        monthNamesShort:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        dayNames:['일','월','화','수','목','금','토'],
        dayNamesShort:['일','월','화','수','목','금','토'],
        showMonthAfteryear:true,
        yearSuffix:'년',
        defaultDate: new Date(),
        minDate:0,
        beforeShow: function(){
        	setTimeout(function(){
        		$('.ui-datepicker').css('z-index', 9999999999);
        	}, 0);

        }
    }); 
};
/* 게시일 값이 onchange될시 destroy후 종료일 datepicker생성 */
function fn_triggerEnd(e){
    $(e.target).next().attr('disabled',false);
    $(e.target).next().datepicker("destroy");
    $(e.target).next().datepicker({
        dateFormat: 'yy-mm-dd',
        prevText:'이전 달',
        nextText:'다음 달',
        currentText:'오늘',
        monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        monthNamesShort:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        dayNames:['일','월','화','수','목','금','토'],
        dayNamesShort:['일','월','화','수','목','금','토'],
        showMonthAfteryear:true,
        yearSuffix:'년',
        // defaultDate: new Date($("#startDate").val()),
        minDate: new Date($("#startDate").val()),
        beforeShow: function(){
        	setTimeout(function(){
        		$('.ui-datepicker').css('z-index', 9999999999);
        	}, 0);

        }
    });
};
	


</script>
</body>
</html>