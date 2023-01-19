<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<style>
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
		height:1000px; /* 수정요망 */
		display:flex;
		justify-content: center;
	}
	div#sellWrap>div#sellContent{
		width:50%;
		height:1000px; /* 수정요망 */
		border: 2px solid red;
	}
	div#sellWrap>div#sellContent>div.sellRow{
		display:flex;
	}
	div.sellRow>div.sellColLeft{
		width:130px;
		height:50px;
		display:flex;
		align-items:center;
		justify-content:right;
		padding-right:15px;
		background-color:rgb(52, 132, 146);
		color:white;
		margin:1px 5px 1px 5px;
		font-weight:bolder;
		font-size:15px;
	}
	div.sellRow>div.sellColRight{
		border:1px solid blue;
		width:100%;
		display:flex;
		justify-content:left;
		align-items:center;
		padding-left:15px;
	}
	div.sellRow select#category{

	}
</style>
<section id="sellpage">
	<div id="title">
		중고 가구 판매 신청
	</div>
	<div id="sellWrap">
		<div id="sellContent">
			<div class="sellRow">
				<div class="sellColLeft" style="border-radius:20px 0px 0px 0px;">
					카테고리 선택
				</div>
				<div class="sellColRight">
					<select id="category">
						<option>세부 항목을 선택해주세요.</option>
						<option>빨</option>
						<option>빨</option>
						<option>빨</option>
					</select>
				</div>	
			</div>
			<div class="sellRow">
				<div class="sellColLeft">
					크기 입력
				</div>
				<div class="sellColRight">
					<span>가로 <input type="number" name="width" style="width:50px"> cm</span>
				</div>		
			</div>
			<div class="sellRow">
				<div class="sellColLeft">
					크기 입력
				</div>
				<div class="sellColRight">
				
				</div>		
			</div>
			<div class="sellRow">
				<div class="sellColLeft">
					색상 입력
				</div>
				<div class="sellColRight">
				
				</div>		
			</div>
			<div class="sellRow">
				<div class="sellColLeft">
					크기 입력
				</div>
				<div class="sellColRight">
				
				</div>		
			</div>
			<div class="sellRow">
				<div class="sellColLeft">
					크기 입력
				</div>
				<div class="sellColRight">
				
				</div>		
			</div>
		</div>
	</div>
</section>
</body>
</html>