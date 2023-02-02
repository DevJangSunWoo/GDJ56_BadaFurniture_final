<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="loginMember" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<!-- css -->
<link rel="stylesheet" href="${path }/resources/css/member/quitPage.css"/>

<!-- jQuery Modal -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />

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
	

<!--------------------------------------------------------------------------------------------------->	
	<!-- 패스워드 modal -->
	<div id="ex1" class="modal">
		<p>📢 비밀번호를 입력해 주세요.</p>
		<input type="hidden" id="memberId" value="${loginMember.memberId}">
		<input type="password" name="password" id="passwordck" placeholder="비밀번호">
  		<br><br><br>
  		<div style="display: flex; justify-content: space-around;">
	  		<input type="button" id="ok" value="확인" onclick="fn_passwordCheck();">
	  		<div id="reset">
	  			<a href="#" rel="modal:close" onclick="reset();">취소</a>
	  		</div>
  		</div>
	</div>
	
	<!-- Link to open the modal -->
	<p><a href="#ex1" id="openModal" rel="modal:open" hidden>Open Modal</a></p>
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
		
		//div 클릭시	
		if(url=='${path}/member/deleteMember.do'){ //탈퇴하기 누를시
			$("#openModal").get(0).click();
			$("#passwordck").focus();
		}else{ //마이페이지로 이동
			location.assign(url);
		}
	});
	
	//패스워드 기본정보와 일치할 경우 페이지이동
	const fn_passwordCheck=()=>{
		$.ajax({
			type : "POST",
			url : "${path}/member/deleteMember.do",
			data : {
				"password": $("#passwordck").val(),
				"memberId": $("#memberId").val()	
			},
			success : data=>{
				if(data=='true') {
					alert("비밀번호 확인완료");
					location.assign("${path}/member/deleteMemberEnd.do");
				}else{
					alert("비밀번호가 맞지 않습니다. 다시 입력해주세요.");
				}
			}
			
		});
	}
	
	//취소버튼 누르면 패스워드 value값 지우기
	const reset=()=>{
		$("#passwordck").val("");
	}
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>