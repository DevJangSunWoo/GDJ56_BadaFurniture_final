<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/product/productView.css"/>
	 <!-- 가운데 섹션 부분!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
    <section>
        </style>
        <div style="border:0px solid rgb(219, 29, 29);height:1700px">
            <div style="display:flex">
                <!--콘텐츠 중앙정렬을 위한 가상왼쪽사이드바-->
                <div  class="profileImg1" style="border:0px solid rgb(156, 30, 230);width:200px;height:700px"></div>
                <!--콘텐츠 중앙정렬을 위한 가상왼쪽사이드바여기까지-->
                <!--메인콘텐츠 div  -->
                <div  style="border:0px solid rgb(236, 10, 10);width:1000px;height:700px;display:flex; ">
                    <div class="box-shadow"   style="border:1px solid black;" style="display:flex">
                        <div style="border:0px solid green;width:1000px;height:700px;display:flex; ">   
                             <div style="border:1px solid #348492;width:455px;border-width: medium thin 5px thick;">
                                <div style="border:0px solid blue;height:539px;">
                                    <div class="slider">
                                        <input type="radio" name="slide" id="slide1">
                                        <input type="radio" name="slide" id="slide2" checked>
                                        <input type="radio" name="slide" id="slide3">
                                        <input type="radio" name="slide" id="slide4">
                                        <ul id="imgholder" class="imgs">
                                            <li  class="image-box"><img class="image-thumbnail" src="${path}/resources/images/product/sofa1.jpg"  onerror="this.src='';"></li>
                                            <li  class="image-box"><img class="image-thumbnail" src="${path}/resources/images/product/sofa2.jpg"></li>
                                            <li  class="image-box"><img class="image-thumbnail" src="${path}/resources/images/product/sofa3.jpg"></li>
                                            <li  class="image-box"><img class="image-thumbnail" src="${path}/resources/images/product/sofa4.jpg"></li>
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
                             <div class="detailFont"   style="border:1px solid #348492;width:545px;border-width: medium thin 5px thick;">
                                <div style="border:0px solid blue;height:77px;">
                                    <div style="text-align:left;margin-left:10px;padding-top:20px;">
                                        
                                    </div>
                                </div>
                                <div style="border-bottom:1px solid #393433;height:77px;border-width: medium thin 5px thick;">
                                    <div style="text-align:left;margin-left:10px;padding-top:20px;">
                                      
                                        <span style="font-size: 30px;">응접실 소파</span>                                      
                                    </div>
                                </div>
                                <div style="border:0px solid blue;height:77px;">
                                    <div style="text-align:left;margin-left:10px;padding-top:20px;">
                                        <span>가격</span>
                                        <span>250,000원</span> 
                                    </div>
                                </div>
                                <div style="border:0px solid red;height:77px;">
                                    <div style="text-align:left;margin-left:10px;padding-top:20px;">
                                        <span>분류</span>
                                        <span>소파</span>
                                    </div>
                                </div>
                                <div style="border:0px solid blue;height:77px;">
                                    <div style="text-align:left;margin-left:10px;padding-top:20px;">
                                        <span>크기</span>
                                        <span>1cm</span>
                                        <span>1cm</span>
                                        <span>1cm</span>
                                        <span>(가로/세로/높이)</span>
                                    </div>
                                </div>
                                <div style="border:0px solid red;height:77px;">
                                    <div style="text-align:left;margin-left:10px;padding-top:20px;">
                                        <span>색상</span>
                                        <span>파란색</span>
                                    </div>
                                </div>
                                <div style="border-bottom:1px solid #393433;height:77px;border-width: medium thin 5px thick;">
                                    <div style="text-align:left;margin-left:10px;padding-top:20px;">
                                        <span>등급</span>
                                        <span>상</span>
                                    </div>
                                </div>
                                <div style="border:0px solid red;height:77px;">
                                    <div style="text-align:left;margin-left:10px;padding-top:20px;">
                                       <div id="delFont" >상품가격에 배송비가 포함되어 있습니다.!!!</div>
                                       <div>
                                            <span>total</span>
                                            <span>250,000원</span>
                                       </div>
                                    </div>
                                </div>
                                <div style="border:0px solid blue;height:77px;">
                                    <div style="text-align:center;margin-left:10px;">
                                        <span><button class="button">구매하기</button></span>
                                        <span style="margin-left:50px;"><button class="button">장바구니</button></span>
                                    </div>    
                                </div>
                            </div>              
                        </div>
                    </div>
                </div>
                <!--메인콘텐츠 div여기까지  -->
            </div>
            <!--상품 상세사항  -->
            <div style="display:flex">
                <!--콘텐츠 중앙정렬을 위한 가상왼쪽사이드바-->
                <div style="border:0px solid green;width:200px;height:1000px"></div>
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
                        <img src="${path}/resources/images/product/sofa1.jpg" class="card-content-img"/>
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
            </div>        
        </div>
       
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
    
    
    
    <style>
        section{
            border: 0px solid tomato;
            font-family: 'Nanum Gothic', sans-serif;
            margin-left: 50px;
            margin-right: 50px;
            /* padding-left: 100px; */
            /* padding-right: 100px; */
            /* 
                만약 섹션 안에 div를 만든다면 여기 padding-left,padding-right에서
                좌우 간격을 조정하세요
                왼쪽 오른쪽도 웬만하면 다같이 맞추면 좋을 듯 하니 각자 만들어보고 의견주세요
             */
            margin-top: 100px;
            height: 2500px; 
            /*
                ->내가 사용하는 중간 섹션부분의 크기를 조절하려면 이 height를 조정하세요★★
                높낮이 조절해도 footer침범하지 않도록 설정해놨으니 마음껏 늘려도 됩니다.
            */
            
        }
        section>div{
            border: 0px solid blue;
            /* 섹션 안의 div테두리 */
            
        }
    </style>
    <!-- 여기까지!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
		
</body>
</html>