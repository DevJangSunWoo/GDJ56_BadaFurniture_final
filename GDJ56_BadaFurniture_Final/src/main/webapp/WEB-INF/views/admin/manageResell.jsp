<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/adminHeader.jsp"/>
<link rel="stylesheet" href="${path }/resources/css/admin/manageResell.css"/>

<style>
	#pageBar a.active {
		background-color: #4CAF50;
  		color: white;
	}
	#pageBar a:hover:not(.active) {
		background-color: #ddd;
	}
</style>

<section>

	<div id="listContainer">
		<h2>'내 가구 팔기' 관리</h2>
		<div id="summaryContainer">
			<table id="summaryTable">
				<tr>
					<th>전체신청</th>
					<td><c:out value="${summary[0].ALL_R}"/></td>
				</tr>
				<tr>
					<th>승인검토</th>
					<td><c:out value="${summary[0].STATE_1}"/></td>
				</tr>
				<tr>
					<th>수정요청</th>
					<td><c:out value="${summary[0].STATE_2}"/></td>
				</tr>
				<tr>
					<th>미입금</th>
					<td><c:out value="${summary[0].STATE_3}"/></td>
				</tr>
				<tr>
					<th>수거대기</th>
					<td><c:out value="${summary[0].STATE_4}"/></td>
				</tr>
	
			</table>
		</div>
		<div id="search-container">
			<span style="font-size: 17px;">검색타입 : </span>
        	<select id="searchType">
				<option value="searchAll" ${searchType.equals("SEARCH_ALL")?"selected":""}>전체조회</option>
				<option value="progressState" ${searchType.equals("PROGRESS_STATE")?"selected":""}>진행상태</option>
        		<option value="memberName" ${searchType.equals("MEMBER_NAME")?"selected":""}>신청자</option>
        		<option value="resellNo" ${searchType.equals("RESELL_NO")?"selected":""}>신청번호</option>
        	</select>

			<div id="search-searchAll">
				<form action="${path}/admin/resell.do" method="get">

					<label><input type="radio" name="searchKeyword" value="searchAll" checked>전체조회</label>
					<input type="hidden" name="searchType" value="SEARCH_ALL">
					<button class="searchBtn">검색</button>
				</form>
			</div>
        	<div id="search-progressState">
				<form action="${path}/admin/resell.do" method="get">

					<select name="searchKeyword" class="searchInput">
						<option value="승인검토" ${searchKeyword.equals("승인검토")?"selected":""}>승인검토</option>
						<option value="수정요청" ${searchKeyword.equals("수정요청")?"selected":""}>수정요청</option>
						<option value="승인거부" ${searchKeyword.equals("승인거부")?"selected":""}>승인거부</option>
						<option value="수거대기" ${searchKeyword.equals("수거대기")?"selected":""}>수거대기</option>
						<option value="수거완료" ${searchKeyword.equals("수거완료")?"selected":""}>수거완료</option>
						<option value="입금완료" ${searchKeyword.equals("입금완료")?"selected":""}>입금완료</option>
					</select>
					
					<input type="hidden" name="searchType" value="PROGRESS_STATE">
					<button class="searchBtn">검색</button>
				</form>
        	</div>
        	
        	<div id="search-memberName">
				<form action="${path}/admin/resell.do" method="get">

					<input type="text" name="searchKeyword" size="30" 
					placeholder="검색할 신청자 이름을 입력하세요" class="searchInput" value="${searchKeyword}">
					<input type="hidden" name="searchType" value="MEMBER_NAME">
					<button class="searchBtn">검색</button>
				</form>
        	</div>
        	
        	<div id="search-resellNo">
				<form action="${path}/admin/resell.do" method="get">

					<input type="text" name="searchKeyword" size="30" 
					placeholder="검색할 신청번호를 입력하세요" class="searchInput" value="${searchKeyword}">
					<input type="hidden" name="searchType" value="RESELL_NO">
					<button class="searchBtn">검색</button>
				</form>
        	</div>

        </div>
		<div id="propertyContainer" class = "tableContainer">
			<table id="propertyTable">
				<thead>
					<tr>
						<!-- <th>
							<input type="checkbox" name="chk" onclick="selectAll(this)">
						</th> -->
						<th>신청번호</th>
						<th>신청일자</th>
						<th>최종수정일</th>
						<th>사진</th>
						<th>분류</th>
						<th>상태</th>
						<th>판매희망금액</th>
						<th>신청자</th>
						<th>수거희망일</th>
						<th>상태</th>		
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty resell}">
						<tr>
							<td colspan="10">조회된 결과가 없습니다.</td>
						</tr>

					</c:if>
					<c:if test="${not empty resell}">
						<c:forEach var="r" items="${resell }">
							<tr>
								<!-- <td>
									<input type="checkbox" name="deleteList" value="${r.resellNo}">
								</td> -->
								<td>
									<input type="hidden" value="${r.resellNo}">
									<a href="${path}/resell/read.do?resellNo=${r.resellNo}">
										<c:out value="${r.resellNo}"/>
									</a>
								</td>
								<td><c:out value="${r.resellEnrollDate}"/></td>
								<td>${r.resellEditDate==null?"-":r.resellEditDate}</td>
								<td>
									<img src="${path}/resources/upload/resell/${r.getFiles().get(0).renamedFileName}">									
								</td>
								<td><c:out value="${r.item}"/></td>
								<td><c:out value="${r.grade}"/></td>
								<td class="price"><c:out value="${r.hopePrice}"/></td>
								<td><c:out value="${r.member.memberName}"/></td>
								<td><c:out value="${r.resellEditDate}"/></td>
								<td>
									<select name="progressState">
										<option value="승인검토" ${r.progressState.equals("승인검토")?"selected":""}>승인검토</option>
										<option value="수정요청" ${r.progressState.equals("수정요청")?"selected":""}>수정요청</option>
										<option value="승인완료" ${r.progressState.equals("승인완료")?"selected":""}>승인완료</option>
										<option value="승인거부" ${r.progressState.equals("승인거부")?"selected":""}>승인거부</option>
										<option value="수거대기" ${r.progressState.equals("수거대기")?"selected":""}>수거대기</option>
										<option value="수거완료" ${r.progressState.equals("수거완료")?"selected":""}>수거완료</option>
										<option value="입금완료" ${r.progressState.equals("입금완료")?"selected":""}>입금완료</option>

									</select>
								</td>
							</tr>
						</c:forEach>
					</c:if>		
				</tbody>		

			</table>
		</div>
		<div id="pageBarContainer">
			<div id=pageBar>
				${pageBar}
			</div>
		</div>
	</div>
</section>
<script>
	//검색 타입 변경
	$("select#searchType").change(e=>{
		const type = $(e.target).val();
		$("div#search-container>div").hide();
		$("div#search-"+type).css("display","inline-block");
		$("input[name=searchKeyword][type=text]").val("");
		$("div#search-hiding>label>input[name=searchKeyword]").first().prop("checked",true);
	});

	//검색조건 고정시켜놓기
	$(()=>{
		const type = $("#searchType").val();
		$("div#search-container>div").hide();
		$("div#search-"+type).css("display","inline-block");
	})

	//천원 단위 콤마
	$(()=>{
		$(".price").each((i,v)=>{
			let oriPrice=$(v).text();
			let numberPrice=Number(oriPrice);
			let parsedPrice=numberPrice.toLocaleString();
			
			// console.log("이전: "+oriPrice);
			// console.log("이후: "+parsedPrice);
			// console.log("=============")

			$(v).text(parsedPrice);
		})
	})




	//진행상태 변경하기
	function changeProgressState(resellNo,progressState){
		$.ajax({
			url:"${path}/admin/updateProgressState.do",
			data:{resellNo:resellNo,progressState:progressState},
			success:function(result){	
				alert(progressState+"상태로 변경했습니다.")
			}
		})
	}

	$("select[name=progressState]").change(e=>{
			const resellNo=$(e.target).parent().parent().children().children().val();
			const progressState=$(e.target).val();

			//console.log("resellNo : "+resellNo);
			//console.log("progressState : "+progressState);
			
			if(progressState=="수정요청"||progressState=="승인거부"||progressState=="승인완료"){
				if(confirm("진행상태를 "+progressState+"으로 변경하시겠습니까?")){					
					changeProgressState(resellNo,progressState);

				}else{
					location.reload();
				}		

			}else{
				changeProgressState(resellNo,progressState);
			}





	});
</script>

</body>
</html>

</body>
</html>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>