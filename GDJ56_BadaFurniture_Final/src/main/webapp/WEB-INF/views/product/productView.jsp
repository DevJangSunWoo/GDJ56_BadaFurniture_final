
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/product/bootstrap.min.css"
	type="text/css">
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/product/font-awesome.min.css" type="text/css"> --%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/product/elegant-icons.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/product/nice-select.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/product/jquery-ui.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/product/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/product/slicknav.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/product/style.css"
	type="text/css">

<!-- Js Plugins -->
<script
	src="${pageContext.request.contextPath }/resources/js/jquery-3.6.1.min.js"></script>
<%--   <script src="${pageContext.request.contextPath }/resources/js/jsProduct/jquery-3.3.1.min.js"></script> --%>
<script
	src="${pageContext.request.contextPath }/resources/js/jsProduct/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/jsProduct/jquery.nice-select.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/jsProduct/jquery-ui.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/jsProduct/jquery.slicknav.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/jsProduct/mixitup.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/jsProduct/owl.carousel.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/jsProduct/main.js"></script>

<!--기존 CSS  -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/product/productView.css" />

<style>
span.deliveryNrefundDetail {
	font-size: smaller;
}
</style>

<!-- Checkout Section Begin -->
<section class="checkout spad">
	<div class="container">
		<!--헤더 예비 위치  -->
		<div class="checkout__form">
			<h4>PRODUCT Details</h4>
			<%-- <a href="${path}/test.do"> 스케줄러 테스트 링크</a> --%>
			<c:if test="${not empty productData}">
				<!--<form action="#"> -->
				<div class="row">
					<div class="col-lg-8 col-md-6">
						<div class="product__details__pic">
							<c:if test="${not empty productData.files}">

								<div class="product__details__pic__item">
									<c:forEach var="files" items="${productData.files}"
										varStatus="vs" begin="0" end="0">
										<div class="container">
											<img id="soldOutStateImg"
												class="product__details__pic__item--large"
												src="${path}/resources/upload/product/${files.renamedFileName}"
												alt=""> <img id="soldOutImage"
												style="display: none; width: 50%; height: 50%;"
												class="centered"
												src="${path}/resources/images/product/soldOutEasy.png">
										</div>
									</c:forEach>
								</div>
								<div class="product__details__pic__slider owl-carousel">
									<c:forEach var="files" items="${productData.files}"
										varStatus="vs">
										<img class="imgUrl"
											data-imgbigurl="${path}/resources/upload/product/${files.renamedFileName}"
											src="${path}/resources/upload/product/${files.renamedFileName}"
											alt="">
									</c:forEach>
								</div>
							</c:if>
						</div>
					</div>
					<div class="col-lg-4 col-md-6">
						<div class="checkout__order">
							<h4>${productData.title}</h4>
							<div class="checkout__order__products">
								가격 <span>${productData.price}원</span>
							</div>
							<ul>
								<li>분류 <span>${productData.item}</span></li>
								<li>크기(가로/세로/높이)</li>
								<li style="font-weight: 700;">${productData.widths}mm/${productData.depths}mm
									/${productData.heights}mm</li>
								<li>색상 <span>${productData.color}</span></li>
							</ul>

							<div class="checkout__order__subtotal">
								등급 <span>${productData.grade}</span>
							</div>
							<div class="checkout__order__total" style="margin-bottom: 100px;">
								총가격 <span>${productData.price}원</span>
							</div>
							<div class="checkout__input__checkbox">
								<!--    <label for="acc-or">
                                        배송비는 어떻게 되나요?
                                      
                                    </label>
                                </div>
                                <p>배송비는 총가격에 포함되고 있습니다.
                                	지역에 따라 배송비 추가금액이 붙을수 있습니다.
                                </p> -->

								<%--    <c:if test="${not empty loginMember }">  --%>
								<button class="site-btn" style="background-color: #348492;"
									onclick="fn_directPurchaseBtn();">바로 구매하기</button>
								<button class="site-btn" style="background-color: #348492;"
									onclick="fn_cartBtn();">장바구니</button>
								<%--    	</c:if> --%>

								<!--장바구니에 보낼데이터   type="hidden -->
								<input id="cart_productNo" type="hidden"
									value="${productData.productNo}">
								<%-- 	<input id="cart_memberNo" type="hidden" value="${loginMember.memberNo}" > --%>
								<input id="cart_memberNo" type="hidden"
									value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.memberNo}">
							</div>
						</div>
					</div>
					<!--</form> -->
				</div>
		</div>
		<%-- 	 <input type="hidden" id="badaLoginFilter"  value="${loginMember.memberId}"> --%>
		<!--비로그인 회원인 장바구니 및 바로구매 사용못하게 하는 스크립트의  기준  -->
		<input type="hidden" id="badaLoginFilter"
			value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.memberId}">


		<!--제품 soldOutState에 영향을 주는 스타일  -->
		<style>
.container {
	position: relative;

	/*  text-align: center; */
}

.centered {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}
</style>

		<input type="hidden" id="productSoldOutState"
			value="${productData.soldOutState}">



		<!--거래중 거래 완료 이미지  css 블러 처리하는 스크립트 -->
		<!--제품 soldOutState에 맞춰서 이미지 블러위에 이미지 표출하는 스크립트 -->
		<script>
    	 if($('#productSoldOutState').val()=='I'|| $('#productSoldOutState').val()=='Y'){ 
    		 $('#soldOutStateImg').css('filter','blur(4px)');
    		 $('#soldOutStateImg').css('-webkit-filter','blur(4px)');
    	 	$('#soldOutImage').show(); 		 
    	 } 
    	 </script>
		</style>
		<!--슬라이드 이미지 크기 조절 스타일  -->
		<style>
.imgUrl {
	height: 100% !important;
	width: 100% !important;
}

.owl-item cloned {
	height: 122.9px !important;
	width: 112.5px !important;
}

.owl-item active {
	height: 122.9px !important;
	width: 112.5px !important;
}

.owl-item {
	height: 122.9px !important;
	width: 112.5px !important;
}

.owl-item cloned active {
	height: 122.9px !important;
	width: 112.5px !important;
}

.product__details__pic__item--large {
	height: 730.9px !important;
	width: 730.5px !important;
}
</style>






		<!--슬라이드 스크립트  -->
		<script type="text/javascript">
    	 /*-----------------------------
         Product Discount Slider
     -------------------------------*/
     $(".product__discount__slider").owlCarousel({
         loop: true,
         margin: 0,
         items: 3,
         dots: true,
         smartSpeed: 1200,
         autoHeight: false,
         autoplay: true,
         responsive: {

             320: {
                 items: 1,
             },

             480: {
                 items: 2,
             },

             768: {
                 items: 2,
             },

             992: {
                 items: 3,
             }
         }
     });

     /*---------------------------------
         Product Details Pic Slider
     ----------------------------------*/
     $(".product__details__pic__slider").owlCarousel({
         loop: true,
         margin: 20,
         items: 4,
         dots: true,
         smartSpeed: 1200,
         autoHeight: false,
         autoplay: true
     });

     /*-----------------------
 		Price Range Slider
 	------------------------ */
     var rangeSlider = $(".price-range"),
         minamount = $("#minamount"),
         maxamount = $("#maxamount"),
         minPrice = rangeSlider.data('min'),
         maxPrice = rangeSlider.data('max');
     rangeSlider.slider({
         range: true,
         min: minPrice,
         max: maxPrice,
         values: [minPrice, maxPrice],
         slide: function (event, ui) {
             minamount.val('$' + ui.values[0]);
             maxamount.val('$' + ui.values[1]);
         }
     });
     minamount.val('$' + rangeSlider.slider("values", 0));
     maxamount.val('$' + rangeSlider.slider("values", 1));

     /*--------------------------
         Select
     ----------------------------*/
     $("select").niceSelect();

     /*------------------
 		Single Product
 	--------------------*/
     $('.product__details__pic__slider img').on('click', function () {

         var imgurl = $(this).data('imgbigurl');
         var bigImg = $('.product__details__pic__item--large').attr('src');
         if (imgurl != bigImg) {
             $('.product__details__pic__item--large').attr({
                 src: imgurl
             });
         }
     });    	     	     	 
    	 </script>
		<input type="hidden" id="productShowState"
			value="${productData.showState}">
		<!-- loginURL 선언을해서  누적인 안되게하면 고정값을 선언 모달창 열림 -->
		<script>
    	 var loginURL;
    	 $(()=>{
    		 loginURL = window.location.href + "#demo-modal"; 
    		 //console.log(loginURL);
    	 });
    	 
    	 //공개상태가 N일떄 장바구니에 담지 못하게하기
    	 const fn_cartBtn=()=>{
    		 if($('#productShowState').val()=='N'){
    			 alert("거래완료된 제품입니다. 장바구니에 담으실수 없습니다.");	
 			 	return false;
    			 
    		 }
    		 
    		 /*  */
    		 if($('#productSoldOutState').val()=='I'|| $('#productSoldOutState').val()=='Y'){ 
    			 alert("거래완료된 제품입니다. 장바구니에 담으실수 없습니다.");	
    			 	return false;
    		 } 
    		 
    		 
    		 if( $("#badaLoginFilter").val() ==''){
    		
    			 alert("로그인 하셔야 장바구니에 담을 수 있습니다.");
    			 window.location.href=loginURL;
    			 return false;
    		} 
    		
    	
    		
    		
    		$.ajax({
						url:"${path}/product/cartBtn.do",
						data:{cartProductNo:$("#cart_productNo").val()
							,cartMemberNo:$("#cart_memberNo").val()
						},
						success:data=>{
							console.log(data);							
							if(confirm(data+"장바구니로 이동하시겠습니까?")) {
							    window.location.href = "${path}/mypage/cart.do"
							}
						}
					});
    			
    	 }	
    	 
    	
    	 const fn_directPurchaseBtn=()=>{
    		 if($('#productSoldOutState').val()=='I'|| $('#productSoldOutState').val()=='Y'){ 
    			 alert("거래완료된 제품입니다. 구매하실수 없습니다.");	
    			 	return false;
    		 } 
    		 	 
    		 
    		 if( $("#badaLoginFilter").val() ==''){
    	    		
    			 alert("로그인 하셔야 구매하실수 있습니다.");
    			 window.location.href=loginURL;
    			 return false;
    		} 
    		 
    		 
    		 location.assign('${path}/order/orderSheet.do?productNo=${productData.productNo}');
    	 }
    	 
    	 
    	 
    	 </script>
		<!--상품 상세사항  -->
		<div class="col-lg-12">
			<div class="product__details__tab">
				<ul class="nav nav-tabs" role="tablist">
					<li class="nav-item"><a class="nav-link active"
						data-toggle="tab" href="#tabs-1" role="tab" aria-selected="true">제품상세정보</a>
					</li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#tabs-2" role="tab" aria-selected="false">배송 및 환불 사항</a></li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" id="tabs-1" role="tabpanel">
						<div class="product__details__tab__desc">
							<div style="display: flex; justify-content: center;">
								<!--콘텐츠 중앙정렬을 위한 가상왼쪽사이드바-->
								<!--콘텐츠 중앙정렬을 위한 가상왼쪽사이드바여기까지-->
								<!--상세사항 div  -->
								<div
									style="border: 0px solid red; width: 1000px; height: 100%; margin-top: 50px;">
									<div class="card-content" style="height: 100%;">
										<img src="${path}/resources/images/product/furnitureInfo.png"
											class="furnitureInfo" />
										<div class="detailFont"
											style="border: 0px solid red; height: 60px; text-align: center;">
											<span>소재:</span> <span>${productData.material}</span>
										</div>
										<div class="detailFont"
											style="border: 0px solid red; text-align: center; margin-bottom:50px;">
											<span>상세설명:</span> <span> ${productData.detail} </span>
										</div>

										<c:if test="${not empty productData.files}">
											<c:forEach var="files" items="${productData.files}"
												varStatus="vs">
												<div style="display: flex; justify-content: center;">
													<div
														style="width: 500px; height: 500px; display: flex; justify-content: center;">
														<img
															src="${path}/resources/upload/product/${files.renamedFileName}"
															class="card-content-img" />
													</div>
												</div>
											</c:forEach>
										</c:if>
										<c:if test="${empty productData.files}"> 
						                    		제품사진 미등록됨
						                    	</c:if>
									</div>
								</div>


							</div>



						</div>
					</div>
					<div class="tab-pane" id="tabs-2" role="tabpanel">
						<div class="product__details__tab__desc">
							<div class="board"
								style="display: flex; justify-content: center ! important;">
								<div style="border: 0px solid black; height: 780px;">
									<div style="border: 0px solid rgb(17, 0, 255); height: 260px;">
										<div style="border: 0px solid rgb(179, 255, 0); height: 86px;">
											📌 배송기간<br> <span class="deliveryNrefundDetail">-
												결제확인 후 영업일 기준 평균 5~7일 소요됩니다.</span>
										</div>
										<div style="border: 0px solid rgb(255, 81, 0); height: 86px;">
											📌 배송비<br> <span class="deliveryNrefundDetail">-
												전국 무료배송 서비스를 진행하고 있습니다.</span> <br> <span
												class="deliveryNrefundDetail">- 제주 및 도서/산간 지역의 경우 추가
												비용이 발생할 수 있습니다.</span>
										</div>
										<br>
										<div style="border: 0px solid rgb(76, 0, 255); height: 86px;">
											📌 반품/교환<br> <span class="deliveryNrefundDetail">-
												구매자 단순변심 : 품목에 따라 별도의 반품비가 부과됩니다.</span> <br> <span
												class="deliveryNrefundDetail">- 상품의 불량 또는 오배송: 본사 부담</span>
										</div>
										<br>
										<div style="border: 0px solid rgb(76, 0, 255); height: 86px;">
											📌 추가 비용 발생 안내<br> <span class="deliveryNrefundDetail">
												- 배송 당일 현장의 특수성으로 인해 추가적으로 발생하는 비용은 고객님 부담입니다. </span> <br> <span
												class="deliveryNrefundDetail"> - 엘리베이터가 없는 3층 이상 주소지
												또는 3층 미만이지만 배송하는 상품이 계단으로 반입이 불가능한 경우 </span> <br> <span
												class="deliveryNrefundDetail"> - 8인 이상 탑승 가능한 엘리베이터가
												없거나, 계단이 좁아 가구 반입이 불가능하여 사다리차나 지게차를 사용할 경우 </span> <br> <span
												class="deliveryNrefundDetail"> - 엘리베이터 사용료 발생 등으로 인하여
												부득이하게 계단을 통해 가구를 이동할 경우 </span>
										</div>
									</div>
									<!-- <div  style="border:0px solid rgb(179, 255, 0);height:260px;"> 
                                                    <div style="border:0px solid rgb(255, 115, 0);height:43px;"><p style="text-decoration: underline; text-underline-position:under;">교환 및 반품 기능</p></div>
                                                    <div style="border:0px solid rgb(30, 255, 0);height:217px;">
                                                        -상품 수령 후 박스를 개봉하기 않은 신품에  한해서는 일주일 이내  반품이 가능합니다.  <br>
                                                        -제품의 하자나 배송오류가 발생한 경우 <br>
                                                        -제품의 수령한 후 반품하게 되면 일정금액의 왕복배송비 및 설치비를 전액 부담하셔야 합니다.  <br>
                                                        -주문하신 제품이  출입문이나 창문으로 들어가지 않을 경우 다른제품으로 교환하는 것을 원칙으로 합니다.  <br>
                                                    </div>
                                                </div>
                                                <div  style="border:0px solid rgb(17, 0, 255);height:260px;">
                                                    <div style="border:0px solid rgb(255, 115, 0);height:43px;"><p style="text-decoration: underline; text-underline-position:under;">교환 및 반품 불가능</p></div>
                                                    <div style="border:0px solid rgb(30, 255, 0);height:217px;">
                                                        -제품을 설치한 후 고객님의 단순변심이나 현장상황이 변경되어 제품이 필요없게 된 경우 <br>
                                                        -주문 후 제품의 설치가 진행된경우 <br>
                                                        -고객님의 실수 또는 오작동으로 인하여 파손되거나 고장난 경우 <br>
                                                    </div>
                                                </div> -->
								</div>
							</div>

						</div>



					</div>
				</div>
			</div>





			</c:if>
			<c:if test="${empty productData}">
              	해당 제품이 조회되지 않습니다.	              
              </c:if>



			<!-- 상품 상세사항 div여기까지  -->
</section>
<!--상품 더보기 접기 js  -->
<script>
        $(document).ready(function(){
      $('.more').click(function(){
        if($('.more').hasClass('more')){
           $('.more').addClass('close').removeClass('more');
           $('.board').css('visibility', 'visible');
        }else if($('.close').hasClass('close')){
           $('.close').addClass('more').removeClass('close');  
           $('.board').css('visibility', 'hidden');
        }
      });
    });
      </script>

<!--section footer 떨어뜨리기  -->
<style>
header {
	position: fixed;
	left: 0px;
	top: 0px;
	height: 60px;
	width: 100%;
	background: #35acff;
	color: white;
}

footer {
	/*    position:fixed;  */
	left: 0px;
	bottom: 0px;
	width: 100%;
	background: #35acff;
	color: white;
}

section {
	margin-top: 60px;
	margin-bottom: 1px !important;
}

/* 	 html, body {
		  height: 100%;
		}
		
		.wrap {
		  position: relative;
		  min-height: 100%;
		  padding-bottom: 114px;
		}
		
		.footer {
		  position: absolute !important;
		  bottom: 0;
		} */
</style>





<jsp:include page="/WEB-INF/views/common/footer.jsp" />