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
<title>취소신청</title>
</head>
<!-- JQuery -->
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
			취소신청
		</div>
		<form action="${path}/refund/cancel/write.do" method="post" onsubmit="return checkSubmit();">
			<div class="updateRow">
				주문일 : <fmt:formatDate value="${orderSheet.orderSheetenrollDate}" type="date" pattern="yyyy-MM-dd(E)"/>
			</div>
			<div class="updateRow">
				환불수단 : 
				<c:choose>
					<c:when test="${fn:contains(orderSheet.paymentMethod, '계좌')}">
						계좌이체
					</c:when>
					<c:when test="${fn:contains(orderSheet.paymentMethod, '카드')}">
						카드취소
					</c:when>
				</c:choose>
			</div>
			<div class="updateRow">
				취소 사유 : 
				<select name="detail">
					<option value="none">세부 항목을 선택해주세요.</option>
					<option value="단순변심">단순변심</option>
					<option value="다른 상품을 잘못 주문함">다른 상품을 잘못 주문함</option>
					<option value="서비스 및 상품 불만족">서비스 및 상품 불만족</option>
				</select>
			</div>
			<div class="updateRow">	
				<button type="button" id="submitBtn" style="background-color:rgb(52, 132, 146);color:white;border:none;width:250px;height:40px;border-radius:10px;font-size:18px;cursor:pointer;">
					취소신청하기
				</button>
			</div>
		</form>
	</div>
</body>
<script>
	$(()=>{
		$("button#submitBtn").click(e=>{
			alert("요호~");
		});
	});

</script>
</html>