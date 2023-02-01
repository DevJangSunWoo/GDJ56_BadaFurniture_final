<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BADA 관리자 페이지</title>

<!-- JQuery -->
<script src="${path}/resources/js/jquery-3.6.1.min.js"></script>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">

<link rel="stylesheet" href="${path }/resources/css/common/adminHeader.css"/>

</head>



<body>
<!-- 로고 -->
  <div id="headerDiv">
  	<div>
      <img src="${path }/resources/images/mainpage/BADAlogo.png" id="logo">
      <span class="button" id="headbtn"><a href="#demo-modal"></a></span>
  	</div>
  	<div id="adminIdDiv">
  		<span id="adminId"> 🛠️ 관리자</span><br>
      <button id="logOutBtn" onclick="location.assign('${path}/member/logout.do')">로그아웃</button>
  	</div>
  </div>  
  
  
  <div id="navDiv">
        <nav class="navMenu">
            <a href="${path }/admin" style="margin-right: 30px;font-weight: bold;">관리자 페이지</a>
            <a href="${path }/admin/insert.do">가구 올리기</a>
            <a href="${path }/admin/product.do">가구 관리</a>
            <a href="${path }/admin/order.do">주문 관리</a>
            <a href="${path }/admin/delivery.do">배송 관리</a>
            <a href="${path }/admin/refund.do">취소/반품 관리</a>
            <a href="${path }/admin/resell.do" style="margin-left: 40px;">'내 가구 팔기' 관리</a>
        </nav>
  </div>