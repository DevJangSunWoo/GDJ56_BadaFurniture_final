<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<style>
	/* section{
		display: flex;
		justify-content: center;
	} */
	
	.flexDiv, #searchDiv{
	    display: flex;
	    justify-content: center;
	}
	
	#searchDiv{
		border: 2px solid black;
		width: 60%;
		height: 700px;
	}
	
	#img{
		width: 100%;
		height: 100%;
			
	}
	
	#inputDiv {
	    width: 100%;
	    text-align: center;
	    background-color: lightgrey;
	}
	
	#inputDiv h2{
		font-size: 34px;
	}
	#inputDiv span{
		font-size: 34px;
		margin-left: 5px;
	}
	#showId {
		color: red;
		font-weight: bolder;
		font-size: 40px;
	}
	
	/* 버튼 */
	.btn {
	    /* font-family: 'Poppins', sans-serif; */
	    text-align: center;
	    text-transform: uppercase;
	    cursor: pointer;
	    font-size: 19px;
	    letter-spacing: 4px;
	    position: relative;
	    background-color: #348492;
	    border: none;
	    color: #fff;
	    padding: 20px;
	    width: 70%;
	    height: 61px;
	    text-align: center;
	    transition-duration: 0.4s;
	    overflow: hidden;
	    box-shadow: 0 5px 10px #193047;
	    border-radius: 10px;
	}
	
	.btn:hover {
	    background: #fff;
	    box-shadow: 0px 2px 10px 5px #1abc9c;
	    color: #000;
	}
	
	.btn:after {
	    content: "";
	    background: #1abc9c;
	    display: block;
	    position: absolute;
	    padding-top: 300%;
	    padding-left: 350%;
	    margin-left: -20px !important;
	    margin-top: -120%;
	    opacity: 0;
	    transition: all 0.8s
	}
	
	.btn:active:after {
	    padding: 0;
	    margin: 0;
	    opacity: 1;
	    transition: 0s
	}
	
	.btn:focus { outline:0; }
</style>

<section>
	<div class="flexDiv">
        <h1 style="color: #348492; font-size: 40px;">아이디 찾기</h1>
    </div>
    <br>

	<div class="flexDiv">
	    <div id="searchDiv">
		    <div style="width:100%; justify-content: center;">
	    		<img id="img" src="${path}/resources/images/member/찾기.jpg">
	    	</div>
	    	
	    	<div id="inputDiv">
                <br><br><br><br><br><br><br><br><br><br>
                <div>
                	<h2>회원님의 아이디는</h2>
                	<span id="showId">${memberId }</span>
                	<span>입니다.</span>
                </div>
	            <br><br><br><br><br><br>
	            <div class="flexDiv" style="justify-content: center;">
                    <input type="button" class="btn" value="비밀번호 찾기" onclick="fn_searchPw();">
                </div>
            </div>
		</div>
	</div>

</section> 
	<script>
		const fn_searchPw=()=>{
			location.assign("");
		}
	</script>



<jsp:include page="/WEB-INF/views/common/footer.jsp"/> 