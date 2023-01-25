<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/adminHeader.jsp"/>
<link rel="stylesheet" href="${path }/resources/css/admin/manageProduct.css"/>

<section>
	<div id="listContainer">
		<h2>가구관리</h2>
		<div id="summaryContainer">
			<table id="summaryTable">
				<tr>
					<th class="tableTh">전체</th>
					<td class="tableTd">10</td>
				</tr>
				<tr>
					<th class="tableTh">판매중</th>
					<td class="tableTd">5</td>
				</tr>
				<tr>
					<th class="tableTh">거래중</th>
					<td class="tableTd">3</td>
				</tr>
				<tr>
					<th class="tableTh">숨긴 가구</th>
					<td class="tableTd">3</td>
				</tr>
			</table>
		</div>
		
		<div id="search-container">
			<span style="font-size: 17px;">검색타입 : </span> 
        	<select id="searchType">
        		<option value="searchAll">전체조회</option>
				<option value="soldOutState">판매상태</option>
        		<option value="showState">공개상태</option>
        		<option value="item">가구분류</option>
        		<option value="productNo">가구번호</option>
        		<option value="price">가격</option>
        	</select>
			        	
			<div id="search-searchAll">
				   <label><input type="radio" name="searchKeyword" value="" checked>전체조회</label>
				   <input type="hidden" name="searchType" value="HIDING">
				   <button class="searchBtn">검색</button>
			</div>
			<div id="search-soldOutState">
				   <label><input type="radio" name="searchKeyword" value="판매중">판매중</label> 
				   <label><input type="radio" name="searchKeyword" value="거래중">거래중</label>
				   <label><input type="radio" name="searchKeyword" value="거래완료">거래완료</label>
				   <input type="hidden" name="searchType" value="HIDING">
				   <button class="searchBtn">검색</button>
			</div>
			
        	<div id="search-showState">
       			<label><input type="radio" name="searchKeyword" value="Y">공개</label> 
       			<label><input type="radio" name="searchKeyword" value="N">숨김</label>
       			<input type="hidden" name="searchType" value="HIDING">
       			<button class="searchBtn">검색</button>
        	</div>

        	<div id="search-item">
                <select name="searchKeyword" class="searchInput">
                    <option value="책상">책상</option>
                    <option value="의자">의자</option>
                    <option value="화장대">화장대</option>
                    <option value="침대">침대</option>
                    <option value="서랍장">서랍장</option>
					<option value="책장">책장</option>
                    <option value="소파">소파</option>
                    <option value="옷장">옷장</option>
                </select>

       			<input type="hidden" name="searchType" value="BROKER_NO">
       			<button class="searchBtn">검색</button>
        	</div>
        	
        	<div id="search-productNo">
       			<input type="text" name="searchKeyword" size="30" 
       			placeholder="검색할 가구번호 입력" class="searchInput">
       			<input type="hidden" name="searchType" value="BROKER_NO">
       			<button class="searchBtn">검색</button>
        	</div>
        	
        	<div id="search-price">
       			<input type="number" name="searchKeyword" size="30" 
       			placeholder="가격 입력" class="searchInput"> 이하
       			<input type="hidden" name="searchType" value="BROKER_NO">
	      		<button class="searchBtn">검색</button>
        	</div>    	
        	
        </div>
		<div id="deleteBtnDiv">
			<button id="delete" class="deleteBtn">삭제</button>
		</div>
		<div id="propertyContainer" class = "tableContainer">
			<table id="propertyTable">
				<thead>
					<tr>
						<th><input type="checkbox" name="chk" onclick="selectAll(this)"></th>
						<th>가구번호</th>
						<th>분류</th>
						<th>사진</th>
						<th>색상</th>
						<th>가격</th>
						<th>업로드일</th>
						<th>판매일자</th>
						<th>판매상태</th>
						<th>공개상태</th>
						<th></th>					
					</tr>
					<tbody>
						<c:if test="${not empty product}">
							<c:forEach var="p" items="${product }">
								<tr>
									<td style="width: 10px;"><input type="checkbox" name="chk"></td>
									<td><a href="">${p.productNo }</a></td>
									<td>${p.item }</td>
									<td><img src=""></td>
									<td>${p.color }</td>
									<td>${p.price }</td>
									<td>${p.soldOutState }</td>
									<td>${p.productSoldOutDate }</td>
									<td>
										<select name="soldOutState">
											<option value="N" >판매중</option>
											<option value="I">거래중</option>
											<option value="Y">판매완료</option>
										</select>
										
									</td>
									<td>
										<select name="showState">
											<option value="Y">공개</option>
											<option value="N">숨김</option>
										</select>
										
									</td>
									<td style="width: 80px;"><button class="updateBtn" onclick="location.assign('${path}/admin/update.do')">수정</button></td>
								</tr>
							</c:forEach>
						</c:if>


					</tbody>
				</thead>

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

	//검색타입 변경
	$("select#searchType").change(e=>{
		const type = $(e.target).val();
		$("div#search-container>div").hide();
		$("div#search-"+type).css("display","inline-block");
		$("input[name=searchKeyword][type=text]").val("");
		$("div#search-hiding>label>input[name=searchKeyword]").first().prop("checked",true);
	});

	//체크박스 전체선택
	function selectAll(selectAll){
		const allCheckbox=document.querySelectorAll('input[type="checkbox"]');
		allCheckbox.forEach((checkbox)=>{
			checkbox.checked = selectAll.checked
		})

	}

	

</script>

</body>
</html>

</body>
</html>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>