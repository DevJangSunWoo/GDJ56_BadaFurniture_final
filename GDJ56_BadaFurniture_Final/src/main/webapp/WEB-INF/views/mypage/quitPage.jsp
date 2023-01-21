<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
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
	div#mypageMenu{
		width:100%;
		height:500px;
		/* border:1px solid red; */
	}
	div#mypageMenu *{
		font-family: 'Nanum Gothic' !important;
	}
	div#mypageMenu>div.mypageRow{
		width:100%;
		height:212px;
		/* border:1px solid blue; */
		display:flex;
		justify-content:center;
	}
	div#mypageMenu>div.mypageRow>div.mypageCol{
		width:200px;
		height:200px;
		border:2px solid black;
		margin: 5px 3px 3px 5px;
		cursor:pointer; 
	}
	div#mypageMenu>div.mypageRow>div.mypageCol>div.innerTitle1{
		text-align: center;
		font-family: "Verdana";
		font-size:25px;
		height:40px;
		padding-top:15px;
	}
	div#mypageMenu>div.mypageRow>div.mypageCol>div.innerTitle2{
		text-align:center;
		font-size:13px;
	}
	div#mypageMenu>div.mypageRow>div.mypageCol>div.innerImg{
		text-align:center;
		margin-top:8px;
		margin-bottom:8px;
	}
	div#mypageMenu>div.mypageRow>div.mypageCol>div.innerImg>img{
		width:60px;
		height:60px;
	}
	div#mypageMenu>div.mypageRow>div.mypageCol>div.innerContent{
		text-align:center;
		font-size:13px;
	}
</style>
	<section class="mypage">
		<div id="title">
			<div id="innerTitle">
				Quit
			</div>
		</div>
		<div id="mypageMenu" style="margin-top:80px;">
			<div class="mypageRow">
				<div class="mypageCol">
					<input type="hidden" value="/mypage.do"/>
					<div class="innerTitle1">
						뒤로가기
					</div>
					<div class="innerTitle2">
						취소
					</div>
					<div class="innerImg">
						<img src="${path}/resources/images/mypage/back.png">
					</div>
					<div class="innerContent">
						마이페이지로
						<br>
						돌아갑니다.
					</div>
				</div>
				<div class="mypageCol">
					<input type="hidden" value="/member/quit.do"/>
					<div class="innerTitle1">
						탈퇴하기
					</div>
					<div class="innerTitle2">
						탈퇴
					</div>
					<div class="innerImg">
						<img src="${path}/resources/images/mypage/check.png">
					</div>
					<div class="innerContent">
						Bada Furniture
						<br>
						가입계정을 탈퇴합니다.
					</div>
				</div>
			</div>
		</div>
	</section>
	<script>
		$("div.mypageCol").click(e=>{
			let mapping;
			if($(e.target).attr("class") != "mypageCol"){
				mapping = $(e.target).parents("div.mypageCol").children().first().val();
			} else {
				mapping = $(e.target).children().first().val();
			}
			let url = "${path}" + mapping;
			location.assign(url);
		});
	</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>