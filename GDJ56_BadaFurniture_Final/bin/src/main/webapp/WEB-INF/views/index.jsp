<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/> 

<!-- css -->
<link rel="stylesheet" href="${path }/resources/css/common/index.css"/>

<section>
	<div class="flexDiv">
	    <img src="${path }/resources/images/mainpage/mainPicture.jpg" class="mainSize">
	</div>

	<div id="iconDiv" class="flexDiv">
		<div class="mainSize" id="iconContainer">
			<div class="icon">
				<img src="${path }/resources/images/mainpage/전체.png">
				<h3>전체</h3>
			</div>
			<div class="icon">
				<img src="${path }/resources/images/mainpage/책장.png">
				<h3>책장</h3>
			</div>
			<div class="icon">
				<img src="${path }/resources/images/mainpage/의자.png">
				<h3>의자</h3>
			</div>
			<div class="icon">
				<img src="${path }/resources/images/mainpage/화장대.png">
				<h3>화장대</h3>
			</div>
			<div class="icon">
				<img src="${path }/resources/images/mainpage/침대.png">
				<h3>침대</h3>
			</div>
			<div class="icon">
				<img src="${path }/resources/images/mainpage/서랍장.png">
				<h3>서랍장</h3>
			</div>
			<div class="icon">
				<img src="${path }/resources/images/mainpage/책상.png">
				<h3>책상</h3>
			</div>
			<div class="icon">
				<img src="${path }/resources/images/mainpage/쇼파.png">
				<h3>쇼파</h3>
			</div>
			<div class="icon">
				<img src="${path }/resources/images/mainpage/옷장.png">
				<h3>옷장</h3>
			</div>
		</div>
	</div>
	
	<div class="flexDiv">
		<h1>Furniture List</h1>
	</div>
	
	<div>
		
	</div>
	
	
	
	
	
	
	
	
</section>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>