 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<!-- 상단 콘텐츠 영역 -->








<!-- SW커스텀마이징 css --> 

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/order/base.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/order/common.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/order/font-awesome.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/order/gallery.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/order/guide.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/order/icon.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/order/image_search.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/order/jqModal.css" />
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
<script src="${pageContext.request.contextPath }/resources/js/jsOrder/ai.2.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jsOrder/base.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jsOrder/chunk-vendors.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jsOrder/clipboard.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jsOrder/common.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jsOrder/events.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jsOrder/get_botton_brand_ranking"></script>
<script src="${pageContext.request.contextPath }/resources/js/jsOrder/get_category_list_jsonp"></script>
<script src="${pageContext.request.contextPath }/resources/js/jsOrder/gtm.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jsOrder/hotjar-1491926.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jsOrder/image_search.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jsOrder/jqModal.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jsOrder/jquery-1.11.1.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jsOrder/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jsOrder/jquery.bxslider.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jsOrder/jquery.cycle.all.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jsOrder/jquery.easing.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jsOrder/jquery.lazyload.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jsOrder/jquery.url.packed.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jsOrder/js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jsOrder/jslib.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jsOrder/lnb.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jsOrder/md5.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jsOrder/mini_cart.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jsOrder/miya_validator.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jsOrder/mpay.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jsOrder/msspay.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jsOrder/order.js"></script>
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
	


	

	<!-- 오른쪽 콘텐츠 영역 -->
	<div class="right_area page_order_form" style="margin-right:300px; ">
		<!-- 컨텐츠 영역 -->
		<!--page nation -->
		<div class="pagenation">
			<!-- <div class="nav_sub"><a href="/">무신사 스토어</a><span class="icon_entity">&gt;</span><span>주문서</span></div> -->
			order/payment 이미지 삽입
		</div>
		<!--//page nation -->

		<form name="f1" id="f1" method="post"  onSubmit="return jsf__pay(this);">
            <input type="hidden" name="pay_kind" value="" />
			<input type="hidden" name="order_prd_amt" value="42800"/>
			<input type="hidden" name="kval" value="a7aef852029ddd8bba20bf60b536415b"/>
			<input type="hidden" name="order_dlv_fee" value=""/>
			<input type="hidden" name="order_coupon_amt" value=""/>
			<input type="hidden" name="order_prepoint_amt" value=""/>
			<input type="hidden" name="order_point_amt" value=""/>
			<input type="hidden" name="order_cart_dc_amt" value="" />
			<input type="hidden" name="order_group_dc_amt" value="" />
			<input type="hidden" name="order_dc_amt" value="" />
			<input type="hidden" name="order_pay_fee" value=""/>
			<input type="hidden" name="order_pay_amt" value=""/>
			<input type="hidden" name="guest" value="" />
			<input type="hidden" name="dlv_cnt" value="1"/>
			
			<!-- 총 상품 금액 -->
			<input type="hidden" name="total_prd_amt" id="total_prd_amt" value="42,800" />
			<!-- 총 상품 정상금액 -->
			<input type="hidden" name="total_normal_amt" value="69,000" />
			<input type="hidden" name="total_normal_add_opt_amt" value="69,000" />
			

			<input type="hidden" name="unpay_order_cnt" value="0"/>
			<input type="hidden" name="unpay_goods_cnt" value="0"/>
			<input type="hidden" name="cancel_order_cnt" value="0"/>
			<input type="hidden" name="cancel_order_dday" value=""/>
			<input type="hidden" name="cancel_goods_cnt" value="0"/>
			<input type="hidden" name="refund_goods_cnt" value="0"/>
			<input type="hidden" name="unpay_limited_goods_cnt" value="0"/>
			<input type="hidden" name="limited_goods_order_yn" value="Y"/>

			<input type="hidden" name="comm_tax_mny" value="" />
			<!-- 부가세 -->
			<input type="hidden" name="comm_vat_mny" value="" />
			<!-- 비과세 금액 -->
			<input type="hidden" name="comm_free_mny" value="" />

			<!-- BIZEST 결제수단 PAYMETHOD -->
			<input type="hidden" name="pg_pay_method" value=""/>

			<!-- 결제 서버 설정 값 -->
			<input type="hidden" name="pay_server" value="https://www.musinsa.com" />

			<input type="hidden" name="virtual_block_yn" value="N" />
			<input type="hidden" name="user_mail_authed_yn" value="N" />

			

			<!-- 환불 정보 -->
			<input type="hidden" name="refund_bank" value="국민은행"/>
			<input type="hidden" name="refund_account" value="93350200466085"/>
			<input type="hidden" name="refund_depositor" value="장선우"/>
			<input type="hidden" name="cert_state" value="Y"/>

			

            <input type="hidden" name="pay_type" value=""/>


			<!--article-title-->
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
			<!--//article-title-->


<!-- 회원 -->
<div class="section order__delivery">
    <!-- 주문자 정보 -->
    <input type="hidden" name="ordr_nm" value="장선우"/>
    <input type="hidden" name="email1" value="sunwoo8949"/>
    <input type="hidden" name="email_etc" value="naver.com"/>
    <input type="hidden" name="email2" value="naver.com"/>
    <input type="hidden" name="omobile1" value="010"/>
    <input type="hidden" name="omobile2" value="5640"/>
    <input type="hidden" name="omobile3" value="5610"/>
    <!-- // 주문자 정보 -->

    <!-- 배송지 정보 -->
    <div class="order__delivery__inner">
        <h3 class="order__title">배송 정보</h3>
        <input type="hidden" name="rcvr_nm" value="장선우" />
        <input type="hidden" name="rtitle" value="장선우님 배송지" />
        <input type="hidden" name="rzip_cd1" value="14215" />
        <input type="hidden" name="rzip_addr1" value="경기 광명시 연서일로17번길 17" />
        <input type="hidden" name="rzip_addr2" value="서동 에이스빌  101동 401호" />
        <input type="hidden" name="rmobile1" value="010" />
        <input type="hidden" name="rmobile2" value="5640" />
        <input type="hidden" name="rmobile3" value="5610" />
        <input type="hidden" name="rphone1" value="010" />
        <input type="hidden" name="rphone2" value="5640" />
        <input type="hidden" name="rphone3" value="5610" />
        <input type="hidden" name="dlv_msg" value="" />
        <input type="hidden" name="rselectedNo" value="8995361" />
        <ul class="order__list">
                        <li class="order__item delivery__item__info" >
                <span class="order__item__label">
                    배송지
                    <!-- 새벽배송 -->
                                    </span>
                <div class="order__item__area">
                    <ul class="order__delivery__radio-wrap" id="quickDeliveryList">
                                                <li>
                            <input type="radio" onclick="ChoiceQuickDeliveryAddress(8995361)" class="n-radio" id="delivery_choice_0" name="delivery_choice" value="장선우님 배송지" checked >
                            <label for="delivery_choice_0">장선우님 배송지</label>
                        </li>
                                            </ul>
                    <button type="button" class="order__button" onclick="">배송지 변경</button> 
                </div>
            </li>
            <li class="order__item delivery__item__info" >
                <span class="order__item__label">이름 / 연락처</span>
                <div class="order__item__area">
                    <ul class="order__delivery__user">
                        <li id="delivery-name">장선우</li>
                        <li id="delivery-mobile">010-5640-5610</li>
                        <li id="delivery-phone">010-5640-5610</li>
                    </ul>
                </div>
            </li>
            <li class="order__item delivery__item__info" >
                <span class="order__item__label">주소</span>
                <div class="order__item__area" id="delivery-addr">(14215) 경기 광명시 연서일로17번길 17 서동 에이스빌  101동 401호</div>
            </li>
         
         <!--배송지 변경 누를시 나타나는 변경  영역-->
         	<div  style="display: none;">
	         	<li class="order__item delivery__item__info" >
	                <span class="order__item__label">주소</span>
	                <div class="order__item__area" id="delivery-addr">(14215) 경기 광명시 연서일로17번길 17 서동 에이스빌  101동 401호</div>
	          	</li>   
         	</div>
         </ul>
    </div>
</div>
			

			<div class="section order_product_info">
				<h3 class="order__title">상품 정보</h3>
				<input type="hidden" id="discount_applied_yn" value="" />
				<input type="hidden" id="event_min_pay_amt" value="10000" />
				<!--cart products-->
				<table class="table_basic order_cart_table">
					<colgroup>
						<col>
						<col width="50px">
<!--						<col width="100px">-->
						<col width="80px">
																		<col width="80px">
						
												<col width="70px" class="charge ">
						<col width="69px" class="charge ">
												<col width="100px" class="charge ">
					</colgroup>
					<thead>
						<tr>
							<th scope="col">상품 정보</th>					
							<th scope="col">배송비</th>
							<th scope="col">주문금액</th>
						</tr>
					</thead>
					<!--리스트 데이터 표출 -->
					<tbody>
						<tr>
							<td class="td_product">
								<input type="hidden" class="input_hidden" name="no" value="780450657" />
								<input type="hidden" class="input_hidden" name="coupon_amt_780450657" value="0" />
								<input type="hidden" class="input_hidden" name="cart_info" value="2702396|0|스위트 메론 / L|42800|0|0|0|N|Y|780450657|Y" />
								<input tyep="hidden" class="input_hidden" id="goods_2702396_0_스위트 메론 / L" />
								<input type="hidden" class="input_hidden" name="goods_coupon_info" value="" />
								<input type="hidden" class="input_hidden" name="used_yn" value="N" />
								<input type="hidden" class="input_hidden" name="cart_goods_cnt[]" value="1" />
								<input type="hidden" class="input_hidden" name="normal_price" value="69000" />
								<input type="hidden" class="input_hidden" name="price" value="42800" />
								<input type="hidden" name="use_point_yn_780450657" value="Y">
								<input type="hidden" name="prepoint_yn_780450657" value="N">
								<input type="hidden" name="prepoint_780450657" value="0">
								<input type="hidden" class="input_hidden" name="exclusive_msspay" value="N" />
								<input type="hidden" class="input_hidden" name="exclusive_msspay_hyundaicard" value="N" />
                                <input type="hidden" class="input_hidden" id="group_dc_limit_yn_780450657" value="Y" />
								<input type="hidden" name="plcc_dc_yn_780450657" value="Y" />
								<input type="hidden" name="limit_coupon_amt_yn_780450657" value="N" />
								<input type="hidden" name="goods_form_type" value="DELIVERY_PRODUCT" />
								<div class="connect_img">
									<a href="/app/goods/2702396/0" target="_blank">
										<!--제품 이미지 삽입  -->
										<img src="//image.msscdn.net/images/goods_img/20220807/2702396/2702396_16734042163511_62.jpg" alt="키뮤어(KIIMUIR) 코튼 워셔블 하찌 하프집업 니트_5 COLOR" />
									</a>
								</div>
								<div class="article_info connect_info">
																																				<div class="box_product">
										<strong>
											<span style="color:#09f;">
																																																											</span>
											<span style="color:#f00;">
																																				※적립금 사용제한											</span>
																																												[키뮤어]
										</strong>
										<span class="list_info">
											<a href="/app/goods/2702396/0" target="_blank">
																								코튼 워셔블 하찌 하프집업 니트_5 COLOR
											</a>
										</span>
									</div>
																		<div class="order_option_box">
										<p>
											<!-- 20160127 --옵션 없음<!-- //20160127 -->
																								옵션 : 스위트 메론 / L																																</p>

																				<p class="font_basic">
											*
											적립금선할인 미적용											 / 쿠폰 사용 불가											 / 회원 할인 제외										</p>
																			</div>
								</div>
							</td>
							<td><strong>1 개</strong></td>
														<td>
								642 원
							</td>
							<td>
																- 26,200 원
															</td>

																				<td rowspan="1">
								<!--7722
								<br>-->
								그룹1
								<!--
																-->
							</td>
							
														<td rowspan="1">
																	무료
																<!--
								무료
																								<br>
								반송비<br>2,500 원
								-->
								<br>
								<a href="javascript:void(0)" onclick="layerView(this, 'order_delivery_pop_1'); return false;"><span class="txt_return">반송비<br />확인</span></a>
								<!--반송비 정보-->
								<div id="order_delivery_pop_1" class="popup_info order_delivery_pop">
									<span class="txt_title">반송비 정보</span><a href="javascript:void(0)" onclick="layerHidden('order_delivery_pop_1'); return false;"><span class="btn_close_pop">닫기</span></a>
									<ul class="box_return_chage">
										<li class="popup_info_title">반송비용</li>
										<li class="popup_info_detail">5,000 원 (지정 택배 이용 시)</li>
									</ul>
									<p class="popup_txt font_basic">- 위 반송비용은 판매사 지정택배 착불 반송 기준이며 선불로 반송하실 경우 50% 금액만 동봉하시면 됩니다.</p>
									<p class="popup_txt font_basic">- 해외배송상품 및 도서 산간 지역의 경우 추가 반송 비용이 발생할 수 있습니다.</p>
								</div>
								<!--//반송비 정보-->
							</td>
							
						                            <td class="price">
								
                                                                <del class="box_origin_price">69,000 원</del>
                                                                <strong>42,800 원</strong>
                            </td>
<!--							<td>-->
<!--								<strong>42,800 원</strong>-->
<!--							</td>-->
						</tr>
																							</tbody>
				</table>

				
			</div>

			<div class="section right_contents section_gift">
				<!--빈영역  -->
			</div>
												
			            				<div class="section order_hyundaicard">
    <div class="order_coupon_discount-box order_hyundaicard-box">
        <h3 class="order__title">무신사 현대카드 혜택</h3>
        <div class="cell_order_form">
            <ul class="cart_discount_method search_plcc_info_area" style="display:none;">
                <li class="cart_method">일시적으로 정보조회에 실패했습니다.</li>
                <li class="cart_discount">
                    <button type="button" id="searchPLCCInfo">다시 조회</button>
                </li>
            </ul>
            <ul class="cart_discount_method first_card_discount_area" style="display:none;">
                <li class="cart_method" name="first_cart_discount_name">무신사 현대카드 즉시할인</li>
                <input type="hidden" id="clicked_yn_first_dc_amt_btn" value="N"/>
                <li class="cart_discount">
                    <span class="hyundaicard-firstpayment" id="span_plccDiscountAmount">0원</span>
                    <span class="plcc-discount-limited txt-info" style="display:none; font-weight: normal; color: red;">제한(한도초과)</span>
                    <button type="button" id="hyundaicardFirstPayment"></button>
                </li>
            </ul>
            <ul class="cart_discount_method card_discount_area" style="display:none;">
                <li class="cart_method card_percent_discount_type">5% 청구할인</li>
                <li class="cart_discount card_underperform">
                    <span class="hyundaicard-under">전월 실적 미달</span>
                </li>
                <li class="cart_discount card_perform">
                    <span name="card_dc_amt">0</span>원&nbsp;<span class="txt_level">(잔여한도 <span id="possible_card_dc_amt">0</span>원)</span>
                </li>
                <input type="hidden" name="card_underperform_yn" readonly value=""/>
                <input type="hidden" name="card_type" readonly value=""/>
            </ul>
            <ul class="cart_discount_method hyundaicard-not" style="display:none;">
                <li class="cart_method card_percent_discount_type">5% 청구할인</li>
                <li class="cart_discount">
                    <em class="txt-info">카드 발급 후 적용</em>
                </li>
            </ul>
                    </div>
    </div>
    <div class="cell_order_form">
        <ul class="list_section_type">
            <li class="first_card_discount_txt" style="display:none;">&middot; 무신사 현대카드로 결제 시 제공되는 혜택입니다.</li>
            <li class="first_card_discount_txt" style="display:none;">&middot; 현대카드 즉시 할인은 무신사페이 결제 시 즉시 적용되며, 본인회원에 한해 1회 제공됩니다.(동일 이벤트 기 적용 회원은 제외)</li>
            <li class="first_card_discount_txt" style="display:none;">&middot; 현대카드 즉시 할인은 즉시할인 적용된 상품 전체 취소 시 다시 사용할 수 있습니다. 단, 부분 취소시 사용된 것으로 간주됩니다.</li>
            <li>&middot; 청구할인/캐시백은 전월 실적 30만원 이상 시, 월 최대 3만원 한도로 할인 가능합니다. (단, 신규 발급월 기준 다음 달 이용 건까지는 전월 실적 30만원 미만도 혜택 적용)</li>
            <li>&middot; 매출전표 접수 기준으로 반영되어 실제 할인금액과 상이할 수 있습니다.</li>
        </ul>
    </div>
</div>            			
			<div class="section order_coupon_discount">
				<h3 class="order__title">쿠폰/할인/적립금</h3>
				<div class="cell_order_form">
					<!--회원할인-->
					<!--할인상세-->
					<div class="discount_contents">
						<ul>
							<li class="cell_discount_tit">상품 금액</li>
							<li class="cell_discount_detail">
								<strong class="">69,000 원</strong>
							</li>
						</ul>
																		<ul>
							<li class="cell_discount_tit">상품 할인</li>
							<li class="cell_discount_detail txt_point">
								<em class="txt_point">- 26,200 원</em>
							</li>
						</ul>
												<ul>
							<li class="cell_discount_tit">등급 할인</li>
							<li class="cell_discount_detail">
								<strong>- 0 원</strong>
																<span>(LV.3 멤버등급)</span>
															</li>
						</ul>
												<ul>
							<li class="cell_discount_tit">쿠폰 할인</li>
							<li class="cell_discount_detail2">
																										<a class="plain-btn btn" onClick="Order.viewCouponPop(); return false;">쿠폰 조회/적용</a>
									<span class="coupon-limited txt-info" style="margin-top:7px;display:none;">제한(한도제한)</span>
									<span class="font_basic txt_desc_btn">(쿠폰 허용 상품 / 일부 쿠폰 제외)</span>
																								</li>
						</ul>
						<ul>
							<li class="cell_discount_tit">적립금 선할인</li>
														<li class="cell_discount_detail">
								<label for="prepointUse" style="font-size:0">적립금 선할인 받기 선택</label>
								<input type="checkbox" id="prepointUse" onclick="Order.CheckPayPrepoint('0'); Order.CalculateAmt(); CheckPrepoint('0','642');Order.isDiscountAmtExceedsPriceByProduct();" disabled/>
																<strong class="prepoint-not-limited" id="prepoint_chk">0 원 할인 / 642 원 적립</strong>
								<span class="prepoint-not-limited">(적립금 선할인 가능 금액은 0원입니다.)</span>
<!--								<span class="prepoint-limited txt-info" style="color: #14aaff;display:none;">제한(한도초과)</span>-->
															</li>
							<li class="cell_discount_detail prepoint-limited" style="display:none;">
								<span style="color: red; ">제한(한도초과)</span>
							</li>
													</ul>
						<ul>
							<li class="cell_discount_tit">적립금 사용</li>
							<li class="cell_discount_detail2">
																																																		<span class="txt-black">사용제한</span>
												<input type="hidden" name="point" readonly value="0" />
																																													</li>
							<li class="cell_discount_detail2 use-point-limited" style="display:none;">
								<span style="color: red;">제한(한도초과)</span>
							</li>
						</ul>
                        						<ul class="first_card_discount_area" style="display:none;">
							<li class="cell_discount_tit">무신사 현대카드 즉시할인</li>
							<li class="cell_discount_detail">
								<strong class="cart_dc_amt">0</strong>
								<strong>원</strong>
							</li>
						</ul>
                        					</div>
					<!--//할인상세-->
					<!--할인금액-->
					<div class="cell_order_form2 cell_order_price">
						<ul class="list_discount_order">
							<!-- 배송비 -->
							<li class="right_cell_order">상품 금액</li>
							<li class="right_cell_price"><strong>69,000</strong> 원</li>
						</ul>
						<ul class="list_discount_order alliancediscount_order hidden">
						<li class="right_cell_order hidden">제휴 할인</li>
						<li class="right_cell_price hidden">
						- <span id="ptn_dc_amt">0</span> 원
						</li>
						</ul>
												<ul class="list_discount_order">
							<!-- 상품 세일 -->
							<li class="right_cell_order">상품 할인</li>
							<li class="right_cell_price">
								<em class="txt_point">- 26,200 원</em>
							</li>
						</ul>
												<ul class="list_discount_order">
							<!-- 배송비 -->
							<strong id="dlv_amt" class="f18b hidden" >0</strong>
							<li class="right_cell_order">등급 할인</li>
							<li class="right_cell_price">
								- <strong id="dc_price">0</strong> 원</li>
						</ul>
												<input type="hidden" name="group_dc_amt" readonly value="0" />
						<ul class="list_discount_order">
							<li class="right_cell_order">쿠폰 할인</li>
							<li class="right_cell_price">
								<input type="hidden" name="kcoupon" readonly value="0"/>
								- <strong id="coupon_price">0</strong> 원
							</li>
						</ul>
						<ul class="list_discount_order">
							<li class="right_cell_order">적립금 선할인</li>
							<li class="right_cell_price">
								<input type="hidden" name="prepoint" readonly value="0"/>
								- <strong id="prepoint_price">0</strong> 원
							</li>
						</ul>
						<ul class="list_discount_order">
							<li class="right_cell_order" id="have_point_li1">적립금 사용</li>
							<li class="right_cell_price" id="have_point_li2">
								- <strong id="point_price">0</strong> 원
							</li>
						</ul>
						<ul class="list_discount_order first_card_discount_area" style="display:none;">
							<li class="right_cell_order">현대카드 즉시할인</li>
							<li class="right_cell_price">
								- <strong class="cart_dc_amt">0</strong> 원
								<input type="hidden" name="cart_dc_amt" readonly value="0" />
							</li>
						</ul>
						<ul class="list_discount_order">
							<li class="right_cell_sum">할인 합계</li>
							<li class="right_cell_result">
								- <strong id="total_pay_dc_amt">0</strong> 원
								<span class="payment_off_grey" id="total_dc_rate">0</span>
								<span class="txt_unit_discount">%</span>
							</li>
						</ul>
					</div>
					<!--//할인금액-->
					<!--//회원할인-->
				</div>
				<div class="cell_order_form">
					<div>
						<ul class="list_section_type" style="margin-top:-50px">
							<li>&middot; 현재 무신사 바로접속 <div class="icon_on">ON</div> 상태입니다. </li>
							<li>&middot; 적립금 사용 시 총 상품 금액의 7% 이내로 제한됩니다. 일부 상품은 적립금 사용이 불가합니다. <a href="/app/cs/faq/005/005000" target="_blank">[적립금 관련 FAQ↗]</a></li>
						</ul>
					</div>

					<div class="cell_order_price total_price_wrap">
						<ul class="list_discount_order">
							<li class="right_cell_order">결제 수수료</li>
							<li class="right_cell_price">
								<strong id="pay_fee">0</strong> 원</p>
							</li>
						</ul>
						<ul class="box_total_price">
							<li class="total_title">최종 결제 금액</li>
							<li class="total_price">
								<strong id="pay_amt">42,800</strong> 원
							</li>
							<li class="total_title total_msspay_area" style="display:none">무신사페이 결제금액</li>
							<li class="total_price total_price--billing total_msspay_area" style="display:none">
								<strong name="total_msspay_amt">0</strong> 원
							</li>
							<li class="total_title total_card_discount_area" style="display:none"><span class="card_discount_type">청구</span> 예상 금액</li>
							<li class="total_price total_price--billing total_card_discount_area" style="display:none">
								<strong name="total_expected_billing_dc_amt">0</strong> 원
							</li>
							<li class="total_title">총 적립금</li>
							<li class="total_price">
								<span id="total_point_amt">642</span> 원
							</li>
						</ul>
					</div>
				</div>
				<!--//할인-->
			</div>

			<div class="right_contents section_payment">
				<h3 class="order__title">결제 정보</h3>
				<div>
					<!--신용카드 -->
					<div class="cell_order_form">
						<div class="clear cell_order_form1 border_add_order" id="payment_info_area">

                        							<!--결제 정보-->
							<ul id="__payment-choice-view" class="list_payment_order">
								<li class="cell_discount_tit new-payment-area">결제 수단</li>
								<li class="cell_discount_detail new-payment-area">
									<ul class="payment-choice">
										<li>
											<input type="radio" class="n-radio" id="payment_btn0" name="payment_choice" value="msspay" >
											
																						<p id="msspay_tooltip" class="n-tooltip tooltip-musinsa tooltip-close tool-right __msspay-user-view __msspay-ok-user-view" style="display:none">무신사페이로 빠르게 결제하세요!
												<button id="__msspay-tooltip-close-button" type="button" class="btn-tooltip-close"><i class="ic-14-line-close">툴팁 닫기</i></button>
											</p>
										</li>
										                                            										<li>
											<input type="radio" class="n-radio" id="payment_btn1" name="payment_choice" value="pg" checked>
											<label for="payment_btn1">일반결제</label>
											<strong class="payment-tit-comment" style="display:none;">무신사 현대카드 즉시 할인 사용이 불가능한 결제수단입니다.</strong>
										</li>
                                            																			</ul>
								</li>
							</ul>

														<div class="__payment-view __msspay-user-view __msspay-failed-user-view" style="display:none">
								<ul class="list_payment_order">
									<li class="cell_discount_tit new-payment-area">결제 안내</li>
									<li class="cell_discount_detail new-payment-area">
										<div class="add-easypayment add-easypayment--button __msspay-reload-button">
											<svg width="123" height="35" viewBox="0 0 123 35" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M109 9.16699V27.8337M118.334 18.5003H99.667" stroke="#333333" stroke-width="2" class="svg-stroke"/>
<path fill-rule="evenodd" clip-rule="evenodd" d="M17.4663 0C19.8415 0 22.0713 0.125474 24.1301 0.327949C24.7122 0.385174 25.4782 0.523772 26.1244 0.697372C27.5575 1.0822 28.8414 1.71675 29.9795 2.5704C30.4325 2.905 30.8601 3.27145 31.2585 3.6666V3.67482C31.6527 4.07417 32.0182 4.50257 32.352 4.9567C33.2036 6.09735 33.8367 7.38447 34.2206 8.82122C34.3938 9.4689 34.532 10.2368 34.5889 10.8202C34.7909 12.8838 34.9163 15.1191 34.9163 17.5C34.9163 19.8807 34.7909 22.116 34.5889 24.1796C34.532 24.7632 34.3938 25.5307 34.2206 26.1786C33.8367 27.6152 33.2036 28.9023 32.352 30.0431C32.0182 30.4971 31.6527 30.9255 31.2585 31.325V31.3332C30.8601 31.7282 30.4325 32.0947 29.9795 32.4292C28.8414 33.2829 27.5575 33.9174 26.1244 34.3024C25.4782 34.476 24.7122 34.6147 24.1301 34.6719C22.0713 34.8742 19.8415 35 17.4663 35H17.4499C15.0749 35 12.845 34.8742 10.7863 34.6719C10.2043 34.6147 9.43822 34.476 8.79227 34.3024C7.35896 33.9174 6.07491 33.2829 4.93699 32.4292C4.48395 32.0947 4.0564 31.7282 3.65801 31.3332V31.325C3.26398 30.9255 2.8984 30.4971 2.5646 30.0431C1.71299 28.9023 1.07979 27.6152 0.695886 26.1786C0.522701 25.5307 0.384428 24.7632 0.32734 24.1796C0.125524 22.116 0 19.8807 0 17.5C0 15.1191 0.125524 12.8838 0.32734 10.8202C0.384428 10.2368 0.522701 9.4689 0.695886 8.82122C1.07979 7.38447 1.71299 6.09735 2.5646 4.9567C2.8984 4.50257 3.26398 4.07417 3.65801 3.67482V3.6666C4.0564 3.27145 4.48395 2.905 4.93699 2.5704C6.07491 1.71675 7.35896 1.0822 8.79227 0.697372C9.43822 0.523772 10.2043 0.385174 10.7863 0.327949C12.845 0.125474 15.0749 0 17.4499 0H17.4663ZM78.3525 11.7067L82.8846 21.423L87.4773 11.7067H91L81.9109 30.9612H78.3882L81.166 25.0768L74.751 11.7067H78.3525ZM64.9078 11.4419C66.7171 11.4419 68.3846 12.1823 69.7206 13.3049V11.7066H72.8568V27.1133H69.7206V25.5908C68.3846 26.6807 66.7171 27.3782 64.9078 27.3782C60.5174 27.3782 56.9584 23.8107 56.9584 19.41C56.9584 15.0092 60.5174 11.4419 64.9078 11.4419ZM48.6715 7.85872C50.9105 7.85872 52.6059 8.56397 53.7893 9.7825C55.0048 10.9688 55.7085 12.6362 55.7085 14.56C55.7085 16.516 55.0048 18.1832 53.7893 19.4017C52.5737 20.6201 50.9105 21.3255 48.6715 21.3255H45.3139V27.1133H42.1778V7.85872H48.6715ZM11.9524 8.80583H8.30501V26.2041H11.7652V14.8367L16.062 21.8164H18.8305L23.1512 14.829V26.2041H26.6114V8.80583H22.9644L17.4479 17.7375L11.9524 8.80583ZM64.9561 14.4974C62.2248 14.4974 60.1062 16.6969 60.1062 19.41C60.1062 22.1232 62.2248 24.3226 64.9561 24.3226C67.6873 24.3226 69.8631 22.1232 69.8631 19.41C69.8631 16.6969 67.6873 14.4974 64.9561 14.4974ZM48.3834 10.937H45.3139V18.2474H48.3834C49.7909 18.2474 50.7949 17.8304 51.4346 17.2214C52.0744 16.58 52.4264 15.6501 52.4264 14.5922C52.4264 13.5019 52.0423 12.5722 51.4346 11.9308C50.7949 11.2896 49.759 10.937 48.3834 10.937Z" fill="#333333" class="svg-fill"/>
</svg>											<p class="text font-mss">
												일시적으로 정보조회를 실패했습니다.<br>
												새로고침 버튼을 눌러주세요.
											</p>
											<button type="button" class="button-refresh">새로고침</button>
										</div>
									</li>
								</ul>
							</div>
							
														<div class="__payment-view __msspay-user-view __msspay-unavailable-user-view" style="display:none">
								<ul class="list_payment_order">
									<li class="cell_discount_tit new-payment-area">결제 안내</li>
									<li class="cell_discount_detail new-payment-area">
										<div class="add-easypayment __msspay-reload-button">
											<svg width="123" height="35" viewBox="0 0 123 35" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M109 9.16699V27.8337M118.334 18.5003H99.667" stroke="#333333" stroke-width="2" class="svg-stroke"/>
<path fill-rule="evenodd" clip-rule="evenodd" d="M17.4663 0C19.8415 0 22.0713 0.125474 24.1301 0.327949C24.7122 0.385174 25.4782 0.523772 26.1244 0.697372C27.5575 1.0822 28.8414 1.71675 29.9795 2.5704C30.4325 2.905 30.8601 3.27145 31.2585 3.6666V3.67482C31.6527 4.07417 32.0182 4.50257 32.352 4.9567C33.2036 6.09735 33.8367 7.38447 34.2206 8.82122C34.3938 9.4689 34.532 10.2368 34.5889 10.8202C34.7909 12.8838 34.9163 15.1191 34.9163 17.5C34.9163 19.8807 34.7909 22.116 34.5889 24.1796C34.532 24.7632 34.3938 25.5307 34.2206 26.1786C33.8367 27.6152 33.2036 28.9023 32.352 30.0431C32.0182 30.4971 31.6527 30.9255 31.2585 31.325V31.3332C30.8601 31.7282 30.4325 32.0947 29.9795 32.4292C28.8414 33.2829 27.5575 33.9174 26.1244 34.3024C25.4782 34.476 24.7122 34.6147 24.1301 34.6719C22.0713 34.8742 19.8415 35 17.4663 35H17.4499C15.0749 35 12.845 34.8742 10.7863 34.6719C10.2043 34.6147 9.43822 34.476 8.79227 34.3024C7.35896 33.9174 6.07491 33.2829 4.93699 32.4292C4.48395 32.0947 4.0564 31.7282 3.65801 31.3332V31.325C3.26398 30.9255 2.8984 30.4971 2.5646 30.0431C1.71299 28.9023 1.07979 27.6152 0.695886 26.1786C0.522701 25.5307 0.384428 24.7632 0.32734 24.1796C0.125524 22.116 0 19.8807 0 17.5C0 15.1191 0.125524 12.8838 0.32734 10.8202C0.384428 10.2368 0.522701 9.4689 0.695886 8.82122C1.07979 7.38447 1.71299 6.09735 2.5646 4.9567C2.8984 4.50257 3.26398 4.07417 3.65801 3.67482V3.6666C4.0564 3.27145 4.48395 2.905 4.93699 2.5704C6.07491 1.71675 7.35896 1.0822 8.79227 0.697372C9.43822 0.523772 10.2043 0.385174 10.7863 0.327949C12.845 0.125474 15.0749 0 17.4499 0H17.4663ZM78.3525 11.7067L82.8846 21.423L87.4773 11.7067H91L81.9109 30.9612H78.3882L81.166 25.0768L74.751 11.7067H78.3525ZM64.9078 11.4419C66.7171 11.4419 68.3846 12.1823 69.7206 13.3049V11.7066H72.8568V27.1133H69.7206V25.5908C68.3846 26.6807 66.7171 27.3782 64.9078 27.3782C60.5174 27.3782 56.9584 23.8107 56.9584 19.41C56.9584 15.0092 60.5174 11.4419 64.9078 11.4419ZM48.6715 7.85872C50.9105 7.85872 52.6059 8.56397 53.7893 9.7825C55.0048 10.9688 55.7085 12.6362 55.7085 14.56C55.7085 16.516 55.0048 18.1832 53.7893 19.4017C52.5737 20.6201 50.9105 21.3255 48.6715 21.3255H45.3139V27.1133H42.1778V7.85872H48.6715ZM11.9524 8.80583H8.30501V26.2041H11.7652V14.8367L16.062 21.8164H18.8305L23.1512 14.829V26.2041H26.6114V8.80583H22.9644L17.4479 17.7375L11.9524 8.80583ZM64.9561 14.4974C62.2248 14.4974 60.1062 16.6969 60.1062 19.41C60.1062 22.1232 62.2248 24.3226 64.9561 24.3226C67.6873 24.3226 69.8631 22.1232 69.8631 19.41C69.8631 16.6969 67.6873 14.4974 64.9561 14.4974ZM48.3834 10.937H45.3139V18.2474H48.3834C49.7909 18.2474 50.7949 17.8304 51.4346 17.2214C52.0744 16.58 52.4264 15.6501 52.4264 14.5922C52.4264 13.5019 52.0423 12.5722 51.4346 11.9308C50.7949 11.2896 49.759 10.937 48.3834 10.937Z" fill="#333333" class="svg-fill"/>
</svg>											<p class="text font-mss">
												안정적인 서비스를 위해 점검 중입니다.<br>
												이용에 불편을 드려 죄송합니다.
											</p>
										</div>
									</li>
								</ul>
							</div>
							
														<div class="__payment-view __msspay-user-view __msspay-ok-user-view __msspay-unregistered-user-view" style="display:none">
								<ul class="list_payment_order">
									<li class="cell_discount_tit new-payment-area">결제 안내</li>
									<li class="cell_discount_detail new-payment-area">
										<div class="no-card-swiper-area">
											<div class="swiper-slide card-list card15">
												<a href="javascript:void(0)" class="add-easypayment __msspay-add-method-button">
													<svg width="123" height="35" viewBox="0 0 123 35" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M109 9.16699V27.8337M118.334 18.5003H99.667" stroke="#333333" stroke-width="2" class="svg-stroke"/>
<path fill-rule="evenodd" clip-rule="evenodd" d="M17.4663 0C19.8415 0 22.0713 0.125474 24.1301 0.327949C24.7122 0.385174 25.4782 0.523772 26.1244 0.697372C27.5575 1.0822 28.8414 1.71675 29.9795 2.5704C30.4325 2.905 30.8601 3.27145 31.2585 3.6666V3.67482C31.6527 4.07417 32.0182 4.50257 32.352 4.9567C33.2036 6.09735 33.8367 7.38447 34.2206 8.82122C34.3938 9.4689 34.532 10.2368 34.5889 10.8202C34.7909 12.8838 34.9163 15.1191 34.9163 17.5C34.9163 19.8807 34.7909 22.116 34.5889 24.1796C34.532 24.7632 34.3938 25.5307 34.2206 26.1786C33.8367 27.6152 33.2036 28.9023 32.352 30.0431C32.0182 30.4971 31.6527 30.9255 31.2585 31.325V31.3332C30.8601 31.7282 30.4325 32.0947 29.9795 32.4292C28.8414 33.2829 27.5575 33.9174 26.1244 34.3024C25.4782 34.476 24.7122 34.6147 24.1301 34.6719C22.0713 34.8742 19.8415 35 17.4663 35H17.4499C15.0749 35 12.845 34.8742 10.7863 34.6719C10.2043 34.6147 9.43822 34.476 8.79227 34.3024C7.35896 33.9174 6.07491 33.2829 4.93699 32.4292C4.48395 32.0947 4.0564 31.7282 3.65801 31.3332V31.325C3.26398 30.9255 2.8984 30.4971 2.5646 30.0431C1.71299 28.9023 1.07979 27.6152 0.695886 26.1786C0.522701 25.5307 0.384428 24.7632 0.32734 24.1796C0.125524 22.116 0 19.8807 0 17.5C0 15.1191 0.125524 12.8838 0.32734 10.8202C0.384428 10.2368 0.522701 9.4689 0.695886 8.82122C1.07979 7.38447 1.71299 6.09735 2.5646 4.9567C2.8984 4.50257 3.26398 4.07417 3.65801 3.67482V3.6666C4.0564 3.27145 4.48395 2.905 4.93699 2.5704C6.07491 1.71675 7.35896 1.0822 8.79227 0.697372C9.43822 0.523772 10.2043 0.385174 10.7863 0.327949C12.845 0.125474 15.0749 0 17.4499 0H17.4663ZM78.3525 11.7067L82.8846 21.423L87.4773 11.7067H91L81.9109 30.9612H78.3882L81.166 25.0768L74.751 11.7067H78.3525ZM64.9078 11.4419C66.7171 11.4419 68.3846 12.1823 69.7206 13.3049V11.7066H72.8568V27.1133H69.7206V25.5908C68.3846 26.6807 66.7171 27.3782 64.9078 27.3782C60.5174 27.3782 56.9584 23.8107 56.9584 19.41C56.9584 15.0092 60.5174 11.4419 64.9078 11.4419ZM48.6715 7.85872C50.9105 7.85872 52.6059 8.56397 53.7893 9.7825C55.0048 10.9688 55.7085 12.6362 55.7085 14.56C55.7085 16.516 55.0048 18.1832 53.7893 19.4017C52.5737 20.6201 50.9105 21.3255 48.6715 21.3255H45.3139V27.1133H42.1778V7.85872H48.6715ZM11.9524 8.80583H8.30501V26.2041H11.7652V14.8367L16.062 21.8164H18.8305L23.1512 14.829V26.2041H26.6114V8.80583H22.9644L17.4479 17.7375L11.9524 8.80583ZM64.9561 14.4974C62.2248 14.4974 60.1062 16.6969 60.1062 19.41C60.1062 22.1232 62.2248 24.3226 64.9561 24.3226C67.6873 24.3226 69.8631 22.1232 69.8631 19.41C69.8631 16.6969 67.6873 14.4974 64.9561 14.4974ZM48.3834 10.937H45.3139V18.2474H48.3834C49.7909 18.2474 50.7949 17.8304 51.4346 17.2214C52.0744 16.58 52.4264 15.6501 52.4264 14.5922C52.4264 13.5019 52.0423 12.5722 51.4346 11.9308C50.7949 11.2896 49.759 10.937 48.3834 10.937Z" fill="#333333" class="svg-fill"/>
</svg>													<p class="text font-mss">무신사페이를 추가하고 빠르게 결제하세요!</p>
												</a>
											</div>
										</div>
																				<div class="no-plcc-card-swiper-area">
											<div id="__msspay-issue-area" class="swiper-slide card-list card16 card16--nocard">
												<p class="logo"></p>
												<div class="text-wrap">
													<p class="text">
														<span class="issued_msspay_txt" style="display:none">무신사 현대카드를</br> 무신사페이에 등록하고 사용하세요!</span>
														<span class="first_card_discount_txt not_issued_msspay_txt"><span name="first_cart_discount_name">무신사 현대카드 즉시 할인</span> 이벤트 혜택과</span>
													</p>
													<p class="text not_issued_msspay_txt">5% 청구 할인 혜택을 받아보세요.</p>
												</div>
												<a class="get-card-button" href="/app/campaign/event/musinsa_hyundaicard/129?eventCode=MSS03">무신사 현대카드 혜택받기</a>
											</div>
										</div>
																				<div class="swiper-area" style="display:none">
											<div class="swiper-container" id="cardSwiper">
												<div class="swiper-wrapper" id="__msspay-available-methods">
												</div>
												<div class="swiper-button-next"><i class="ic-30-line-arrow-right"></i></div>
												<div class="swiper-button-prev"><i class="ic-30-line-arrow-left"></i></div>
											</div>
																																											</div>

										
									</li>
								</ul>
							</div>
							                        
														<div class="__payment-view __payment-pg-view" >
								<ul class="list_payment_order">
									<li class="cell_discount_tit new-payment-area">결제 안내</li>
									<li class="cell_discount_detail payment-area">
										<div class="payment-area-wrap">
																																	<input type="radio" id="btn-paykind-CARD" type="radio" name="kyejae" value="card" onclick="selectPayKind('CARD');">
												<label for="btn-paykind-CARD" class="box_choice">카드</label>
                                            
											
											
											
											
											<!--toss-->
											
											
											
											
																																
											                                                <input type="radio" id="btn-paykind-VTRANSFER" type="radio" name="kyejae" value="virtual" onclick="selectPayKind('VTRANSFER');">
                                                <label for="btn-paykind-VTRANSFER" class="box_choice">가상계좌</label>
                                            
											
											
											
											<!--toss-->
											
											
											
											
																																
											
																							<input type="radio" id="btn-paykind-TRANSFER" type="radio" name="kyejae" value="transfer" onclick="selectPayKind('TRANSFER');">
												<label for="btn-paykind-TRANSFER" class="box_choice">계좌이체</label>
                                            
											
											
											<!--toss-->
											
											
											
											
																																
											
											
											                                                <input type="radio" id="btn-paykind-PHONE" type="radio"  name="kyejae" value="mobile" onclick="selectPayKind('PHONE');">
                                                <label for="btn-paykind-PHONE" class="box_choice">휴대폰</label>
                                            
											
											<!--toss-->
											
											
											
											
																																
											
											
											
											
											<!--toss-->
																							<input type="radio" id="btn-paykind-TOSSPAY" type="radio" name="kyejae" value="toss" onclick="selectPayKind('TOSSPAY');">
												<label for="btn-paykind-TOSSPAY" class="box_choice">토스페이</label>
											
											
											
											
																																
											
											
											
											
											<!--toss-->
											
																							<input type="radio" id="btn-paykind-KAKAOPAY" type="radio" name="kyejae" value="kkopay" onclick="selectPayKind('KAKAOPAY');">
												<label for="btn-paykind-KAKAOPAY" class="box_choice">카카오페이</label>
											
											
											
																																
											
											
											
											
											<!--toss-->
											
											
																							<input type="radio" id="btn-paykind-NAVERPAY" type="radio" name="kyejae" value="naverpay" onclick="selectPayKind('NAVERPAY');">
												<label for="btn-paykind-NAVERPAY" class="box_choice">네이버페이</label>
											
											
																																
											
											
											
											
											<!--toss-->
											
											
											
											
																							<input type="radio" id="btn-paykind-PAYCO" type="radio" name="kyejae" value="payco" onclick="selectPayKind('PAYCO');">
												<label for="btn-paykind-PAYCO" class="box_choice">페이코</label>
																					
											<!-- 결제수수료율 설정값 출력 부분 //-->
                                                                                        <input type="hidden" id="pay-fee-rate-PHONE" value="5" />
                                            										</div>

										<div id="pay_info2" style="display:none">

										
											<!-- 카드 결제 안내 -->
																						<div id="box-payKind-info-CARD" class="box-payment-method box-payKind-info" style="display:none">
												<div class="box-select">
                                                    <select name="card_code" id="card_code">
                                                        <option value="">카드 선택</option>
                                                                                                                                                                                <option value="CCHN">하나카드</option>
                                                                                                                                                                                                                                            <option value="CCBC">BC카드</option>
                                                                                                                                                                                                                                            <option value="CCCJ">제주은행</option>
                                                                                                                                                                                                                                            <option value="CCCT">씨티카드</option>
                                                                                                                                                                                                                                            <option value="CC48">신협은행</option>
                                                                                                                                                                                                                                            <option value="CCDI">현대카드</option>
                                                                                                                                                                                                                                            <option value="CC401">KB증권</option>
                                                                                                                                                                                                                                            <option value="CCJB">전북은행</option>
                                                                                                                                                                                                                                            <option value="CC92">카카오뱅크</option>
                                                                                                                                                                                                                                            <option value="CC215">산업은행</option>
                                                                                                                                                                                                                                            <option value="CCKJ">광주은행</option>
                                                                                                                                                                                                                                            <option value="CC302">케이뱅크</option>
                                                                                                                                                                                                                                            <option value="CCKM">국민카드</option>
                                                                                                                                                                                                                                            <option value="CCLG">신한카드</option>
                                                                                                                                                                                                                                            <option value="CCLO">롯데카드</option>
                                                                                                                                                                                                                                            <option value="CC403">NH투자증권</option>
                                                                                                                                                                                                                                            <option value="CC207">우체국</option>
                                                                                                                                                                                                                                            <option value="CC33">우리카드</option>
                                                                                                                                                                                                                                            <option value="CC216">저축은행</option>
                                                                                                                                                                                                                                            <option value="CC204">새마을금고</option>
                                                                                                                                                                                                                                            <option value="CCSS">삼성카드</option>
                                                                                                                                                                                                                                            <option value="CCSU">수협은행</option>
                                                                                                                                                                                                                                            <option value="CCNH">농협카드</option>
                                                                                                                                                                        </select>
													<select id="card_quota" name="card_quota">
														<option value="1">일시불</option>
																												<option value="2">2개월</option>
																												<option value="3">3개월</option>
																												<option value="4">4개월</option>
																												<option value="5">5개월</option>
																												<option value="6">6개월</option>
																												<option value="7">7개월</option>
																												<option value="8">8개월</option>
																												<option value="9">9개월</option>
																												<option value="10">10개월</option>
																												<option value="11">11개월</option>
																												<option value="12">12개월</option>
																											</select>
													<button type="button" class="order-benefit-button" onclick="Order.showInterestBenefitInfo(); return false;">
														무이자/부분무이자 할부 혜택 안내<i class="ic-14-line-arrow-right"></i>
													</button>
												</div>
												<div class="order-notice">
													<p class="order-notice__title">
														안전결제(ISP)? (국민카드/BC카드/우리카드)
													</p>
													<p class="order-notice__contents">
														온라인 쇼핑 시 주민등록번호, 비밀번호 등의 주요 개인정보를 입력하지 않고 고객님이 사전에 미리 설정한 한전결제(ISP) 비밀번호만 입력, 결제하도록 하여 개인정보 유출 및 카드 도용을 방지하는 서비스입니다.
													</p>
													<p class="order-notice__title">
														안심 클릭 결제? (삼성/외환/롯데/현대/신한/시티/하나/NH/수협/전북/광주/산업은행/제주은행)
													</p>
													<p class="order-notice__contents">
														온라인 쇼핑시 주민등록번호, 비밀번호 등의 주요 개인 정보를 입력하지 않고 고객님이 사전에 미리 설정한 전자 상거래용 안심 클릭 비밀번호를 입력하여 카드 사용자 본인 여부를 확인함으로써 온라인상에서의 카드 도용을 방지하는 서비스입니다.
													</p>
												</div>
											</div>
                                            											<!-- //카드 결제 안내 -->

											<!-- 가상 계좌 안내-->
																						<!-- //가상 계좌 안내-->


											<!-- 계좌이체 결제 안내-->
																						<!-- //계좌이체 결제 안내-->

											<!-- 핸드폰 결제 안내-->
																						<!-- //핸드폰 결제 안내 -->

											<!-- 해외카드 안내 -->
																						<!-- //해외카드 안내 -->

											<!-- PAYCO 안내 -->
																						<!-- //PAYCO 안내 -->

											<!-- 카카오페이 안내 -->
																						<!-- //카카오페이 안내 -->

											<!-- TOSS 안내 -->
																						<!-- //TOSSO 안내 -->

											<!-- NAVERPAY 안내 -->
																						<!-- // NAVERPAY 안내 -->

											<!-- 차이페이 안내 -->
																						<!-- // 차이페이 안내 -->
										
											<!-- 카드 결제 안내 -->
																						<!-- //카드 결제 안내 -->

											<!-- 가상 계좌 안내-->
																						<div id="box-payKind-info-VTRANSFER" class="box-payment-method box-payKind-info" style="display:none">
												<div class="box-select" >
                                                    <select name="virtual_bank_code">
                                                        <option value="">입금은행 선택 </option>
                                                                                                                                                                                <option value="BK03">기업은행</option>
                                                                                                                                                                                                                                            <option value="BK04">국민은행</option>
                                                                                                                                                                                                                                            <option value="BK20">우리은행</option>
                                                                                                                                                                                                                                            <option value="BK07">수협은행</option>
                                                                                                                                                                                                                                            <option value="BK11">농협은행</option>
                                                                                                                                                                                                                                            <option value="BK32">부산은행</option>
                                                                                                                                                                                                                                            <option value="BK88">신한은행</option>
                                                                                                                                                                                                                                            <option value="BK81">하나은행</option>
                                                                                                                                                                                                                                            <option value="BK34">광주은행</option>
                                                                                                                                                                                                                                            <option value="BK71">우체국</option>
                                                                                                                                                                                                                                            <option value="BK31">대구은행</option>
                                                                                                                                                                                                                                            <option value="BK39">경남은행</option>
                                                                                                                                                                        </select>
													<input type="text" name="virtual_bank_inpnm" id="virtual_bank_inpnm" value="장선우" readonly="readonly" disabled="disabled" />
												</div>
												<div class="order-notice">
													<p class="order-notice__comment">
														가상 계좌 <span>유효 기간</span>
														<strong class="danger">2023년 01월 23일
															<span id="virtual_bank_deadline">23시 29분</span> 59초
														</strong>
													</p>

													<ul class="order-notice__bullet">
														<li class="order-notice__bullet-item">가상계좌는 주문 시 고객님께 발급되는 일회성 계좌번호 이므로 입금자명이 다르더라도 입금 확인이 가능합니다.</li>
														<li class="order-notice__bullet-item">단, 선택하신 은행을 통해 결제 금액을 1원 단위까지 정확히 맞추셔야 합니다.</li>
														<li class="order-notice__bullet-item">가상 계좌의 입금 유효 기간은 주문 후 2일 이내이며, 기간 초과 시 계좌번호는 소멸되어 입금되지 않습니다.</li>
														<li class="order-notice__bullet-item">구매 가능 수량이 1개로 제한된 상품은 주문 취소 시, 24시간 내 가상 계좌를 통한 재주문이 불가 합니다.</li>
														<li class="order-notice__bullet-item">인터넷뱅킹, 텔레뱅킹, ATM/CD기계, 은행 창구 등에서 입금할 수 있습니다.</li>
														<li class="order-notice__bullet-item">ATM 기기는 100원 단위 입금이 되지 않으므로 통장 및 카드로 계좌이체 해주셔야 합니다. 은행 창구에서도 1원 단위 입금이 가능합니다.</li>
                                                        <li class="order-notice__bullet-item danger">가상 계좌 주문 방식은 입금이 최종 완료된 후 주문 확인 및 출고가 진행됩니다.</li>
                                                        <li class="order-notice__bullet-item danger">가상 계좌 입금 전 재고 소진, 상품 품절, 판매 종료 등의 사유가 발생할 경우 주문이 취소됩니다.</li>
														<li class="order-notice__bullet-item danger">반복적인 주문취소는 주문제한 사유가 될 수 있습니다.</li>
													</ul>
												</div>

											</div>
                                            											<!-- //가상 계좌 안내-->


											<!-- 계좌이체 결제 안내-->
																						<!-- //계좌이체 결제 안내-->

											<!-- 핸드폰 결제 안내-->
																						<!-- //핸드폰 결제 안내 -->

											<!-- 해외카드 안내 -->
																						<!-- //해외카드 안내 -->

											<!-- PAYCO 안내 -->
																						<!-- //PAYCO 안내 -->

											<!-- 카카오페이 안내 -->
																						<!-- //카카오페이 안내 -->

											<!-- TOSS 안내 -->
																						<!-- //TOSSO 안내 -->

											<!-- NAVERPAY 안내 -->
																						<!-- // NAVERPAY 안내 -->

											<!-- 차이페이 안내 -->
																						<!-- // 차이페이 안내 -->
										
											<!-- 카드 결제 안내 -->
																						<!-- //카드 결제 안내 -->

											<!-- 가상 계좌 안내-->
																						<!-- //가상 계좌 안내-->


											<!-- 계좌이체 결제 안내-->
																						<div id="box-payKind-info-TRANSFER" class="box-payKind-info" style="display:none;">
												<ul class="order-notice__bullet">
													<li class="order-notice__bullet-item">
														실시간 계좌이체를 이용하기 위해서는 계좌결제 앱이 설치되어 있어야 합니다.
													</li>
													<li class="order-notice__bullet-item">
														계좌이체는  ATM이나 은행 홈페이지에 접속하지 않고 무신사 홈페이지 내에서 즉시 결제, 출금되는 결제 방식 입니다.
													</li>
													<li class="order-notice__bullet-item">
														현재 약 20여개의 은행이 가능하며 현금영수증 발행은 결제 시 즉시 발급받으실 수 있습니다.
													</li>
												</ul>
											</div>
                                            											<!-- //계좌이체 결제 안내-->

											<!-- 핸드폰 결제 안내-->
																						<!-- //핸드폰 결제 안내 -->

											<!-- 해외카드 안내 -->
																						<!-- //해외카드 안내 -->

											<!-- PAYCO 안내 -->
																						<!-- //PAYCO 안내 -->

											<!-- 카카오페이 안내 -->
																						<!-- //카카오페이 안내 -->

											<!-- TOSS 안내 -->
																						<!-- //TOSSO 안내 -->

											<!-- NAVERPAY 안내 -->
																						<!-- // NAVERPAY 안내 -->

											<!-- 차이페이 안내 -->
																						<!-- // 차이페이 안내 -->
										
											<!-- 카드 결제 안내 -->
																						<!-- //카드 결제 안내 -->

											<!-- 가상 계좌 안내-->
																						<!-- //가상 계좌 안내-->


											<!-- 계좌이체 결제 안내-->
																						<!-- //계좌이체 결제 안내-->

											<!-- 핸드폰 결제 안내-->
																						<div id="box-payKind-info-PHONE" class="box-payKind-info" style="display:none;">
												<ul class="order-notice__bullet">
													<li class="order-notice__bullet-item">
														휴대폰 결제는 통신사와 결제 대행사 정책 / 높은 수수료 / 늦은 정산 주기로 인해 50만원이하 상품만 가능하며 <b>결제하실 금액의 5%가 결제 수수료로 추가</b>됩니다.<br>
														예시) 판매금액 50,000원 상품을 휴대폰으로 결제 할 경우 52,500원이 결제됩니다. 환불 시에는 수수료를 포함한 결제금액이 환불됩니다.
													</li>
													<li class="order-notice__bullet-item">
														<b>저렴한 구매를 원하실 경우 타 결제수단 (신용카드, 가상계좌, 계좌이체)를 이용</b>하시기바랍니다.
													</li>
													<li class="order-notice__bullet-item">
														부분환불/결제 월이 지난 경우, 계좌로 환불 됩니다.
													</li>
												</ul>
											</div>
                                            											<!-- //핸드폰 결제 안내 -->

											<!-- 해외카드 안내 -->
																						<!-- //해외카드 안내 -->

											<!-- PAYCO 안내 -->
																						<!-- //PAYCO 안내 -->

											<!-- 카카오페이 안내 -->
																						<!-- //카카오페이 안내 -->

											<!-- TOSS 안내 -->
																						<!-- //TOSSO 안내 -->

											<!-- NAVERPAY 안내 -->
																						<!-- // NAVERPAY 안내 -->

											<!-- 차이페이 안내 -->
																						<!-- // 차이페이 안내 -->
										
											<!-- 카드 결제 안내 -->
																						<!-- //카드 결제 안내 -->

											<!-- 가상 계좌 안내-->
																						<!-- //가상 계좌 안내-->


											<!-- 계좌이체 결제 안내-->
																						<!-- //계좌이체 결제 안내-->

											<!-- 핸드폰 결제 안내-->
																						<!-- //핸드폰 결제 안내 -->

											<!-- 해외카드 안내 -->
																						<!-- //해외카드 안내 -->

											<!-- PAYCO 안내 -->
																						<!-- //PAYCO 안내 -->

											<!-- 카카오페이 안내 -->
																						<!-- //카카오페이 안내 -->

											<!-- TOSS 안내 -->
																						<div id="box-payKind-info-TOSSPAY" class="box-payKind-info" style="display:none;">
												<ul class="order-notice__bullet">
													<li class="order-notice__bullet-item">
														토스는 간편하게 비밀번호만으로 결제 할 수 있는 빠르고 편리한 계좌 간편 결제 서비스 입니다.
													</li>
													<li class="order-notice__bullet-item">
														지원 은행: 모든 은행 계좌 등록/결제 가능
													</li>
													<li class="order-notice__bullet-item">
														결제 비밀번호 분실 시 재설정 후 이용 가능합니다.
													</li>
												</ul>
											</div>
                                            											<!-- //TOSSO 안내 -->

											<!-- NAVERPAY 안내 -->
																						<!-- // NAVERPAY 안내 -->

											<!-- 차이페이 안내 -->
																						<!-- // 차이페이 안내 -->
										
											<!-- 카드 결제 안내 -->
																						<!-- //카드 결제 안내 -->

											<!-- 가상 계좌 안내-->
																						<!-- //가상 계좌 안내-->


											<!-- 계좌이체 결제 안내-->
																						<!-- //계좌이체 결제 안내-->

											<!-- 핸드폰 결제 안내-->
																						<!-- //핸드폰 결제 안내 -->

											<!-- 해외카드 안내 -->
																						<!-- //해외카드 안내 -->

											<!-- PAYCO 안내 -->
																						<!-- //PAYCO 안내 -->

											<!-- 카카오페이 안내 -->
																						<div id="box-payKind-info-KAKAOPAY" class="box-payKind-info" style="display:none;">
												<ul class="order-notice__bullet">
													<li class="order-notice__bullet-item">
														카카오페이는 카카오톡에서 카드를 등록, 간단하게 비밀번호만으로 결제할 수 있는 빠르고 편리한 모바일 결제 서비스입니다.
													</li>
													<li class="order-notice__bullet-item">
														지원 카드 : 모든 카드 등록/결제 가능
													</li>
												</ul>
											</div>
                                            											<!-- //카카오페이 안내 -->

											<!-- TOSS 안내 -->
																						<!-- //TOSSO 안내 -->

											<!-- NAVERPAY 안내 -->
																						<!-- // NAVERPAY 안내 -->

											<!-- 차이페이 안내 -->
																						<!-- // 차이페이 안내 -->
										
											<!-- 카드 결제 안내 -->
																						<!-- //카드 결제 안내 -->

											<!-- 가상 계좌 안내-->
																						<!-- //가상 계좌 안내-->


											<!-- 계좌이체 결제 안내-->
																						<!-- //계좌이체 결제 안내-->

											<!-- 핸드폰 결제 안내-->
																						<!-- //핸드폰 결제 안내 -->

											<!-- 해외카드 안내 -->
																						<!-- //해외카드 안내 -->

											<!-- PAYCO 안내 -->
																						<!-- //PAYCO 안내 -->

											<!-- 카카오페이 안내 -->
																						<!-- //카카오페이 안내 -->

											<!-- TOSS 안내 -->
																						<!-- //TOSSO 안내 -->

											<!-- NAVERPAY 안내 -->
																						<div id="box-payKind-info-NAVERPAY" class="box-payKind-info" style="display:none;">
												<ul class="order-notice__bullet">
													<li class="order-notice__bullet-item">
														주문 변경 시 카드사 혜택 및 할부 적용 여부는 해당 카드사 정책에 따라 변경될 수 있습니다.
													</li>
													<li class="order-notice__bullet-item">
														네이버페이는 네이버ID로 별도 앱 설치 없이 신용카드 또는 은행계좌 정보를 등록하여 네이버페이 비밀번호로 결제할 수 있는 간편결제 서비스입니다.
													</li>
													<li class="order-notice__bullet-item">
														결제 가능한 신용카드: 신한, 삼성, 현대, BC, 국민, 하나, 롯데, NH농협, 씨티, 카카오뱅크
													</li>
													<li class="order-notice__bullet-item">
														결제 가능한 은행: NH농협, 국민, 신한, 우리, 기업, SC제일, 부산, 경남, 수협, 우체국, 미래에셋대우, 광주, 대구, 전북, 새마을금고, 제주은행, 신협, 하나은행, 케이뱅크, 카카오뱅크, 삼성증권
													</li>
													<li class="order-notice__bullet-item">
														네이버페이 카드 간편결제 시 카드사별 무이자, 청구할인은 네이버페이에서 제공하는 혜택만 적용됩니다.(무신사에서 제공하는 혜택은 적용 제외)
													</li>
												</ul>
											</div>
                                            											<!-- // NAVERPAY 안내 -->

											<!-- 차이페이 안내 -->
																						<!-- // 차이페이 안내 -->
										
											<!-- 카드 결제 안내 -->
																						<!-- //카드 결제 안내 -->

											<!-- 가상 계좌 안내-->
																						<!-- //가상 계좌 안내-->


											<!-- 계좌이체 결제 안내-->
																						<!-- //계좌이체 결제 안내-->

											<!-- 핸드폰 결제 안내-->
																						<!-- //핸드폰 결제 안내 -->

											<!-- 해외카드 안내 -->
																						<!-- //해외카드 안내 -->

											<!-- PAYCO 안내 -->
																						<div id="box-payKind-info-PAYCO" class="box-payKind-info" style="display:none;">
												<p class="txt_tit_payment">PAYCO 간편결제 안내</p>
												<p class="txt_desc_payment">PAYCO는 온/오프라인 쇼핑은 물론 송금, 멤버십 적립까지 가능한 통합 서비스입니다.<br />휴대폰과 카드 명의자가 동일해야 결제 가능하며, 결제금액 제한은 없습니다.</p>
												<ul class="list_wrap">
													<li><span>-</span><span>지원카드 : 모든 국내 신용/체크카드</span></li>
													<li><span>-</span><span>첫 구매 시(1만원 이상) 2,000원 즉시 할인 쿠폰 지급</span></li>
												</ul>
											</div>
                                            											<!-- //PAYCO 안내 -->

											<!-- 카카오페이 안내 -->
																						<!-- //카카오페이 안내 -->

											<!-- TOSS 안내 -->
																						<!-- //TOSSO 안내 -->

											<!-- NAVERPAY 안내 -->
																						<!-- // NAVERPAY 안내 -->

											<!-- 차이페이 안내 -->
																						<!-- // 차이페이 안내 -->
										
										</div>

									</li>
								</ul>
							</div>
														<!-- 무신사페이 현금영수증 -->
							<ul id="box-pay-cash-receipt" class="list_payment_order article_cash_receipt" style="display:none">
								<li class="cell_discount_tit">현금영수증</li>
								<li class="cell_discount_detail">
									<div class="cell_discount_detail__receipt-choice">
										<input type="radio" class="n-radio" id="cash_btn0" name="cash_btn" value="INCOME" checked>
										<label for="cash_btn0">소득공제</label>
										<input type="radio" class="n-radio" id="cash_btn1" name="cash_btn" value="SPENDING">
										<label for="cash_btn1">지출증빙</label>
										<input type="radio" class="n-radio" id="cash_btn2" name="cash_btn" value="NONE">
										<label for="cash_btn2">미발행</label>
									</div>

									<!-- 소득공제 -->
									<div class="cell_discount_detail__receipt-result div_income" style="display:none">
										<div class="n-select n-select--style">
											<select name="select-income">
												<option value="PHONE">휴대폰 번호</option>
												<option value="CARDNUM">현금영수증카드</option>
											</select>
										</div>
										<input type="text" name="income_type_number" value="" class="n-input--style" placeholder="숫자만 입력해 주세요." />
									</div>
									<!-- //소득공제 -->
									<div class="cell_discount_detail__receipt-result div_spending" style="display:none">
										<div class="n-select n-select--style">
											<select name="select-spending">
												<option value="CORPNUM">사업자 번호</option>
<!--												<option value="CARDNUM">현금영수증카드</option>-->
											</select>
										</div>
										<input type="text" name="spending_type_number" value="" class="n-input--style" placeholder="숫자만 입력해 주세요." />
									</div>
									<div class="cell_discount_detail__receipt-result__reuse" style="display:none">
										<input type="checkbox" class="n-check" id="checkCashReceipt" checked>
										<label for="checkCashReceipt">현금영수증 정보를 다음에도 사용</label>
									</div>
								</li>
							</ul>
							<!-- //무신사페이 현금영수증 -->
							<input type="hidden" name="ord_used_yn" value="N">
							<input type="hidden" name="implode_refundable_bank_names" value="농협중앙회|우리은행|신한은행|기업은행|대구은행|부산은행|광주은행|경남은행|국민은행|수협|우체국|하나은행|토스뱅크|케이뱅크|산업은행|SC|시티은행|제주은행|전북은행|새마을금고|신협|카카오뱅크">
														<ul class="list_payment_order account-refund">
								<li class="cell_discount_tit" id="SoldoutContTitle" style="display:none">품절 시 환불 계좌</li>
								<li class="cell_discount_detail" id="SoldoutCont" style="display:none">
									<span id="refund_info"  >
																					장*우 | 국민은행 933502004*****
																			</span>
									<a href="javascript:void(0);" id="refund_info_button" class="n-btn btn-sm btn-default" onclick="RefundAccount.showRefundAccount();">
										변경하기
									</a>
																		<div>
										<ul class="cell_discount_detail-list">
											<li>&middot; 입점업체 배송은 낮은 확률로 상품이 품절일 가능성이 있습니다. 이에 품절 시 빠르게 환불 처리해드립니다.</li>
											<li>&middot; 현금 환불의 경우, 예금정보가 일치해야 환불 처리가 가능합니다. 은행명, 계좌번호, 예금주명을 정확히 기재 부탁드립니다.</li>
											<li>&middot; 환불 받으신 날짜 기준으로 3~5일(주말 제외) 후 결제대행사에서 직접 고객님의 계좌로 환불 처리됩니다.</li>
										</ul>
									</div>
																	</li>
							</ul>
														<ul id="soldOutNonRefundablePayment" class="list_payment_order account-refund">
								<li class="cell_discount_tit">품절 시 환불 안내</li>
								<li class="cell_discount_detail">
									<span>결제하신 수단으로 취소됩니다.</span>
																		<div>
										<ul class="cell_discount_detail-list">
											<li>&middot; 입점업체 배송은 낮은 확률로 상품이 품절일 가능성이 있습니다. 이에 품절 시 빠르게 환불 처리해드립니다.</li>
											<li>&middot; 현금 환불의 경우, 예금정보가 일치해야 환불 처리가 가능합니다. 은행명, 계좌번호, 예금주명을 정확히 기재 부탁드립니다.</li>
											<li>&middot; 환불 받으신 날짜 기준으로 3~5일(주말 제외) 후 결제대행사에서 직접 고객님의 계좌로 환불 처리됩니다.</li>
										</ul>
									</div>
																	</li>
							</ul>
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
						<div class="cell_order_form2" id="right_pay_info_area">
							<div class="payment_promotion" style="padding-bottom:0">
								<p class="title_area" style="padding:0 10px">결제 프로모션</p>
                                							</div>
							<!-- //결제 수단 선택 -->

                            <!-- 무신사페이 정보 -->
                                                        <ul class="box_payment_event" id="right_pay_info_msspay" style="display:none;">
                                <li class="box_method_order">무신사페이 안내사항</li>
                                <li class="n-order-promotion">
                                                                        <strong>무신사페이  할인 이벤트</strong>
<div>
<br>
[하나카드 즉시할인]
<br>
        - 하나카드로 10만원 이상 결제시, 6천원 즉시 할인
</div>
<a href="/app/plan/views/29620">혜택 상세 내용 확인 ↗</a>
<div>
<br>
[롯데카드 즉시할인]
<br>
        - 롯데카드로 10만원 이상 결제시, 6천원 즉시 할인
</div>
<a href="/app/plan/views/29619">혜택 상세 내용 확인 ↗</a>
<div>
<br>
[NH농협카드 즉시할인]
<br>
        - 농협카드로 10만원 이상 결제시, 6천원 즉시 할인
</div>
<a href="/app/plan/views/29656">혜택 상세 내용 확인 ↗</a>
<div>
<br>
[삼성카드 즉시할인]
<br>
        - 삼성카드로 8만원 이상 결제시, 4천원 즉시 할인
</div>
<a href="/app/plan/views/29618">혜택 상세 내용 확인 ↗</a>
<div>
<br>
※ 본 프로모션은 카드사 예산 소진 시 조기 종료될 수 있습니다.
</div>
                                                                    </li>
                            </ul>
                                                        <!-- // 무신사페이 정보 -->

						                            <ul class="box_payment_event" id="right_pay_info_CARD" style="display:none">
							                                <!-- 신용카드 정보 -->
																<li class="box_method_order" style="border-top: none">카드사 할인 이벤트</li>
                                <!-- // 신용카드 정보 -->
                                                            <li class="n-order-promotion">
                                                                            <strong>삼성카드 14만원 캐시백 프로모션</strong>
<div>
	- 삼성카드 14만 원 이용 시, 14만원 캐시백
</div>
<a href="/app/plan/views/29463">프로모션 자세히 보기 ↗</a>
                                                                    </li>
                            </ul>
						                            <ul class="box_payment_event" id="right_pay_info_VTRANSFER" style="display:none">
							                                <!-- 가상계좌 정보 -->
								<li class="box_method_order">가상 계좌 안내</li>
								<li class="box_contents" style="padding-bottom:0">
																		<!--회원 핸드폰 인증-->
									<p class="font_basic">수량 제한 상품의 경우, 가상 계좌를 통한 주문은 최대 2건까지만 가능합니다.</p>
									<p class="font_basic">(미입금 주문 기준, 기존 주문 합산)이전 주문을 완료 혹은 수량 제한 상품의 주문을 조절하세요.</p>
									<p class="font_basic">구매 가능 수량이 1개로 제한된 상품은 주문 취소 시, 24시간 내 가상계좌 재주문이 불가합니다.</p>
									<p class="font_basic txt-danger">반복적인 주문취소는 주문제한 사유가 될 수 있습니다.</p>
																	</li>
                                <!-- //가상계좌 정보 -->
                                                            <li class="n-order-promotion">
                                                                            현재 진행중인 이벤트가 없습니다.
                                                                    </li>
                            </ul>
						                            <ul class="box_payment_event" id="right_pay_info_TRANSFER" style="display:none">
															<li class="box_method_order">계좌이체 이벤트</li>
                                                            <li class="n-order-promotion">
                                                                            현재 진행중인 이벤트가 없습니다.
                                                                    </li>
                            </ul>
						                            <ul class="box_payment_event" id="right_pay_info_PHONE" style="display:none">
															<li class="box_method_order">휴대폰 이벤트</li>
                                                            <li class="n-order-promotion">
                                                                            현재 진행중인 이벤트가 없습니다.
                                                                    </li>
                            </ul>
						                            <ul class="box_payment_event" id="right_pay_info_TOSSPAY" style="display:none">
															<li class="box_method_order">토스페이 이벤트</li>
                                                            <li class="n-order-promotion">
                                                                            <strong>토스페이 최대 6천원 혜택 </strong>
<div>
        - 토스페이 7만원 이상 결제 시, 3천원 즉시 할인(1인 1회)
<br>
        - 토스페이 생애 첫 1만원 이상 결제 시, 3천원 캐시백(1인 1회)
</div>
<div>
※ 본 프로모션은 결제사 예산 소진 시 조기 종료될 수 있습니다.<br>
</div>
<div>
<strong>토스페이 후불결제 오픈</strong>
<br>
- 쇼핑은 오늘, 결제는 다음 달에!
<br>
- 월 최대 30만 원 까지 후불결제 가능
<br>
<br>
<strong><a href="/app/plan/views/30171">혜택 상세 내용 확인 ↗</a></strong>
</div>
                                                                    </li>
                            </ul>
						                            <ul class="box_payment_event" id="right_pay_info_KAKAOPAY" style="display:none">
															<li class="box_method_order">카카오페이 이벤트</li>
                                                            <li class="n-order-promotion">
                                                                            현재 진행중인 이벤트가 없습니다.
                                                                    </li>
                            </ul>
						                            <ul class="box_payment_event" id="right_pay_info_NAVERPAY" style="display:none">
															<li class="box_method_order">네이버페이 이벤트</li>
                                                            <li class="n-order-promotion">
                                                                            현재 진행중인 이벤트가 없습니다.
                                                                    </li>
                            </ul>
						                            <ul class="box_payment_event" id="right_pay_info_PAYCO" style="display:none">
															<li class="box_method_order">페이코 이벤트</li>
                                                            <li class="n-order-promotion">
                                                                            <strong>페이코 3천원 할인</strong>
<div>
	- 페이코 4만원 이상 결제 시 3천원 할인 
</div>
<a href="/app/plan/views/29426">프로모션 자세히 보기 ↗</a>
<div>
※ 본 프로모션은 결제사 예산 소진 시 조기 종료될 수 있습니다.
</div>
                                                                    </li>
                            </ul>
												</div>
					</div>
					<!--//결제 정보-->
					<!--//신용카드 -->

				</div>

				<!--cart button-->
									<div class="btn_wrap order_form__payment-button-wrap">
						<a id="btn_pay" href="javascript:void(0)"  onclick="Order.payment();" class="order_form__payment-button">
							<span id="btn-pay_amt" style="font-size:20px;">0</span>원 결제하기&nbsp;
							<span class="btn_billing" style="display:none;"><span name="total_expected_billing_dc_amt"></span>원 <span class="card_discount_type">청구</span> 예상</span>
						</a>
						<span id="txt_exclude_interest_free" class="btn-text" style="display:none">
							무이자 할부 시 청구할인 대상 제외
						</span>
					</div>
								<!--//cart button-->
			</div>
			<!--// 컨텐츠 영역 -->
		</form>
		<iframe name="payment_result" src="about:blank" target=_blank border="0" style="display: none; width: 100%; height: 0px; text-align: center;"></iframe>
		<!-- 하단 콘텐츠 영역 -->
				<div id="footerCommonPc"></div>
<meta name="google-site-verification" content="NqB0BDAEWJTvAPCCxzrckJYnS7-xJILFU40FvSmh5S8" />
<script type="text/javascript" src="//static.msscdn.net/skin/musinsa/js/jquery.url.packed.js" async="true"></script>				<!--// 하단 콘텐츠 영역 -->
	</div>
	<!--// 오른쪽 콘텐츠 영역 -->
</div>
<!--// wrap -->
<div id="order_delivery_pop" class="popup_info order_delivery_pop" style="display:none;"></div>

<!--매장 픽업 가이드-->
<div id="layer-pickup-guide" class="ui-layer layer-basic layer-change-info layer-pickup-guide"></div>


<script type="text/javascript">
	function showEtc(val){
		if(val == 'etc'){
			$("#dlv_selectbox").val("etc");
			$("#etc_textarea").show();
			$("#etc_textarea").val(document.f1.dlv_msg.value);
		}else{
			$("#dlv_selectbox").val(val);
			$("#etc_textarea").hide();
			// $("#etc_textarea").val("");
		}
	}

	function recipientInfoAutoInput(isChecked) {
		if (isChecked) {
			// 구매자 정보 자동 입력
			$('[name="rcvr_nm"]').val('장선우');
			$('[name="rmobile1"]').val('010');
			$('[name="rmobile2"]').val('5640');
			$('[name="rmobile3"]').val('5610');
		} else {
			// 받는 분 정보 초기화
			$('[name="rcvr_nm"]').val('');
			$('[name="rmobile1"]').val('');
			$('[name="rmobile2"]').val('');
			$('[name="rmobile3"]').val('');
		}
	}

	function setDigitalGoodsRecipientInfoAutoInput() {
		var f1 = document.f1;
		var ordr_nm = f1.ordr_nm.value;
		var rcvr_nm = f1.rcvr_nm.value.trim();
		var omobile = f1.omobile1.value + f1.omobile2.value + f1.omobile3.value;
		var rmobile = f1.rmobile1.value + f1.rmobile2.value + f1.rmobile3.value;
		if (omobile == rmobile && ordr_nm == rcvr_nm) {
			$('[name="ticket-tel"]').prop('checked', true);
		} else {
			$('[name="ticket-tel"]').prop('checked', false);
		}
	}

	function showCashReceiptByType(type) {
		if (type === 'INCOME') {
			$('.div_spending').hide();
			$('.div_income').show();
			$('.cell_discount_detail__receipt-result__reuse').show();
		} else if (type === 'SPENDING') {
			$('.div_income').hide();
			$('.div_spending').show();
			$('.cell_discount_detail__receipt-result__reuse').show();
		} else if (type === 'NONE') {
			$('.cell_discount_detail__receipt-result').hide();
			$('.cell_discount_detail__receipt-result__reuse').hide();
		}
	}

	function showDlvEntranceType(obj) {
	    if ($(obj).val() === 'password') {
			$('#dlv_entrance_memo').show();
		} else {
			$('#dlv_entrance_memo').hide();
		}
	}

	$('.input-num-size').keyup (function () {

		var charLimit = $(this).attr("maxlength");

		if (this.value.length >= charLimit) {
			$(this).next('.input-num-size').focus();
			return false;
		}
	});

	$("#hyundaicardFirstPayment").click(function() {
		var clicked_yn = 'N';
		if (!PLCC.isActivePLCCFirstPayDiscountBtn()) {
			if (!PLCC.validatePLCCFirstPayDiscount()) {
				return false;
			}
			clicked_yn = 'Y';
		}

		PLCC.changePLCCFirstPayDiscountYn(clicked_yn);
		PLCC.setClickedYnFirstPayDiscount();
	});

	$("#btnCardIssue").click(function() {
		document.location.href = '/app/campaign/event/musinsa_hyundaicard/129';
	});

	$("#searchPLCCInfo").click(function() {
		PLCC.setPLCCData();
	});

	// 새벽 배송 출입 방법 툴팁
	$('#__delivery-entrance-tooltip-close-button').on('click', function () {
		if ($('#delivery-entrance-toggle-btn').hasClass('is-active')) {
			$('#delivery-entrance-toggle-btn').removeClass('is-active');
		} else {
			$('#delivery-entrance-toggle-btn').addClass('is-active');
		}
	});

	// 배송지 툴팁
	$('#__delivery-boutique-tooltip-close-button').on('click', function () {
		if ($('#delivery-boutique-toggle-btn').hasClass('is-active')) {
			$('#delivery-boutique-toggle-btn').removeClass('is-active');
		} else {
			$('#delivery-boutique-toggle-btn').addClass('is-active');
		}
	});

	$('select[name=virtual_bank_code]').on('change', function () {
		var virtual_bank_code = $('select[name=virtual_bank_code]').val();
		var deadline_time = (virtual_bank_code == 'BK07' || virtual_bank_code == 'BK31')? '22시 59분' : '23시 29분';
		$('#virtual_bank_deadline').text(deadline_time);
	});
</script>


	<form method="post" name="msspay_method_add_form" action="https://pay.musinsa.com/paymethod/add">
		<input type="hidden" name="returnUrl" value="https://www.musinsa.com/app/order/msspay_method_add_result" />
	</form>

	<form method="post" name="msspay_pay_form"></form>
	
		<script type="text/javascript">
			if (!console.debug) {
				console.debug = console.log;
			}
			
			Msspay.install({
				getOrderNo: function() {
					Order.initOrderNo();
					return document.order_info.ord_no.value;
				},
				getAmount: function() {
					return Order.getPayAmt();
				},
				getTaxFreeAmount: function() {
					return document.order_info.comm_free_mny.value;
				},
				getOrderTitle: function() {
					return document.order_info.good_name.value;
				},
				isCardPointUse: function() {
				 	return $('#__msspay-use-card-point input[type=checkbox]').is(':checked');
				},
				getFirstDiscountYN: function() {
					return $(".hyundaicard-firstpayment").hasClass('is-active')? 'Y' : 'N';
				},
				getCashReceiptRegistrationType: function() {
					return getCashReceiptType();
				},
				getCashReceiptNumberType: function() {
					return getCashReceiptNumberType();
				},
				getCashReceiptRegistrationNumber: function() {
					return getCashReceiptNumber();
				},
				isSaveCashReceipt: function() {
					return $('#checkCashReceipt').prop('checked');
				},
				onMethodListUpdated: function() {
					Order.CalculateAmt();
				},
                showImmediateDiscountCardName: function (immediateDiscountCardInfo) {
					$('.msspay-discount-card').hide();
                    $('#msspay_tooltip').hide();
				    if (immediateDiscountCardInfo['cardNameList'].length > 0 && immediateDiscountCardInfo['maxDiscountAmt'] > 0) {
						$('[name=discountCard]').text(immediateDiscountCardInfo['cardNameList'].join(', '));
						$('.msspay-discount-card').show();
                        setCookie("msspay-tooltip-close-button", 1, 1);
                    } else {
						var tootipCookie = getCookie("msspay-tooltip-close-button");
						if (tootipCookie != "1") {
							$('#msspay_tooltip').show();
						}
                    }
                },
				onAfterInstalled: function(msspay) {
					$('.__payment-pg-view').show();
					$('div.payment-area-wrap label.box_choice:visible').each(function(index, item){
						if (index % 4 > 0) {
							return true; // continue
						}

						$(item).addClass('row-first');
					});
					$('.__payment-pg-view').hide();

					// 주문서 결제수단 선택 : 무신사페이(msspay) / 일반결제(pg)
					$('ul.payment-choice input[name=payment_choice]').each(function() {
						$(this).on('click', function(event, param) {
							const paymentChoice = $(this).val();
							msspay.updatePaymentView(paymentChoice);
							showClaim();
							if (Order.isMsspaySupported()) {
								Msspay.showCashReceiptByPaymentType();
								Msspay.setImmediateDiscount();
							}

							if (paymentChoice === 'msspay') {
								$('.box_payment_event').hide();
								$("#right_pay_info_msspay").show();
                                setPayKind('MPAY');
								CalculateAmt();
							} else {
								$('input[type=radio][name=kyejae]:checked').click();
							}

							if (plcc_open_yn == 'Y' && param != 'noCheckUsePLCC') {
								PLCC.checkUsePLCCFirstPayDiscountByPaymentChoice(paymentChoice);
								PLCC.checkPLCCDiscount(paymentChoice);
								PLCC.checkExcludeInterestFreeText();
							}
						});
					});

					// 현금영수증 선택
					$('input[name=cash_btn]').each(function() {
						$(this).on('click', function() {
							const receiptChoice = $(this).val();
							showCashReceiptByType(receiptChoice);
						});
					});

					$(window).on('pageshow', function (event) {
						if (event.originalEvent.persisted || (window.performance && window.performance.navigation.type == 2)) {
							$('ul.payment-choice input[name=payment_choice]:checked').click();
						}
					});

					// 무신사페이 선택버튼 우측 툴팁 닫기
					$('#__msspay-tooltip-close-button').on('click', function() {
						$(this).parent().css('visibility', 'hidden');
						setCookie("msspay-tooltip-close-button", 1, 7);
					});

					// 무신사페이 가입/결제수단 추가 버튼
					$('.list_payment_order').on('click', '.__msspay-add-method-button',  msspay.openMsspayMethodAddWindow);
					$('.__msspay-reload-button').on('click', msspay.loadMsspayMethodList);
				},
				onAfterLoadList: function() {
					// 무신사페이 할부 영역 change 이벤트
					$('select[id^=__msspay-plcc-interest-]').selectmenu({
						change: function (event, ui) {
							PLCC.checkExcludeInterestFreeText()
						}
					});
				}
			});
		</script>
	

	<form method="post" name="mpay_auth_form"></form>
	
		<script type="text/javascript">
			Mpay.install({
				auth : {
					form: document.mpay_auth_form,
					getOrderNo: function() {
						Order.initOrderNo();
						return document.order_info.ord_no.value;
					},
					getOrderKey: function() {
						Order.initOrderNo();
						return document.order_info.ord_key.value;
					},
					getItemList: function() {
						return getProductInfo();
					},
					getCashReceiptRegistrationType: function() {
						return getCashReceiptType();
					},
					getCashReceiptNumberType: function() {
						return getCashReceiptNumberType();
					},
					getCashReceiptRegistrationNumber: function() {
						return getCashReceiptNumber();
					},
					isSaveCashReceipt: function() {
						return ( $('#checkCashReceipt').prop('checked') && this.getCashReceiptRegistrationType() !== 'NONE' ) ? 'Y' : 'N';
					},
					onPrepared: function(form) {
						window.name = 'order_form_' + form.oid.value;
						var originalHandler = Order.payment;
						var payKind = form.payKind.value;
						const popupWindow = new PopupWindow('mpayAuthWindow', {
							onAfterClosed: function() {
								Order.payment = originalHandler;
							}
						});
						if(payKind == 'VTRANSFER') {
							form.target = "_self";
							form.submit();
						} else {
							if(payKind == 'CARD' || payKind == 'PHONE' || payKind == 'TRANSFER' || payKind == 'OVERSEA_CARD') {
								popupWindow.setFeature("width", 760);
								popupWindow.setFeature("height", 570);
							}
							popupWindow.openWithForm(form, function() {
								Order.payment = function() {
									alert('결제 요청중입니다.');
								}
								return true;
							});
						}
					}
				}
			});

            const cashReceiptInfo = [];
            Order.setCashReceipt(cashReceiptInfo);
		</script>
	
	



</body>
</html>