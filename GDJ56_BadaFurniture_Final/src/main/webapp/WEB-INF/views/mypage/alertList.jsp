<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<style>
	section.mypage>div#title{
		width:100%;
		height:200px;
	}
	section.mypage>div#title>div#innerTitle{
		display:flex;
		align-items:center;
		justify-content:center;
		width:100%;
		height:200px;
		font-family:"Courier New";
		font-weight:bolder;
		font-size:50px;
	} 
	
	div#alertWrap{
		width:100%; 
		/* height:1000px; */ /* 수정요망 */
		display:flex;
		justify-content: center;
	}
	div#alertWrap *{
		font-family: 'Nanum Gothic' !important;
	}
	div#alertWrap>div#alertContent{
		width:900px; /* px로 수정 */ 
		/* height:1000px; */ /* 수정요망 */
		/* border: 2px solid red; */
	}
	
	
	table#alertTable{
		width:100%;
		/* border:1px solid black; */
		border-top:8px solid black;
		border-collapse: collapse;
	}
	table#alertTable th{
		text-align: center;
	}
	table#alertTable td{
		height:60px;
	}
	table#alertTable tr>th:first-child, table#alertTable tr>td:first-child{
		width:100px;
	}
	table#alertTable tr>th:nth-child(2), table#alertTable tr>td:nth-child(2){
		width:650px;
	}
	table#alertTable tr>th:nth-child(3), table#alertTable tr>td:nth-child(3){
		width:140px;
	}
	table#alertTable th{
		padding:0px;
		border-bottom:2px solid black;
		height:52px;
	}
	table#alertTable td{
		padding:0px;
		text-align:center;
		border-bottom:1px solid grey;
	}
	button#deleteSelect{
		padding:0px;
		border:2px solid red;
		width:70px;
		height:25px;
		background-color:white;
		color:red;
		border-radius:5px;
		padding-bottom:2px;
		margin:1px;
	}
</style>
	<section class="mypage">
		<div id="title">
			<div id="innerTitle">
				Alert
			</div>
		</div>
		<div id="alertWrap">
			<div id="alertContent">	
				<table id="alertTable"> 
					<tr> 
						<th>
							<input type="checkbox" class="checkAll" style="cursor:pointer;">
						</th>
						<th>알림내용</th>
						<th>알림일자</th>
					</tr>
					<c:if test="${not empty alerts}">
						<c:forEach var="alert" items="${alerts}">
							<tr>
								<td>
									<input type="checkbox" class="check" name="alertNo" value="${alert.alertNo}" style="cursor:pointer;">
								</td>
								<td>
									${alert.detail}
									<c:if test="${alert.readState == 'N'}">
										<button style="width:24px;height:12px;border:none;background-color:red;font-size:8px;color:white;text-align:center;padding:0px;">new</button>
									</c:if>
								</td>
								<td>
									<fmt:formatDate value="${alert.alertEnrollDate}" type="date" pattern="yyyy-MM-dd(E)"/>
								</td>
							</tr>
						</c:forEach>
					</c:if>
				</table>
				<div style="display:flex;justify-content: left;">
					<div>
						<button  id="deleteSelect" style="margin:15px 0px 10px 15px;font-size:13px;">선택삭제</button>
					</div>
				</div>
				<div id="pageBar" style="text-align:center">
					${pageBar }
				</div>
			</div>
		</div>
	</section>

<script>
	
	//전체선택 체크박스를 클릭했을 때
	$("input.checkAll").change(e=>{
		if($(e.target).prop("checked")==true){
			$("input.check").prop("checked",true);	
		} else {
			$("input.check").prop("checked",false);	
		}
	});
	
	//알림 체크박스를 클릭했을 때
	$("input.check").change(e=>{
		if($("input.check").length == $("input.check:checked").length){
			$("input.checkAll").prop("checked",true);
		} else {
			$("input.checkAll").prop("checked",false);
		}
		sumPrice();
	});
	
	//선택삭제 버튼 클릭했을 때
	$("button#deleteSelect").click(e=>{
		let queryString = "";
		if($("input.check:checked").length > 0){
			if(confirm("선택하신 알림을 삭제하시겠습니까?")){
				$("input.check:checked").each((i,v)=>{
					queryString += "alertNo=" + $(v).val() + "&";
				});
				queryString = queryString.substring(0,queryString.length-1);
				location.replace("${path}/alert/delete.do?" + queryString);
			} 
		}
	});

</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
