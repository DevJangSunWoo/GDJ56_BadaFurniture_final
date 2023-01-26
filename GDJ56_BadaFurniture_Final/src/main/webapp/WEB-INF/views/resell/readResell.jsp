<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet"> 
<style>
	section#sellpage * {
		font-family: 'Nanum Gothic' !important;
	}
	section#sellpage>div#title{
		display:flex;
		justify-content:center;
		font-size:30px;
		color:rgb(52, 132, 146);
		font-weight:bolder;
		width:100%;
		height:120px;
		align-items:center;
	}
	div#sellWrap{
		width:100%;
		/* height:900px; */ /* 수정요망 */
		display:flex;
		justify-content: center;
	}
	div#sellWrap>div#sellContent{
		width:618px; 
		/* height:900px; */ /* 수정요망 */
		/* border: 2px solid red; */
	}
	div#sellWrap>div#sellContent>div.sellRow{
		display:flex;
	}
	div.sellRow>div.sellColLeft{
		width:170px;
		height:50px;
		display:flex;
		align-items:center;
		justify-content:left;
		padding-left:15px;
		background-color:rgb(52, 132, 146);
		color:white;
		font-weight:bolder;
		font-size:15px;
		border:1px solid white;
	}
	div.sellRow>div.sellColRight{
		border-top:1px solid black;
		border-right:1px solid black;
		width:100%;
		display:flex;
		justify-content:left;
		align-items:center;
		padding-left:15px;
	}
	div.sellRow>div.sellColRight *{
		font-size:14px;
	}
	div.sellRow select#category{

	}
	div.sellColRight>div.sellImageUpload{
		width:220px;
		height:220px;
		border: 2px solid rgb(52, 132, 146);
		margin-right:0px;
	}
	div#addressContainer>*{
		margin:3px;
	}
	div#accountContainer>*{
		margin:3px;
	}
	div.sellRow input#resellBtn{
		width:600px;
		height:50px;
		margin-top:20px;
		color:white;
		background-color:rgb(52, 132, 146);
		border:none;
		font-size:20px;
		border-radius:20px;
	}
	
	/*댓글테이블*/
	div#comment-container>div.comment-editor{
		display:flex;
		justify-content: center;
		padding-top:20px;
	}
	
	div#comment-container button#btn-insert{width:60px;height:50px; color:white; border:none;border-radius:10px;
    background-color:rgb(52, 132, 146);position:relative;top:-20px;}
    
    table#tbl-comment{width:580px; margin:0 auto; border-collapse:collapse; clear:both; } 
    table#tbl-comment tr td{border-bottom:1px solid; border-top:1px solid; padding:5px; text-align:left; line-height:120%;}
    table#tbl-comment tr td:first-of-type{padding: 5px 5px 5px 50px;}
    table#tbl-comment tr td:last-of-type {text-align:right; width: 100px;}
    table#tbl-comment button.btn-reply{display:none;}
    table#tbl-comment button.btn-delete{display:none;}
    table#tbl-comment tr:hover {background:lightgray;}
    table#tbl-comment tr:hover button.btn-reply{display:inline;}
    table#tbl-comment tr:hover button.btn-delete{display:inline;}
    table#tbl-comment tr.level2 {color:gray; font-size: 14px;}
    table#tbl-comment sub.comment-writer {color:navy; font-size:14px}
    table#tbl-comment sub.comment-date {color:tomato; font-size:10px}
    table#tbl-comment tr.level2 td:first-of-type{padding-left:100px;}
    table#tbl-comment tr.level2 sub.comment-writer {color:#8e8eff; font-size:14px}
    table#tbl-comment tr.level2 sub.comment-date {color:#ff9c8a; font-size:10px}
    /*답글관련*/
    table#tbl-comment textarea{margin: 4px 0 0 0;}
    table#tbl-comment button.btn-insert2{width:60px; height:23px; color:white; background:#3300ff; position:relative; top:-5px; left:10px;}
</style>
<section id="sellpage">
	<div id="title">
		내 가구 판매 신청서 조회
	</div>
	<div id="title" style="font-size:20px !important;height:50px !important;">
		신청번호 : <c:out value="${resell.resellNo}"/>
	</div>
	<div id="sellWrap">
		<div id="sellContent">
			<div class="sellRow">
				<div class="sellColLeft" style="border-radius:20px 0px 0px 0px;">
					카테고리
				</div>
				<div class="sellColRight" style="border-radius:0px 20px 0px 0px;">
					<c:out value="${resell.item}"/>
				</div>	
			</div>
			<div class="sellRow">
				<div class="sellColLeft">
					크기
				</div>
				<div class="sellColRight">
					<span style="margin-right:30px;">가로 <c:out value="${resell.widths}"/>mm</span>
					<span style="margin-right:30px;">세로 <c:out value="${resell.depths}"/>mm</span>
					<span>높이 <c:out value="${resell.heights}"/>mm</span>
				</div>		
			</div>
			<div class="sellRow">
				<div class="sellColLeft">
					색상
				</div>
				<div class="sellColRight">
					<c:out value="${resell.color}"/>
				</div>		
			</div>
			<div class="sellRow">
				<div class="sellColLeft">
					상태
				</div>
				<div class="sellColRight">
					<c:out value="${resell.grade}"/>
				</div>		
			</div>
			<div class="sellRow">
				<div class="sellColLeft" style="height:250px !important;">
					사진
				</div>
				<div class="sellColRight" style="height:250px !important;display:flex;">
					<div class="sellImageUpload">
						<img src="${path}/resources/upload/resell/${resell.files[0].renamedFileName}" width="100%" height="100%"/>
					</div>
					<div class="sellImageUpload" style="border-left:0px;">
						<img src="${path}/resources/upload/resell/${resell.files[1].renamedFileName}" width="100%" height="100%"/>
					</div>
				</div>		
			</div>
			<div class="sellRow">
				<div class="sellColLeft" style="height:110px !important;">
					참고사항
				</div>
				<div class="sellColRight" style="height:110px !important;">
					<div>
						<c:out value="${resell.detail}"/>
					</div>
				</div>		
			</div>
			<div class="sellRow">
				<div class="sellColLeft" style="height:110px !important;">
					주소
				</div>
				<div class="sellColRight" style="height:110px !important;">
					<div id="addressContainer">
						<input type="text" style="width:100px;"name="postCode" value="${resell.postCode}" disabled><br>
						<input type="text" style="width:435px;"name="address" value="${resell.address}" disabled><br>
						<input type="text" style="width:435px;"name="addressDetail" value="${resell.addressDetail}" disabled>
					</div>
				</div>		
			</div>
			<div class="sellRow">
				<div class="sellColLeft">
					희망수거일
				</div>
				<div class="sellColRight">
					<fmt:formatDate value="${resell.pickUpDate}" type="date" pattern="yyyy-MM-dd(E)"/>
				</div>		
			</div>
			<div class="sellRow">
				<div class="sellColLeft">
					판매희망금액
				</div>
				<div class="sellColRight">
					<fmt:formatNumber value="${resell.hopePrice}" type="currency" />
				</div>		
			</div>
			<div class="sellRow">
				<div class="sellColLeft" style="height:80px !important;border-radius:0px 0px 0px 20px;">
					입금받을
					<br>
					계좌번호
				</div>
				<div class="sellColRight" style="height:80px !important;border-bottom: 1px solid black;border-radius:0px 0px 20px 0px;">
					<div id="accountContainer">
						은행명 : <c:out value="${resell.bankName}"/> / 
						예금주 : <c:out value="${resell.depositorName}"/>
						<br>
						계좌번호 : <c:out value="${resell.accountCode}"/>
					</div>
				</div>		
			</div>
			<div id="comment-container">
				<div class="comment-editor">
					<form action="${path}/board/writeBoardComment.do" method="post">
						<textarea name="content" cols="55" rows="3"></textarea>
						<input type="hidden" name="boardref" value="${board.boardNo}">
						<input type="hidden" name="level" value="1">
						<input type="hidden" name="commentref" value="0">
						<input type="hidden" name="commentWriter" value="${loginMember!=null?loginMember.memberId:''}">
						<button type="submit" id="btn-insert">등록</button>
					</form>
				</div>
				<table id="tbl-comment">
					<c:if test="${not empty resell.comments}">
						<c:forEach var="comment" items="${resell.comments}">
							<tr class="level1">
								<td>
									<sub class="comment-writer">
										<c:out value="${comment.memberNo==100000?'운영자':loginMember.memberId}"/>
									</sub>
								    <sub class="comment-date"><c:out value="${comment.resellCommentEnrollDate}"/></sub>
								    <br> 
								    <c:out value="${comment.content}"/>
								</td>
								<td>
								
								</td>
							</tr>
						</c:forEach>
					</c:if>	
				</table>
			</div>
		</div>
	</div>
</section>
<br><br><br><br>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
