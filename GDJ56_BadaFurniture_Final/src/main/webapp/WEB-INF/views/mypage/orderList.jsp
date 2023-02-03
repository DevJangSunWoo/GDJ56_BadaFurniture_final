<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">

<!-- datepicker -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
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
	div#orderWrap{
		width:100%; 
		/* height:1000px; */ /* 수정요망 */
		display:flex;
		justify-content: center;
	}
	div#orderWrap *{
		font-family: 'Nanum Gothic' !important;
	}
	div#orderWrap>div#orderContent{
		width:1350px; /* px로 수정 */ 
		/* height:1000px; */ /* 수정요망 */
		/* border: 2px solid red; */
	}
	div#dateContainer{
		width:100%;
		height:80px; 
		border:1px solid black;
		border-radius: 20px; 
		margin-bottom:5px;
	}
	div#dateContent{
		padding:27px;
	}
	span#dateButtonContainer>button{
		padding:0px;
		border:2px solid rgb(52, 132, 146);
		width:70px;
		height:30px;
		background-color:white;
		color:rgb(52, 132, 146);
		border-radius:5px;
		cursor:pointer;
		font-size:14px;
	}
	table#orderTable{
		width:100%;
		/* border:1px solid black; */
		border-top:8px solid black;
		border-collapse: collapse;
	}
	table#orderTable th{
		text-align:center;
	}
	table#orderTable tr>th:first-child, td.td1{
		width:220px;
	}
	table#orderTable tr>th:nth-child(2), td.td2{
		width:550px;
	}
	td.td2{
		text-align:left !important;
	}
	table#orderTable tr>th:nth-child(3), td.td3{
		width:220px;
	}
	table#orderTable tr>th:nth-child(4), td.td4{
		width:220px;
	}
	table#orderTable tr>th:nth-child(5), td.td5{
		width:220px;
	}
	table#orderTable tr>th:nth-child(6), td.td6{
		width:320px;
	}
	table#orderTable tr>th:nth-child(7), td.td7{
		width:200px;
	}
	table#orderTable tr>th:nth-child(8), td.td8{
		width:100px;
	}
	

	table#orderTable th{
		padding:0px;
		border-bottom:3px solid black;
		height:52px;
	}
	table#orderTable td{
		padding:0px;
		text-align:center;
		border-bottom:1px solid grey;
		border-left:1px dotted grey;
		border-right:1px dotted grey;
	}
	table#orderTable button{
		padding:0px;
		border:2px solid rgb(52, 132, 146);
		width:70px;
		height:25px;
		background-color:white;
		color:rgb(52, 132, 146);
		border-radius:5px;
		padding-bottom:2px;
		margin:1px;
		cursor: pointer;
		font-size:13px;
	}
	
	div#pageBar{
		text-align:center;margin-top:20px;
	}
	
	/* 모달 Customizing */
	/* 모달 */
	.modalTitle{
		display: flex;
		justify-content: center;
		font-size:30px;
		font-weight: bolder;
		margin-bottom:20px;
	}
	
	.closeBtn {
      background-color: #348492;
      padding: 5px 10px;
      border-radius: 4px;
      cursor: pointer;
	  border:none;
	  color: white;
	  width: 500px;
      height:40px;
      font-weight:bolder;
      font-size:18px;
    }

    .modals {
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      display: flex;
      justify-content: center;
      align-items: center;
    }
    
    .modals *{
   		font-family: 'Nanum Gothic' !important;
    }

    .modals .bg {
      width: 100%;
      height: 100%;
      background-color: rgba(0, 0, 0, 0.6);
    }

    .modalBox {
      position: absolute;
      background-color: #fff;
      width: 700px;
      height: 800px;
      padding: 20px;
      overflow: scroll;
    }

    .modalBox button {
      display: block;
      margin: 0 auto;
    }

    .hiddens {
      display: none;
    }

	.modalContentInnerDiv{
		margin:8px;
	}

	#modalBtnArea{
		display: flex;
		justify-content: center;
		padding: 15px;
		margin-top:30px;
	}
	table#orderDetailTable{
		width:100%;
		border-top:5px solid black;
		border-collapse: collapse;
	}
	table#orderDetailTable th{
		text-align: center;
		border-bottom:2px solid black;
		height:30px;
	}
	table#orderDetailTable td{
		border-bottom:1px solid black;
	}
	table#orderDetailTable th:first-child, table#orderDetailTable td:first-child {
		width:530px;
	}
	table#orderDetailTable th:nth-child(2), table#orderDetailTable td:nth-child(2) {
		width:100px;
		text-align:center;
	}
	div.detailInfoContainer{
		height:85px;width:100%;margin:10px;display:flex;
	}
	img.infoImg{
		cursor:pointer;width:85px;height:85px;
	}
	div.detailProductTitle{
		padding:20px 0px 8px 10px;
	}
	div.detailProductsummary{
		padding:0px 0px 5px 10px;font-size:13px;color:grey;
	}
	
	table.infoTable td{
		border-bottom: 1px solid grey;
		height: 30px;
		font-weight:bolder;
		padding:10px;
	}
	table.infoTable td:first-child {
		width:150px;	
	}
	table.infoTable button.receiptButton{
		padding:0px;
		border:2px solid rgb(52, 132, 146);
		width:70px;
		height:25px;
		background-color:white;
		color:rgb(52, 132, 146);
		border-radius:5px;
		padding-bottom:2px;
		margin:1px;
		cursor: pointer;
		font-size:13px;
	}
	/* modal costomizing..  */
	
	span.refundDone{
		font-size:14px;
		color:grey;
		font-weight:bolder;
	}
</style>
	<section class="mypage">
		<div id="title">
			<div id="innerTitle">
				Order
			</div>
		</div>
		<div id="orderWrap">
			<div id="orderContent">
				<div id="dateContainer">
					<div id=dateContent>
						<span id="dateButtonContainer">
							<input type="hidden" name="searchKeyword" id="day1">
							<button class="searchDate">오늘</button>
							<input type="hidden" name="searchKeyword" id="week1">
							<button class="searchDate">1주일</button>
							<input type="hidden" name="searchKeyword" id="month1">
							<button class="searchDate">1개월</button>
							<input type="hidden" name="searchKeyword" id="month3">
							<button class="searchDate">3개월</button>
							<input type="hidden" name="searchKeyword" id="month6">
							<button class="searchDate">6개월</button>
							&nbsp;&nbsp;
							<!-- &nbsp;&nbsp;
							<input type="date">
							&nbsp;~&nbsp;
							<input type="date">
							&nbsp;&nbsp; -->
							<input type="text" id="orderDateRange" name="searchKeyword" class="searchDate" size="25" style="padding-bottom:3px;">
							<button class="searchDate">조회</button>
						</span>
					</div>
				</div>
				<div style="font-size:14px;color:grey;margin-bottom:70px;">
					 <!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					 - 기본적으로 최근 3개월간의 자료가 조회되며, 기간 검색시 지난 주문조회 내역을 조회하실 수 있습니다. -->
				</div>
				<table id="orderTable"> 
					<tr style="border-bottom:1px solid black;"> 
						<th>주문번호<br>(주문상세보기)</th>
						<th>상품정보</th>
						<th>결제금액</th>
						<th>결제수단</th>
						<th>결제상태</th>
						<th>주문일</th>
						<th>배송상태</th>
						<th>비고</th>
					</tr>
					<c:if test="${not empty orderSheets}">
						<c:forEach var ="orderSheet" items="${orderSheets}">
							<c:if test="${not empty orderSheet.details}">
								<c:forEach var="detail" items="${orderSheet.details}" varStatus="vs">
									<tr>
										<c:if test="${vs.index==0}">
											<td rowspan="${orderSheet.details.size()}" class="td1">
												<a href="javascript:void(0)" id="detailModalBtn" class="orderSheetTag" style="font-weight:bolder;">
													<c:out value="${orderSheet.orderSheetNo}"/>
												</a>
											</td>
										</c:if>
										<td  class="td2">
											<div style="height:85px;width:530px;margin:10px;display:flex;">
												<input type="hidden" id="productNo" value="${detail.product.productNo}"/>
												<img class="infoImg" src="${path}/resources/upload/product/${detail.product.getFiles().get(0).renamedFileName}" width="85px" height="85px" style="cursor:pointer;"/>
												<div>
													<div style="padding:20px 0px 8px 10px;">
														<a href="${path}/product/view.do?productNo=${detail.product.productNo}" style="font-weight:bolder;"><c:out value="${detail.product.title}"/></a>
													</div>
													<div style="padding:0px 0px 5px 10px;font-size:13px;color:grey;">
														분류: <span><c:out value="${detail.product.item}"/></span> / 가격 : <span><fmt:formatNumber value="${detail.product.price}" pattern="#,###" />원</span>
													</div>
												</div>
											</div>
										</td>
										<c:if test="${vs.index==0}">
											<td rowspan="${orderSheet.details.size()}"  class="td3">
												<fmt:formatNumber value="${orderSheet.totalPrice}" pattern="#,###" />원
											</td>
											<td rowspan="${orderSheet.details.size()}"  class="td4">
												<c:out value="${orderSheet.paymentMethod}"/>
											</td>
											<td rowspan="${orderSheet.details.size()}"  class="td5">
												<c:out value="${orderSheet.paymentState}"/>
											</td>
											<td rowspan="${orderSheet.details.size()}"  class="td6">
												<fmt:formatDate value="${orderSheet.orderSheetenrollDate}" type="date" pattern="yyyy-MM-dd(E)"/>
											</td>
										</c:if>
										<td  class="td7">
											<c:out value="${detail.deliveryState}"/>
										</td>
										<td class="td8">
											<input type="hidden" value="${orderSheet.orderSheetNo}"/>
											<input type="hidden" value="${detail.orderDetailNo}"/>
											<c:choose>
												<c:when test="${detail.refundState eq null and detail.deliveryState ne null and detail.deliveryState eq '배송대기'}">
													<button class="cancelBtn">취소신청</button>
												</c:when>
												<c:when test="${detail.refundState eq null and detail.deliveryState ne null and (detail.deliveryState eq '배송중' or detail.deliveryState eq '배송완료')}">
													<button class="returnBtn">반품신청</button>
												</c:when>
												<c:when test="${detail.refundState ne null and fn:contains(detail.refundState, '취소')}">
													<span class="refundDone">취소신청완료</span>
												</c:when>
												<c:when test="${detail.refundState ne null and fn:contains(detail.refundState, '반품')}">
													<span class="refundDone">반품신청완료</span>
												</c:when>
											</c:choose>
										</td>
									</tr>
								</c:forEach>
							</c:if>
						</c:forEach>
					</c:if>
					<c:if test="${orderSheets == null or empty orderSheets}">
						<tr>
							<td colspan="7">조회된 결과가 없습니다.</td>
						</tr>
					</c:if>
				</table>
				<div id="pageBar">
					${pageBar}
				</div>
			</div>
		</div>
		<!-- 반품/취소 상세내역 모달 -->
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
	</section>
	
<script>
	$(()=>{
		//1일전, 7일전, 1달전, 3달전, 6달전 input 설정
		let dayArr = [0, 7, 30, 90, 180];
		for(let i = 0; i<dayArr.length; i++){
			let day = new Date(new Date().getTime() - dayArr[i]*24*60*60*1000).toISOString().split("T")[0];
			$("input[name=searchKeyword]").eq(i).val(day+" ~ "+new Date().toISOString().split("T")[0]);
		}
		console.log("${searchKeyword}");
		if("${searchKeyword}" != "searchAll"){
			$("input.searchDate").val("${searchKeyword}");
		}
		else{
			$("input.searchDate").val("날짜를 선택해주세요.");
		}
	});
	
	//날짜검색
	$("button.searchDate").click(e=>{
		if($(e.target).prev().val().includes("~")){
			location.assign("${path}/mypage/order.do?searchType=ORDER_SHEET_ENROLL_DATE&searchKeyword="+$(e.target).prev().val());
		} else {
			alert("날짜를 입력해주세요.");
		}
	});
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
	
	//주문상세보기에서 영수증보기를 클릭했을 때
	$(document).on("click","button.receiptButton", e=>{
		let path = $(e.target).val();
		window.open(path,'_blank','width=430px height=700px top=250px left=750px');	
	});

	//datepicker
	$('#orderDateRange').daterangepicker({
		locale: {
		    format: "YYYY-MM-DD",
		    separator: " ~ ",
		    applyLabel: "확인",
		    cancelLabel: "취소",
		   	fromLabel: "From",
		    toLabel: "To",
		    customRangeLabel: "Custom",
		    weekLabel: "W",
		    daysOfWeek: ["일", "월", "화", "수", "목", "금", "토"],
		    monthNames: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
		},
		maxDate:new Date(),
		startDate: new Date(),
		endDate: new Date(),
		drops: "auto"
		}, 
		function (start, end, label) {
		    console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')');
			let when = $("#orderDateRange").val();
			console.log(when);
		}
	);
	
	//숫자 콤마 찍어주는 함수
	function fnSetComma(n) {
	    var reg = /(^[+-]?\d+)(\d{3})/;   // 정규식
	    n += '';                          // 숫자를 문자열로 변환         
	    while (reg.test(n)) {
	        n = n.replace(reg, '$1' + ',' + '$2');
	    }
	    return n;
	}
	
	//이미지를 클릭했을 때 => 동적 태그 생성 추가
	$(document).on("click", "img.infoImg", e=>{
		let path = '${path}/product/view.do?productNo=' + $(e.target).prev().val();
		location.assign(path);
	});
	
	//취소신청 클릭했을 때
	$("button.cancelBtn").click(e=>{
		let path = "${path}/refund/write.do?state=취소&orderSheetNo="+$(e.target).prev().prev().val()+"&orderDetailNo=" + $(e.target).prev().val();
		window.open(path,'_blank','width=470px height=420px top=230px left=700px');	
	});
	//반품신청 클릭했을 때
	$("button.returnBtn").click(e=>{
		let path = "${path}/refund/write.do?state=반품&orderSheetNo="+$(e.target).prev().prev().val()+"&orderDetailNo=" + $(e.target).prev().val();
		window.open(path,'_blank','width=470px height=420px top=230px left=700px');	
	});
	
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
