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
	div#resellWrap{
		width:100%; 
		/* height:1000px; */ /* 수정요망 */
		display:flex;
		justify-content: center;
	}
	div#resellWrap *{
		font-family: 'Nanum Gothic' !important;
	}
	div#resellWrap>div#resellContent{
		width:1150px; /* px로 수정 */ 
		/* height:1000px; */ /* 수정요망 */
		/* border: 2px solid red; */ /* 삭제요망 */ 
	}
	
	table#resellTable{
		width:100%;
		/* border:1px solid black; */
		border-top:8px solid black;
		border-collapse: collapse;
	}
	table#resellTable tr>th:first-child{
		width:400px;
	}
	table#resellTable tr>td:first-child{
		width:400px;
		text-align:left !important;
	}
	table#resellTable tr>th:nth-child(2), table#resellTable tr>td:nth-child(2){
		width:150px;
	}
	table#resellTable tr>th:nth-child(3), table#resellTable tr>td:nth-child(3){
		width:150px;
	}
	table#resellTable tr>th:nth-child(4), table#resellTable tr>td:nth-child(4){
		width:150px;
	}

	table#resellTable th{
		padding:0px;
		border-bottom:2px solid black;
		height:52px;
	}
	table#resellTable td{
		padding:0px;
		text-align:center;
		border-bottom:1px solid grey;
	}
	button.deleteBtn{
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
	button.updateBtn{
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
				Resell
			</div>
		</div>
		<div id="resellWrap">
			<div id="resellContent">
				<table id="resellTable"> 
					<tr style="border-bottom:1px solid black;"> 
						<th>신청정보</th>
						<th>신청일<br>(최종수정일)</th>
						<th>거래희망가</th>
						<th>수거희망일</th>
						<th>판매상태</th>
						<th>비고</th>
					</tr>
					<tr>
						<td>
							<div style="height:85px;width:350px;margin:10px;display:flex;">
								<img src="${path}/resources/images/admin/addImage.png" width="85px" height="85px"/>
								<div>
									<div style="padding:30px 0px 8px 20px;">
										<a href="#">화장대 판매신청</a>
										<button style="width:24px;height:12px;border:none;background-color:red;font-size:8px;color:white;text-align:center;padding:0px;">new</button>
									</div>
								</div>
							</div>
						</td>
						<td>
							2023-01-18
						</td>
						<td>
							100,000원
						</td>
						<td>
							2023-01-25
						</td>
						<td>
							수정요청
						</td>
						<td>
							<button class="updateBtn">수정하기</button>
							<br>
							<button class="deleteBtn">삭제</button>
						</td>
					</tr>	
					
					<tr>
						<td>
							<div style="height:85px;width:350px;margin:10px;display:flex;">
								<img src="${path}/resources/images/admin/addImage.png" width="85px" height="85px"/>
								<div>
									<div style="padding:30px 0px 8px 20px;">
										<a href="#">책상 판매신청</a>
									</div>
								</div>
							</div>
						</td>
						<td>
							2023-01-01
							<br>
							(2023-01-03)
						</td>
						<td>
							30,000원
						</td>
						<td>
							2023-01-10
						</td>
						<td>
							입금완료
						</td>
						<td>
							내가구팔기 완료
						</td>
					</tr>	
				</table>
				
				<div id="pageBar" style="text-align:center;margin-top:10px;">
					[이전] 1 2 3 4 5 [다음]
				</div>
			</div>
		</div>
	</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
