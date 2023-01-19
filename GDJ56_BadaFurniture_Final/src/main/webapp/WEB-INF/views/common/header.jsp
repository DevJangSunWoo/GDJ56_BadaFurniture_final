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
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common/header.css"/>

<!-- 상단바 폰트 -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@500&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Ubuntu&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Rowdies:wght@300&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Cabin&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">

<body>
<!-- 상단 -->
    <div id="headerDiv">
        <img src="${path }/resources/images/BADAlogo.png" id="logo">
        <span class="button" id="headbtn"><a href="#demo-modal"></a></span>
    </div>

<!------------------------------------------------------------------------------------------------------------------>
    <!-- 로그인 모달창 -->
    <div id="demo-modal" class="modal">
        <div class="loginBox"> 
            <a href="#" id="modal__close">
                <!-- <img src="./아이콘/external-close-web-flaticons-flat-flat-icons.png" alt="" width="50px" height="50px"> -->
                <img src="${path }/resources/images/closebutton.png" alt="" width="50px" height="50px">
            </a>
            <img class="user" src="${path }/resources/images/loginIcon.png" height="100px" width="100px">
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
            <div class="text-center">
                <p style="color: #348492; font-weight: bolder;">회원가입</p>
            </div>
        </div>   
    </div>

<!------------------------------------------------------------------------------------------------------------------>
    <!-- 메뉴바 -->
    <div id="navDiv">
        <nav class="navMenu">
            <a href="#">Home</a>
            <a href="${path}/mypage.do">myPage</a>
            <a href="${path}/resell.do">Resell</a>
            <!-- <a href="#">Admin</a> -->
            <div class="dot"></div>
        </nav>
    </div>

