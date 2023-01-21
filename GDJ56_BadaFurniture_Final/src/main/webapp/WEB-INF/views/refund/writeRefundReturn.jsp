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
<title>반품신청</title>
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
		margin:20px;
	}
	div#updateResellContainer div{
		text-align: center;
	}
	div.updateTitle{
		font-size:30px;
		font-weight:bolder;
		color:rgb(52, 132, 146);
		margin:30px 0px 30px 0px !important;
	}
</style>
<body>
	<div id="updateResellContainer">
		<div class="updateRow updateTitle">
			반품신청
		</div>
		<form action="" method="post">
			<div class="updateRow">
				주문일 : 2023-01-15
			</div>
			<div class="updateRow">
				환불수단 : 카드 취소
			</div>
			<div class="updateRow">
				반품 사유 : 
				<select id="item">
					<option>세부 항목을 선택해주세요.</option>
					<option>단순변심</option>
					<option>다른 상품을 잘못 주문함</option>
					<option>다른 상품이 잘못 배송됨</option>
					<option>서비스 및 상품 불만족</option>
					<option>상품정보 상이</option>
					<option>배송지연</option>
					<option>상품파손</option>
					<option>오배송</option>
				</select>
			</div>
			<div class="updateRow">
				<input type="submit" value="반품신청하기" 
				style="background-color:rgb(52, 132, 146);color:white;border:none;width:250px;height:40px;border-radius:10px;font-size:18px;cursor:pointer;"/>
			</div>
		</form>
	</div>
</body>
</html>