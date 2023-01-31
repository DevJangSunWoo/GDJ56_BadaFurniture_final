<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<!-- css -->
<link rel="stylesheet" href="${path }/resources/css/member/quitPage.css"/>

<section class="mypage">
	<div id="title">
		<div id="innerTitle">
			Quit
		</div>
	</div>
	<div id="mypageMenu">
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
				<input type="hidden" value="/member/deleteMember.do"/>
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