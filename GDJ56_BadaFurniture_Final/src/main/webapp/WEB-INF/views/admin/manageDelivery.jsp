<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/adminHeader.jsp"/>
<link rel="stylesheet" href="${path }/resources/css/admin/manageDelivery.css"/>


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
		<h2>배송 관리</h2>
		<!-- 요약테이블 -->
		<div id="summaryContainer">
			<table id="summaryTable">
				<tr>
					<th class="tableTh">배송대기</th>
					<td id="summary_state1" class="tableTd"><c:out value="${summary.STATE_1}"/></td>
				</tr>
				<tr>
					<th class="tableTh">배송중</th>
					<td id="summary_state2" class="tableTd"><c:out value="${summary.STATE_2}"/></td>
				</tr>
				<tr>
					<th class="tableTh">배송완료</th>
					<td id="summary_state3" class="tableTd"><c:out value="${summary.STATE_3}"/></td>
				</tr>
			</table>
		</div>
		

		<!-- 조건 검색하기 -->

		<div id="search-container">
			<span style="font-size: 17px;">검색타입 : </span> 
        	<select id="searchType">
        		<option value="searchAll" ${searchType.equals("SEARCH_ALL")?"selected":""}>전체조회</option>
				<option value="deliveryState" ${searchType.equals('DELIVERY_STATE')?"selected":""}>배송상태</option>
        		<option value="orderSheetNo" ${searchType.equals('ORDER_SHEET_NO')?"selected":""}>주문번호</option>
        		<option value="orderDetailNo" ${searchType.equals('ORDER_DETAIL_NO')?"selected":""}>주문상세번호</option>
        	</select>
			        	
			<div id="search-searchAll">
				<form action="${path}/admin/delivery.do" method="get">

					<label><input type="radio" name="searchKeyword" value="searchAll" ${searchKeyword.equals("searchAll")?"checked":""} checked>전체조회</label>
					<input type="hidden" name="searchType" value="SEARCH_ALL">
					<button class="searchBtn">검색</button>
				</form>
			</div>

			<div id="search-deliveryState">
				<form action="${path}/admin/delivery.do" method="get">
					<label><input type="radio" name="searchKeyword" value="배송대기" ${searchKeyword.equals('배송대기')?"checked":""}>배송대기</label> 
					<label><input type="radio" name="searchKeyword" value="배송중" ${searchKeyword.equals('배송중')?"checked":""}>배송중</label>
					<label><input type="radio" name="searchKeyword" value="배송완료" ${searchKeyword.equals('배송완료')?"checked":""}>배송완료</label>
					<input type="hidden" name="searchType" value="DELIVERY_STATE">
					<button class="searchBtn">검색</button>
				</form>
			</div>
        	
        	<div id="search-orderSheetNo">
				<form action="${path}/admin/delivery.do" method="get">
					<input type="number" name="searchKeyword" size="30" 
					placeholder="주문번호 입력" class="searchInput" value="${searchKeyword}">
					<input type="hidden" name="searchType" value="ORDER_SHEET_NO">
					<button class="searchBtn">검색</button>
				</form>
        	</div> 

        	<div id="search-orderDetailNo">
				<form action="${path}/admin/delivery.do" method="get">
					<input type="number" name="searchKeyword" size="30" 
					placeholder="주문상세번호 입력" class="searchInput" value="${searchKeyword}">
					<input type="hidden" name="searchType" value="ORDER_DETAIL_NO">
					<button class="searchBtn">검색</button>
				</form>
        	</div>   


        	
        </div>

		<!-- 배송 목록 -->
		<div id="propertyContainer" class = "tableContainer">
			<table id="propertyTable">
				<thead>
					<tr>
						<th>주문번호</th>
						<th>주문상세번호</th>
						<th>가구번호</th>
						<th>사진</th>
						<th>분류</th>
						<th>제품명</th>
						<th>가격&nbsp;(원)</th>
						<th>배송 상태</th>	
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty delivery}">
						<tr>
							<td colspan="8">조회된 결과가 없습니다.</td>
						</tr>

					</c:if>
					<c:if test="${not empty delivery}">
						<c:forEach var="d" items="${delivery }">
							<tr>
								<td style="width: 20px;">
									<a class="viewOrderSheet" href="${path}/admin/order.do?searchKeyword=${d.orderSheet.orderSheetNo}&searchType=ORDER_SHEET_NO">
										<c:out value="${d.orderSheet.orderSheetNo }"/>
									</a>
								</td>
								<td style="width: 40px;">
									<input type="hidden" value="${d.orderDetailNo }">
									<a class="viewOrderDetail" href="">
										<c:out value="${d.orderDetailNo }"/>
									</a>
								</td>
								<td style="width: 20px;">
									<a class="viewProduct" href="${path}/product/view.do?productNo=${d.product.productNo }">
										<c:out value="${d.product.productNo }"/>
									</a>
								</td>
								<td style="width: 70px;">
									<img id="productImg" src="${path}/resources/upload/product/${d.product.getFiles().get(0).renamedFileName}">
								</td>
								<td style="width: 30px;"><c:out value="${d.product.item }"/></td>
								<td style="width: 30px;"><c:out value="${d.product.title }"/></td>
								<td class="price" style="width: 70px;"><c:out value="${d.product.price }"/></td>
								<td>
									<select name="deliveryState">
										<option value="배송대기" ${d.deliveryState=='배송대기'?"selected":"" }>배송대기</option>
										<option value="배송중" ${d.deliveryState=='배송중'?"selected":"" }>배송중</option>
										<option value="배송완료" ${d.deliveryState=='배송완료'?"selected":"" }>배송완료</option>
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

	//요약테이블 출력
	$(()=>{
		updateSummary();
	});

	//검색타입 변경
	$("select#searchType").change(e=>{
		const type = $(e.target).val();
		$("div#search-container>div").hide();
		$("div#search-"+type).css("display","inline-block");
		$("input[name=searchKeyword][type=text]").val("");
		$("div#search-hiding>label>input[name=searchKeyword]").first().prop("checked",true);
	});

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

	//배송상태 변경하기
		$("select[name=deliveryState]").change(e=>{
			const orderDetailNo=$(e.target).parent().parent().children().find('input').first().val();
			const deliveryState=$(e.target).val();
			// console.log(orderDetailNo);
			// console.log(deliveryState);

			$.ajax({
				url:"${path}/admin/updateDeliveryState.do",
				data:{
					orderDetailNo:orderDetailNo
					,deliveryState:deliveryState
				},
				success:function(result){	

					alert(result.msg);
					updateSummary();
				},
				error:function(result){
					alert("AJAX ERROR - result : "+result);	
				}
			})


	});

	//검색조건 고정시켜놓기
	$(()=>{

		const type = $("#searchType").val();
		$("div#search-container>div").hide();
		$("div#search-"+type).css("display","inline-block");

	})

	//
	function updateSummary(){
		$.ajax({
			url:"${path}/admin/updateDeliverySummary.do",
			dataType : "json",
			success:function(summary){

				$("#summary_state1").text(summary.STATE_1);
				$("#summary_state2").text(summary.STATE_2);
				$("#summary_state3").text(summary.STATE_3);

			}
		})
	}
</script>

</body>
</html>

</body>
</html>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>