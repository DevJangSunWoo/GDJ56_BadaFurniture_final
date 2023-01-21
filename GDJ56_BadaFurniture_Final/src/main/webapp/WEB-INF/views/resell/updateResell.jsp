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
		<form action="" method="post">
			<div class="updateRow">
				판매 희망 금액 : <input type="number" style="width:100px;"> 원 
			</div>
			<div class="updateRow">
				희망 수거일 : <input type="date" style="width:100px">
			</div>
			<div class="updateRow">
				<input type="submit" value="수정하기" 
				style="background-color:rgb(52, 132, 146);color:white;border:none;width:250px;height:40px;border-radius:10px;font-size:18px;cursor:pointer;"/>
			</div>
		</form>
	</div>
</body>
</html>