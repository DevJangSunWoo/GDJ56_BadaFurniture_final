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
        <img src="${path }/resources/images/mainpage/BADAlogo.png" id="logo" style="cursor:pointer;">
        
        <c:if test="${empty loginMember }">
        	<span class="headbtn" id="headbtn"><a href="#demo-modal"></a></span>
        </c:if>
        
        <c:if test="${not empty loginMember }">
        	<div style="display: flex; margin-top:10px">
	        	<span id="alertImgContainer"><img id="alertImg" width="60px" height="60px" style="cursor:pointer;"/></span>
	        	<div style="display: flex; margin-right: 5px;">
	        	  <details>
			        <summary id="memberName"><u>${loginMember.memberName}님</u></summary>
			        <nav class="memberMenu">
		        		<c:if test="${loginMember.memberId.equals('admin')}">
							<a href="${path}/admin">관리자페이지</a>
						</c:if>
						<c:if test="${!loginMember.memberId.equals('admin')}">
							<a href="${path}/mypage/alert.do">알림</a>
							<a href="${path}/mypage/cart.do">장바구니</a>
							<a href="${path}/mypage/order.do">주문목록</a>
						</c:if>
						<a href="${path}/member/updateMember.do">정보수정</a>
						<a href="${path}/member/logout.do ">로그아웃</a>
			        </nav>
			      </details>
		        </div>
        	</div>
        </c:if> 
    </div>
    

<!------------------------------------------------------------------------------------------------------------------>
    <!-- 로그인 모달창 -->
    <div id="demo-modal" class="loginModal" style="z-index:3">
        <div class="loginBox"> 
            <a href="#" id="loginModal__close">
                <!-- <img src="./아이콘/external-close-web-flaticons-flat-flat-icons.png" alt="" width="50px" height="50px"> -->
                <img src="${path }/resources/images/mainpage/closebutton.png" alt="" width="50px" height="50px">
            </a>
            <img class="user" src="${path }/resources/images/mainpage/loginIcon.png" height="100px" width="100px">
            <h3>Sign in here</h3>
            <form action="${path}/member/login.do" method="post">
                <div class="inputBox"> 
                    <input id="uname" type="text" name="memberId" placeholder="아이디"> 
                    <input id="pass" type="password" name="password" placeholder="비밀번호"> 
                </div>
                <br>
                <input type="submit" value="Login">
            </form>
            <div style="display: flex; justify-content: center;">
                <a href="${path}/member/searchId.do" class="find">아이디 찾기<br> </a> 
                &nbsp; &nbsp; <a> | </a> &nbsp; &nbsp;
                <a href="${path}/member/searchPw.do" class="find">비밀번호 찾기<br> </a>
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
    
<!------------------------------------------------------------------------------------------------------------------>    
    <script>
    $(()=>{
    	<c:if test="${loginMember != null}">
    	$.ajax({
   			url:"${path}/alert/countReadState.do",
   			success:data=>{
   				let alertImg = $("img#alertImg");
   				if(data > 0){
   					alertImg.attr("src","${path }/resources/images/mainpage/new종.png");
   				} else{
   					alertImg.attr("src","${path }/resources/images/mainpage/종.png");
   				}
   				$("span#alertImgContainer").append(alertImg);
   			}
    	});
    	</c:if>
    });
    
    $(document).on("click","span#alertImgContainer>img", e=>{
    	location.assign("${path}/mypage/alert.do");
    });
    
    $("#logo").click(e=>{
    	location.assign("${path}")
    });
    </script>

