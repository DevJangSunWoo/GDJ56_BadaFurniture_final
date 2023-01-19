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
	div#orderWrap{
		width:100%; 
		height:1000px; /* 수정요망 */
		display:flex;
		justify-content: center;
	}
	div#orderWrap *{
		font-family: 'Nanum Gothic' !important;
	}
	div#orderWrap>div#orderContent{
		width:1150px; /* px로 수정 */ 
		height:1000px; /* 수정요망 */
		/* border: 2px solid red; */
	}
	div#dateContainer{
		width:100%;
		height:80px; 
		border:1px solid black;
		border-radius: 20px; 
		margin-bottom:5px;
	}
	div#dateContent{
		padding:27px;
	}
	span#dateButtonContainer>button{
		padding:0px;
		border:2px solid rgb(52, 132, 146);
		width:50px;
		height:25px;
		background-color:white;
		color:rgb(52, 132, 146);
		border-radius:5px;
		padding-bottom:2px;
	}
	table#orderTable{
		width:100%;
		/* border:1px solid black; */
		border-top:8px solid black;
		border-collapse: collapse;
	}
	table#orderTable tr>th:first-child{
		width:400px;
	}
	table#orderTable tr>td:first-child{
		width:400px;
		text-align:left !important;
	}
	table#orderTable tr>th:nth-child(2), table#orderTable tr>td:nth-child(2){
		width:130px;
	}
	table#orderTable tr>th:nth-child(3), table#orderTable tr>td:nth-child(2){
		width:200px;
	}
	table#orderTable tr>th:nth-child(4), table#orderTable tr>td:nth-child(2){
		width:120px;
	}

	table#orderTable th{
		padding:0px;
		border-bottom:2px solid black;
		height:52px;
	}
	table#orderTable td{
		padding:0px;
		text-align:center;
		border-bottom:1px solid grey;
	}
	table#orderTable button{
		padding:0px;
		border:2px solid rgb(52, 132, 146);
		width:70px;
		height:25px;
		background-color:white;
		color:rgb(52, 132, 146);
		border-radius:5px;
		padding-bottom:2px;
		margin:1px;
	}
</style>
	<section class="mypage">
		<div id="title">
			<div id="innerTitle">
				Order
			</div>
		</div>
		<div id="orderWrap">
			<div id="orderContent">
				<div id="dateContainer">
					<div id=dateContent>
						<span id="dateButtonContainer">
							<button>오늘</button>
							<button>1주일</button>
							<button>1개월</button>
							<button>3개월</button>
							<button>6개월</button>
							&nbsp;&nbsp;
							<input type="date">
							&nbsp;~&nbsp;
							<input type="date">
							&nbsp;&nbsp;
							<button>조회</button>
						</span>
					</div>
				</div>
				<div style="font-size:14px;color:grey;margin-bottom:70px;">
					 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					 - 기본적으로 최근 3개월간의 자료가 조회되며, 기간 검색시 지난 주문조회 내역을 조회하실 수 있습니다.
				</div>
				<table id="orderTable"> 
					<tr style="border-bottom:1px solid black;"> 
						<th>상품정보</th>
						<th>주문일자</th>
						<th>주문번호</th>
						<th>상품구매금액</th>
						<th>배송상태</th>
						<th>주문상태</th>
						<th>비고</th>
					</tr>
					<tr>
						<td>
							
							<div style="height:85px;width:380px;margin:10px;display:flex;">
								<img src="${path}/resources/images/admin/addImage.png" width="85px" height="85px"/>
								<div>
									<div style="padding:20px 0px 8px 10px;">
										<a href="#">만성피로에 좋은 안락의자</a>
									</div>
									<div style="padding:0px 0px 5px 10px;font-size:13px;color:grey;">
										상태 : 상
									</div>
								</div>
							</div>
						</td>
						<td>
							2023-01-19
						</td>
						<td>
							202301191631119876
						</td>
						<td>
							50,000원
						</td>
						<td>
							배송대기
						</td>
						<td>
							결제완료
						</td>
						<td>
							<button class="cancelBtn">취소신청</button>
							<br>
							<button>영수증</button>
						</td>
					</tr>
					<tr>
						<td>
							<img src="${path}/resources/images/admin/addImage.png" width="85px" height="85px" style="padding:10px;"/>
						</td>
						<td>
							2023-01-19
						</td>
						<td>
							202301191631119876
						</td>
						<td>
							100,000원
						</td>
						<td>
							배송완료
						</td>
						<td>
							결제완료
						</td>
						<td>
							<button class="refundBtn">반품신청</button>
							<br>					
							<button class="confirmBtn">주문확정</button>
							<br>
							<button>영수증</button>
						</td>
					</tr>
					
					<tr>
						<td>
							
							<div style="height:85px;width:380px;margin:10px;display:flex;">
								<img src="${path}/resources/images/admin/addImage.png" width="85px" height="85px"/>
								<div>
									<div style="padding:20px 0px 8px 10px;">
										<a href="#">만성피로에 좋은 안락의자</a>
									</div>
									<div style="padding:0px 0px 5px 10px;font-size:13px;color:grey;">
										상태 : 상
									</div>
								</div>
							</div>
						</td>
						<td>
							2023-01-19
						</td>
						<td>
							202301191631119876
						</td>
						<td>
							50,000원
						</td>
						<td>
							배송완료
						</td>
						<td>
							주문확정
						</td>
						<td>
							<button>영수증</button>
						</td>
					</tr>
					
					<tr>
						<td>
							
							<div style="height:85px;width:380px;margin:10px;display:flex;">
								<img src="${path}/resources/images/admin/addImage.png" width="85px" height="85px"/>
								<div>
									<div style="padding:20px 0px 8px 10px;">
										<a href="#">만성피로에 좋은 안락의자</a>
									</div>
									<div style="padding:0px 0px 5px 10px;font-size:13px;color:grey;">
										상태 : 상
									</div>
								</div>
							</div>
						</td>
						<td>
							2023-01-19
						</td>
						<td>
							202301191631119876
						</td>
						<td>
							50,000원
						</td>
						<td>
							배송대기
						</td>
						<td>
							결제완료
						</td>
						<td>
							<button class="cancelBtn">취소신청</button>
							<br>
							<button>영수증</button>
						</td>
					</tr>
					
					<tr>
						<td>
							
							<div style="height:85px;width:380px;margin:10px;display:flex;">
								<img src="${path}/resources/images/admin/addImage.png" width="85px" height="85px"/>
								<div>
									<div style="padding:20px 0px 8px 10px;">
										<a href="#">만성피로에 좋은 안락의자</a>
									</div>
									<div style="padding:0px 0px 5px 10px;font-size:13px;color:grey;">
										상태 : 상
									</div>
								</div>
							</div>
						</td>
						<td>
							2023-01-19
						</td>
						<td>
							202301191631119876
						</td>
						<td>
							50,000원
						</td>
						<td>
							배송대기
						</td>
						<td>
							결제완료
						</td>
						<td>
							<button class="cancelBtn">취소신청</button>
							<br>
							<button>영수증</button>
						</td>
					</tr>
					
					<tr>
						<td>
							
							<div style="height:85px;width:380px;margin:10px;display:flex;">
								<img src="${path}/resources/images/admin/addImage.png" width="85px" height="85px"/>
								<div>
									<div style="padding:20px 0px 8px 10px;">
										<a href="#">만성피로에 좋은 안락의자</a>
									</div>
									<div style="padding:0px 0px 5px 10px;font-size:13px;color:grey;">
										상태 : 상
									</div>
								</div>
							</div>
						</td>
						<td>
							2023-01-19
						</td>
						<td>
							202301191631119876
						</td>
						<td>
							50,000원
						</td>
						<td>
							배송대기
						</td>
						<td>
							결제완료
						</td>
						<td>
							<button class="cancelBtn">취소신청</button>
							<br>
							<button>영수증</button>
						</td>
					</tr>
					
					<tr>
						<td>
							
							<div style="height:85px;width:380px;margin:10px;display:flex;">
								<img src="${path}/resources/images/admin/addImage.png" width="85px" height="85px"/>
								<div>
									<div style="padding:20px 0px 8px 10px;">
										<a href="#">만성피로에 좋은 안락의자</a>
									</div>
									<div style="padding:0px 0px 5px 10px;font-size:13px;color:grey;">
										상태 : 상
									</div>
								</div>
							</div>
						</td>
						<td>
							2023-01-19
						</td>
						<td>
							202301191631119876
						</td>
						<td>
							50,000원
						</td>
						<td>
							배송대기
						</td>
						<td>
							결제완료
						</td>
						<td>
							<button class="cancelBtn">취소신청</button>
							<br>
							<button>영수증</button>
						</td>
					</tr>
					
					<tr>
						<td>
							
							<div style="height:85px;width:380px;margin:10px;display:flex;">
								<img src="${path}/resources/images/admin/addImage.png" width="85px" height="85px"/>
								<div>
									<div style="padding:20px 0px 8px 10px;">
										<a href="#">만성피로에 좋은 안락의자</a>
									</div>
									<div style="padding:0px 0px 5px 10px;font-size:13px;color:grey;">
										상태 : 상
									</div>
								</div>
							</div>
						</td>
						<td>
							2023-01-19
						</td>
						<td>
							202301191631119876
						</td>
						<td>
							50,000원
						</td>
						<td>
							배송대기
						</td>
						<td>
							결제완료
						</td>
						<td>
							<button class="cancelBtn">취소신청</button>
							<br>
							<button>영수증</button>
						</td>
					</tr>
					
					<tr>
						<td>
							
							<div style="height:85px;width:380px;margin:10px;display:flex;">
								<img src="${path}/resources/images/admin/addImage.png" width="85px" height="85px"/>
								<div>
									<div style="padding:20px 0px 8px 10px;">
										<a href="#">만성피로에 좋은 안락의자</a>
									</div>
									<div style="padding:0px 0px 5px 10px;font-size:13px;color:grey;">
										상태 : 상
									</div>
								</div>
							</div>
						</td>
						<td>
							2023-01-19
						</td>
						<td>
							202301191631119876
						</td>
						<td>
							50,000원
						</td>
						<td>
							배송대기
						</td>
						<td>
							결제완료
						</td>
						<td>
							<button class="cancelBtn">취소신청</button>
							<br>
							<button>영수증</button>
						</td>
					</tr>
					
					<tr>
						<td>
							
							<div style="height:85px;width:380px;margin:10px;display:flex;">
								<img src="${path}/resources/images/admin/addImage.png" width="85px" height="85px"/>
								<div>
									<div style="padding:20px 0px 8px 10px;">
										<a href="#">만성피로에 좋은 안락의자</a>
									</div>
									<div style="padding:0px 0px 5px 10px;font-size:13px;color:grey;">
										상태 : 상
									</div>
								</div>
							</div>
						</td>
						<td>
							2023-01-19
						</td>
						<td>
							202301191631119876
						</td>
						<td>
							50,000원
						</td>
						<td>
							배송대기
						</td>
						<td>
							결제완료
						</td>
						<td>
							<button class="cancelBtn">취소신청</button>
							<br>
							<button>영수증</button>
						</td>
					</tr>
				</table>
				<div id="pageBar">
					[이전] 1 2 3 4 5 [다음]
				</div>
			</div>
		</div>
	</section>
</body>
</html>