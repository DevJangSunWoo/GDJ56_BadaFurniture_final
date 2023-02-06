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

	<form class="flexDiv" action="${path}/member/searchIdEnd.do" method="post" onsubmit="return fn_invalidate(result);">
	    <div id="searchDiv">
	    	<div style="width:100%; justify-content: center;">
	    		<img id="img" src="${path}/resources/images/member/찾기.jpg">
	    	</div>
			<div id="inputDiv">
	    		<br><br>
	    		<div class="flexDiv">
                    <img src="${path }/resources/images/member/메일.png">
                    <div class="input-container" >
                        <input type="email" name="email" id="email" class="form__input" placeholder="이메일" required/>
                        <label class="form__label" id="mailTxt">이메일</label>
                    </div>
                 	<input type="button" class="oribtn" id="emailAuthentication" value="이메일인증">
                </div>
                <br><br>
                <div class="flexDiv">
                    <img src="${path }/resources/images/member/이메일체크.png" width="">
                    <div class="input-container">
                        <input type="text" name="emailck" class="form__input" id="memailconfirm" placeholder="이메일 인증번호" required/>
                        <label class="form__label" id="memailconfirmTxt">인증번호</label>
                    </div>
                    <!-- <input type="button" class="oribtn" value="인증확인"> -->		
                </div>
                <br><br>
				<div class="flexDiv">
                	<img src="${path }/resources/images/member/이름.png">
                    <div class="input-container">		
                        <input type="text" name="memberName" class="form__input" placeholder="이름" required/>
                        <label class="form__label">이름</label>
                    </div>
                </div>
                <br>
                
                <br><br><br>
                
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
						      url : "login/mailConfirm",
						      data : {
						         "email" : $("#email").val()
						      },
						      success : function(data){
						         alert("해당 이메일로 인증번호 발송이 완료되었습니다. \n 확인부탁드립니다.")
						         console.log("data : "+data);
						         chkEmailConfirm(data, $("#memailconfirm"), $("#memailconfirmTxt"));
						      }
						   });
	               		}
					});
	            	// 이메일 인증번호 체크 함수
	            	function chkEmailConfirm(data){
	            		$("#memailconfirm").on("blur", function(){
	            			if (data != $("#memailconfirm").val()) { 
	            				emconfirmchk = false;
	            				$("#memailconfirmTxt").html("<span id='emconfirmchk'>인증번호가 불일치</span>")
	            				$("#emconfirmchk").css({
	            					"color" : "#FA3E3E",
	            					"font-weight" : "bold",
	            					"font-size" : "14px"
	            				});
	            				
	            				fn_invalidate("false");
	            				//alert("인증번호가 잘못되었습니다.");
	            				//$("input[name=emailck]").val("");
	            				
	            			} else { // 아니면 중복아님
	            				$("button[type=submit]").css("background","#348492");
	            			
	            				emconfirmchk = true;
	            				$("#memailconfirmTxt").html("<span id='emconfirmchk'>인증번호 확인 완료</span>")
	
	            				$("#emconfirmchk").css({
	            					"color" : "#0D6EFD",
	            					"font-weight" : "bold",
	            					"font-size" : "14px"
	            				});
	            				
	            			}
	            		});
	            	}
	            	
                </script>
                
                <div class="flexDiv">
	                <div id="searchTip">
	                    <p>회원정보에 등록된 정보와 일치해야 </p>
	                    <p><strong><u>아이디</u></strong>를 찾을 수 있습니다.</p>
	                </div>
	            </div>
	            
	            <br><br><br>
	            <div class="flexDiv" style="justify-content: center;">
                    <input type="submit" class="btn" value="아이디찾기">
                </div>
			</div>
		</div>
	</form>	
	
</section>

	<script>
		//onsubmit
		const fn_invalidate=(result)=>{
			if(result=='false'){
				console.log(result);
				$("input[name=emailck]").focus();
				//$("input[type=submit]").css("background","gray");
				return false;
			}else{
				//$("button[type=submit]").css("background","#348492");
				return true;
			}
		}
	</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/> 