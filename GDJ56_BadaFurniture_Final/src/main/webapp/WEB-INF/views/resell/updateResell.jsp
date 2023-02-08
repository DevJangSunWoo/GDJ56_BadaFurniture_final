<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 가구 팔기 수정</title>
</head>
<script src="${path}/resources/js/jquery-3.6.1.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<style>
	div#updateResellContainer{
		width:400px;
		height:280px;
		border:1px solid rgb(52, 132, 146);
	}
	div#updateResellContainer *{
		font-family: 'Nanum Gothic' !important;
	}
	div.updateRow{
		margin:30px;
	}
	div#updateResellContainer div{
		text-align: center;
	}
	div.updateTitle{
		font-size:30px;
		font-weight:bolder;
		color:rgb(52, 132, 146);
	}
</style>
<body>
	<div id="updateResellContainer">
		<div class="updateRow updateTitle">
			내 가구 팔기 수정
		</div>
		<form action="${path}/resell/updateEnd.do" method="post" onsubmit="return checkSubmit();">
			<input type="hidden" name="resellNo" value="${resell.resellNo}"/>
			<div class="updateRow">
				판매 희망 금액 : <input type="number" style="width:100px;" name="hopePrice" min="1" value="${resell.hopePrice}"> 원 
			</div>
			<div class="updateRow">
				희망 수거일 : <input type="date" name="pickUpDate" style="width:100px">
				<br>
				<span style="margin-left:10px;color:grey;font-size:13px;">
					* 희망수거일은 7일 이후부터 선택할 수 있습니다.
				</span>
			</div>
			<div class="updateRow">
				<input type="submit" value="수정하기" 
				style="background-color:rgb(52, 132, 146);color:white;border:none;width:250px;height:40px;border-radius:10px;font-size:18px;cursor:pointer;"/>
			</div>
		</form>
	</div>
<script>
	$(()=>{
		// 지금 날짜 + 7일*24시간*60분*60초*1000ms로 세팅
		var now_utc = Date.now() + 7*24*60*60*1000;
		// getTimezoneOffset()은 위 시간과의 차이를 분 단위로 반환
		var timeOff = new Date().getTimezoneOffset()*60000; 
		var sevenAfterDay = new Date(now_utc-timeOff).toISOString().split("T")[0];
		$("input[name=pickUpDate]").attr("min",sevenAfterDay);
	});
	
	const checkSubmit = () => {
		if($("input[name=hopePrice]").val()==''){
			alert("판매희망금액을 입력해주세요.");
			return false;
		}
		else if($("input[name=pickUpDate]").val()==''){
			alert("희망수거일을 입력해주세요.");
			return false;
		} 
		return true;
	}
</script>
</body>
</html>