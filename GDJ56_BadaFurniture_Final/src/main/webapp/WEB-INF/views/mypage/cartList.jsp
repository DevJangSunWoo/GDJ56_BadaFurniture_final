<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<style>
	section.mypage>div#title{
		width:100%;
		height:200px;
	}
	section.mypage>div#title>div#innerTitle{
		display:flex;
		align-items:center;
		justify-content:center;
		width:100%;
		height:200px;
		font-family:"Courier New";
		font-weight:bolder;
		font-size:50px;
	} 
	
	div#cartWrap{
		width:100%; 
		/* height:1000px; */ /* 수정요망 */
		display:flex;
		justify-content: center;
	}
	div#cartWrap *{
		font-family: 'Nanum Gothic' !important;
	}
	div#cartWrap>div#cartContent{
		width:1150px; /* px로 수정 */ 
		/* height:1000px; */ /* 수정요망 */
		/* border: 2px solid red; */
	}
	
	
	table#cartTable{
		width:100%;
		/* border:1px solid black; */
		border-top:8px solid black;
		border-collapse: collapse;
	}
	table#cartTable tr>th:first-child{
		width:80px;
	}
	table#cartTable tr>td:first-child{
		width:80px;
	}
	table#cartTable tr>th:nth-child(2), table#cartTable tr>td:nth-child(2){
		width:40px;
		text-align:left !important;
	}
	table#cartTable tr>th:nth-child(3), table#cartTable tr>td:nth-child(3){
		width:500px;
	}
	table#cartTable tr>td:nth-child(3){
		text-align:left !important;
	}
	table#cartTable tr>th:nth-child(4), table#cartTable tr>td:nth-child(4){
		width:200px;
	}

	table#cartTable th{
		padding:0px;
		border-bottom:2px solid black;
		height:52px;
	}
	table#cartTable td{
		padding:0px;
		text-align:center;
		border-bottom:1px solid grey;
	}
	button#deleteBtn{
		padding:0px;
		border:2px solid red;
		width:70px;
		height:25px;
		background-color:white;
		color:red;
		border-radius:5px;
		padding-bottom:2px;
		margin:1px;
	}
	div#ulContainer li{
		color:grey;
		font-size:14px;
	}
	
	
	button#orderBtn{
		width:600px;
		height:50px;
		margin-top:20px;
		color:white;
		background-color:rgb(52, 132, 146);
		border:none;
		font-size:20px;
		border-radius:20px;
	}
</style>
	<section class="mypage">
		<div id="title">
			<div id="innerTitle">
				Cart
			</div>
		</div>
		<div id="cartWrap">
			<div id="cartContent">
				<table id="cartTable"> 
					<tr style="border-bottom:1px solid black;"> 
						<th style="font-size:13px;">
							전체
							<br>
							n개
						</th>
						<th>
							<input type="checkbox">
						</th>
						<th>상품정보</th>
						<th>판매가</th>
						<th>배송비</th>
						<th>비고</th>
					</tr>
					<tr>
						<td>1</td>
						<td>
							<input type="checkbox">
						</td>
						<td>
							<div style="height:85px;width:380px;margin:10px;display:flex;">
								<img src="${path}/resources/images/admin/addImage.png" width="85px" height="85px"/>
								<div>
									<div style="padding:20px 0px 8px 10px;">
										<a href="#">유병승 선생님의 책상</a>
									</div>
									<div style="padding:0px 0px 5px 10px;font-size:13px;color:grey;">
										상태 : 상
									</div>
								</div>
							</div>
						</td>
						<td>
							30,000원
						</td>
						<td>
							무료
						</td>
						<td>
							<button id="deleteBtn">삭제</button>
						</td>
					</tr>	
					<tr>
						<td>2</td>
						<td>
							<input type="checkbox">
						</td>
						<td>
							<div style="height:85px;width:380px;margin:10px;display:flex;">
								<img src="${path}/resources/images/admin/addImage.png" width="85px" height="85px"/>
								<div>
									<div style="padding:20px 0px 8px 10px;">
										<a href="#">유병승 선생님의 책상</a>
									</div>
									<div style="padding:0px 0px 5px 10px;font-size:13px;color:grey;">
										상태 : 상
									</div>
								</div>
							</div>
						</td>
						<td>
							100,000원
						</td>
						<td>
							무료
						</td>
						<td>
							<button id="deleteBtn">삭제</button>
						</td>
					</tr>	
				</table>
				<div style="display:flex;justify-content: space-between;">
					<div>
						<button  id="deleteBtn" style="margin:15px 0px 10px 15px;">선택삭제</button>
					</div>
					<div id="priceContainer" style="width:100%;height:80px;display:flex;justify-content:right;align-items:center;margin-right:30px;">
						<div style="color:grey;font-size:20px;font-weight:bolder;">상품합계 : </div>
						<div style="color:black;font-size:25px;font-weight:bolder">130,000원</div>
					</div>
				</div>
				<div id="ulContainer">
					<ul>
						<li>
							바다 퍼니쳐는 전 상품 무료배송입니다.
						</li>
						<li>
							2개 이상의 상품을 주문시, 개별 배송 됩니다.
						</li>
						<li>
							장바구니에는 최대 10개의 상품을 보관할 수 있으며, 주문당 한번에 주문 가능한 상품 수는 10개로 제한됩니다.
						</li>
						<li>
							무통장 입금 결제는 주문 취소시 24시간 내 재주문이 불가능합니다.
						</li>
					</ul>
				</div>
				<div style="display:flex;justify-content:center">
					<button id="orderBtn">결제하기</button>
				</div>
			</div>
		</div>

	</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
