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
        <h1 style="color: #348492; font-size: 40px;">비밀번호 찾기</h1>
    </div>
    <br>

	<form class="flexDiv" action="" method="post" onsubmit="">
	    <div id="searchDiv">
	    	<div style="width:100%; justify-content: center;">
	    		<img id="img" src="${path}/resources/images/member/찾기.jpg">
	    	</div>
			<div id="inputDiv">
	    		<br><br>
	    		<div class="flexDiv">
                    <img src="${path }/resources/images/member/아이디.png">
                    <div class="input-container">		
                        <input type="text" name="memberId" id="id" class="form__input" placeholder="아이디" required/>
                        
                        <label class="form__label" id="idTxt">아이디</label>
                    </div>
                </div>
                <br><br>
				<div class="flexDiv">
                	<img src="${path }/resources/images/member/이름.png">
                    <div class="input-container">		
                        <input type="text" id="name" name="memberName" class="form__input" placeholder="이름" required/>
                        <label class="form__label">이름</label>
                    </div>
                </div>
                <br><br>
	    		<div class="flexDiv">
                    <img src="${path }/resources/images/member/메일.png">
                    <div class="input-container" >
                        <input type="email" name="email" id="email" class="form__input" placeholder="이메일" required/>
                        <label class="form__label" id="mailTxt">이메일</label>
                    </div>
                 	<!-- <input type="button" class="oribtn" id="emailAuthentication" value="이메일인증"> -->
                </div>
                <br><br><br>
                
                <div class="flexDiv">
	                <div id="searchTip">
	                    <p>회원정보에 등록된 정보와 일치해야 </p>
	                    <p><strong><u>비밀번호</u></strong>를 찾을 수 있습니다.</p>
	                </div>
	            </div>
	            
	            <br><br><br>
	            <div class="flexDiv" style="justify-content: center;">
                    <input type="button" id="emailAuthentication" class="btn" value="비밀번호찾기">
                </div>
			</div>
		</div>
	</form>	
	
</section>
	<script>
		//이메일 정규표현식
		$("input[name=email]").blur(e=>{
			const userEmail=$("input[name=email]").val().trim();
			const emailChk=/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])+@[a-z]+\.[a-z]{2,3}/
			
			if(!emailChk.test(userEmail)){
				setTimeout(function(){ 
					alert("⛔ 이메일을 정확히 입력해주세요 ⛔");
					$("input[name=email]").val("");
				}, 10);
			}					
		});       	
              	
		// 이메일 인증번호
        $("#emailAuthentication").click(function() {
        	const emailVal = $("#email").val().trim();
        	
       		if(emailVal==''){
       			alert("이메일을 입력해주세요");
       		}else{
			   $.ajax({
			      type : "POST",
			      url : "searchPw",
			      data : {
			         "email" : $("#email").val(),
			         "memberName" : $("#name").val(),
			         "inputId" : $("#id").val()
			      },
			      success : function(data){
			         if(data=='false'){
			        	 alert("회원정보에 등록된 정보와 일치하는 정보가 없습니다. \n입력하신 내용을 다시 확인해주세요.");
			         
			         }else{
			        	 alert("비밀번호 찾기 성공!");
				   		 alert("해당 이메일로 임시비밀번호 발송이 완료되었습니다. \n 확인부탁드립니다.")
			        	 console.log("data : "+data);
				         location.assign("${path}/");
			         }
			      }
			   });
       		}
		});       	
             	
	</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/> 