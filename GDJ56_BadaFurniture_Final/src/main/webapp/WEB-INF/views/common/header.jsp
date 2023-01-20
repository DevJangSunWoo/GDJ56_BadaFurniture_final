<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bada Furniture</title>
</head>
<!-- JQuery -->
<script src="${path}/resources/js/jquery-3.6.1.min.js"></script>

<!-- css -->
<link rel="stylesheet" href="${path }/resources/css/common/header.css"/>

<!-- 상단바 폰트 -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@500&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Ubuntu&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Rowdies:wght@300&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Cabin&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">

<body>
<!-- 상단 -->
    <div id="headerDiv">
        <img src="${path }/resources/images/mainpage/BADAlogo.png" id="logo">
        <c:if test="${not empty loginMember }">
        	<span class="button" id="headbtn"><a href="#demo-modal"></a></span>
        </c:if>
        <c:if test="${empty loginMember }">
        	<div style="display: flex; margin-top:10px">
	        	<span><img src="${path }/resources/images/mainpage/종.png" width="60px" height="60px"></span>
	        	<div style="display: flex; margin-right: 5px;">
	        	  <details>
			        <summary id="memberName"><u>유저공일님</u></summary>
			        <nav class="memberMenu">
			          <a href="#link">알림</a>
			          <a href="#link">장바구니</a>
			          <a href="#link">주문목록</a>
			          <a href="#link">내 정보수정</a>
			          <a href="#link">로그아웃</a>
			          
			        </nav>
			      </details>
		        </div>
        	</div>
        </c:if>
    </div>

<!------------------------------------------------------------------------------------------------------------------>
    <!-- 로그인 모달창 -->
    <div id="demo-modal" class="modal">
        <div class="loginBox"> 
            <a href="#" id="modal__close">
                <!-- <img src="./아이콘/external-close-web-flaticons-flat-flat-icons.png" alt="" width="50px" height="50px"> -->
                <img src="${path }/resources/images/mainpage/closebutton.png" alt="" width="50px" height="50px">
            </a>
            <img class="user" src="${path }/resources/images/mainpage/loginIcon.png" height="100px" width="100px">
            <h3>Sign in here</h3>
            <form action="login.php" method="post">
                <div class="inputBox"> 
                    <input id="uname" type="text" name="Username" placeholder="아이디"> 
                    <input id="pass" type="password" name="Password" placeholder="비밀번호"> 
                </div> 
                <input type="submit" name="" value="Login">
            </form>
            <div style="display: flex; justify-content: center;">
                <a href="#" class="find">아이디 찾기<br> </a> 
                &nbsp; &nbsp; <a> | </a> &nbsp; &nbsp;
                <a href="#" class="find">비밀번호 찾기<br> </a>
            </div>
            <br><br>
            <div class="text-center" style="float:left">
                <a href="${path}/member/enrollMember.do" class="find">회원가입</a>
            </div>
        </div>   
    </div>

<!------------------------------------------------------------------------------------------------------------------>
    <!-- 메뉴바 -->
    <div id="navDiv">
        <nav class="navMenu">
            <a href="${path}/">Home</a>
            <a href="${path}/mypage.do">myPage</a>
            <a href="${path}/resell/write.do">Resell</a>
            <!-- <a href="#">Admin</a> -->
            <div class="dot"></div>
        </nav>
    </div>

