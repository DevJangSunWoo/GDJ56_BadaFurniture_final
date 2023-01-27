 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!-- 상단 콘텐츠 영역 -->





<!-- SW커스텀마이징 css --> 

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/order/base.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/order/common.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/order/font-awesome.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/order/gallery.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/order/guide.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/order/icon.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/order/image_search.css" />
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/order/jqModal.css" /> --%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/order/layout.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/order/magazine_common.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/order/media_query.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/order/new.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/order/normalizer.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/order/order.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/order/pc.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/order/store_common.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/order/style.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/order/sub.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/order/swiper.min.css" />
<!--// SW커스텀마이징 css -->
<link rel="stylesheet" href="//image.msscdn.net/ui/musinsa/resources/common/css/icon.min.css?202101051200"/>



<script src="//static.msscdn.net/swiper/swiper.min.js?20200316"></script>




<!-- SW js커스텀마이징 -->
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.1.min.js"></script> 

<%-- <script src="${pageContext.request.contextPath }/resources/js/hotjar-1491926.js"></script>  --%>

<%-- <script src="${pageContext.request.contextPath }/resources/js/jsOrder/ai.2.min.js"></script> --%>
<script src="${pageContext.request.contextPath }/resources/js/jsOrder/base.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jsOrder/chunk-vendors.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jsOrder/clipboard.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jsOrder/common.js"></script>
<%-- <script src="${pageContext.request.contextPath }/resources/js/jsOrder/events.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath }/resources/js/jsOrder/get_botton_brand_ranking"></script> --%>
<%-- <script src="${pageContext.request.contextPath }/resources/js/jsOrder/get_category_list_jsonp"></script> --%>
<script src="${pageContext.request.contextPath }/resources/js/jsOrder/gtm.js"></script>
<%-- <script src="${pageContext.request.contextPath }/resources/js/jsOrder/hotjar-1491926.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath }/resources/js/jsOrder/image_search.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath }/resources/js/jsOrder/jqModal.min.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath }/resources/js/jsOrder/jquery-1.11.1.min.js"></script> --%>
<script src="${pageContext.request.contextPath }/resources/js/jsOrder/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jsOrder/jquery.bxslider.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jsOrder/jquery.cycle.all.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jsOrder/jquery.easing.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jsOrder/jquery.lazyload.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jsOrder/jquery.url.packed.js"></script>
<%-- <script src="${pageContext.request.contextPath }/resources/js/jsOrder/js"></script> --%>
<script src="${pageContext.request.contextPath }/resources/js/jsOrder/jslib.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jsOrder/lnb.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jsOrder/md5.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jsOrder/mini_cart.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jsOrder/miya_validator.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jsOrder/mpay.js"></script>
<%-- <script src="${pageContext.request.contextPath }/resources/js/jsOrder/msspay.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath }/resources/js/jsOrder/order.js"></script> --%>
<script src="${pageContext.request.contextPath }/resources/js/jsOrder/order_plcc.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jsOrder/pc.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jsOrder/plcc_data.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jsOrder/popup_window.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jsOrder/refund-account.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jsOrder/swiper.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jsOrder/ui.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jsOrder/uwt.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jsOrder/wcslog.js"></script> 



<!-- //SW js커스텀마이징 -->
<script src="//static.msscdn.net/static/common/1.2.0/chunk-vendors.js"></script>
<script src="//static.msscdn.net/skin/js/app/app.js?874d2b2435d068069fdd"></script>

   



<style>
	.important-style{font-weight:bold !important; font-size:14px !important;}

	/* 결제 프로모션 */
	.n-order-promotion{color:#777;font-size:12px;line-height:18px;padding:10px}
	.n-order-promotion.promotion-all{border-bottom:1px solid #ddd}
	.n-order-promotion > strong{display:block;color:#000;margin-top:15px}
	.n-order-promotion > strong:first-child{margin-top:0}
	.n-order-promotion > div{margin:5px 0}
	.n-order-promotion > a{display:inline-block;font-weight:bold;color:#000;margin-top:5px}
</style>



<!--  결제 관련  시작 -->
<!--vs코드 참조  -->
<!--  결제 관련  종료 -->


<!-- wrap -->
<div class="wrap">
	<div style="display: flex !important;justify-content: center !important;height:1200px !important;">
	
	<!-- 오른쪽 콘텐츠 영역 -->
		<div  style="margin-top:150px; ">
			
			<form  action="${path}/order/insertBoard.do"   method="post"    name="f1" id="orderForm"  >
	           <!--input hidden 위치 결제수단,상품금액 -->
	           
	           
				<div class="right_contents">
					<h2 class="title-page">Order / Payment</h2>
					<div class="page-sorting order font-mss">
						<a href="/app/cart"><span>장바구니</span></a>
						<span><i class="ic-14-line-arrow-right">></i></span>
						<span class="current-page">주문서</span>
						<span><i class="ic-14-line-arrow-right">></i></span>
						<span>주문 완료</span>
					</div>
				</div>
	
	
				<!-- 회원 -->
				<div class="section order__delivery">
				<!-- 주문자 정보   히튼 태그 위치 -->
		
			
			    <!-- 배송지 정보 -->
			    <div class="order__delivery__inner">
			        <h3 class="order__title">배송 정보</h3>
			       <!--배송정보 히든 태그  -->
			     <c:if test="${not empty loginMember }"> 
				        <ul class="order__list">
				            <li class="order__item delivery__item__info" >
				                <span class="order__item__label">
				                    배송지
				                </span>
				                <div class="order__item__area">
				                    <ul class="order__delivery__radio-wrap" id="quickDeliveryList">
				                        <li>
				                            <input type="radio" onclick="test123789();" class="n-radio" id="delivery_choice_0" name=""    checked >
				                            <label for="delivery_choice_0">${loginMember.memberId}님 배송지</label>
				                        </li>
				                    </ul>
				                    <button type="button" class="order__button" onclick="sample6_execDaumPostcode();">배송지 변경</button> 
				                </div>
				            </li>
				            <li class="order__item delivery__item__info" >
				                <span class="order__item__label">이름 / 연락처</span>
				                <div class="order__item__area">
				                    <ul class="order__delivery__user">
				                        <li id="delivery-name">${loginMember.memberName}</li>
				                        <li id="delivery-phone">${loginMember.phone}</li>
				                    </ul>
				                </div>
				            </li>	
				        
				         	<div>
					         	<div class="order__item__area">
						         	<span class="order__item__label">배송주소</span>    			
					                <div class="order_option_box"> 
									 	<!-- <div id="addressContainer">
										 	<input type="text" id="sample6_postcode" placeholder="우편번호" style="width:100px;border:1px solid lightgray;"name="postCode" readonly required>
											<input type="text" id="sample6_address" placeholder="주소" style="width:210px;border:1px solid lightgray;"name="address" readonly required><br>
											<input type="text" id="sample6_detailAddress" placeholder="상세주소" style="width:210px;border:1px solid lightgray;"name="addressDetail">
									 	</div> -->
										<div id="addressContainer">
											<input type="text" id="sample6_postcode" placeholder="우편번호" style="width:100px;border:1px solid lightgray;"name="postCode" readonly required  value="${loginMember.postCode}"   >
											<input type="text" id="sample6_address" placeholder="주소" style="width:280px;border:1px solid lightgray;"name="address" readonly required value="${loginMember.address}"><br>
											<input type="text" id="sample6_detailAddress" placeholder="상세주소" style="width:210px;border:1px solid lightgray;"name="addressDetail" value="${loginMember.detailAddress}">
											<input type="hidden" id="sample6_extraAddress" placeholder="참고항목" style="width:210px;"name="addressExtra" disabled>
										</div>
									 </div>	
				                </div>
				         	</div>
				         </ul>
			          </c:if> 
			    </div>
			</div>
		
			<!--주소api  -->
			
			<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
			<script>
			function sample6_execDaumPostcode() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

		                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var addr = ''; // 주소 변수
		                var extraAddr = ''; // 참고항목 변수

		                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                    addr = data.roadAddress;
		                } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                    addr = data.jibunAddress;
		                }

		                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
		                if(data.userSelectedType === 'R'){
		                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                        extraAddr += data.bname;
		                    }
		                    // 건물명이 있고, 공동주택일 경우 추가한다.
		                    if(data.buildingName !== '' && data.apartment === 'Y'){
		                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                    }
		                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		                    if(extraAddr !== ''){
		                        extraAddr = ' (' + extraAddr + ')';
		                    }
		                    // 조합된 참고항목을 해당 필드에 넣는다.
		                    document.getElementById("sample6_extraAddress").value = extraAddr;
		                
		                } else {
		                    document.getElementById("sample6_extraAddress").value = '';
		                }

		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                document.getElementById('sample6_postcode').value = data.zonecode;
		                document.getElementById("sample6_address").value = addr;
		                // 커서를 상세주소 필드로 이동한다.
		                document.getElementById("sample6_detailAddress").focus();
		            }
		        }).open();
		    	$("#delivery_choice_0").prop("checked",false);
			}	
			</script>
			<script>
				/*기본 배송지로 변경하는 스크립트   */
				function test123789(){
					$("#sample6_postcode").val('${loginMember.postCode}');
					$("#sample6_address").val('${loginMember.address}');
					$("#sample6_detailAddress").val('${loginMember.detailAddress}');
			}
			</script>
			
			
			
		
			<div class="section order_product_info">
				<h3 class="order__title">상품 정보</h3>	
				<!--cart products-->
				<table class="table_basic order_cart_table">
					<colgroup>
						<col>
						<col width="50px">
						<col width="80px">
						<col width="80px">
						<col width="70px" class="charge ">
						<col width="69px" class="charge ">
						<col width="100px" class="charge ">
					</colgroup>
					<thead>
						<tr>
							<th scope="col">상품 정보</th>					
							<th scope="col"  colspan="3">배송비</th>
							<th scope="col"  colspan="3">주문금액</th>
						</tr>
					</thead>
					<!--리스트 데이터 표출 -->
					<tbody>
						 <c:if test="${not empty products}">    	
							<!--총가격을 구하기 위한 이엘태그  -->
							<c:set var = "total" value = "0" />
								<c:forEach var="products" items="${products}" varStatus="vs">
										
										<tr>
											<td class="td_product">
												<div class="connect_img">
													<img src="${path}/resources/upload/product/${products.files.get(0).renamedFileName}">
												</div>
												<div class="article_info connect_info">
													<div class="box_product">
														<strong>제품 명</strong>
														<span class="list_info">${products.title}</span>
													</div>
													<div class="order_option_box">
														<p> 분류:${products.item}/색깔:${products.color} /상태:${products.grade}</p>
													</div>										
												</div>
											</td>
											<td rowspan="1" colspan="3">
											배송비는 주문 금액에 포함되있습니다.
											</td>
										    <td class="price" colspan="3">
					                        	<strong>${products.price}원</strong>
					                        </td>                                
										</tr>
									<c:set var= "total" value="${total + products.price}"/>
								</c:forEach>
							
						</c:if> 
						<c:if test="${empty products}">	
							해당 제품은 판매되었습니다.
						</c:if>
						
					</tbody>																	
				</table>
			</div>
			
			<div class="right_contents section_payment">
				<h3 class="order__title">결제 정보</h3>
				<div>
					<!--신용카드 -->
					<div class="cell_order_form" style="border-right: lightgray 1px !important;">
						<div class="clear cell_order_form1 border_add_order" id="payment_info_area">            			
							<ul id="__payment-choice-view" class="list_payment_order">
								<li class="cell_discount_tit new-payment-area">결제 수단</li>
								<li class="cell_discount_detail new-payment-area">
									<ul class="payment-choice">
										<li>                                           										
											<input type="radio" class="n-radio" id="payment_btn1" name="payment_choice" value="pg" checked>
											<label for="payment_btn1">일반결제</label>
										</li>
                                     </ul>      																			
								</li>
							</ul>                
							<div class="__payment-view __payment-pg-view" >
								<ul class="list_payment_order">
									<li class="cell_discount_tit new-payment-area">결제 안내</li>
									<li class="cell_discount_detail payment-area">
										<div class="payment-area-wrap">
												<input type="radio" id="btn-paykind-CARD" type="radio" name="kyejae" value="card" onclick="pay_info2_card();">
												<label for="btn-paykind-CARD" class="box_choice">카드</label>
												<input type="radio" id="btn-paykind-TRANSFER" type="radio" name="kyejae" value="transfer" onclick="pay_info2_account();">
												<label for="btn-paykind-TRANSFER" class="box_choice">계좌이체</label>
								<!-- 결제수수료율 설정값 출력 부분 //-->
	                                                <input type="hidden" id="pay-fee-rate-PHONE" value="5" />                                       
	                                       </div>
										<div id="pay_info2_account"  style="display:none;" >
											<input id="depositName" type="text"  placeholder="예금주명을 입력해주세요" style="width:200px;border:1px solid lightgray;display:inline !important;"/>	
										</div>
										
									</li>
								</ul>
							</div>
						<!-- 주문자 동의 -->
							<ul class="list_payment_order">
								<li class="cell_discount_tit last">주문자 동의</li>
								<li class="cell_discount_detail last">
							    <div class="order-agree">
							        <div class="order-agree__title">
							            회원 본인은 구매 조건, 주문 내용 확인 및 결제에 동의합니다
							        </div>
							                <div class="order-agree__text">
							            <span class="font_basic">개인정보 수집 및 이용 동의</span>
							            <a href="javascript:void(0)" class="order-agree__more" onclick="showAgreeDetail(this); return false;" id="secondAgree">자세히</a>
							            <div id="secondAgreeDetail" class="order-agree__section" style="display:none;">
							                <strong>개인정보 수집 및 이용 동의</strong>
							                <ol>
							                    <li>
							                        1. 수집목적
							                        <br>판매자와 구매자의 거래의 원활한 진행, 본인의사의 확인, 고객 상담 및 불만처리, 상품과 경품 배송을 위한 배송지 확인 등
							                    </li>
							                    <li>
							                        2. 수집 항목
							                        <br>구매자 정보: 성명, 전화번호, ID, 휴대전화 번호, 메일주소, 상품 구매정보
							                        <br>수령자 정보: 성명, 전화번호, 휴대전화 번호, 배송지 주소
							                    </li>
							                    <li>
							                        3. 보유기간
							                        <br><span style="font-weight: bold; font-size: 14px;">개인정보 수집 및 이용목적 달성 시 및 관련 법령에 따른 기간까지 보관</span>
							                    </li>
							                    <li>
							                        4. 동의 거부시 불이익
							                        <br>본 개인정보 수집 및 이용 등에 동의하지 않을 권리가 있습니다. 다만, 필수항목에 동의를 하지 않을경우 거래가 제한될 수 있습니다.
							                    </li>
							                </ol>
							            </div>
							        </div>
							        <div class="order-agree__text">
							            <span class="font_basic">개인정보 제 3자 제공 동의</span>
							            <a href="javascript:void(0)" class="order-agree__more" onclick="showAgreeDetail(this); return false;" id="thirdAgree">자세히</a>
							            <div id="thirdAgreeDetail" class="order-agree__section" style="display:none;">
							                <p>무신사의 회원계정으로 상품 및 서비스를 구매하고자 할 경우, (주)무신사는 거래 당사자간 원활한 의사소통 및 배송, 상담 등 거래이행을 위하여 필요한 최소한의 개인정보만을 무신사
							                    입점업체 판매자 및 배송업체에 아래와 같이 공유하고 있습니다.</p>
							                <ol>
							                    <li>1. (주)무신사는 귀하께서 무신사 입점업체 판매자로부터 상품 및 서비스를 구매하고자 할 경우, 개인정보보호법 제 17조 (개인정보의 제공)에 따라 아래와 같은 사항은
							                        안내하고 동의를 받아 귀하의 개인정보를 판매자에게 공유합니다.
							                    </li>
							                    <li>2. 개인정보를 공유받는자 :
							                                                                                                                                                주식회사 콘크리트웍스
							                                                                                            </li>
							                    <li>3. 공유하는 개인정보 항목 - 구매자 정보: 성명, 전화번호, ID, 휴대전화 번호, 메일주소, 상품 구매정보 - 수령자 정보: 성명, 전화번호, 휴대전화 번호, 배송지
							                        주소
							                    </li>
							                    <li>4. 개인정보를 공유받는 자의 이용 목적 : 판매자와 구매자의 거래의 원활한 진행, 본인의사의 확인, 고객 상담 및 불만처리, 상품과 경품 배송을 위한 배송지 확인 등
							                    </li>
							                    <li>5. 개인정보를 공유받는 자의 개인정보 보유 및 이용 기간 : <span style="font-weight: bold; font-size: 14px;">상품 구매/배송/반품 등 서비스 처리 완료 후 180일간 보관 후 파기</span></li>
							                    <li>6. 동의 거부 시 불이익 : 본 개인정보 공유에 동의하지 않으시는 경우, 동의를 거부할 수 있으며, 이 경우 거래가 제한됩니다.</li>
							                </ol>
							            </div>
							        </div>
							        
							        <div class="order-agree__text">
							            <span class="font_basic">전자결제대행 이용 동의</span>
							            <a href="javascript:void(0)" class="order-agree__more" onclick="showAgreeDetail(this); return false;" id="fifthAgree">자세히</a>
							            <div id="fifthAgreeDetail" class="order-agree__section" style="display:none;">
							                <strong>[토스페이먼츠]</strong><br>
							                <strong>전자금융거래 기본약관(이용자용)</strong><br>
							
							                <strong>제1조 (목적)</strong>
							                <ol>
							                    <li>이 약관은 전자지급결제대행서비스 및 결제대금예치서비스를 제공하는 토스페이먼츠 주식회사(이하 '회사'라 합니다)와 이용자 사이의 전자금융거래에 관한 기본적인 사항을 정함으로써
							                        전자금융거래의 안정성과 신뢰성을 확보함에 그 목적이 있습니다.
							                    </li>
							                </ol>
							
							                <strong>제2조 (용어의 정의)</strong>
							                <ol>
							                    <li>이 약관에서 정하는 용어의 정의는 다음과 같습니다.</li>
							                    <li>① 전자금융거래'라 함은 회사가 전자적 장치를 통하여 전자지급결제대행서비스 및 결제대금예치서비스(이하 '전자금융거래 서비스'라고 합니다)를 제공하고, 이용자가 회사의
							                        구성원과 직접 대면하거나 의사소통을 하지 아니하고 전산화된 방식으로 이를 이용하는 거래를 말합니다.
							                    </li>
							                    <li>② '전자지급결제대행 서비스'라 함은 전자적 방법으로 재화의 구입 또는 용역의 이용에 있어서 지급결제정보를 송신하거나 수신하는 것 또는 그 대가의 정산을 대행하거나 매개하는
							                        서비스를 말합니다.
							                    </li>
							                    <li>③ ‘결제대금예치서비스'라 함은 이용자가 재화의 구입 또는 용역의 이용에 있어서 그 대가(이하 '결제대금'이라 한다)의 전부 또는 일부를 재화 또는 용역(이하 '재화
							                        등'이라 합니다)을 공급받기 전에 미리 지급하는 경우, 회사가 이용자의 물품수령 또는 서비스 이용 확인 시점까지 결제대금을 예치하는 서비스를 말합니다.
							                    </li>
							                    <li>④ '이용자'라 함은 이 약관에 동의하고 회사가 제공하는 전자지급결제대행 서비스를 이용하는 자를 말합니다.</li>
							                    <li>⑤ '접근매체'라 함은 전자금융거래에 있어서 거래지시를 하거나 이용자 및 거래내용의 진실성과 정확성을 확보하기 위하여 사용되는 수단 또는 정보로서 전자식 카드 및 이에
							                        준하는 전자적 정보(신용카드번호를 포함한다), '전자서명법'상의 인증서, 금융기관 또는 전자금융업자에 등록된 이용자번호, 이용자의 생체정보, 이상의 수단이나 정보를
							                        사용하는데 필요한 비밀번호 등 전자금융거래법 제2조 제10호에서 정하고 있는 것을 말합니다.
							                    </li>
							                    <li>⑥ '거래지시'라 함은 이용자가 전자금융거래계약에 따라 금융기관 또는 전자금융업자에게 전자금융거래의 처리를 지시하는 것을 말합니다.</li>
							                    <li>⑦ '오류'라 함은 이용자의 고의 또는 과실 없이 전자금융거래가 전자금융거래계약 또는 이용자의 거래지시에 따라 이행되지 아니한 경우를 말합니다.</li>
							                </ol>
							
							                <strong>제3조 (약관의 명시 및 변경)</strong>
							                <ol>
							                    <li>① 회사는 이용자가 전자지급결제대행 서비스를 이용하기 전에 이 약관을 게시하고 이용자가 이 약관의 중요한 내용을 확인할 수 있도록 합니다.</li>
							                    <li>② 회사는 이용자의 요청이 있는 경우 서면제공 방식 또는 전자문서의 전송방식에 의하여 본 약관의 사본을 이용자에게 교부합니다.</li>
							                    <li>③ 회사가 약관을 변경하는 때에는 그 시행일 1월 전에 변경되는 약관을 지급결제정보 입력화면 및 회사의 홈페이지에 게시함으로써 이용자에게 공지합니다.</li>
							                    <li>④ 이용자는 제3항의 규정에 따른 약관의 변경내용이 게시되거나 통지된 후부터 변경되는 약관의 시행일 전의 영업일까지 전자금융거래의 계약을 해지할 수 있습니다. 전단의 기간
							                        안에 이용자가 약관의 변경내용에 대하여 이의를 제기하지 아니하는 경우에는 약관의 변경을 승인한 것으로 봅니다.
							                    </li>
							                </ol>
							
							                <strong>제4조 (전자지급결제대행서비스의 종류)</strong>
							                <ol>
							                    <li>회사가 제공하는 전자지급결제대행서비스는 지급결제수단에 따라 다음과 같이 구별됩니다.</li>
							                    <li>① 신용카드결제대행서비스: 이용자가 결제대금의 지급을 위하여 제공한 지급결제수단이 신용카드인 경우로서, 회사가 전자결제시스템을 통한 신용카드 지불정보의 송,수신 및
							                        결제대금의 정산을 대행하거나 매개하는 서비스를 말합니다.
							                    </li>
							                    <li>② 계좌이체대행서비스: 이용자가 결제대금을 회사의 전자결제시스템을 통하여 금융기관에 등록한 자신의 계좌에서 출금하여 원하는 계좌로 이체할 수 있는 실시간 송금 서비스를
							                        말합니다.
							                    </li>
							                    <li>③ 가상계좌서비스: 이용자가 결제대금을 현금으로 결제하고자 경우 회사의 전자결제시스템을 통하여 자동으로 이용자만의 고유한 일회용 계좌의 발급을 통하여 결제대금의 지급이
							                        이루어지는 서비스를 말합니다.
							                    </li>
							                    <li>④ 기타: 회사가 제공하는 서비스로서 지급결제수단의 종류에 따라 '휴대폰 결제대행서비스', 'KT전화(ARS,폰빌)결제대행서비스', '상품권결제대행서비스'등이 있습니다.
							                    </li>
							                </ol>
							
							                <strong>제5조 (결제대금예치서비스의 내용)</strong>
							                <ol>
							                    <li>① 이용자(이용자의 동의가 있는 경우에는 재화 등을 공급받을 자를 포함합니다. 이하 본조에서 같습니다)는 재화 등을 공급받은 사실을 재화 등을 공급받은 날부터 3영업일
							                        이내에 회사에 통보하여야 합니다.
							                    </li>
							                    <li>② 회사는 이용자로부터 재화 등을 공급받은 사실을 통보 받은 후 회사와 통신판매업자간 사이에서 정한 기일 내에 통신판매업자에게 결제대금을 지급합니다.</li>
							                    <li>③ 회사는 이용자가 재화 등을 공급받은 날부터 3영업일이 지나도록 정당한 사유의 제시 없이 그 공급받은 사실을 회사에 통보하지 아니하는 경우에는 이용자의 동의 없이
							                        통신판매업자에게 결제대금을 지급할 수 있습니다.
							                    </li>
							                    <li>④ 회사는 통신판매업자에게 결제대금을 지급하기 전에 이용자에게 결제대금을 환급받을 사유가 발생한 경우에는 그 결제대금을 소비자에게 환급합니다.</li>
							                    <li>⑤ 회사는 이용자와의 결제대금예치서비스 이용과 관련된 구체적인 권리,의무를 정하기 위하여 본 약관과는 별도로 결제대금예치서비스이용약관을 제정할 수 있습니다.</li>
							                </ol>
							
							                <strong>제6조 (접근매체의 선정, 관리 등)</strong>
							                <ol>
							                    <li>① 회사는 전자지급결제대행 서비스 제공 시 접근매체를 선정하여 이용자의 신원, 권한 및 거래지시의 내용 등을 확인할 수 있습니다.</li>
							                    <li>② 이용자는 접근매체를 제3자에게 대여하거나 사용을 위임하거나 양도 또는 담보 목적으로 제공할 수 없습니다.</li>
							                    <li>③ 이용자는 자신의 접근매체를 제3자에게 누설 또는 노출하거나 방치하여서는 안되며, 접근매체의 도용이나 위조 또는 변조를 방지하기 위하여 충분한 주의를 기울여야 합니다.
							                    </li>
							                    <li>④ 회사는 이용자로부터 접근매체의 분실이나 도난 등의 통지를 받은 때에는 그 때부터 제3자가 그 접근매체를 사용함으로 인하여 이용자에게 발생한 손해를 배상할 책임이
							                        있습니다.
							                    </li>
							                </ol>
							
							                <strong>제7조 (회사의 책임)</strong>
							                <ol>
							                    <li>① 접근매체의 위조나 변조로 발생한 사고로 인하여 이용자에게 발생한 손해에 대하여 배상책임이 있습니다. 다만, 이용자가 접근매체를 제3자에게 대여하거나 그 사용을 위임한
							                        경우 또는 양도나 담보의 목적으로 제공한 경우, 회사가 보안강화를 위하여 전자금융거래 시 요구하는 추가적인 보안조치를 이용자가 정당한 사유 없이 거부하여 정보통신망에
							                        침입하여 거짓이나 그 밖의 부정한 방법으로 획득한 접근매체의 이용으로 사고가 발생한 경우, 이용자가 제6조 제2항에 위반하거나 제3자가 권한 없이 이용자의 접근매체를
							                        이용하여 전자금융거래를 할 수 있음을 알았거나 알 수 있었음에도 불구하고 이용자가 자신의 접근매체를 누설 또는 노출하거나 방치한 경우 그 책임의 전부 또는 일부를 이용자가
							                        부담하게 할 수 있습니다.
							                    </li>
							                    <li>② 회사는 계약체결 또는 거래지시의 전자적 전송이나 처리과정에서 발생한 사고로 인하여 이용자에게 손해가 발생한 경우에는 그 손해를 배상할 책임이 있습니다. 다만, 본조
							                        제1항 단서에 해당하거나 법인('중소기업기본법' 제2조 제2항에 의한 소기업을 제외한다)인 이용자에게 손해가 발생한 경우로서 회사가 사고를 방지하기 위하여 보안절차를
							                        수립하고 이를 철저히 준수하는 등 합리적으로 요구되는 충분한 주의의무를 다한 경우 그 책임의 전부 또는 일부를 이용자가 부담하게 할 수 있습니다.
							                    </li>
							                    <li>③ 회사는 전자금융거래를 위한 전자적 장치 또는 ‘정보통신망 이용촉진 및 정보보호 등에 관한 법률’ 제2조제1항제1호에 따른 정보통신망에 침입하여 거짓이나 그 밖의 부정한
							                        방법으로 획득한 접근매체의 이용으로 발생한 사고로 인하여 이용자에게 그 손해가 발생한 경우에는 그 손해를 배상할 책임이 있습니다.
							                    </li>
							                </ol>
							
							                <strong>제8조 (거래내용의 확인)</strong>
							                <ol>
							                    <li>① 회사는 이용자와 미리 약정한 전자적 방법을 통하여 이용자의 거래내용(이용자의 '오류정정 요구사실 및 처리결과에 관한 사항'을 포함합니다)을 확인할 수 있도록 하며,
							                        이용자의 요청이 있는 경우에는 요청을 받은 날로부터 2주 이내에 전자적양식, 모사전송, 서면 등의 방법으로 거래내용에 관한 서면을 교부합니다. 전자적 장치의 운영장애, 그
							                        밖의 사유로 거래내용을 확인하게 할 수 없는 때에는 인터넷 등을 이용하여 즉시 그 사유를 알리고, 그 사유가 종료된 때부터 이용자가 거래내용을 확인할 수 있도록 하여야
							                        합니다.
							                    </li>
							                    <li>② 회사가 이용자에게 제공하는 거래내용 중 거래계좌의 명칭 또는 번호, 거래의 종류 및 금액, 거래상대방을 나타내는 정보, 거래일자, 전자적 장치의 종류 및 전자적 장치를
							                        식별할 수 있는 정보와 해당 전자금융거래와 관련한 전자적 장치의 접속기록은 5년간, 건당 거래금액이 1만원 이하인 소액 전자금융거래에 관한 기록, 전자지급수단 이용시
							                        거래승인에 관한 기록, 이용자의 오류정정 요구사실 및 처리결과에 관한 사항은 1년간의 기간을 대상으로 하되, 회사가 가맹점에 대한 전자지급결제대행 서비스 제공의 대가로
							                        수취한 수수료에 관한 사항은 제공하는 거래내용에서 제외됩니다.
							                    </li>
							                    <li>③ 이용자가 본조 제1항에서 정한 서면교부를 요청하고자 할 경우 다음의 주소 및 전화번호로 요청할 수 있습니다.</li>
							                    <li>주소 : 서울특별시 강남구 테헤란로 131 한국지식재산센터 15층 토스페이먼츠 주식회사</li>
							                    <li>이메일 주소 : support@tosspayments.com</li>
							                    <li>전화번호 : 1544-7772</li>
							                </ol>
							
							                <strong>제9조 (오류의 정정 등)</strong>
							                <ol>
							                    <li>① 이용자는 전자지급결제대행 서비스를 이용함에 있어 오류가 있음을 안 때에는 회사에 대하여 그 정정을 요구할 수 있습니다.</li>
							                    <li>② 회사는 전항의 규정에 따른 오류의 정정요구를 받은 때에는 이를 즉시 조사하여 처리한 후 정정요구를 받은 날부터 2주 이내에 그 결과를 이용자에게 알려 드립니다.</li>
							                    <li>③ 이용자는 다음의 주소 및 전화번호로 본 조항상의 정정 요구를 할 수 있습니다.</li>
							                    <li>주소 : 서울특별시 강남구 테헤란로 131 한국지식재산센터 15층 토스페이먼츠 주식회사</li>
							                    <li>이메일 주소 : support@tosspayments.com</li>
							                    <li>전화번호: 1544 - 7772</li>
							                    <li>④ 회사는 스스로 전자금융거래에 오류가 있음을 안 때에는 이를 즉시 조사하여 처리한 후 오류가 있음을 안 날부터 2주 이내에 오류의 원인과 처리 결과를 이용자에게 알려
							                        드립니다.
							                    </li>
							                </ol>
							
							                <strong>제10조 (전자지급결제대행 서비스 이용 기록의 생성 및 보존)</strong>
							                <ol>
							                    <li>① 회사는 이용자가 전자지급결제대행 서비스 이용거래의 내용을 추적, 검색하거나 그 내용에 오류가 발생한 경우에 이를 확인하거나 정정할 수 있는 기록을 생성하여
							                        보존합니다.
							                    </li>
							                    <li>② 전항의 규정에 따라 회사가 보존하여야 하는 기록의 종류 및 보존방법은 제8조 제2항에서 정한 바에 따릅니다.</li>
							                </ol>
							
							                <strong>제11조 (거래지시의 철회 제한)</strong>
							                <ol>
							                    <li>① 이용자가 전자지급거래를 한 경우, 지급의 효력은 ‘전자금융거래법’ 제13조 각호의 규정에 따릅니다.</li>
							                    <li>② 이용자는 ‘전자금융거래법’ 제13조 각호의 규정에 따라 지급의 효력이 발생하기전까지 거래지시를 철회할 수 있습니다. 단, 금융기관, 이동통신사 등의 규정에 의거
							                        거래지시의 철회가 제한될 수 있습니다.
							                    </li>
							                    <li>③ 전자지급수단별 거래지시의 철회 방법 및 제한 등은 다음 각호와 같습니다.</li>
							                    <li>신용카드결제, 계좌이체결제, 가상계좌결제 : 전자상거래 등에서의 소비자보호에 관한 법률 등 관련 법령에서 정한 바에 따라 재화의 구입 또는 용역의 이용 거래에서의 청약의
							                        철회 등을 한 경우에 한하여 철회가 가능합니다.
							                    </li>
							                    <li>휴대폰결제, KT전화(ARS,폰빌)결제: 전 가호의 방법에 따른 청약철회 요청건 중 이동통신사의 규정에 의거 결제일 해당월 말일까지 발생한 거래건에 한하여 철회가
							                        가능합니다.
							                    </li>
							                    <li>상품권결제: 전 가호의 방법에 따른 청약철회 요청 건 중 시스템 장애 등으로 정상적인 서비스를 이용하지 못한 경우에 한하여 결제일로부터 10일 이내 청약 철회가
							                        가능합니다.
							                    </li>
							                </ol>
							
							                <strong>제12조 (추심이체의 출금 동의 및 철회)</strong>
							                <ol>
							                    <li>① 회사는 이용자의 요청이 있는 경우 이용자의 계좌가 개설되어 있는 금융회사 등이 추심이체를 실행할 수 있도록 금융회사 등을 대신하여 전자금융거래법령 등 관련 법령에 따른
							                        방법으로 출금에 대한 동의를 진행합니다.
							                    </li>
							                    <li>② 회사는 전 항에 따른 이용자의 동의 사항을 추심 이체를 실행하는 해당 금융회사 등에 제출합니다.</li>
							                    <li>③ 이용자는 이용자의 계좌의 원장에 출금기록이 끝나기 전까지 회사 또는 해당 금융회사 등에 제1항의 규정에 따른 동의의 철회를 요청할 수 있습니다.</li>
							                    <li>④ 전 항에도 불구하고 회사 또는 금융회사 등은 대량으로 처리하는 거래 또는 예약에 따른 거래 등의 경우에는 미리 이용자와 정한 약정에 따라 동의의 철회시기를 달리 정할 수
							                        있습니다.
							                    </li>
							                    <li>⑤ 이용자가 제3항에 따라 출금 동의 철회를 요청한 경우, 이용자는 출금 동의 철회 요청 이후 발생한 출금에 대해서 제14조 제1항의 담당자에게 이의를 제기할 수 있습니다.
							                        다만, 본 조항은 동의 철회요청 이전에 발생한 출금에 대해서는 적용되지 않습니다.
							                    </li>
							                </ol>
							
							                <strong>제13조 (전자금융거래정보의 제공금지)</strong>
							                <ol>
							                    <li>회사는 전자지급결제대행서비스 및 결제대금예치서비스를 제공함에 있어서 취득한 이용자의 인적사항, 이용자의 계좌, 접근매체 및 전자금융거래의 내용과 실적에 관한 정보 또는
							                        자료를 이용자의 동의를 얻지 아니하고 제3자에게 제공,누설하거나 업무상 목적 외에 사용하지 아니합니다. 단, ‘금융실명 거래 및 비밀 보장에 관한 법률’ 제4조 제1항
							                        단서의 규정에 따른 경우 그 밖의 다른 법률에서 정하는 바에 따른 경우에는 그러하지 아니합니다.
							                    </li>
							                </ol>
							
							                <strong>제14조 (분쟁처리 및 분쟁조정)</strong>
							                <ol>
							                    <li>① 이용자는 다음의 분쟁처리 책임자 및 담당자에 대하여 전자지급결제대행 서비스 및 결제대금예치서비스 이용과 관련한 의견 및 불만의 제기, 손해배상의 청구 등의
							                        분쟁처리를 요구할 수 있습니다.
							                    </li>
							                    <li>담당자 : 토스페이먼츠 RM(리스크)팀</li>
							                    <li>연락처 : 전화번호 1544-7772, 팩스 02-6919-2354</li>
							                    <li>이메일 : rm@tosspayments.com</li>
							                    <li>② 이용자가 회사에 대하여 분쟁처리를 신청한 경우에는 회사는 15일 이내에 이에 대한 조사 또는 처리 결과를 이용자에게 안내합니다.</li>
							                    <li>③ 이용자는 '금융위원회의 설치 등에 관한 법률' 제51조의 규정에 따른 금융감독원의 금융분쟁조정위원회나 '소비자기본법' 제35조 제1항의 규정에 따른 소비자원에
							                        회사의 전자지급결제대행서비스 및 결제대금예치서비스의 이용과 관련한 분쟁조정을 신청할 수 있습니다.
							                    </li>
							                </ol>
							
							                <strong>제15조 (회사의 안정성 확보 의무)</strong>
							                <ol>
							                    <li>회사는 전자금융거래의 안전성과 신뢰성을 확보할 수 있도록 전자금융거래의 종류별로 전자적 전송이나 처리를 위한 인력, 시설, 전자적 장치 등의 정보기술부문 및
							                        전자금융업무에 관하여 금융위원회가 정하는 기준을 준수합니다.
							                    </li>
							                </ol>
							
							                <strong>제16조 (이용시간)</strong>
							                <ol>
							                    <li>① 회사는 이용자에게 연중무휴 1일 24시간 전자금융거래 서비스를 제공함을 원칙으로 합니다. 단, 금융기관 기타 결제수단 발행업자의 사정에 따라 변경될 수
							                        있습니다.
							                    </li>
							                    <li>② 회사는 정보통신설비의 보수, 점검 기타 기술상의 필요나 금융기관 기타 결제수단 발행업자의 사정에 의하여 서비스 중단이 불가피한 경우, 서비스 중단 3일 전까지
							                        게시가능한 전자적 수단을 통하여 서비스 중단 사실을 게시한 후 서비스를 일시 중단할 수 있습니다. 다만, 시스템 장애보국, 긴급한 프로그램 보수, 외부요인 등
							                        불가피한 경우에는 사전 게시없이 서비스를 중단할 수 있습니다.
							                    </li>
							                </ol>
							
							                <strong>제17조 (약관외 준칙 및 관할)</strong>
							                <ol>
							                    <li>① 이 약관에서 정하지 아니한 사항에 대하여는 전자금융거래법, 전자상거래 등에서의 소비자 보호에 관한 법률, 통신판매에 관한 법률, 여신전문금융업법 등 소비자보호
							                        관련 법령에서 정한 바에 따릅니다.
							                    </li>
							                    <li>② 회사와 이용자간에 발생한 분쟁에 관한 관할은 민사소송법에서 정한 바에 따릅니다.</li>
							                </ol>
							                <br><br><br>
							                <strong>[엔에이치엔한국사이버결제]</strong><br>
							                <strong>전자금융거래 기본약관</strong><br>
							
							                <strong>제1조 (목적)</strong>
							                <ol>
							                    <li>이 약관은 엔에이치엔한국사이버결제 주식회사(이하 '회사'라 합니다)가 제공하는 전자지급결제대행서비스 및 결제대금예치서비스를 이용자가 이용함에 있어 회사와 이용자 사이의
							                        전자금융거래에 관한 기본적인 사항을 정함을 목적으로 합니다.
							                    </li>
							                </ol>
							
							                <strong>제2조 (용어의 정의)</strong>
							                <ol>
							                    <li>이 약관에서 정하는 용어의 정의는 다음과 같습니다.</li>
							                    <li>1. '전자금융거래'라 함은 회사가 전자적 장치를 통하여 전자지급결제대행서비스 및 결제대금예치서비스(이하 '전자금융거래 서비스'라고 합니다)를 제공하고, 이용자가 회사의
							                        종사자와 직접 대면하거나 의사소통을 하지 아니하고 자동화된 방식으로 이를 이용하는 거래를 말합니다.
							                    </li>
							                    <li>2. '전자지급결제대행서비스'라 함은 전자적 방법으로 재화의 구입 또는 용역의 이용에 있어서 지급결제정보를 송신하거나 수신하는 것 또는 그 대가의 정산을 대행하거나 매개하는
							                        서비스를 말합니다.
							                    </li>
							                    <li>3. '결제대금예치서비스'라 함은 이용자가 재화의 구입 또는 용역의 이용에 있어서 그 대가(이하 '결제대금'이라 한다)의 전부 또는 일부를 재화 또는 용역(이하 '재화
							                        등'이라 합니다)을 공급받기 전에 미리 지급하는 경우, 회사가 이용자의 물품수령 또는 서비스 이용 확인 시점까지 결제대금을 예치하는 서비스를 말합니다.
							                    </li>
							                    <li>4. ‘가맹점’이라 함은 금융기관 또는 전자금융업자와의 계약에 따라 직불전자지급수단이나 선불전자지급수단 또는 전자화폐에 의한 거래에 있어서 이용자에게 재화 또는 용역을
							                        제공하는 자로서 금융기관 또는 전자금융업자가 아닌 자를 말합니다.
							                    </li>
							                    <li>5. '이용자'라 함은 이 약관에 동의하고 회사가 제공하는 전자금융거래 서비스를 이용하는 자를 말합니다.</li>
							                    <li>6. '접근매체'라 함은 전자금융거래에 있어서 거래지시를 하거나 이용자 및 거래내용의 진실성과 정확성을 확보하기 위하여 사용되는 수단 또는 정보로서 전자식 카드 및 이에
							                        준하는 전자적 정보(신용카드번호를 포함한다), '전자서명법'상의 인증서, 회사에 등록된 이용자번호, 이용자의 생체정보, 이상의 수단이나 정보를 사용하는데 필요한 비밀번호 등
							                        전자금융거래법 제2조 제10호에서 정하고 있는 것을 말합니다.
							                    </li>
							                    <li>7. '거래지시'라 함은 이용자가 본 약관에 의하여 체결되는 전자금융거래계약에 따라 회사에 대하여 전자금융거래의 처리를 지시하는 것을 말합니다.</li>
							                    <li>8. '거래지시'라 함은 이용자가 본 약관에 의하여 체결되는 전자금융거래계약에 따라 회사에 대하여 전자금융거래의 처리를 지시하는 것을 말합니다.</li>
							                </ol>
							
							                <strong>제3조 (약관의 명시 및 변경)</strong>
							                <ol>
							                    <li>① 회사는 이용자가 전자금융거래 서비스를 이용하기 전에 이 약관을 게시하고 이용자가 이 약관의 중요한 내용을 확인할 수 있도록 합니다.</li>
							                    <li>② 회사는 이용자의 요청이 있는 경우 전자문서의 전송방식에 의하여 본 약관의 사본을 이용자에게 교부합니다.</li>
							                    <li>③ 회사가 약관을 변경하는 때에는 그 시행일 1월 전에 변경되는 약관을 회사가 제공하는 전자금융거래 서비스 이용 초기화면 및 회사의 홈페이지에 게시함으로써 이용자에게
							                        공지합니다. 다만, 법령의 개정으로 인하여 긴급하게 약관을 변경하는 경우에는 즉시 공지합니다.
							                    </li>
							                    <li>④ 이용자가 변경된 약관사항에 동의하지 않는 경우에는 서비스의 이용이 불가하며 이용자는 이용 계약을 해지할 수 있습니다.</li>
							                </ol>
							
							                <strong>제4조 (전자지급결제대행서비스의 종류)</strong>
							                <ol>
							                    <li>회사가 제공하는 전자지급결제대행서비스는 지급결제수단에 따라 다음과 같이 구별됩니다.</li>
							                    <li>1. 신용카드결제대행서비스: 이용자가 결제대금의 지급을 위하여 제공한 지급결제수단이 신용카드인 경우로서, 회사가 전자결제시스템을 통하여 신용카드 지불정보를 송,수신하고
							                        결제대금의 정산을 대행하거나 매개하는 서비스를 말합니다.
							                    </li>
							                    <li>2. 계좌이체대행서비스: 이용자가 결제대금을 회사의 전자결제시스템을 통하여 금융기관에 등록한 자신의 계좌에서 출금하여 원하는 계좌로 이체할 수 있는 실시간 송금 서비스를
							                        말합니다.
							                    </li>
							                    <li>3. 가상계좌서비스: 이용자가 결제대금을 현금으로 결제하고자 경우 회사의 전자결제시스템을 통하여 자동으로 이용자만의 고유한 일회용 계좌의 발급을 통하여 결제대금의 지급이
							                        이루어지는 서비스를 말합니다.
							                    </li>
							                    <li>4. 기타: 회사가 제공하는 서비스로서 지급결제수단의 종류에 따라 '휴대폰 결제대행서비스', 'ARS결제대행서비스', '상품권결제대행서비스', '교통카드결제대행서비스' 등이
							                        있습니다.
							                    </li>
							                </ol>
							
							                <strong>제5조 (결제대금예치서비스의 내용)</strong>
							                <ol>
							                    <li>① 이용자(이용자의 동의가 있는 경우에는 재화 등을 공급받을 자를 포함합니다. 이하 본조에서 같습니다)는 재화 등을 공급받은 사실을 재화 등을 공급받은 날부터 3영업일
							                        이내에 회사에 통보하여야 합니다.
							                    </li>
							                    <li>② 회사는 이용자로부터 재화 등을 공급받은 사실을 통보받은 후 회사와 통신판매업자간 사이에서 정한 기일 내에 통신판매업자에게 결제대금을 지급합니다.</li>
							                    <li>③ 회사는 이용자가 재화 등을 공급받은 날부터 3영업일이 지나도록 정당한 사유의 제시없이 그 공급받은 사실을 회사에 통보하지 아니하는 경우에는 이용자의 동의없이
							                        통신판매업자에게 결제대금을 지급할 수 있습니다.
							                    </li>
							                    <li>④ 회사는 통신판매업자에게 결제대금을 지급하기 전에 이용자에게 결제대금을 환급받을 사유가 발생한 경우에는 그 결제대금을 소비자에게 환급합니다.</li>
							                    <li>⑤ 회사는 이용자와의 결제대금예치서비스 이용과 관련된 구체적인 권리,의무를 정하기 위하여 본 약관과는 별도로 결제대금예치서비스이용약관을 제정할 수 있습니다.</li>
							                </ol>
							
							                <strong>제6조 (이용시간)</strong>
							                <ol>
							                    <li>① 회사는 이용자에게 연중무휴 1일 24시간 전자금융거래 서비스를 제공함을 원칙으로 합니다. 단, 금융기관 기타 결제수단 발행업자의 사정에 따라 달리 정할 수 있습니다.
							                    </li>
							                    <li>② 회사는 정보통신설비의 보수, 점검 기타 기술상의 필요나 금융기관 기타 결제수단 발행업자의 사정에 의하여 서비스 중단이 불가피한 경우, 서비스 중단 3일 전까지 게시
							                        가능한 전자적 수단을 통하여 서비스 중단 사실을 게시한 후 서비스를 일시 중단할 수 있습니다. 다만, 시스템 장애복구, 긴급한 프로그램 보수, 외부요인 등 불가피한 경우에는
							                        사전 게시없이 서비스를 중단할 수 있습니다.
							                    </li>
							                </ol>
							
							                <strong>제7조 (접근매체의 선정과 사용 및 관리)</strong>
							                <ol>
							                    <li>① 회사는 전자금융거래 서비스 제공 시 접근매체를 선정하여 이용자의 신원, 권한 및 거래지시의 내용 등을 확인할 수 있습니다.</li>
							                    <li>② 이용자는 접근매체를 제3자에게 대여하거나 사용을 위임하거나 양도 또는 담보 목적으로 제공할 수 없습니다.</li>
							                    <li>③ 이용자는 자신의 접근매체를 제3자에게 누설 또는 노출하거나 방치하여서는 안되며, 접근매체의 도용이나 위조 또는 변조를 방지하기 위하여 충분한 주의를 기울여야 합니다.
							                    </li>
							                    <li>④ 회사는 이용자로부터 접근매체의 분실이나 도난 등의 통지를 받은 때에는 그 때부터 제3자가 그 접근매체를 사용함으로 인하여 이용자에게 발생한 손해를 배상할 책임이
							                        있습니다.
							                    </li>
							                </ol>
							
							                <strong>제8조 (거래내용의 확인)</strong>
							                <ol>
							                    <li>① 회사는 이용자와 미리 약정한 전자적 방법을 통하여 이용자의 거래내용(이용자의 '오류정정 요구사실 및 처리결과에 관한 사항'을 포함합니다)을 확인할 수 있도록 하며,
							                        이용자의 요청이 있는 경우에는 요청을 받은 날로부터 2주 이내에 모사전송 등의 방법으로 거래내용에 관한 서면을 교부합니다. 다만, 전자적 장치의 운영 장애, 그 밖의 사유로
							                        거래내용을 제공할 수 없는 때에는 즉시 이용자에게 전자문서 전송(전자우편을 이용한 전송을 포함합니다)의 방법으로 그러한 사유를 알려야 하며, 거래내용을 제공할 수 없는
							                        기간은 서면교부 기간에 산입하지 아니합니다.
							                    </li>
							                    <li>② 회사가 이용자에게 제공하는 거래내용 중 거래계좌의 명칭 또는 번호, 거래의 종류 및 금액, 거래상대방을 나타내는 정보, 거래일자, 전자적 장치의 종류 및 전자적 장치를
							                        식별할 수 있는 정보와 해당 전자금융거래와 관련한 전자적 장치의 접속기록 회사가 전자금융거래의 대가로 받은 수수료, 이용자의 출금 동의에 관한 사항, 전자금융거래의 신청 및
							                        조건의 변경에 관한 사항, 건당 거래금액이 1만원을 초과하는 전자금융거래에 관한 기록은 5년간, 건당 거래금액이 1만원 이하인 소액 전자금융거래에 관한 기록, 전자지급수단
							                        이용시 거래승인에 관한 기록, 이용자의 오류정정 요구사실 및 처리결과에 관한 사항은 1년간의 기간을 대상으로 보존하고, 회사가 전자지급결제대행 서비스 제공의 대가로 수취한
							                        수수료에 관한 사항을 제공합니다.
							                    </li>
							                    <li>③ 이용자가 제1항에서 정한 서면교부를 요청하고자 할 경우 다음의 주소 및 전화번호로 요청할 수 있습니다.</li>
							                    <li>주소: 서울시 구로구 디지털로26길 72(구로동, NHN한국사이버결제)</li>
							                    <li>이메일 주소: help@kcp.co.kr</li>
							                    <li>전화번호: 1544-8667</li>
							                </ol>
							
							                <strong>제9조 (오류의 정정 등)</strong>
							                <ol>
							                    <li>① 이용자는 전자금융거래 서비스를 이용함에 있어 오류가 있음을 안 때에는 회사에 대하여 그 정정을 요구할 수 있습니다.</li>
							                    <li>② 회사는 전항의 규정에 따른 오류의 정정요구를 받은 때 또는 스스로 오류가 있음을 안 때 에는 이를 즉시 조사하여 처리한 후 정정요구를 받은 날 또는 오류가 있음을 안
							                        날부터 2주 이내에 그 결과를 이용자에게 문서, 전화 또는 전자우편으로 알려 드립니다.
							                    </li>
							                </ol>
							
							                <strong>제10조 (가맹점의 준수사항 등)</strong>
							                <ol>
							                    <li>① 가맹점은 직불전자지급수단이나 선불전자지급수단 또는 전자화폐(이하 "전자화폐등"이라 한다)에 의한 거래를 이유로 재화 또는 용역의 제공 등을 거절하거나 이용자를 불리하게
							                        대우하여서는 아니 됩니다.
							                    </li>
							                    <li>② 가맹점은 이용자로 하여금 가맹점수수료를 부담하게 하여서는 아니 됩니다.</li>
							                    <li>③ 가맹점은 다음 각 호의 어느 하나에 해당하는 행위를 하여서는 아니 됩니다.</li>
							                    <li> 1. 재화 또는 용역의 제공 등이 없이 전자화폐등에 의한 거래를 한 것으로 가장(가장)하는 행위</li>
							                    <li> 2. 실제 매출금액을 초과하여 전자화폐등에 의한 거래를 하는 행위</li>
							                    <li> 3. 다른 가맹점 이름으로 전자화폐등에 의한 거래를 하는 행위</li>
							                    <li> 4. 가맹점의 이름을 타인에게 빌려주는 행위</li>
							                    <li> 5. 전자화폐등에 의한 거래를 대행하는 행위</li>
							                    <li>④가맹점이 아닌 자는 가맹점의 이름으로 전자화폐등에 의한 거래를 하여서는 아니 됩니다.</li>
							                </ol>
							
							                <strong>제11조 (가맹점 모집 등)</strong>
							                <ol>
							                    <li>① 회사는 가맹점을 모집하는 경우에는 가맹점이 되고자 하는 자의 영업여부 등을 확인하여야 합니다. 다만, 「여신전문금융업법」 제16조의2의 규정에 따라 이미 확인을 한
							                        가맹점인 경우에는 그러하지 아니합니다.
							                    </li>
							                    <li>② 회사는 다음 각 호의 사항을 금융위원회가 정하는 방법에 따라 가맹점에 알려야 합니다.</li>
							                    <li> 1. 가맹점수수료</li>
							                    <li> 2. 제2항의 규정에 따른 가맹점에 대한 책임</li>
							                    <li> 3. 전조 규정에 따른 가맹점의 준수사항</li>
							                    <li>③ 회사는 가맹점이 전조의 규정을 위반하여 형의 선고를 받거나 관계 행정기관으로부터 위반사실에 대하여 서면통보를 받는 등 대통령령이 정하는 사유에 해당하는 때에는 특별한
							                        사유가 없는 한 지체 없이 가맹점계약을 해지하여야 합니다. ‘대통령령이 정하는 사유’라 함은 다음 각 호의 어느 하나에 해당하는 경우를 말합니다.
							                    </li>
							                    <li> 1. 가맹점이 전자금융거래법 제 26조 또는 전조 제3항 제3호 내지 제5호를 위반하여 형을 선고받은 경우</li>
							                    <li> 2. 가맹점이 전조 제1항, 제2항 또는 제3항 제3호 내지 제5호를 위반한 사실에 관하여 관계 행정기관으로부터 서면통보가 있는 경우</li>
							                    <li> 3. 관계 행정기관으로부터 해당 가맹점의 폐업사실을 서면으로 통보 받은 경우</li>
							                </ol>
							
							                <strong>제12조 (회사의 책임)</strong>
							                <ol>
							                    <li>① 접근매체의 위조나 변조로 발생한 사고로 인하여 이용자에게 발생한 손해에 대하여 배상책임이 있습니다. 다만 이용자가 제7조 제2항에 위반하거나 제3자가 권한 없이 이용자의
							                        접근매체를 이용하여 전자금융거래를 할 수 있음을 알았거나 알 수 있었음에도 불구하고 이용자가 자신의 접근매체를 누설 또는 노출하거나 방치한 경우 그 책임의 전부 또는 일부를
							                        이용자가 부담하게 할 수 있습니다.
							                    </li>
							                    <li>② 회사는 계약체결 또는 거래지시의 전자적 전송이나 처리과정에서 발생한 사고로 인하여 이용자에게 그 손해가 발생한 경우에는 그 손해를 배상할 책임이 있습니다. 다만 본조
							                        제1항 단서에 해당하거나 법인('중소기업기본법' 제2조 제2항에 의한 소기업을 제외합니다)인 이용자에게 손해가 발생한 경우로서 회사가 사고를 방지하기 위하여 보안절차를
							                        수립하고 이를 철저히 준수하는 등 합리적으로 요구되는 충분한 주의의무를 다한 경우에는 그러하지 아니합니다.
							                    </li>
							                    <li>③ 회사는 이용자로부터의 거래지시가 있음에도 불구하고 천재지변, 회사의 귀책사유가 없는 정전, 화재, 통신장애 기타의 불가항력적인 사유로 처리 불가능하거나 지연된 경우로서
							                        이용자에게 처리 불가능 또는 지연사유를 통지한 경우(금융기관 또는 결제수단 발행업체나 통신판매업자가 통지한 경우를 포함합니다)에는 이용자에 대하여 이로 인한 책임을 지지
							                        아니합니다.
							                    </li>
							                    <li>④ 회사는 전자금융거래를 위한 전자적 장치 또는 ‘정보통신망 이용촉진 및 정보보호 등에 관한 법률’ 제 2조 제 1항 제 1호에 따른 정보통신망에 침입하여 거짓이나 그 밖의
							                        부정한 방법으로 획득한 접근매체의 이용으로 발생한 사고로 인하여 이용자에게 그 손해가 발생한 경우에는 그 손해를 배상할 책임이 있습니다. 다만, 다음과 같은 경우 회사는
							                        이용자에 대하여 일부 또는 전부에 대하여 책임을 지지 않습니다.
							                    </li>
							                    <li> 1. 회사가 접근매체에 따른 확인 외에 보안강화를 위하여 전자금융거래 시 요구하는 추가적인 보안조치를 이용자가 정당한 사유 없이 거부하여 전자금융거래법 제9조 제1항
							                        제3호에 따른(이하 ‘사고’라 한다)사고가 발생한 경우.
							                    </li>
							                    <li> 2. 이용자가 동항 제 1호의 추가적인 보안조치에서 사용되는 매체, 수단 또는 정보에 대하여 다음과 같은 행위를 하여 사고가 발생하는 경우</li>
							                    <li> 가. 누설, 누출 또는 방치한 행위</li>
							                    <li> 나. 제 3자에게 대여하거나 그 사용을 위임한 행위 또는 양도나 담보의 목적으로 제공한 행위</li>
							                </ol>
							
							                <strong>제13조 (전자지급거래계약의 효력)</strong>
							                <ol>
							                    <li>① 회사는 이용자의 거래지시가 전자지급거래에 관한 경우 그 지급절차를 대행하며, 전자지급거래에 관한 거래지시의 내용을 전송하여 지급이 이루어지도록 합니다.</li>
							                    <li>② 회사는 이용자의 전자지급거래에 관한 거래지시에 따라 지급거래가 이루어지지 않은 경우 수령한 자금을 이용자에게 반환하여야 합니다.</li>
							                </ol>
							
							                <strong>제14조 (거래지시의 철회)</strong>
							                <ol>
							                    <li>① 이용자는 전자지급거래에 관한 거래지시의 경우 지급의 효력이 발생하기 전까지 다음의 주소, 전자우편 및 연락처에 연락을 취함으로써 거래지시를 철회할 수 있습니다.</li>
							                    <li>주소: 서울시 구로구 디지털로26길 72(구로동, NHN한국사이버결제)</li>
							                    <li>이메일 주소: help@kcp.co.kr</li>
							                    <li>전화번호: 1544-8667</li>
							                    <li>② 전항의 지급의 효력이 발생 시점이란 (i) 전자자금이체의 경우에는 거래지시된 금액의 정보에 대하여 수취인의 계좌가 개설되어 있는 금융기관의 계좌 원장에 입금기록이 끝난
							                        때 (ii) 그 밖의 전자지급수단으로 지급하는 경우에는 거래지시된 금액의 정보가 수취인의 계좌가 개설되어 있는 금융기관의 전자적 장치에 입력이 끝난 때를 말합니다.
							                    </li>
							                    <li>③ 이용자는 지급의 효력이 발생한 경우에는 전자상거래 등에서의 소비자보호에 관한 법률 등 관련 법령상 청약의 철회의 방법 또는 본 약관 제5조에서 정한 바에 따라 결제대금을
							                        반환받을 수 있습니다.
							                    </li>
							                </ol>
							
							                <strong>제15조 (전자지급결제대행 서비스 이용 기록의 생성 및 보존)</strong>
							                <ol>
							                    <li>① 회사는 이용자가 전자금융거래의 내용을 추적, 검색하거나 그 내용에 오류가 발생한 경우에 이를 확인하거나 정정할 수 있는 기록을 생성하여 보존합니다.</li>
							                    <li>② 전항의 규정에 따라 회사가 보존하여야 하는 기록의 종류 및 보존방법은 제8조 제2항에서 정한 바에 따릅니다.</li>
							                </ol>
							
							                <strong>제16조 (전자금융거래정보의 제공금지)</strong>
							                <ol>
							                    <li>회사는 전자금융거래 서비스를 제공함에 있어서 취득한 이용자의 인적사항, 이용자의 계좌, 접근매체 및 전자금융거래의 내용과 실적에 관한 정보 또는 자료를 이용자의 동의를 얻지
							                        아니하고 제3자에게 제공, 누설하거나 업무상 목적 외에 사용하지 아니합니다. 단, 통신비밀보호법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률 등 관계법령에 의하여
							                        적법한 절차에 따르는 경우에는 그러하지 아니합니다.
							                    </li>
							                </ol>
							
							                <strong>제17조 (계약해지 및 이용제한)</strong>
							                <ol>
							                    <li>① 이용자는 서비스 홈페이지 또는 고객센터를 통하여 서비스 계약을 해지할 수 있습니다.</li>
							                    <li>② 회사는 이용자가 본 약관의 의무를 이행하지 않을 경우 사전 통지 없이 즉시 서비스 이용계약을 해지하거나 서비스 이용을 제한할 수 있습니다. 회사의 조치에 대하여 이의가
							                        있는 경우에는 서비스 홈페이지 또는 고객센터를 통하여 이의신청을 할 수 있습니다.
							                    </li>
							                    <li>③ 전 항의 이의가 정당하다고 판단되는 경우 회사는 서비스의 이용을 즉시 재개합니다.</li>
							                </ol>
							
							                <strong>제18조 (분쟁처리 및 분쟁조정)</strong>
							                <ol>
							                    <li>① 이용자는 다음의 분쟁처리 책임자 및 담당자에 대하여 전자금융거래 서비스 이용과 관련한 의견 및 불만의 제기, 손해배상의 청구 등의 분쟁처리를 요구할 수 있습니다.
							                    </li>
							                    <li>담당자: RM팀</li>
							                    <li>연락처(전화번호, 전자우편주소) : 070-5075-8041, minwon@kcp.co.kr</li>
							                    <li>② 이용자가 회사에 대하여 분쟁처리를 신청한 경우에는 회사는 15일 이내에 이에 대한 조사 또는 처리 결과를 이용자에게 안내합니다.</li>
							                    <li>③ 이용자는 '금융위원회의 설치 등에 관한 법률' 제51조의 규정에 따른 금융감독원의 금융분쟁조정위원회나 '소비자기본법' 제33조의 규정에 따른 한국소비자원에 회사의
							                        전자금융거래 서비스의 이용과 관련한 분쟁조정을 신청할 수 있습니다.
							                    </li>
							                </ol>
							
							                <strong>제19조 (회사의 안정성 확보 의무)</strong>
							                <ol>
							                    <li>회사는 전자금융거래가 안전하게 처리될 수 있도록 선량한 관리자로서의 주의를 다하며 전자금융거래의 안전성과 신뢰성을 확보할 수 있도록 전자금융거래의 종류별로 전자적 전송이나
							                        처리를 위한 인력, 시설, 전자적 장치 등의 정보기술부문 및 전자금융업무에 관하여 금융위원회가 정하는 기준을 준수합니다.
							                    </li>
							                </ol>
							
							                <strong>제20조 (약관 외 준칙 및 관할)</strong>
							                <ol>
							                    <li>① 회사와 이용자 사이에 개별적으로 합의한 사항이 이 약관에 정한 사항과 다를 때에는 그 합의사항을 이 약관에 우선하여 적용합니다.</li>
							                    <li>② 이 약관에서 정하지 아니한 사항에 대하여는 전자금융거래법, 전자상거래 등에서의 소비자 보호에 관한 법률, 통신판매에 관한 법률, 여신전문금융업법 등 소비자보호 관련
							                        법령에서 정한 바에 따릅니다.
							                    </li>
							                    <li>③ 회사와 이용자간에 발생한 분쟁에 관한 관할은 민사소송법에서 정한 바에 따릅니다.</li>
							                </ol>
							
							                <ol>
							                    <li>부칙 < 제 1 호, 2006.12.26. ></li>
							                    <li>본 약관은 2007년 1월 1일부터 시행한다</li>
							                    <br>
							                    <li>부칙 < 제 2 호, 2011.01.17. ></li>
							                    <li>본 약관은 2011년 02월 21일부터 시행한다.</li>
							                    <li>(제 2조 4항 신설, 제 8조 2항 일부 개정, 제 10조 신설, 제11조 신설)</li>
							                    <br>
							                    <li>부칙 < 제 3 호, 2015.10.14. ></li>
							                    <li>본 약관은 2015 10월 14일부터 시행한다</li>
							                    <li>(제 17조 제1항 일부 개정, 제 12조 제 5항 신설)</li>
							                    <br>
							                    <li>부칙 < 제 4 호, 2016.04.08. ></li>
							                    <li>본 약관은 2016년 4월 26일부터 시행한다</li>
							                    <li>(제 1조 일부 개정, 제 8조 제 3항 일부 개정)</li>
							                    <br>
							                    <li>부칙 < 제 5 호, 2016.11.11. ></li>
							                    <li>본 약관은 2016 11월 21일부터 시행한다</li>
							                    <li>(제 17조 신설, 제3조 제3항 및 제4항, 제9조 제2항, 제14조 제1항, 제16조, 제18조 제3항 일부 개정)</li>
							                    <br>
							                    <li>부칙 < 제 6 호, 2016.11.28. ></li>
							                    <li>본 약관은 2016 11월 28일부터 시행한다</li>
							                    <li>(제12조 제1항 삭제, 제6조 제2항, 제8조 제1항 및 제2항, 제9조 제2항, 제19조 개정, 제20조 제1항 신설)</li>
							                    <br>
							                    <br>
							                    <br>
							                    <li>부칙 < 제 7 호, 2018.01.19. ></li>
							                    <li>본 약관은 2018년 02월 22일부터 시행한다</li>
							                    <li>(제12조 제1항, 제2항 일부 개정)</li>
							                    <br>
							                    <li>부칙 < 제 8 호, 2018.07.23. ></li>
							                    <li>본 약관은 2018년 07월 31일부터 시행한다</li>
							                    <li>(제18조 제1항 일부 개정)</li>
							                    <br>
							                    <li>부칙 < 제 9 호, 2018.11.15. ></li>
							                    <li>본 약관은 2018년 12월 20일부터 시행한다</li>
							                    <li>(제8조 제3항, 제14조 제1항 개정)</li>
							                    <br>
							                    <li>부칙 < 제 10 호, 2019.05.21. ></li>
							                    <li>본 약관은 2019년5월 31일부터 시행한다</li>
							                    <li>(제8조 제3항, 제14조 제1항 개정)</li>
							                </ol>
							            </div>
							        </div>
							
							        <div class="order-agree__text" style="display:none">
							            <span class="font_basic">주문제작 상품 주문 후 취소 불가 동의</span>
							            <a href="javascript:void(0)" class="order-agree__more" onclick="showAgreeDetail(this); return false;" id="fourthAgree">자세히</a>
							            <div id="fourthAgreeDetail" class="order-agree__section" style="display:none;">
							                ■ 주문 상품 중 주문 후 상품의 제작에 들어가는 주문제작 상품의 경우 소비자의 주문에 의하여 개별 생산 되며<br/>
							                생산이 시작된 이 후 해당 재화를 타인에게 판매가 불가능 함으로 주문 후 취소, 주문 후 교환, 주문 후 환불이 불가능 합니다. <br/>
							                주문 시 해당 내용을 참고하여 신중한 구매 부탁 드립니다.<br/>
							                [관련 조항]<br/>
							                전자상거래 등에서 소비자보호에 관한 법률 시행령[시행 2015.1.1.] [대통령령 제25840호, 2014.12.0., 타법개정]<br/>
							                제 21조(청약철회등의 제한) 법 제 17조 2항제5호에서 “대통령령으로 정하는 경우＂란 소비자의 주문에 따라 개별적으로 생산되는 재화등 <br/>
							                또는 이와 유사한 재화등에 대하여 법 제 13조제2항제5호에 따른 청약 철회등(이하 :쳥약철회등＂이라한다.)을 인정하는 경우 <br/>
							                통신판매업자에게 회복할 수 없는 중대한 피해가 예상되는 경우로서 사전에 해당 거래에 대하여<br/>
							                별도로 그 사실을 고지하고 소비자의 서면(전자문서를 포함한다)에 의한 동의를 받은 경우를 말한다.<br/>
							            </div>
							        </div>
							    </div>
							</li>
							
							
							<script type="text/javascript">
							    function showAgreeDetail(obj) {
							        if (!obj || typeof obj.id === 'undefined') {
							            return ;
							        }
							
							        var id = obj.id;
							        var agreeBtnId = $("#"+id);
							        var agreeDetailId = $("#"+id+"Detail");
							
							        if (agreeDetailId.css('display') === 'none') {
							            agreeDetailId.show();
							            agreeBtnId.text("닫기");
							        } else {
							            agreeDetailId.hide();
							            agreeBtnId.text("자세히");
							        }
							    }
							</script>
							
							</ul>
						<!-- // 주문자 동의 -->
						</div>
					</div>
					<!--//결제 정보-->
					<!--//신용카드 -->
				</div>

				<!--cart button-->
				<div  id="card_btn"  class="btn_wrap order_form__payment-button-wrap" >
					<a id="btn_pay" href="javascript:void(0)"  onclick="Order.payment();" class="order_form__payment-button" ">
						<span id="btn-pay_amt" style="font-size:20px;">0</span>카드 결제하기&nbsp;
						<span class="btn_billing" style="display:none;"><span name="total_expected_billing_dc_amt"></span>원 <span class="card_discount_type">청구</span> 예상</span>
					</a>
				</div>
				<div  id="account_btn"  class="btn_wrap order_form__payment-button-wrap" style="display:none;" >
						
						<a id="btn_pay" href="javascript:void(0)"  onclick="Order.accountPayment();" class="order_form__payment-button" ">
							<span id="btn-pay_amt" style="font-size:20px;"><c:out value="${total}"/>원</span>&nbsp계좌이체로 결제하기&nbsp;
						</a>
				</div>
				<!--//cart button-->
			 </div>
			<!--// 컨텐츠 영역 -->
			</form>
			<!--right area  -->
	</div>

	</div>	
		<!-- 중앙정렬용 /div  -->
	<!--wrap  -->
</div> 
<!--결제 버튼 스크립트 -->
	<script>
		function Order.accountPayment(){
			$("#orderForm").submit();
			
		} 	
	</script>
<!--결제수단 여는 스크립트  -->
	<script type="text/javascript">
	function pay_info2_account(){
	      if($('#pay_info2_account').css('display') == 'none'){
	      $('#pay_info2_account').show();
	      $('#card_btn').hide();
	      $('#account_btn').show();
	
	    }
	  
	    }
	
	
	function pay_info2_card(){
	      if($('#pay_info2_account').css('display') != 'none'){
	      $('#pay_info2_account').hide();
	      $('#card_btn').show();
	      $('#account_btn').hide();
	   		$("#depositName").val("");
	    }
	  
	    }
		
	
	</script>





	

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>