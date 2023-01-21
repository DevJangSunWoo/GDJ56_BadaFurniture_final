<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
	
	div#alertWrap{
		width:100%; 
		/* height:1000px; */ /* 수정요망 */
		display:flex;
		justify-content: center;
	}
	div#alertWrap *{
		font-family: 'Nanum Gothic' !important;
	}
	div#alertWrap>div#alertContent{
		width:900px; /* px로 수정 */ 
		/* height:1000px; */ /* 수정요망 */
		/* border: 2px solid red; */
	}
	
	
	table#alertTable{
		width:100%;
		/* border:1px solid black; */
		border-top:8px solid black;
		border-collapse: collapse;
	}
	table#alertTable td{
		height:60px;
	}
	table#alertTable tr>th:first-child, table#alertTable tr>td:first-child{
		width:100px;
	}
	table#alertTable tr>th:nth-child(2), table#alertTable tr>td:nth-child(2){
		width:650px;
	}
	table#alertTable tr>th:nth-child(3), table#alertTable tr>td:nth-child(3){
		width:140px;
	}
	table#alertTable th{
		padding:0px;
		border-bottom:2px solid black;
		height:52px;
	}
	table#alertTable td{
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
</style>
	<section class="mypage">
		<div id="title">
			<div id="innerTitle">
				Alert
			</div>
		</div>
		<div id="alertWrap">
			<div id="alertContent">	
				<table id="alertTable"> 
					<tr> 
						<th>
							<input type="checkbox">
						</th>
						<th>알림내용</th>
						<th>알림일자</th>
					</tr>
					<tr>
						<td>
							<input type="checkbox">
						</td>
						<td>
							<a href="" style="color:rgb(52, 132, 146);">책상 판매신청(100,000)</a>에 운영자가 댓글을 달았습니다.
							<button style="width:24px;height:12px;border:none;background-color:red;font-size:8px;color:white;text-align:center;padding:0px;">new</button>
						</td>
						<td>
							2023-01-21
						</td>
					</tr>
					
					<tr>
						<td>
							<input type="checkbox">
						</td>
						<td>
							<a href="" style="color:rgb(52, 132, 146);">책상 판매신청(100,000)</a>에 운영자가 댓글을 달았습니다.
							<button style="width:24px;height:12px;border:none;background-color:red;font-size:8px;color:white;text-align:center;padding:0px;">new</button>
						</td>
						<td>
							2023-01-21
						</td>
					</tr>
					
					<tr>
						<td>
							<input type="checkbox">
						</td>
						<td>
							<a href="" style="color:rgb(52, 132, 146);">책상 판매신청(100,000)</a>에 운영자가 댓글을 달았습니다.
						</td>
						<td>
							2023-01-18
						</td>
					</tr>
					
					<tr>
						<td>
							<input type="checkbox">
						</td>
						<td>
							<a href="" style="color:rgb(52, 132, 146);">책상 판매신청(100,000)</a>에 운영자가 댓글을 달았습니다.
						</td>
						<td>
							2023-01-17
						</td>
					</tr>
					
					<tr>
						<td>
							<input type="checkbox">
						</td>
						<td>
							<a href="" style="color:rgb(52, 132, 146);">책상 판매신청(100,000)</a>에 운영자가 댓글을 달았습니다.
						</td>
						<td>
							2023-01-17
						</td>
					</tr>
				</table>
				<div style="display:flex;justify-content: left;">
					<div>
						<button  id="deleteBtn" style="margin:15px 0px 10px 15px;">선택삭제</button>
					</div>
				</div>
				<div id="pageBar" style="text-align:center">
					[이전] 1 2 3 4 5 [다음]
				</div>
			</div>
		</div>
	</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
