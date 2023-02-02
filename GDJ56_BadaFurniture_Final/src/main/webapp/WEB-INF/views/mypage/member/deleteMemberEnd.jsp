<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<c:set var="loginMember" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal}"/>

<style>
	section{
		background-color: lightgray;
	}
	#divOuter{
	    justify-content: center;
	    display: flex;    
	    margin-top: 30px;

	}
	#withdrawal-Container{
	    width: fit-content;
	    height: fit-content;
	}
	#withdrawal-Container>div>hr{
	    width:310px;
	    margin-left: 0px;
	}
	#withdrawal-Container>div>h1{
	    margin-bottom: 10px;
	    padding-top: 30px;
	}
	#withdrawal-Container>div>input{
	    width:300px;
	    height:30px;
	
	}
	p#info{
	
	    width:310px;
	    height:20px;
	}
	
	#withdrawalBtn-Container{
	    margin-top: 170px;
	}	
	
	#agreeck{
		width: 22px;
    	height: 16px;
	}
	
	.oribtn {
	    background-color: #348492;
	    color: white;
	    border: none;
	    border-radius: 3px;
	    width: 95%;
	    height: 35px;
	    margin-right: 10px;
	    margin-top: 10px;
	    cursor: pointer;
	}
	
</style>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<section>
	<div id="divOuter">
        <div id="withdrawal-Container">
            <h1>회원탈퇴 안내</h1>
            <hr>
            <div id="info-Container">
                <p id="info">
                    지금까지 <b>BADA Furniture</b>의 서비스를 이용해주셔서 감사합니다. <br><br>
                    1. 회원탈퇴 시 해당 아이디는 즉시 탈퇴처리됩니다. <br>
                    2. 회원정보, 알림, 매물 문의 및 조회내역 등 모든 정보가 삭제되고 복구할 수 없습니다.
                </p>
             </div>
            <div id="withdrawalBtn-Container">
                <hr>
                <form id="withdrawal" action="${path}/member/deleteMemberResult.do" method="post">
                	<label><input type="checkbox" id="agreeck" name="withdrawalAgree" value="Y" required> 
                	<span>위 내용을 숙지하였으며, 동의합니다.</span></label>
                	<input type="hidden" name="memberNo" value="${loginMember.memberNo}">
                	<br><br>
                	<div style="display: flex; justify-content: center;">
                		<button class="oribtn" >탈퇴하기</button>
                	</div>
                </form>
                <br>
            </div>
        </div>             
    </div>
</section> 
<jsp:include page="/WEB-INF/views/common/footer.jsp"/> 