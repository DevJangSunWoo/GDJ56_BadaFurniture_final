<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/> 

<!-- css -->
<link rel="stylesheet" href="${path }/resources/css/member/searchId.css"/>

<section>
	<div class="flexDiv">
        <h1 style="color: #348492; font-size: 40px;">아이디 찾기</h1>
    </div>
    <br>

	<form class="flexDiv" action="" method="post">
	    <div id="searchDiv">
	    	<div style="width:100%; justify-content: center;">
	    		<img id="img" src="${path}/resources/images/member/찾기.jpg">
	    	</div>
			<div id="inputDiv">
	    		<br><br>
				<div class="flexDiv">
                	<img src="${path }/resources/images/member/이름.png">
                    <div class="input-container">		
                        <input type="text" name="memberName" class="form__input" placeholder="이름" required/>
                        <label class="form__label">이름</label>
                    </div>
                </div>
                <br><br>
		        
		        <div class="flexDiv">
                    <img src="${path }/resources/images/member/전화.png">
                    <div class="input-container">
                        <input type="text" name="phone" class="form__input" placeholder="전화번호(-포함)" required/>
                        <label class="form__label">전화번호</label>		
                    </div>
                </div>
                <br><br>
                
                <div class="flexDiv">
                    <img src="${path }/resources/images/member/메일.png">
                    <div class="input-container" >
                        <input type="email" name="email" id="email" class="form__input" placeholder="이메일" required/>
                        <label class="form__label" id="mailTxt">이메일</label>
                    </div>
<!--                    <input type="button" class="oribtn" id="emailAuthentication" value="이메일인증" hidden> -->
                </div>
                <br><br><br>
                
                <div class="flexDiv">
	                <div id="searchTip">
	                    <p>회원정보에 등록된 정보와 일치해야 </p>
	                    <p><strong><u>아이디</u></strong>를 찾을 수 있습니다.</p>
	                </div>
	            </div>
	            
	            <br><br><br>
	            <div class="flexDiv" style="justify-content: center;">
                    <button type="submit" class="btn">회원가입</button>
                </div>
			</div>
		</div>
	</form>
	

</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/> 