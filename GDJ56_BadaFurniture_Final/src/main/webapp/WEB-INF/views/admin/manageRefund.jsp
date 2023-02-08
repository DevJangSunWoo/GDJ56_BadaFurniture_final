<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/adminHeader.jsp"/>
<link rel="stylesheet" href="${path }/resources/css/admin/manageRefund.css"/>

<!-- 제이쿼리 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" 
integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg==" 
crossorigin="anonymous" type="text/javascript"></script>

<!-- 아임포트 -->
<script src ="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>


<style>
	#pageBar a.active {
		background-color: #4CAF50;
  		color: white;
	}
	#pageBar a:hover:not(.active) {
		background-color: #ddd;
	}
	.onclickInput{
    width: 88px;
    border-style: none;
    background-color: #dcd5c36c;
    text-align: center;
    cursor: pointer;
  }
</style>

<section>
	<div id="listContainer">
		<h2>취소/반품 관리</h2>
		<!-- 요약테이블 -->
		<div id="summaryContainer">
			<table id="summaryTable">
				<tr>
					<th class="tableTh">전체</th>
					<td id="summary_allR"class="tableTd"><c:out value="${summary.ALL_R}"/></td>
				</tr>
				<tr>
					<th class="tableTh">취소요청</th>
					<td id="summary_state1" class="tableTd"><c:out value="${summary.STATE_1}"/></td>
				</tr>
				<tr>
					<th class="tableTh">반품요청</th>
					<td id="summary_state2" class="tableTd"><c:out value="${summary.STATE_2}"/></td>
				</tr>
				<tr>
					<th class="tableTh">반품대기</th>
					<td id="summary_state3" class="tableTd"><c:out value="${summary.STATE_3}"/></td>
				</tr>
				<tr>
					<th class="tableTh">취소/반품완료</th>
					<td id="summary_state4" class="tableTd"><c:out value="${summary.STATE_4}"/></td>
				</tr>
				<tr>
					<th class="tableTh">거부완료</th>
					<td id="summary_state5" class="tableTd"><c:out value="${summary.STATE_5}"/></td>
				</tr>
			</table>
		</div>
		

		<!-- 조건 검색하기 -->

		<div id="search-container">
			<span style="font-size: 17px;">검색타입 : </span> 
        	<select id="searchType">
        		<option value="searchAll" ${searchType.equals("SEARCH_ALL")?"selected":""}>전체조회</option>
				<option value="orderSheetNo" ${searchType.equals('ORDER_SHEET_NO')?"selected":""}>주문번호</option>
        		<option value="refundState" ${searchType.equals('REFUND_STATE')?"selected":""}>취소/반품 상태</option>
        	</select>
			        	
			<div id="search-searchAll">
				<form action="${path}/admin/refund.do" method="get">

					<label><input type="radio" name="searchKeyword" value="searchAll" ${searchKeyword.equals("searchAll")?"checked":""}>전체조회</label>
					<input type="hidden" name="searchType" value="SEARCH_ALL">
					<button class="searchBtn">검색</button>
				</form>
			</div>

			<div id="search-refundState">
				<form action="${path}/admin/refund.do" method="get">
					<select name="searchKeyword" class="searchInput">
						<option value="취소요청" ${searchKeyword.equals('취소요청')?"selected":""}>취소요청</option>
						<option value="반품요청" ${searchKeyword.equals('반품요청')?"selected":""}>반품요청</option> 
						<option value="반품대기" ${searchKeyword.equals('반품대기')?"selected":""}>반품대기</option>
						<option value="취소완료" ${searchKeyword.equals('취소완료')?"selected":""}>취소완료</option>
						<option value="반품완료" ${searchKeyword.equals('반품완료')?"selected":""}>반품완료</option>
						<option value="취소거부" ${searchKeyword.equals('취소거부')?"selected":""}>취소거부</option>
						<option value="반품거부" ${searchKeyword.equals('반품거부')?"selected":""}>반품거부</option>
					</select>



					<input type="hidden" name="searchType" value="REFUND_STATE">
					<button class="searchBtn">검색</button>
				</form>
			</div>        	
        	
        	<div id="search-orderSheetNo">
				<form action="${path}/admin/refund.do" method="get">
					<input type="number" name="searchKeyword" size="30" 
					placeholder="검색할 주문서번호 입력" class="searchInput" value="${searchKeyword}">
					<input type="hidden" name="searchType" value="ORDER_SHEET_NO">
					<button class="searchBtn">검색</button>
				</form>
        	</div>
        	
        </div>

		<div id="propertyContainer" class = "tableContainer">
			<table id="propertyTable">
				<thead>
					<tr>
						<th>주문서번호</th>
						<th>주문상세번호</th>
						<th>가구번호</th>
						<th>사진</th>
						<th>분류</th>
						<th>제품명</th>
						<th>가격&nbsp;(원)</th>
						<th>취소/반품 상태</th>
						<th>취소/반품 상세</th>			
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty refund}">
						<tr>
							<td colspan="12">조회된 결과가 없습니다.</td>
						</tr>

					</c:if>
					<c:if test="${not empty refund}">
						<c:forEach var="r" items="${refund }">							
							<tr>
								<td style="width: 20px;">
									
									<a class="viewOrderSheet" href="${path}/admin/order.do?searchKeyword=${r.orderSheet.orderSheetNo}&searchType=ORDER_SHEET_NO">
										<input type="text" class="onclickInput" name="orderSheetNo" value="${r.orderSheet.orderSheetNo}"													" 
										onclick="location.assign('${path}/admin/delivery.do?searchKeyword=${r.product.productNo}&searchType=PRODUCT_NO')" 
										readonly>
									</a>
								</td>
								<td style="width: 20px;">
									<input type="hidden" value="${r.orderDetailNo }">									
									<c:out value="${r.orderDetailNo }"/>									
								</td>
								<td style="width: 10px;">
									<input type="hidden" value="${r.product.productNo }">
									<input type="text" class="onclickInput" name="productNo" value="${r.product.productNo }"													" 
									onclick="location.assign('${path}/product/view.do?productNo=${r.product.productNo }')" 
									readonly>
								</td>
								<td style="width: 70px;">
									<img id="productImg" src="${path}/resources/upload/product/${r.product.getFiles().get(0).renamedFileName}">
								</td>
								<td style="width: 30px;"><c:out value="${r.product.item }"/></td>
								<td style="width: 50px;"><c:out value="${r.product.title }"/></td>
								<td class="price" style="width: 70px;"><c:out value="${r.product.price }"/></td>
								<td>
									<c:if test='${fn:contains(r.refundState,"취소")}'>
										<select name="refundState" id="refundStateSelectBox" ${r.refundState=="취소완료"?"disabled":""}>
											<option value="취소요청" ${r.refundState.equals("취소요청")?"selected":""}>취소요청</option>
											<option value="취소완료" ${r.refundState.equals("취소완료")?"selected":""}>취소완료</option>
											<option value="취소거부" ${r.refundState.equals("취소거부")?"selected":""}>취소거부</option>
										</select>	
									</c:if>
									<c:if test='${fn:contains(r.refundState,"반품")}'>
										<select name="refundState" id="refundStateSelectBox" ${r.refundState=="반품완료"?"disabled":""}>
											<option value="반품요청" ${r.refundState.equals("반품요청")?"selected":""}>반품요청</option>
											<option value="반품대기" ${r.refundState.equals("반품대기")?"selected":""}>반품대기</option>
											<option value="반품완료" ${r.refundState.equals("반품완료")?"selected":""}>반품완료</option>
											<option value="반품거부" ${r.refundState.equals("반품거부")?"selected":""}>반품거부</option>

										</select>
									</c:if>
									
								</td>
								<input type="hidden" value="${r.orderSheet.orderSheetNo }">
								<input type="hidden" value="${r.orderSheet.paymentMethod }">
								<input type="hidden" value="${r.orderSheet.impUid }">
								<input type="hidden" value="${r.product.price }">
								<input type="hidden" value="${r.orderDetailNo }">	
								<td class="tableTd" style="width: 80px;">
									<button id="detailModalBtn" class="updateBtn" onclick="" name="refundDetail">상세확인</button>
								</td>
							</tr>
						</c:forEach>
					</c:if>							
				</tbody>								
			</table>
		</div>


		<!-- 취소/반품 상세내역 모달 -->
		<div class="modals hiddens">
		<div class="bg"></div>
			<div class="modalBox">
				<div class="modalTitle">
					<h1>취소/반품 상세내역</h1>
				</div>
				<div class="modalContent">
					<div class="modalContentInnerDiv">
						<span>✔️ 취소/반품 여부 : </span><span id="refund_State"></span>
					</div>
					<div class="modalContentInnerDiv">
						<span>✔️ 주문 상세번호 : </span><span id="refund_OrderDetailNo"></span>
					</div>
					<div class="modalContentInnerDiv">
						<span>✔️ 취소/반품 신청일 : </span><span id="refund_EnrollDate"></span>
					</div>
					<div class="modalContentInnerDiv">
						<span>✔️ 취소/반품 사유 : </span><span id="refund_RefundDetail"></span>
					</div>
				</div>
				<div id="modalBtnArea">
					<button class="closeBtn">닫기</button>
				</div>
			</div>
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

	//취소반품 상태 변경 ajax
	function updateRefundState(orderDetailNo,refundState,productNo){
		$.ajax({
				url:"${path}/admin/updateRefundState.do",
				data:{
					orderDetailNo:orderDetailNo,
					refundState:refundState,
					productNo:productNo
				},
				success:function(result){	
						
					alert(result.msg);
					updateSummary();
				},
				error:function(result){
					alert("AJAX ERROR - result : "+result);	
				}
			})
	}

	//취소/반품상태 변경하기 & 카드 취소
	$("select[name=refundState]").change(e=>{
			const orderDetailNo=$(e.target).parent().next().next().next().next().next().val();
			const refundState=$(e.target).val();
			const productNo=$(e.target).parent().prev().prev().prev().prev().prev().children().val();
			
			const orderSheetNo=$(e.target).parent().next().val();

			const paymentMethod=$(e.target).parent().next().next().val();
			const impUid=$(e.target).parent().next().next().next().val();
			const price=$(e.target).parent().next().next().next().next().val();
			
			// console.log(orderDetailNo);
			// console.log(refundState);
			// console.log(productNo);
			// console.log(orderSheetNo);
			 //console.log("paymentMethod:"+paymentMethod);
			// console.log("impUid:"+impUid);
			// console.log("price:"+price);		
			
			if(refundState=="취소완료" || refundState=="반품완료"){
				if(confirm("⛔ 취소/반품 완료 후에는 상태 변경이 불가능합니다. 변경하시겠습니까?")){
					if(paymentMethod=="카드결제"){	
						if(confirm("주문번호 : "+orderSheetNo+", 취소금액 : "+price + " 진행하시겠습니까?")){
							$.ajax({
								url:"${path}/admin/cardCancel.do",
								data:{
									paymentMethod:paymentMethod,
									impUid:impUid,
									price:price
								},
								success:function(returnV){	
									if(returnV=="Failed"){
										alert("부분취소가 불가능한 가맹점입니다.")
										location.reload();
										return;
									}else{
										updateRefundState(orderDetailNo,refundState,productNo);
										$(e.target).attr("disabled",true);	
									} 
								}
							});
						}
						else{
							alert("취소하셨습니다.");
							location.reload();
							return;
						}
					}else{
						updateRefundState(orderDetailNo,refundState,productNo);
						$(e.target).attr("disabled",true);	
					}
				}
				else{
					alert("취소하셨습니다.");
					location.reload();
					return;
				}
			}else{
				updateRefundState(orderDetailNo,refundState,productNo);
				
				
			}
				
	});

	//검색조건 고정시켜놓기
	$(()=>{

		const type = $("#searchType").val();
		$("div#search-container>div").hide();
		$("div#search-"+type).css("display","inline-block");

	})

	//모달
	const open = () => {
		document.querySelector(".modals").classList.remove("hiddens");
	}

	const close = () => {
		document.querySelector(".modals").classList.add("hiddens");
	}
	document.querySelector(".closeBtn").addEventListener("click", close);
	document.querySelector(".bg").addEventListener("click", close);

	//취소/반품 상세확인 
	$("button[name=refundDetail]").click(e=>{
		$(e.target).parent().parent().children().find('input').first().val();
		const orderDetailNo=$(e.target).parent().parent().children().find('input').first().val();
		console.log("orderDetailNo"+orderDetailNo);

		$.ajax({
			url:"${path}/admin/viewRefundDetail.do",
			data:{
				orderDetailNo:orderDetailNo,
			},
			success:function(result){
				
				$("#refund_State").text(result.refundState);
				if($("#refund_State").text()=="취소"){
					$("#refund_State").css("color","red");
					
				}else{
					$("#refund_State").css("color","blue");

				}
				$("#refund_OrderDetailNo").text(result.orderDetailNo);
				$("#refund_EnrollDate").text(result.refundEnrollDate);
				$("#refund_RefundDetail").text(result.detail);

				open();
				
			}
		})


	});

	function updateSummary(){
		$.ajax({
			url:"${path}/admin/updateRefundSummary.do",
			dataType : "json",
			success:function(summary){

				$("#summary_allR").text(summary.ALL_R);
				$("#summary_state1").text(summary.STATE_1);
				$("#summary_state2").text(summary.STATE_2);
				$("#summary_state3").text(summary.STATE_3);
				$("#summary_state4").text(summary.STATE_4);
				$("#summary_state5").text(summary.STATE_5);

			}
		})
	}



</script>

</body>
</html>

</body>
</html>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>