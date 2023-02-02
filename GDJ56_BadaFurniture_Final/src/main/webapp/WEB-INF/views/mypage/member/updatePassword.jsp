<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="loginMember" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal}"/>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
</head>
<style>
	div#updatePassword-container{
	/*     background:#348492; */
	    background:#393434;
	    color: white;
	}
	div#updatePassword-container table {
	    margin:0 auto;
	    border-spacing: 20px;
	}
	div#updatePassword-container table tr:last-of-type td {
	    text-align:center;
	}
</style>
<body>
	<div id="updatePassword-container">
		<form name="updatePwdFrm" action="${path }/member/updatePasswordEnd.do" method="post" 
			onsubmit="return passwordCheck();">
			<table>
				<tr>
					<th colspan="2">${loginMember.memberId }님의</th>
					<input type="text" name="memberId" value="${loginMember.memberId}" hidden>
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
						<input type="submit" value="변경" />&nbsp;
						<input type="button" value="닫기" onclick="fn_close();"/>						
					</td>
				</tr>
			</table>
		</form>
	</div>
	<script>
		
		const passwordCheck=()=>{
		 	const password = document.querySelector("#password_new").value;
		 	const passwordck = document.querySelector("#password_chk").value;
		 	/* if(password.trim().length<8){
		 		alert("비밀번호는 8글자이상 작성해야합니다");
		 		return false;
		 	} */
		 	
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