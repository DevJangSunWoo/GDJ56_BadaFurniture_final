<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${path }/resources/css/admin/manageOrder.css"/>
<jsp:include page="/WEB-INF/views/common/adminHeader.jsp"/>

<!-- datepicker -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

<style>
	#pageBar a.active {
		background-color: #4CAF50;
  		color: white;
	}
	#pageBar a:hover:not(.active) {
		background-color: #ddd;
	}

	.orderImg{
		width: 70px;
		height: 70px;
	}
</style>


<section>

	<div id="listContainer">
		<h2>주문관리</h2>
		<div id="summaryContainer">
			<table class="summaryTable">
				<tr>
					<th class="tableTh">전체주문</th>
					<td class="tableTd"><c:out value="${summary[0].ALL_O}"/></td>
				</tr>
			</table>
			<table class="summaryTable">
				<tr>
					<th class="tableTh">입금대기</th>
					<td class="tableTd"><c:out value="${summary[0].STATE_1}"/></td>
				</tr>	
				<tr>
					<th class="tableTh">입금완료</th>
					<td class="tableTd"><c:out value="${summary[0].STATE_2}"/></td>
				</tr>	
				<tr>
					<th class="tableTh">결제완료</th>
					<td class="tableTd"><c:out value="${summary[0].STATE_3}"/></td>
				</tr>
			</table>

			<table class="summaryTable">
				<tr>
					<th class="tableTh">배송준비</th>
					<td class="tableTd"><c:out value="${summary[0].STATE_4}"/></td>
				</tr>
				<tr>
					<th class="tableTh">배송중</th>
					<td class="tableTd"><c:out value="${summary[0].STATE_5}"/></td>
				</tr>	
				<tr>
					<th class="tableTh">배송완료</th>
					<td class="tableTd"><c:out value="${summary[0].STATE_6}"/></td>
				</tr>
			</table>

			<table class="summaryTable">
				<tr>
					<th class="tableTh">반품요청</th>
					<td class="tableTd"><c:out value="${summary[0].STATE_7}"/></td>
				</tr>
				<tr>
					<th class="tableTh">반품대기</th>
					<td class="tableTd"><c:out value="${summary[0].STATE_8}"/></td>
				</tr>	
				<tr>
					<th class="tableTh">취소요청</th>
					<td class="tableTd"><c:out value="${summary[0].STATE_9}"/></td>
				</tr>
			</table>

		</div>
		<div id="search-container">
			<span style="font-size: 17px;">검색타입 : </span> 
        	<select id="searchType" class="searchInput">
				<option value="searchAll" ${searchType.equals("SEARCH_ALL")?"selected":""}>전체조회</option>
        		<option value="paymentState" ${searchType.equals("PAYMENT_STATE")?"selected":""}>결제상태</option>
        		<!-- <option value="deliveryState" ${searchType.equals("DELIVERY_STATE")?"selected":""}>배송상태</option>
				<option value="refundState" ${searchType.equals("REFUND_STATE")?"selected":""}>취소/반품상태</option> -->
        		<option value="orderSheetNo" ${searchType.equals("ORDER_SHEET_NO")?"selected":""}>주문번호</option>
        		<option value="memberName" ${searchType.equals("MEMBER_NAME")?"selected":""}>주문자</option>
        		<option value="orderSheetEnrollDate" ${searchType.equals("ORDER_SHEET_ENROLL_DATE")?"selected":""}>주문일자</option>
        	</select>
			        	
			<div id="search-searchAll">
				<form action="${path}/admin/order.do" method="get">

					<label><input type="radio" name="searchKeyword" value="" checked>전체조회</label>
					<input type="hidden" name="searchType" value="SEARCH_ALL">
					<button class="searchBtn">검색</button>
				</form>
			</div>
			
			<div id="search-paymentState">
				<form action="${path}/admin/order.do" method="get">

					<select name="searchKeyword" class="searchInput">
						<option value="입금대기" ${searchKeyword.equals("입금대기")?"selected":""}>입금대기</option>
						<option value="입금완료" ${searchKeyword.equals("입금완료")?"selected":""}>입금완료</option>
						<option value="카드결제완료" ${searchKeyword.equals("카드결제완료")?"selected":""}>카드결제완료</option>
					</select>
					
					<input type="hidden" name="searchType" value="PAYMENT_STATE">
					<button class="searchBtn">검색</button>
				</form>
			</div>

			<!-- <div id="search-deliveryState">
				<form action="${path}/admin/order.do" method="get">

					<select name="searchKeyword" class="searchInput">
						<option value="배송대기" ${searchKeyword.equals("배송준비")?"selected":""}>배송대기</option>
						<option value="배송중" ${searchKeyword.equals("배송중")?"selected":""}>배송중</option>
						<option value="배송완료" ${searchKeyword.equals("배송완료")?"selected":""}>배송완료</option>
					</select>
					
					<input type="hidden" name="searchType" value="DELIVERY_STATE">
					<button class="searchBtn">검색</button>
				</form>
			</div>

			<div id="search-refundState">
				<form action="${path}/admin/order.do" method="get">

					<select name="searchKeyword" class="searchInput">
						<option value="반품요청" ${searchKeyword.equals("반품요청")?"selected":""}>반품요청</option>
						<option value="반품대기" ${searchKeyword.equals("반품대기")?"selected":""}>반품대기</option>
						<option value="반품완료" ${searchKeyword.equals("반품완료")?"selected":""}>반품완료</option>
						<option value="취소요청" ${searchKeyword.equals("취소요청")?"selected":""}>취소요청</option>
						<option value="취소완료" ${searchKeyword.equals("취소완료")?"selected":""}>취소완료</option>
					</select>
					
					<input type="hidden" name="searchType" value="REFUND_STATE">
					<button class="searchBtn">검색</button>
				</form>
			</div> -->
        	
        	<div id="search-orderSheetNo">
				<form action="${path}/admin/order.do" method="get">

					<input type="text" name="searchKeyword" size="30" 
					placeholder="검색할 주문번호 입력" class="searchInput" value="${searchKeyword}">
					<input type="hidden" name="searchType" value="ORDER_SHEET_NO">
					<button class="searchBtn">검색</button>
				</form>
        	</div>

			<div id="search-memberName">
				<form action="${path}/admin/order.do" method="get">

					<input type="text" name="searchKeyword" size="30" 
					placeholder="검색할 주문자 이름 입력" class="searchInput" value="${searchKeyword}">
					<input type="hidden" name="searchType" value="MEMBER_NAME">
					<button class="searchBtn">검색</button>
				</form>
		 	</div>

			<!-- 주문일자 기간선택 -->
        	<div id="search-orderSheetEnrollDate">
				<form action="${path}/admin/order.do" method="get">
					<input type="text" id="orderDateRange" name="searchKeyword" class="searchInput" placeholder="날짜를 선택하세요.">
					<input type="hidden" name="searchType" value="ORDER_SHEET_ENROLL_DATE">
					<button class="searchBtn">검색</button>
				</form>
        	</div>


        	
        </div>
		<div id="propertyContainer" class = "tableContainer">
			<table id="propertyTable">
				<thead>
					<tr>
						<!-- <th class="tableTh"><input type="checkbox" name="chk"></th> -->
						<th class="tableTh">주문번호</th>
						<th class="tableTh">주문일자</th>
						<th class="tableTh">가구번호</th>
						<th class="tableTh">분류</th>
						<th class="tableTh">사진</th>
						<th class="tableTh">가격</th>

						<th class="tableTh">배송상태</th> <a href=""></a>
						<th class="tableTh">취소/반품 상태</th> <a href=""></a>

						<th class="tableTh">총금액</th>
						<th class="tableTh">주문자</th>
						<th class="tableTh">결제수단</th>
						<th class="tableTh">결제상태</th>


					</tr>
				</thead>
				<tbody>
					<c:if test="${empty order}">
						<tr>
							<td colspan="13" class="tableTd">조회된 결과가 없습니다.</td>
						</tr>

					</c:if>
					<c:if test="${not empty order}">
						<c:forEach var="o" items="${order}" varStatus="vs">						
								<!-- <td class="tableTd" style="width: 10px;background-color:#dcd5c32b;"><input type="checkbox" name="chk"></td> -->
								<c:if test="${not empty o.details}">
									<c:forEach var="d" items="${o.details}" varStatus="vs">
										<tr>
											<c:if test="${vs.index==0}">												
												<td class="tableTd" rowspan="${o.details.size()}">
													<input type="hidden" value="${o.orderSheetNo}">
													<a href="${path}/order/orderPayment.do?orderSheetNo="><c:out value="${o.orderSheetNo}"/></a>
												</td>
												<td class="tableTd2" rowspan="${o.details.size()}"><c:out value="${o.orderSheetenrollDate}"/></td>
											</c:if>

											<td class="${o.orderSheetNo}Td">
												<input type="hidden" value="${d.product.productNo}">
												<c:out value="${d.product.productNo}"/>
											</td>

											<td class="tableTd"><c:out value="${d.product.item}"/></td>

											<td class="tableTd">
												<img class="orderImg" src="${path}/resources/upload/product/${d.product.getFiles().get(0).renamedFileName}">
											</td>
											<td class="price"><c:out value="${d.product.price}"/></td>

											

											<c:if test='${o.paymentState=="카드결제완료" or o.paymentState=="입금완료"}'>
												<td class="tableTd2" >
													<input type="text" name="paymentState" value="${d.deliveryState}" style="width: 88px;border-style: none;background-color: #dcd5c36c;text-align: center;" readonly>
													<!-- <select name="deliverState">
														<option value="배송대기" ${d.deliveryState.equals("배송준비")?"selected":""}>배송대기</option>
														<option value="배송중" ${d.deliveryState.equals("배송중")?"selected":""}>배송중</option>
														<option value="배송완료" ${d.deliveryState.equals("배송완료")?"selected":""}>배송완료</option>
													</select>												 -->
												</td>
											</c:if>
											<c:if test='${o.paymentState=="입금대기"}'>
												<td class="tableTd2" >-</td>
											</c:if>

											<c:if test="${d.refundState==null}">
												<td class="tableTd2">-</td>
																				
											</c:if>
											<c:if test="${d.refundState!=null}">
												<td class="tableTd2">
													<input type="text" name="refundState" value="${d.refundState}" style="width: 88px;border-style: none;background-color: #dcd5c36c;text-align: center;" readonly>
													<!-- <select name="refundState">
														<option value="반품요청" ${d.refundState.equals("반품요청")?"selected":""}>반품요청</option>
														<option value="반품대기" ${d.refundState.equals("반품대기")?"selected":""}>반품대기</option>
														<option value="반품완료" ${d.refundState.equals("반품완료")?"selected":""}>반품완료</option>
														<option value="취소요청" ${d.refundState.equals("취소요청")?"selected":""}>취소요청</option>
														<option value="취소완료" ${d.refundState.equals("취소완료")?"selected":""}>취소완료</option>
														<option value="주문확정" ${d.refundState.equals("주문확정")?"selected":""}>주문확정</option>
													</select>										 -->
												</td>
											</c:if>

											<c:if test="${vs.index==0}">
												<td class="price" rowspan="${o.details.size()}"><c:out value="${o.totalPrice}"/></td>
											</c:if>
											
											<c:if test="${vs.index==0}">
												<td class="tableTd2" rowspan="${o.details.size()}"><c:out value="${o.member.memberName}"/></td>
												<td class="tableTd2" rowspan="${o.details.size()}"><c:out value="${o.paymentMethod}"/></td>
												<td class="tableTd2" rowspan="${o.details.size()}">
													<!-- <input type="text" name="paymentState" value="${o.paymentState}" style="width: 88px;border-style: none;background-color: #dcd5c36c;text-align: center;" readonly> -->
													<select name="paymentState">
														<option value="입금대기" ${o.paymentState.equals("입금대기")?"selected":""}>입금대기</option>
														<option value="입금완료"  ${o.paymentState.equals("입금완료")?"selected":""}>입금완료</option>
														<option value="카드결제완료"  ${o.paymentState.equals("카드결제완료")?"selected":""}>카드결제완료</option>
													</select>
													
												</td>
											</c:if>
												<!-- <td class="tableTd" style="width: 80px;">
													<button id="detailModalBtn" class="updateBtn" onclick="">상세확인</button>
												</td> -->
										</tr>
									</c:forEach>
								</c:if>	


						</c:forEach>
					</c:if>
				</tbody>
			</table>
			
			<!-- 반품/취소 상세내역 모달 -->
			<!-- <div class="modals hiddens">
			<div class="bg"></div>
				<div class="modalBox">
					<div class="modalTitle">
						<h1>반품/취소 상세내역</h1>
					</div>
					<div class="modalContent">
						<div class="modalContentInnerDiv">
							<span>✔️ 주문 상세번호 : </span><span>1111</span>
						</div>
						<div class="modalContentInnerDiv">
							<span>✔️ 반품/취소 신청일 : </span><span>23-01-20</span>
						</div>
						<div class="modalContentInnerDiv">
							<span>✔️ 반품/취소 사유 : </span><span>단순변심</span>
						</div>
					</div>
					<div id="modalBtnArea">
						<button class="closeBtn">닫기</button>
					</div>
				</div>
			</div> -->
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

	function changePaymentState(orderSheetNo,paymentState,productNoArr){
		$.ajax({
				url:"${path}/admin/updatePaymentState.do",
				traditional:true,
				data:{
					orderSheetNo:orderSheetNo,
					paymentState:paymentState,
					productNoArr:productNoArr
				},
				success:function(result){		
						
					if(result.result>0){
						alert(paymentState+" 상태로 변경 완료");
						
					}else{
						alert(paymentStat+" 상태로 변경 실패");
						
					}


				},
				error:function(result){
					alert("error! result 값 : "+result.result );	
				}
			})
	}

	//결제상태 변경하기
	$("select[name=paymentState]").change(e=>{
			const orderSheetNo=$(e.target).parent().parent().children().children().val();
			const paymentState=$(e.target).val();
			
			let productNoArr = [];
			$("td."+orderSheetNo+"Td").each((i,v)=>{
				productNoArr.push($(v).children().first().val());
			});	

			// console.log("orderSheetNo"+orderSheetNo);
			// console.log("paymentState"+paymentState);
			// console.log(productNoArr);

			if(paymentState=="입금완료"){
				if(confirm("결제상태를 '입금완료'로 변경하시겠습니까?")){					
					changePaymentState(orderSheetNo,paymentState,productNoArr);

				}else{
					alert("변경을 취소하셨습니다.");
					location.reload();
				}		

			}else{
				changePaymentState(orderSheetNo,paymentState,productNoArr);
			}
			


	});	




	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// datepicker
	$('#orderDateRange').daterangepicker({
    "locale": {
        "format": "YYYY-MM-DD",
        "separator": " ~ ",
        "applyLabel": "확인",
        "cancelLabel": "취소",
        "fromLabel": "From",
        "toLabel": "To",
        "customRangeLabel": "Custom",
        "weekLabel": "W",
        "daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
        "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
    },
    "startDate": new Date(),
    "endDate": new Date(),
    "drops": "auto"
	}, 
	function (start, end, label) {
	    //console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')');
		let when = $("#orderDateRange").val();
		//console.log(when);
	}
	);


	//취소/반품 확인 모달
	// const open = () => {
	// 	document.querySelector(".modals").classList.remove("hiddens");
	// }

	// const close = () => {
	// 	document.querySelector(".modals").classList.add("hiddens");
	// }

	// document.querySelector("#detailModalBtn").addEventListener("click", open);
	// document.querySelector(".closeBtn").addEventListener("click", close);
	// document.querySelector(".bg").addEventListener("click", close);




</script>

</body>
</html>

</body>
</html>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>