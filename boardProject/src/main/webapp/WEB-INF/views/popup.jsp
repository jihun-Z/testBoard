<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${path }/resources/js/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="${path }/resources/css/style.css">
</head>

<style>


</style>
<script type="text/javascript" defer>
	
	//클릭해서 
	$(document).on("click","#pop-box",function(e){
		const li=$(e.target).text();
		e.target.focus();
		console.log(li);
		$("#poptext").val(li);
	});
	
	function sendToIndex(){
		let txt=$("#poptext").val();
		 // opener 를 이용해 부모 window 객체에 접근할 수 있습니다.
        // 부모에게서 전달받은 값에 추가로 문자열을 더해서 다시 부모의 receiveFromChild 라는 id를 갖는
        // 태그요소에 value 값을 바꾸어 주는 작업입니다.
        $(opener.document).find("#lang").val(txt);
        
        //창 닫음
        window.close();

	}

</script>
<body>
		<div class="pop-container">
			<h4>언어선택</h4>
			<ul id="pop-box">
				<li>한국어</li>
				<li>영어</li>
				<li>스페인어</li>
				<li>중국어</li>
				<li>일본어</li>
			</ul>
			<input type="text" id="poptext"/> 
			<button type="button" onclick="sendToIndex();">창 닫기 </button>
		
		</div>
		
		
		
</body>

</html>