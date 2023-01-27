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
	
	div#cartWrap{
		width:100%; 
		/* height:1000px; */ /* 수정요망 */
		display:flex;
		justify-content: center;
	}
	div#cartWrap *{
		font-family: 'Nanum Gothic' !important;
	}
	div#cartWrap>div#cartContent{
		width:1150px; /* px로 수정 */ 
		/* height:1000px; */ /* 수정요망 */
		/* border: 2px solid red; */
	}
	
	
	table#cartTable{
		width:100%;
		/* border:1px solid black; */
		border-top:8px solid black;
		border-collapse: collapse;
	}
	table#cartTable tr>th:first-child{
		width:80px;
	}
	table#cartTable tr>td:first-child{
		width:80px;
	}
	table#cartTable tr>th:nth-child(2), table#cartTable tr>td:nth-child(2){
		width:40px;
		text-align:left !important;
	}
	table#cartTable tr>th:nth-child(3), table#cartTable tr>td:nth-child(3){
		width:500px;
	}
	table#cartTable tr>td:nth-child(3){
		text-align:left !important;
	}
	table#cartTable tr>th:nth-child(4), table#cartTable tr>td:nth-child(4){
		width:200px;
	}

	table#cartTable th{
		padding:0px;
		border-bottom:2px solid black;
		height:52px;
	}
	table#cartTable td{
		padding:0px;
		text-align:center;
		border-bottom:1px solid grey;
	}
	button.deleteBtn{
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
	div#ulContainer li{
		color:grey;
		font-size:14px;
	}
	
	
	button#orderBtn{
		width:600px;
		height:50px;
		margin-top:20px;
		color:white;
		background-color:rgb(52, 132, 146);
		border:none;
		font-size:20px;
		border-radius:20px;
	}
</style>
	<section class="mypage">
		<div id="title">
			<div id="innerTitle">
				Cart
			</div>
		</div>
		<div id="cartWrap">
			<div id="cartContent">
				<form action="${path}/order/orderSheet.do" method="get" onsubmit="return submitCheck();">
				<table id="cartTable"> 
					<tr style="border-bottom:1px solid black;"> 
						<th style="font-size:13px;">
							전체
							<br>
							<c:out value="${products.size()}"/>개
						</th>
						<th>
							<input type="checkbox" class="checkAll" style="cursor:pointer;" checked>
						</th>
						<th>상품정보</th>
						<th>판매가</th>
						<th>배송비</th>
						<th>비고</th>
					</tr>
					<c:if test="${not empty products}">
						<c:forEach var="product" items="${products}" varStatus="vs">
							<tr>
								<td>${vs.index+1}</td>
								<td>
									<input type="checkbox" class="check" name="productNo" value="${product.productNo}" style="cursor:pointer;" checked>
								</td>
								<td>
									<div style="height:85px;width:380px;margin:10px;display:flex;">
										<img class="infoImg" alt="${product.productNo}" src="${path}/resources/upload/product/${product.files[0].renamedFileName}" width="85px" height="85px" style="cursor:pointer;"/>
										<div>
											<div style="padding:20px 0px 8px 10px;">
												<a href="${path}/product/view.do?productNo=${productNo}"><c:out value="${product.title}"/></a>
											</div>
											<div style="padding:0px 0px 5px 10px;font-size:13px;color:grey;">
												상태 : <c:out value="${product.grade}"/>
											</div>
										</div>
									</div>
								</td>
								<td class="price">
									<input type="hidden" value="${product.price}"/>
									<fmt:formatNumber value="${product.price}" type="currency"/> 
								</td>
								<td>
									무료
								</td>
								<td>
									<button type="button" class="deleteBtn deleteOne" value="${product.productNo}" style="cursor:pointer;">삭제</button>
								</td>
							</tr>	
						</c:forEach>
					</c:if>
					<c:if test="${empty products}">
						<tr>
							<td colspan="6">장바구니에 상품이 없습니다.</td>
						</tr>
					</c:if>
				</table>
				<div style="display:flex;justify-content: space-between;">
					<div>
						<button type="button" class="deleteBtn deleteSelect" style="margin:15px 0px 10px 15px;cursor:pointer;">선택삭제</button>
					</div>
					<div id="priceContainer" style="width:100%;height:80px;display:flex;justify-content:right;align-items:center;margin-right:30px;">
						<div style="color:grey;font-size:20px;font-weight:bolder;margin-right:5px;">상품합계 : </div>
						<div style="color:black;font-size:25px;font-weight:bolder">
							<span id="totalPrice"></span>원
						</div>
					</div>
				</div>
				<div id="ulContainer">
					<ul>
						<li>
							바다 퍼니쳐는 전 상품 무료배송입니다.
						</li>
						<li>
							2개 이상의 상품을 주문시, 개별 배송 됩니다.
						</li>
						<li>
							장바구니에는 최대 10개의 상품을 보관할 수 있으며, 주문당 한번에 주문 가능한 상품 수는 10개로 제한됩니다.
						</li>
						<li>
							무통장 입금 결제는 주문 취소시 24시간 내 재주문이 불가능합니다.
						</li>
					</ul>
				</div>
				<div style="display:flex;justify-content:center">
					<button id="orderBtn">구매하기</button>
				</div>
				</form>
			</div>
		</div>
	</section>
<script>
	$(()=>{
		sumPrice();
	});
	
	//전체선택 체크박스를 클릭했을 때
	$("input.checkAll").change(e=>{
		if($(e.target).prop("checked")==true){
			$("input.check").prop("checked",true);	
			sumPrice();
		} else {
			$("input.check").prop("checked",false);	
			sumPrice();
		}
	});
	
	//가구 체크박스를 클릭했을 때
	$("input.check").change(e=>{
		if($("input.check").length == $("input.check:checked").length){
			$("input.checkAll").prop("checked",true);
		} else {
			$("input.checkAll").prop("checked",false);
		}
		sumPrice();
	});
	
	//가격 구하기 함수
	const sumPrice = () => {
		let totalPrice = 0;
		if($("input.check:checked").length > 0){
			$("input.check:checked").each((i,v)=>{
				totalPrice += Number($(v).parent().next().next().children().first().val());
			});
		} 
		$("span#totalPrice").html(fnSetComma(totalPrice));
	};
	
	//onsubmit 함수
	const submitCheck = () => {
		if($("input.check:checked").length == 0){
			alert("한개 이상의 가구를 선택해 주세요.");
			return false;
		}
		return true;
	}
	
	//숫자 콤마 찍어주는 함수
	function fnSetComma(n) {
	    var reg = /(^[+-]?\d+)(\d{3})/;   // 정규식
	    n += '';                          // 숫자를 문자열로 변환         
	    while (reg.test(n)) {
	        n = n.replace(reg, '$1' + ',' + '$2');
	    }
	    return n;
	}
	
	//삭제 버튼 클릭했을 때
	$("button.deleteOne").click(e=>{
		if(confirm("삭제 하시겠습니까?")){
			location.replace("${path}/cart/delete.do?productNo="+$(e.target).val());
		} 
	});
	
	//선택삭제 버튼 클릭했을 때
	$("button.deleteSelect").click(e=>{
		let queryString = "";
		if($("input.check:checked").length > 0){
			if(confirm("선택하신 가구들을 삭제하시겠습니까?")){
				$("input.check:checked").each((i,v)=>{
					queryString += "productNo=" + $(v).val() + "&";
				});
				queryString = queryString.substring(0,queryString.length-1);
				location.replace("${path}/cart/delete.do?" + queryString);
			} 
		}
	});
	
	//이미지 클릭했을 때
	$("img.infoImg").click(e=>{
		let path = '${path}/product/view.do?productNo=' + $(e.target).attr("alt");
		location.assign(path);
	});
	
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
