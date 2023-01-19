<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- JQuery -->
<script src="${path}/resources/js/jquery-3.6.1.min.js"></script>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">

</head>



<style>

    body *{
		font-family: 'Nanum Gothic', sans-serif;;
	}
	
/* 상단 메뉴바 */
/* @import url("https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700&display=swap");*/
#navDiv {
    background-color: #393434;
    display: flex;
    justify-content: space-between;
    height: 80px;
    width: 100%;

    align-items: center;
    text-align: center;




}

.navMenu a {
    /* color: #f6f4e6; */
    /* font-family: 'Noto Serif Display', serif; */
    color: white;
    text-decoration: none;
    font-size: 1.5em;
    text-transform: uppercase;
    font-weight: 500;
    display: inline-block;
    width: 250px;
    height: 30px;
    text-align: center;
    -webkit-transition: all 0.2s ease-in-out;
    transition: all 0.2s ease-in-out;
    
    /* border: red 1px solid; */
    
    padding-top: 21px;
    padding-bottom:23px;
}

.navMenu a:hover {
  color: #348492;
}

/* 
.navMenu .dot {
  width: 10px;
  height: 10px;
  background: #fddb3a;
  border-radius: 50%;
  opacity: 0;
  -webkit-transform: translateX(1px);
  transform: translateX(1px);
  -webkit-transition: all 0.2s ease-in-out;
  transition: all 0.2s ease-in-out;
}

.navMenu a:nth-child(1):hover ~ .dot {
  -webkit-transform: translateX(195px);
  transform: translateX(195px);
  -webkit-transition: all 0.2s ease-in-out;
  transition: all 0.2s ease-in-out;
  opacity: 1;
}

.navMenu a:nth-child(2):hover ~ .dot {
  -webkit-transform: translateX(600px);
  transform: translateX(600px);
  -webkit-transition: all 0.2s ease-in-out;
  transition: all 0.2s ease-in-out;
  opacity: 1;
}

.navMenu a:nth-child(3):hover ~ .dot {
  -webkit-transform: translateX(1005px);
  transform: translateX(1005px);
  -webkit-transition: all 0.2s ease-in-out;
  transition: all 0.2s ease-in-out;
  opacity: 1;
}

.navMenu a:nth-child(4):hover ~ .dot {
  -webkit-transform: translateX(450px);
  transform: translateX(450px);
  -webkit-transition: all 0.2s ease-in-out;
  transition: all 0.2s ease-in-out;
  opacity: 1;
} */

</style>


<body>
	<div id="navDiv">
	    <nav class="navMenu">
	        <a href="${path }/admin/dash.do" style="margin-right: 100px;font-weight: bold;">관리자 페이지</a>
	        <a href="${path }/admin/insert.do">가구 올리기</a>
	        <a href="${path }/admin/furniture.do">가구 관리</a>
	        <a href="${path }/admin/order.do">주문 관리</a>
	        <a href="${path }/admin/resell.do">'내 가구 팔기' 관리</a>
	        <div class="dot"></div>
	    </nav>
	</div>