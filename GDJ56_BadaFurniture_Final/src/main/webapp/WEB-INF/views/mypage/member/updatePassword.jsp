<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="loginMember" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal}"/>
 
<!-- jquery -->
<script  src="http://code.jquery.com/jquery-latest.min.js"></script> 
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
</head>
<style>
	table input{
	    width: 237px;
    	height: 27px;
	}
	
	div#updatePassword-container table {
	    margin:0 auto;
	    border-spacing: 20px;
	    width: 100%;
	    font-size: 20px;
	}
	div#updatePassword-container table tr:last-of-type td {
	    text-align:center;
	}
	
	/* 버튼 */
	#passwordck{
	width: 100%;
	font-size: 30px;
	}
	
	#ok, #reset {
		margin: 30px;
	
		--c:  #229091; /* the color*/
		
		box-shadow: 0 0 0 .1em inset var(--c); 
		--_g: linear-gradient(var(--c) 0 0) no-repeat;
		background: 
		  var(--_g) calc(var(--_p,0%) - 100%) 0%,
		  var(--_g) calc(200% - var(--_p,0%)) 0%,
		  var(--_g) calc(var(--_p,0%) - 100%) 100%,
		  var(--_g) calc(200% - var(--_p,0%)) 100%;
		background-size: 50.5% calc(var(--_p,0%)/2 + .5%);
		outline-offset: .1em;
		transition: background-size .4s, background-position 0s .4s;
	}
	
	#ok:hover, #reset:hover {
	  --_p: 100%;
	  transition: background-position .4s, background-size 0s;
	  color: #fff;
	}
	#ok:active, #reset:active {
	  box-shadow: 0 0 9e9q inset #0009; 
	  background-color: var(--c);
	  color: #fff;
	}
	
	#ok{
	    width: 100px;
	    height: 40px;
	    font-size: 24px;
		/* background-color: #348492;
	    color: white; */
	    cursor: pointer;
	    border: none;
	    border-radius: 3px;
	}
	
	#reset{
		width: 100px;
	    height: 40px;
	    font-size: 24px;
		/* background-color: #ff4f4f;
	    color: white; */
	    color: black;
	    cursor: pointer;
	    border: none;
	    border-radius: 3px;
	}
	
	#reset>a{
		text-decoration: none;
		color: black;
	}
	
	#reset>a:hover{
		color:white;
	}
</style>
<body>
	<div id="updatePassword-container">
		<form name="updatePwdFrm" action="${path }/member/updatePasswordEnd.do" method="post" 
			onsubmit="return passwordCheck();">
			<table>
				<tr>
					<th colspan="2" style="font-size: 30px;">${loginMember.memberId }님의</th>
					<input type="hidden" name="memberId" value="${loginMember.memberId}">
				</tr>
				<tr>
					<th>현재 비밀번호</th>
					<td><input type="password" name="password" id="password" required></td>
				</tr>
				<tr>
					<th>변경할 비밀번호</th>
					<td>
						<input type="password" name="password_new" id="password_new" required>
					</td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td>	
						<input type="password" id="password_chk" required><br>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" id="ok" value="변경" />&nbsp;
						<input type="button" id="reset" value="닫기" onclick="fn_close();" style="--c:#E95A49"/>						
					</td>
				</tr>
			</table>
		</form>
	</div>
	<script>
		$(()=>{
			$("#password_new").blur(e=>{
				const pw=$("#password_new").val();
				const pwChk=/^[a-zA-Z0-9]+$/ //정규표현식
				console.log(pw);
				//비밀번호 정규표현식
				if(!pwChk.test(pw) || pw.trim().length<8){
					alert("⛔비밀번호는 8자 이상, 영문자/숫자로만 가능합니다.⛔");
					$("#pw").val('');
				}
			});
		});
		
		const passwordCheck=()=>{
		 	const password = document.querySelector("#password_new").value;
		 	const passwordck = document.querySelector("#password_chk").value;
		 	
		 	if(password!=passwordck){
		 		alert("비밀번호가 일치하지 않습니다");
		 		return false;
		 	}
		}
		
		//창 닫기
		const fn_close=()=>{
			window.close();
		}
	</script>
</body>
</html>