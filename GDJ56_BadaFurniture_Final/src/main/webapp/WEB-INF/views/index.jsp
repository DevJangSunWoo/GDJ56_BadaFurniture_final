<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/> 

<!-- css -->
<link rel="stylesheet" href="${path }/resources/css/common/index.css"/>

<section>
	<div id="mainDiv">
	    <img src="${path }/resources/images/mainpage/mainPicture.jpg" id="mainPicture">
	</div>

</section>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>