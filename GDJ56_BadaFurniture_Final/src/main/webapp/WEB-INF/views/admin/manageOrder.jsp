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
					<td class="tableTd">10</td>
				</tr>
			</table>
			<table class="summaryTable">
				<tr>
					<th class="tableTh">입금대기</th>
					<td class="tableTd">2</td>
				</tr>	
				<tr>
					<th class="tableTh">입금완료</th>
					<td class="tableTd">2</td>
				</tr>	
				<tr>
					<th class="tableTh">결제완료</th>
					<td class="tableTd">3</td>
				</tr>
			</table>

			<table class="summaryTable">
				<tr>
					<th class="tableTh">배송준비</th>
					<td class="tableTd">10</td>
				</tr>
				<tr>
					<th class="tableTh">배송중</th>
					<td class="tableTd">2</td>
				</tr>	
				<tr>
					<th class="tableTh">배송완료</th>
					<td class="tableTd">2</td>
				</tr>
			</table>

			<table class="summaryTable">
				<tr>
					<th class="tableTh">반품요청</th>
					<td class="tableTd">10</td>
				</tr>
				<tr>
					<th class="tableTh">반품대기</th>
					<td class="tableTd">2</td>
				</tr>	
				<tr>
					<th class="tableTh">취소요청</th>
					<td class="tableTd">2</td>
				</tr>
			</table>

		</div>
		<div id="search-container">
			<span style="font-size: 17px;">검색타입 : </span> 
        	<select id="searchType" class="searchInput">
				<option value="searchAll">전체조회</option>
        		<option value="paymentState">결제상태</option>
        		<option value="deliveryState">배송상태</option>
				<option value="refundState">취소/반품상태</option>
        		<option value="orderSheetNo">주문번호</option>
        		<option value="memberName">주문자</option>
        		<option value="orderSheetEnrollDate">주문일자</option>
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
						<option value="입금대기">입금대기</option>
						<option value="입금완료">입금완료</option>
						<option value="카드결제완료">카드결제완료</option>
					</select>
					
					<input type="hidden" name="searchType" value="PAYMENT_STATE">
					<button class="searchBtn">검색</button>
				</form>
			</div>

			<div id="search-deliveryState">
				<form action="${path}/admin/order.do" method="get">

					<select name="searchKeyword" class="searchInput">
						<option value="배송준비">배송준비</option>
						<option value="배송중">배송중</option>
						<option value="배송완료">배송완료</option>
					</select>
					
					<input type="hidden" name="searchType" value="DELIVERY_STATE">
					<button class="searchBtn">검색</button>
				</form>
			</div>

			<div id="search-refundState">
				<form action="${path}/admin/order.do" method="get">

					<select name="searchKeyword" class="searchInput">
						<option value="반품요청">반품요청</option>
						<option value="반품대기">반품대기</option>
						<option value="반품완료">반품완료</option>
						<option value="취소요청">취소요청</option>
						<option value="취소완료">취소완료</option>
					</select>
					
					<input type="hidden" name="searchType" value="REFUND_STATE">
					<button class="searchBtn">검색</button>
				</form>
			</div>
        	
        	<div id="search-orderSheetNo">
				<form action="${path}/admin/order.do" method="get">

					<input type="text" name="searchKeyword" size="30" 
					placeholder="검색할 주문번호 입력" class="searchInput">
					<input type="hidden" name="searchType" value="ORDER_SHEET_NO">
					<button class="searchBtn">검색</button>
				</form>
        	</div>

			<div id="search-memberName">
				<form action="${path}/admin/order.do" method="get">

					<input type="text" name="searchKeyword" size="30" 
					placeholder="검색할 주문자 이름 입력" class="searchInput">
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
						<th class="tableTh">주문자</th>
						<th class="tableTh">결제수단</th>
						<th class="tableTh">결제상태</th>
						<th class="tableTh">배송상태</th>
						<th class="tableTh">주문상태</th>
						<th class="tableTh">취소/반품</th>					
					</tr>
				</thead>
				<tbody>
					<tr>
						<!-- <td class="tableTd" style="width: 10px;background-color:#dcd5c32b;"><input type="checkbox" name="chk"></td> -->
						<td class="tableTd">
							<input type="hidden" value="">
							<a href="${path}/order/orderPayment.do?orderSheetNo=">주문번호</a>
						</td>
						<td class="tableTd">주문일자</td>
						<td class="tableTd">가구번호</td>
						<td class="tableTd">분류</td>
						<td class="tableTd">
							<img class="orderImg" src="">
						</td>
						<td class="tableTd">가격</td>
						<td class="tableTd">주문자</td>
						<td class="tableTd">결제수단</td>
						<td class="tableTd">
							<select name="paymentState">
								<option value="입금대기">입금대기</option>
								<option value="입금완료">입금완료</option>
								<option value="결제완료">결제완료</option>
							</select>

						</td>
						<td class="tableTd">
							<select name="deliverState">
								<option value="배송준비">배송준비</option>
								<option value="배송중">배송중</option>
								<option value="배송완료">배송완료</option>
							</select>
							
						</td>
						<td class="tableTd">
							<select name="refundState">
								<option value="반품요청">반품요청</option>
								<option value="반품대기">반품대기</option>
								<option value="반품완료">반품완료</option>
								<option value="취소요청">취소요청</option>
								<option value="취소완료">취소완료</option>
								<option value="주문확정">주문확정</option>
							</select>	

						</td>
						<td class="tableTd" style="width: 80px;"><button id="detailModalBtn" class="updateBtn" onclick="">상세확인</button></td>
					</tr>
				</tbody>
			</table>
			
			<!-- 반품/취소 상세내역 모달 -->
			<div class="modals hiddens">
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
			</div>





		</div>
		<div id="pageBarContainer">
			<div id=pageBar></div>
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
	    console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')');
		let when = $("#orderDateRange").val();
		console.log(when);
	}
	);


	//취소/반품 확인 모달
	const open = () => {
		document.querySelector(".modals").classList.remove("hiddens");
	}

	const close = () => {
		document.querySelector(".modals").classList.add("hiddens");
	}

	document.querySelector("#detailModalBtn").addEventListener("click", open);
	document.querySelector(".closeBtn").addEventListener("click", close);
	document.querySelector(".bg").addEventListener("click", close);




</script>

</body>
</html>

</body>
</html>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>