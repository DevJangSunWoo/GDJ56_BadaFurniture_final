<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/adminHeader.jsp"/>
<link rel="stylesheet" href="${path }/resources/css/admin/manageProduct.css"/>


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
		<h2>가구 관리</h2>
		<!-- 요약테이블 -->
		<div id="summaryContainer">
			<table id="summaryTable">
				<tr>
					<th class="tableTh">전체</th>
					<td class="tableTd"><c:out value="${summary[0].ALLP}"/></td>
				</tr>
				<tr>
					<th class="tableTh">판매중</th>
					<td class="tableTd"><c:out value="${summary[0].SOSNP}"/></td>
				</tr>
				<tr>
					<th class="tableTh">거래중</th>
					<td class="tableTd"><c:out value="${summary[0].SOSIP}"/></td>
				</tr>
				<tr>
					<th class="tableTh">숨긴 가구</th>
					<td class="tableTd"><c:out value="${summary[0].SSNP}"/></td>
				</tr>
			</table>
		</div>
		

		<!-- 조건 검색하기 -->

		<div id="search-container">
			<span style="font-size: 17px;">검색타입 : </span> 
        	<select id="searchType">
        		<option value="searchAll" ${searchType.equals("SEARCH_ALL")?"selected":""}>전체조회</option>
				<option value="soldOutState" ${searchType.equals('SOLD_OUT_STATE')?"selected":""}>판매상태</option>
        		<option value="showState" ${searchType.equals('SHOW_STATE')?"selected":""}>공개상태</option>
        		<option value="item" ${searchType.equals('ITEM')?"selected":""}>가구분류</option>
        		<option value="productNo" ${searchType.equals('PRODUCT_NO')?"selected":""}>가구번호</option>
        		<option value="grade" ${searchType.equals('GRADE')?"selected":""}>상태</option>
        		<option value="price" ${searchType.equals('PRICE')?"selected":""}>가격</option>
        	</select>
			        	
			<div id="search-searchAll">
				<form action="${path}/admin/product.do" method="get">

					<label><input type="radio" name="searchKeyword" value="searchAll" ${searchKeyword.equals("searchAll")?"checked":""}>전체조회</label>
					<input type="hidden" name="searchType" value="SEARCH_ALL">
					<button class="searchBtn">검색</button>
				</form>
			</div>

			<div id="search-soldOutState">
				<form action="${path}/admin/product.do" method="get">

					<label><input type="radio" name="searchKeyword" value="N" ${searchKeyword.equals('N')?"checked":""}>판매중</label> 
					<label><input type="radio" name="searchKeyword" value="I" ${searchKeyword.equals('I')?"checked":""}>거래중</label>
					<label><input type="radio" name="searchKeyword" value="Y" ${searchKeyword.equals('Y')?"checked":""}>판매완료</label>
					<input type="hidden" name="searchType" value="SOLD_OUT_STATE">
					<button class="searchBtn">검색</button>
				</form>
			</div>
			
        	<div id="search-showState">
				<form action="${path}/admin/product.do" method="get">
					
					<label><input type="radio" name="searchKeyword" value="Y" ${searchKeyword.equals('Y')?"checked":""}>공개</label> 
					<label><input type="radio" name="searchKeyword" value="N" ${searchKeyword.equals('N')?"checked":""}>숨김</label>
					<input type="hidden" name="searchType" value="SHOW_STATE">
					<button class="searchBtn">검색</button>
				</form>

        	</div>

        	<div id="search-item">
				<form action="${path}/admin/product.do" method="get">

					<select name="searchKeyword" class="searchInput">
						<option value="책상" ${searchKeyword.equals("책상")?"selected":""}>책상</option>
						<option value="의자" ${searchKeyword.equals("의자")?"selected":""}>의자</option>
						<option value="화장대" ${searchKeyword.equals("화장대")?"selected":""}>화장대</option>
						<option value="침대" ${searchKeyword.equals("침대")?"selected":""}>침대</option>
						<option value="서랍장" ${searchKeyword.equals("서랍장")?"selected":""}>서랍장</option>
						<option value="책장" ${searchKeyword.equals("책장")?"selected":""}>책장</option>
						<option value="소파" ${searchKeyword.equals("소파")?"selected":""}>소파</option>
						<option value="옷장" ${searchKeyword.equals("옷장")?"selected":""}>옷장</option>
					</select>
					
					<input type="hidden" name="searchType" value="ITEM">
					<button class="searchBtn">검색</button>
				</form>
        	</div>
        	
        	<div id="search-productNo">
				<form action="${path}/admin/product.do" method="get">

					<input type="text" name="searchKeyword" size="30" 
					placeholder="검색할 가구번호 입력" class="searchInput" value="${searchKeyword}">
					<input type="hidden" name="searchType" value="PRODUCT_NO">
					<button class="searchBtn">검색</button>
				</form>
        	</div>

			<div id="search-grade">
				<form action="${path}/admin/product.do" method="get">

					<select name="searchKeyword" class="searchInput">
						<option value="최상" ${searchKeyword.equals("최상")?"selected":""}>최상</option>
						<option value="상" ${searchKeyword.equals("상")?"selected":""}>상</option>
						<option value="중" ${searchKeyword.equals("중")?"selected":""}>중</option>
					</select>
					
					<input type="hidden" name="searchType" value="GRADE">
					<button class="searchBtn">검색</button>
				</form>
			</div>
        	
        	<div id="search-price">
				<form action="${path}/admin/product.do" method="get">

					<input type="number" name="searchKeyword" size="30" 
					placeholder="가격 입력" class="searchInput" value="${searchKeyword}"> 이하
					<input type="hidden" name="searchType" value="PRICE">
					<button class="searchBtn">검색</button>
				</form>
        	</div>    	
        	
        </div>

		<!-- 가구 목록 -->

		<form action="${path}/admin/deleteProduct.do" method="post" onsubmit="return deleteConfirm();">
			<div id="deleteBtnDiv">
				<button type="submit" id="delete" class="deleteBtn">삭제</button>
			</div>
			<div id="propertyContainer" class = "tableContainer">
				<table id="propertyTable">
					<thead>
						<tr>
							<th><input type="checkbox" name="chk" onclick="selectAll(this)"></th>
							<th>가구번호</th>
							<th>사진</th>
							<th>제품명</th>
							<th>분류</th>
							<th>상태</th>
							<th>색상</th>
							<th>가격&nbsp;(원)</th>
							<th>업로드일</th>
							<th>판매상태</th>
							<th>공개상태</th>
							<th></th>					
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty product}">
							<tr>
								<td colspan="12">조회된 결과가 없습니다.</td>
							</tr>

						</c:if>
						<c:if test="${not empty product}">
							<c:forEach var="p" items="${product }">
								<tr>
									<td style="width: 10px;">
										<input type="checkbox" name="deleteList" value="${p.productNo}">
									</td>
									<td style="width: 20px;">
										<a class="viewProduct" href="${path}/product/view.do?productNo=${p.productNo}"><c:out value="${p.productNo }"/></a>
									</td>
									<td style="width: 70px;">
										<img id="productImg" src="${path}/resources/upload/product/${p.getFiles().get(0).renamedFileName}">
									</td>
									<td>${p.title }</td>
									<td style="width: 40px;"><c:out value="${p.item }"/></td>
									<td style="width: 20px;"><c:out value="${p.grade }"/></td>
									<td style="width: 30px;"><c:out value="${p.color }"/></td>
									<td class="price" style="width: 70px;"><c:out value="${p.price }"/></td>
									<td style="width: 60px;"><c:out value="${p.productEnrollDate }"/></td>
									<td>
										<select name="soldOutState">
											<option value="N" ${p.soldOutState=='N'?"selected":"" }>판매중</option>
											<option value="I" ${p.soldOutState=='I'?"selected":"" }>거래중</option>
											<option value="Y" ${p.soldOutState=='Y'?"selected":"" }>판매완료</option>
										</select>
										
									</td>
									<td>
										<select name="showState">
											<option value="Y" ${p.showState=='Y'?"selected":"" }>공개</option>
											<option value="N" ${p.showState=='N'?"selected":"" }>숨김</option>
										</select>										
									</td>
									<td style="width: 80px;"><button type="button" class="updateBtn" onclick="window.open('${path}/admin/update.do?productNo=${p.productNo }')">수정</button></td>
								</tr>
							</c:forEach>
						</c:if>							
					</tbody>								
				</table>
			</div>
		</form>
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

	//체크 안하고 삭제 버튼 눌렀을 때
	function deleteConfirm(){				
		let deleteList=$("[name=deleteList]");
		var chkArray=[];
		$('input:checkbox[name=deleteList]:checked').each(function(){
			chkArray.push(this.value);		
		});
		
		if(chkArray.length==0){
			alert("삭제할 가구를 선택해주세요.")
			return false;
		}else{
			if(confirm("총 "+chkArray.length+"개의 가구를 삭제하시겠습니까?")){
				return true;	
			}else{
				return false;
			}
		}
	}

	//판매상태 변경하기
	$("select[name=soldOutState]").change(e=>{
			const productNo=$(e.target).parent().parent().children().children().val();
			const soldOutState=$(e.target).val();
			// console.log(productNo);
			// console.log(soldOutState);

			$.ajax({
				url:"${path}/admin/updateSoldOutState.do",
				data:{productNo:productNo,soldOutState:soldOutState},
				success:function(result){		
					if(result.result>0){

						const nowState="";
						if(soldOutState=='N'){
							msg="판매중";
						}else if(soldOutState=='I'){
							msg="거래중";
						}else{
							msg="판매완료";
						}

						alert(msg+"으로 변경 완료");

						
					}else{
						alert("판매상태 변경 실패");
						
					}
				},
				error:function(result){
					alert("error! result 값 : "+result.result );	
				}
			})


	});


	//공개상태 변경하기
		$("select[name=showState]").change(e=>{
			const productNo=$(e.target).parent().parent().children().children().val();
			const showState=$(e.target).val();
			console.log(productNo);
			console.log(showState);

			$.ajax({
				url:"${path}/admin/updateShowState.do",
				data:{productNo:productNo,showState:showState},
				success:function(result){		
					if(result.result>0){
						alert("공개상태 변경 완료");
					}else{
						alert("공개상태 변경 실패");
						
					}
				},
				error:function(result){
					alert("error! result 값 : "+result.result );	
				}
			})


	});

	//검색조건 고정시켜놓기
	$(()=>{

		const type = $("#searchType").val();
		$("div#search-container>div").hide();
		$("div#search-"+type).css("display","inline-block");

	})



</script>

</body>
</html>

</body>
</html>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>