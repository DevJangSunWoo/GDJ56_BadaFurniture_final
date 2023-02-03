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
					<td id="summary_allO" class="tableTd"><c:out value="${summary.ALL_O}"/></td>
				</tr>
			</table>
			<table class="summaryTable">
				<tr>
					<th class="tableTh">입금대기</th>
					<td id="summary_state1" class="tableTd"><c:out value="${summary.STATE_1}"/></td>
				</tr>	
				<tr>
					<th class="tableTh">입금완료</th>
					<td id="summary_state2" class="tableTd"><c:out value="${summary.STATE_2}"/></td>
				</tr>	
				<tr>
					<th class="tableTh">카드결제완료</th>
					<td id="summary_state3" class="tableTd"><c:out value="${summary.STATE_3}"/></td>
				</tr>
			</table>

			<table class="summaryTable">
				<tr>
					<th class="tableTh">배송대기</th>
					<td id="summary_state4" class="tableTd"><c:out value="${summary.STATE_4}"/></td>
				</tr>
				<tr>
					<th class="tableTh">배송중</th>
					<td id="summary_state5" class="tableTd"><c:out value="${summary.STATE_5}"/></td>
				</tr>	
				<tr>
					<th class="tableTh">배송완료</th>
					<td id="summary_state6" class="tableTd"><c:out value="${summary.STATE_6}"/></td>
				</tr>
			</table>

			<table class="summaryTable">
				<tr>
					<th class="tableTh">반품요청</th>
					<td id="summary_state7" class="tableTd"><c:out value="${summary.STATE_7}"/></td>
				</tr>
				<tr>
					<th class="tableTh">반품대기</th>
					<td id="summary_state8" class="tableTd"><c:out value="${summary.STATE_8}"/></td>
				</tr>	
				<tr>
					<th class="tableTh">취소요청</th>
					<td id="summary_state9" class="tableTd"><c:out value="${summary.STATE_9}"/></td>
				</tr>
			</table>

		</div>
		<div id="search-container">
			<span style="font-size: 17px;">검색타입 : </span> 
        	<select id="searchType" class="searchInput">
				<option value="searchAll" ${searchType.equals("SEARCH_ALL")?"selected":""}>전체조회</option>
        		<option value="paymentState" ${searchType.equals("PAYMENT_STATE")?"selected":""}>결제상태</option>
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

						<th class="tableTh">배송상태</th>
						<th class="tableTh">취소/반품 상태</th>

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
													<input type="number" value="${o.orderSheetNo}" 
													style="width: 85px;border-style: none;background-color: #dcd5c36c;text-align: center;"
													readonly>
												</td>
												<td class="tableTd2" rowspan="${o.details.size()}"><c:out value="${o.orderSheetenrollDate}"/></td>
											</c:if>

											<td class="${o.orderSheetNo}Td" style="background-color: #dcd5c32b;">
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
													<input type="text" name="deliveryState" value="${d.deliveryState}" 
													style="width: 88px;border-style: none;background-color: #dcd5c36c;text-align: center;" 
													onclick="location.assign('${path}/admin/delivery.do?searchKeyword=${d.product.productNo}&searchType=PRODUCT_NO')" 
													readonly>
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
													<input type="text" name="refundState" value="${d.refundState}" 
													style="width: 88px;border-style: none;background-color: #dcd5c36c;text-align: center;"
													onclick="location.assign('${path}/admin/refund.do?searchKeyword=${d.product.productNo}&searchType=PRODUCT_NO')"
													readonly>
												</td>
											</c:if>

											<c:if test="${vs.index==0}">
												<td class="price" rowspan="${o.details.size()}"><c:out value="${o.totalPrice}"/></td>
											</c:if>
											
											<c:if test="${vs.index==0}">
												<td class="tableTd2" rowspan="${o.details.size()}"><c:out value="${o.member.memberName}"/></td>
												<td class="tableTd2" rowspan="${o.details.size()}"><c:out value="${o.paymentMethod}"/></td>
												<td class="tableTd2" rowspan="${o.details.size()}">
													<select name="paymentState">
														<option value="입금대기" ${o.paymentState.equals("입금대기")?"selected":""}>입금대기</option>
														<option value="입금완료"  ${o.paymentState.equals("입금완료")?"selected":""}>입금완료</option>
														<option value="카드결제완료"  ${o.paymentState.equals("카드결제완료")?"selected":""}>카드결제완료</option>
													</select>
													
												</td>
											</c:if>
										</tr>
									</c:forEach>
								</c:if>	


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

<!-- 주문 상세내역 모달 -->
<div class="modals hiddens">
	<div class="bg">
	
	</div>
	<div class="modalBox">
		<div class="modalTitle">
			주문 상세보기
		</div>
		<div class="modalContent">
			<div style="text-align:left;font-size:16px;margin:5px 0px 5px 0px;font-weight:bolder;">
				주문번호 : <span id="orderSheetNo"></span> &nbsp;&nbsp; 주문일자 : <span id="orderSheetEnrollDate"></span>
			</div>
			<table id="orderDetailTable">
			
			</table>
			
			<div style="font-size:23px;font-weight:bolder;margin:25px 0px 3px 0px;"> 
				결제정보
			</div>
			<table class="infoTable" style="width:100%;border-top:5px solid black;border-collapse: collapse;">
				<tr>
					<td>결제금액</td>
					<td id="totalPrice"></td>
				</tr>
				<tr>
					<td>결제수단</td>
					<td id="paymentMethod"></td>
				</tr>
				<tr>
					<td>결제상태</td>
					<td id="paymentState"></td>
				</tr>
				<tr>
					<td id="paymentEtc"></td>
					<td id="paymentEtcContent"></td>
				</tr>
			</table>
			
			<div style="font-size:23px;font-weight:bolder;margin:25px 0px 3px 0px;"> 
				배송정보
			</div>
			<table class="infoTable" style="width:100%;border-top:5px solid black;border-collapse: collapse;">
				<tr>
					<td>수령인</td>
					<td id="receiverName"></td>
				</tr>
				<tr>
					<td>우편번호</td>
					<td id="postCode"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td id="address"></td>
				</tr>
				<tr>
					<td>상세주소</td>
					<td id="detailAddress"></td>
				</tr>
			</table>
			
		</div>
		<div id="modalBtnArea">
			<button class="closeBtn">닫기</button>
		</div>
	</div>
</div>


<script>

	//modal open
	const open = () => {
		document.querySelector(".modals").classList.remove("hiddens");
	}
	//modal close
	const close = () => {
		document.querySelector(".modals").classList.add("hiddens");
	}
	
	//주문번호를 클릭했을 때 => 주문상세보기 모달창 open
	$(document).on("click", "#detailModalBtn", e=>{
		let orderSheetNo = Number($(e.target).text());
		$.ajax({
			url:"${path}/mypage/order/read.do",
			data:{
				orderSheetNo:orderSheetNo
			},
			success:data=>{
				console.log(data);
				$("div.modalContent span#orderSheetNo").text(data.orderSheetNo);
				$("div.modalContent span#orderSheetEnrollDate").text(data.orderSheetenrollDate);
				$("div.modalContent span#totalPrice").text(fnSetComma(data.totalPrice)+'원');
				$("div.modalContent span#paymentMethod").text(data.paymentMethod);
				$("div.modalContent span#paymentState").text(data.paymentState);
				
				$("table#orderDetailTable").html("");
				let trHead = $("<tr>");
				trHead.append($("<th>").text("상품정보"));
				trHead.append($("<th>").text("배송정보"));
				$("table#orderDetailTable").append(trHead);
				
				for(let i = 0; i < data.details.length; i++){
					let tr = $("<tr>");
					let td1 = $("<td>");
					tr.append(td1);
					let detailInfoContainer = $("<div>").attr("class","detailInfoContainer");
					td1.append(detailInfoContainer);
					detailInfoContainer.append($("<input>").attr("type","hidden").val(data.details[i].product.productNo));
					detailInfoContainer.append($("<img>").attr("class","infoImg").attr("src","${path}/resources/upload/product/"+data.details[i].product.files[0].renamedFileName));
					let infoInner = $("<div>").attr("class","infoInner");
					infoInner.append($("<div>").attr("class","detailProductTitle").append($("<a>").attr("href","${path}/product/view.do?productNo="+data.details[i].product.productNo).text(data.details[i].product.title).css("font-weight","bolder")))
					detailInfoContainer.append(infoInner);
					let detailProductsummary = $("<div>").attr("class","detailProductsummary");
					detailProductsummary.append($("<span>").text("분류 : ")).append($("<span>").text(data.details[i].product.item)).append($("<span>").text(" / 가격 : ")).append($("<span>").text(fnSetComma(data.details[i].product.price)+"원"));
					infoInner.append(detailProductsummary);
					let td2 = $("<td>").text(data.details[i].deliveryState);
					tr.append(td2);
					$("table#orderDetailTable").append(tr);
				}
				
				$("table.infoTable td#totalPrice").text(fnSetComma(data.totalPrice)+"원");
				$("table.infoTable td#paymentMethod").text(data.paymentMethod);
				$("table.infoTable td#paymentState").text(data.paymentState);
				$("table.infoTable td#paymentEtc").html(data.paymentMethod=="계좌이체"?"입금자명<br>[입금계좌]":"영수증");
				let paymentEtcContent = $("table.infoTable td#paymentEtcContent");
				if(data.paymentMethod=="계좌이체"){ //이게맞따
					//paymentEtcContent.text(data.depositor);
					$("table.infoTable td#paymentEtcContent").html(data.depositor +"<br>[예금주명:유병승 / BS은행 / 계좌번호:1002-1002-1002]");
				} else {
					let receiptButton = $("<button>").attr("class","receiptButton").text("영수증 보기").val(data.receiptUrl);
					$("table.infoTable td#paymentEtcContent").html("");
					$("table.infoTable td#paymentEtcContent").append(receiptButton);
				}
				
				$("table.infoTable td#receiverName").text(data.receiverName);
				$("table.infoTable td#postCode").text("("+$.trim(data.postCode)+")");
				$("table.infoTable td#address").text(data.address);
				$("table.infoTable td#detailAddress").text(data.detailAddress);
					
					
				open();
			}
		});
	});
	document.querySelector(".closeBtn").addEventListener("click", close);
	document.querySelector(".bg").addEventListener("click", close);
	

	//요약테이블 출력
	$(()=>{
		updateSummary();
	});
	
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
						
					// if(result.result>0){
					// 	alert(paymentState+" 상태로 변경 완료");
						
					// }else{
					// 	alert(paymentState+" 상태로 변경 실패");
						
					// }
					alert(result.msg);


				},
				error:function(result){
					alert("AJAX ERROR - error : "+result);	
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
			
			updateSummary();


	});	

	//
	function updateSummary(){
		$.ajax({
			url:"${path}/admin/updateOrderSummary.do",
			dataType : "json",
			success:function(summary){
				//console.log(summary);

				$("#summary_allO").text(summary.ALL_O);
				$("#summary_state1").text(summary.STATE_1);
				$("#summary_state2").text(summary.STATE_2);
				$("#summary_state3").text(summary.STATE_3);
				$("#summary_state4").text(summary.STATE_4);
				$("#summary_state5").text(summary.STATE_5);
				$("#summary_state6").text(summary.STATE_6);
				$("#summary_state7").text(summary.STATE_7);
				$("#summary_state8").text(summary.STATE_8);
				$("#summary_state9").text(summary.STATE_9);

			}
		})

	}




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




</script>



</body>
</html>

</body>
</html>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>