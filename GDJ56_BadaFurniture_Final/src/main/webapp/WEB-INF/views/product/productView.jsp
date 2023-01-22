 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	<!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/product/bootstrap.min.css" type="text/css">
    <%-- <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/product/font-awesome.min.css" type="text/css"> --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/product/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/product/nice-select.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/product/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/product/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/product/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/product//style.css" type="text/css">
	
	<!-- Js Plugins -->
     <script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.1.min.js"></script> 
  <%--   <script src="${pageContext.request.contextPath }/resources/js/jsProduct/jquery-3.3.1.min.js"></script> --%>
    <script src="${pageContext.request.contextPath }/resources/js/jsProduct/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/jsProduct/jquery.nice-select.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/jsProduct/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/jsProduct/jquery.slicknav.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/jsProduct/mixitup.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/jsProduct/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/jsProduct/main.js"></script>
		
	<!--기존 CSS  -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/product/productView.css"/>
    

   

    <!-- Checkout Section Begin -->
    <section class="checkout spad">
        <div class="container">
           <!--헤더 예비 위치  -->
            <div class="checkout__form">
                <h4>PRODUCT Details</h4>
                <form action="#">
                    <div class="row">
                        <div class="col-lg-8 col-md-6">
                           	<div class="box-shadowTest123" style="border:1px solid lightgray;width:700px;margin-leff:600px!important;height:709px;">
                                <div style="border:0px solid blue;height:539px;">
                                    <div class="slider">
                                        <input type="radio" name="slide" id="slide1">
                                        <input type="radio" name="slide" id="slide2" checked>
                                        <input type="radio" name="slide" id="slide3">
                                        <input type="radio" name="slide" id="slide4">
                                        <ul id="imgholder" class="imgs">
                                            <li  class="image-box"><img class="image-thumbnail" src="${path}/resources/images/product/sofa2.jpg"  ></li>
                                            <li  class="image-box"><img class="image-thumbnail" src="${path}/resources/images/product/sofa1.jpg"></li>
                                            <li  class="image-box"><img class="image-thumbnail" src="${path}/resources/images/product/sofa4.jpg"></li>
                                            <li  class="image-box"><img class="image-thumbnail" src="${path}/resources/images/product/sofa3.jpg"></li>
                                        </ul>
                                        <div class="bullets">
                                            <label for="slide1">&nbsp;</label>
                                            <label for="slide2">&nbsp;</label>
                                            <label for="slide3">&nbsp;</label>
                                            <label for="slide4">&nbsp;</label>
                                        </div>
                                    </div>
                                </div>
                                <div style="border:0px solid red;height:154px;">
                                </div>
                            </div>
                           	
                            
                            
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="checkout__order">
                                <h4>응접실 소파</h4>
                                <div class="checkout__order__products">가격 <span>250,000원</span></div>
                                <ul>
                                    <li>분류 <span>소파</span></li>
                                    <li>크기(가로/세로/높이) <span>1cm 1cm 1cm</span></li>
                                    <li>색상 <span>베이지</span></li>
                                </ul>
                                <div class="checkout__order__subtotal">등급 <span>상</span></div>
                                <div class="checkout__order__total">총가격 <span>260,000원</span></div>
                                <div class="checkout__input__checkbox">
                                    <label for="acc-or">
                                        배송비는 어떻게 되나요?
                                        <input type="checkbox" id="acc-or">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                                <p>배송비는 총가격에 포함되고 있습니다.
                                	지역에 따라 배송비 추가금액이 붙을수 있습니다.
                                </p>
                                
                                <button type="submit" class="site-btn" style="background-color: #348492;">구매하기</button>
                                <button type="submit" class="site-btn" style="background-color: #348492;" >장바구니</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    	 
    	 <!--상품 상세사항  -->
            <div style="display:flex;justify-content: center;">
                <!--콘텐츠 중앙정렬을 위한 가상왼쪽사이드바-->
              
                <!--콘텐츠 중앙정렬을 위한 가상왼쪽사이드바여기까지-->
                <!--상세사항 div  -->
                <div style="border:0px solid red;width:1000px;height:1000px;margin-top:50px;">
                    <div class="card-content">
                        <img src="${path}/resources/images/product/furnitureInfo.png"  class="furnitureInfo"/>
                        <div class="detailFont" style="border:0px solid red;height:60px;text-align: center;">
                            <span>소재:</span>
                            <span>불곰가죽</span>
                        </div>
                        <div class="detailFont" style="border:0px solid red;height:60px;text-align: center;">
                            <span>조립식 유/무:</span>
                            <span>무</span>
                        </div>
                        <img src="${path}/resources/images/product/sofa2.jpg" class="card-content-img"/>
                    </div>
                    <span class="more">
                        <span class="blind">상품 더보기</span>
                      </span>
                      <div class="board">
                        <div  style="border:0px solid black;height:780px;"> 
                            <div  style="border:0px solid rgb(17, 0, 255);height:260px;">
                                <div style="border:0px solid rgb(179, 255, 0);height:86px;">
                                배송기간<br>
                                -평균5~7일
                                </div>
                                <div style="border:0px solid rgb(255, 81, 0);height:86px;">
                                배송비<br>
                                배송비는 주문금액에 포함되어있습니다.
                                </div>
                                <div style="border:0px solid rgb(76, 0, 255);height:86px;">
                                반품/교환<br>
                                -배송비는 누가 부담하나요?단순변심: 고객부담 <br>
                                -상품의 불량 또는 오배송: 본사 부담
                                </div>   
                            </div>
                            <div  style="border:0px solid rgb(179, 255, 0);height:260px;"> 
                                <div style="border:0px solid rgb(255, 115, 0);height:43px;"><p style="text-decoration: underline; text-underline-position:under;">교환 및 반품 기능</p></div>
                                <div style="border:0px solid rgb(30, 255, 0);height:217px;">
                                    -상품 수령 후 박스를 개봉하기 않은 신품에  한해서는 일주일 이내  반품이 가능합니다.  <br>
                                    -제품의 하자나 배송오류가 발생한 경우 <br>
                                    -제품의 수령한 후 반품하게 되면 일정금액의 왕복배송비 및 설치비를 전액 부담하셔야 합니다.  <br>
                                    -주문하신 제품이  출입문이나 창문으로 들어가지 않을 경우 다른제품으로 교환하는 것을 원칙으로 합니다.  <br>
                                </div>
                            </div>
                            <div  style="border:0px solid rgb(17, 0, 255);height:260px;">
                                <div style="border:0px solid rgb(255, 115, 0);height:43px;"><p style="text-decoration: underline; text-underline-position:under;">교환밑반품불가능</p></div>
                                <div style="border:0px solid rgb(30, 255, 0);height:217px;">
                                    -제품을 설치한 후 고객님의 단순변심이나 현장상황이 변경되어 제품이 필요없게 된 경우 <br>
                                    -주문 후 제품의 설치가 진행된경우 <br>
                                    -고객님의 실수 또는 오작동으로 인하여 파손되거나 고장난 경우 <br>
                                </div>
                            </div>
                        </div>
                      </div>
                </div>
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
    
    
    <!-- Checkout Section End -->
    <!-- Footer Section Begin -->
    <!-- <footer class="footer spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="footer__about">
                        <div class="footer__about__logo">
                            <a href="./index.html"><img src="" alt=""></a>
                        </div>
                        <ul>
                            <li>Address: 60-49 Road 11378 New York</li>
                            <li>Phone: +65 11.188.888</li>
                            <li>Email: hello@colorlib.com</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6 offset-lg-1">
                    <div class="footer__widget">
                        <h6>Useful Links</h6>
                        <ul>
                            <li><a href="#">About Us</a></li>
                            <li><a href="#">About Our Shop</a></li>
                            <li><a href="#">Secure Shopping</a></li>
                            <li><a href="#">Delivery infomation</a></li>
                            <li><a href="#">Privacy Policy</a></li>
                            <li><a href="#">Our Sitemap</a></li>
                        </ul>
                        <ul>
                            <li><a href="#">Who We Are</a></li>
                            <li><a href="#">Our Services</a></li>
                            <li><a href="#">Projects</a></li>
                            <li><a href="#">Contact</a></li>
                            <li><a href="#">Innovation</a></li>
                            <li><a href="#">Testimonials</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-4 col-md-12">
                    <div class="footer__widget">
                        <h6>Join Our Newsletter Now</h6>
                        <p>Get E-mail updates about our latest shop and special offers.</p>
                        <form action="#">
                            <input type="text" placeholder="Enter your mail">
                            <button type="submit" class="site-btn">Subscribe</button>
                        </form>
                        <div class="footer__widget__social">
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-instagram"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-pinterest"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="footer__copyright">
                        <div class="footer__copyright__text"><p>Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0.
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
  Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0.</p></div>
                        <div class="footer__copyright__payment"><img src="" alt=""></div>
                    </div>
                </div>
            </div>
        </div>
    </footer> -->
    <!-- Footer Section End -->

    

 

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>