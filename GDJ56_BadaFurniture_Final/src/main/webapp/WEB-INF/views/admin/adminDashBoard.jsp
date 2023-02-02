<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${path }/resources/css/admin/adminDashBoard.css"/>

<jsp:include page="/WEB-INF/views/common/adminHeader.jsp"/>
<style>
    hr {
        border: 0px;
    }
</style>
<section>
    <div id="divTop">
        <div id="title_container">            
            <h1>🔵 관리자 대시보드 🔵</h1>
        </div>        
    </div>

    <div id="divMidOuter">    
        <div id="divMid">
            <div id="order_container">
                <h3 class="title">💰 주문 현황</h3>
                <div class="spandiv">                

                    <div class="stateOuterDiv">
                        <div class="itemDiv"><strong>전체</strong></div>
                        <div class="valueDiv"><c:out value="${summary.ALL_ORDER}"/></div>
                        <div class="unitDiv"><strong>건</strong></div>
                    </div>                     
                    <hr>
                    <hr>
                    <div class="stateOuterDiv">
                        <div class="itemDiv"><strong>입금대기</strong></div>
                        <div class="valueDiv"><c:out value="${summary.STATE_1}"/></div>
                        <div class="unitDiv"><strong>건</strong></div>
                    </div> 

                    <div class="stateOuterDiv">
                        <div class="itemDiv"><strong>입금완료</strong></div>
                        <div class="valueDiv"><c:out value="${summary.STATE_2}"/></div>
                        <div class="unitDiv"><strong>건</strong></div>
                    </div>    
                    <hr>
                    <div class="stateOuterDiv">
                        <div class="itemDiv"><strong>카드결제</strong></div>
                        <div class="valueDiv"><c:out value="${summary.STATE_3}"/></div>
                        <div class="unitDiv"><strong>건</strong></div>
                    </div>    

                </div>            
            </div>
            
            <div id="delivery_container">
                <h3 class="title">🚚 배송 현황</h3>
                <div class="spandiv">

                    <div class="stateOuterDiv">
                        <div class="itemDiv"><strong>배송준비</strong></div>
                        <div class="valueDiv"><c:out value="${summary.STATE_4}"/></div>
                        <div class="unitDiv"><strong>건</strong></div>
                    </div>   

                    <div class="stateOuterDiv">
                        <div class="itemDiv"><strong>배송중</strong></div>
                        <div class="valueDiv"><c:out value="${summary.STATE_5}"/></div>
                        <div class="unitDiv"><strong>건</strong></div>
                    </div>  

                    <div class="stateOuterDiv">
                        <div class="itemDiv"><strong>배송완료</strong></div>
                        <div class="valueDiv"><c:out value="${summary.STATE_6}"/></div>
                        <div class="unitDiv"><strong>건</strong></div>
                    </div>  
                </div>            
            </div>
           
            <div id="orderDetail_container">
                <h3 class="title">🛒 취소/반품 현황</h3>
                <div class="spandiv">                                    

                    <div class="stateOuterDiv">
                        <div class="itemDiv"><strong>전체</strong></div>
                        <div class="valueDiv"><c:out value="${summary.ALL_REFUND}"/></div>
                        <div class="unitDiv"><strong>건</strong></div>
                    </div> 
                    <hr>
                    <hr>
                    <div class="stateOuterDiv">
                        <div class="itemDiv"><strong>취소요청</strong></div>
                        <div class="valueDiv"><c:out value="${summary.STATE_7}"/></div>
                        <div class="unitDiv"><strong>건</strong></div>
                    </div> 
                    <div class="stateOuterDiv">
                        <div class="itemDiv"><strong>취소완료</strong></div>
                        <div class="valueDiv"><c:out value="${summary.STATE_8}"/></div>
                        <div class="unitDiv"><strong>건</strong></div>
                    </div> 

                    <div class="stateOuterDiv">
                        <div class="itemDiv"><strong>취소거부</strong></div>
                        <div class="valueDiv"><c:out value="${summary.STATE_9}"/></div>
                        <div class="unitDiv"><strong>건</strong></div>
                    </div> 
                    <hr>
                    <hr>
                    <div class="stateOuterDiv">
                        <div class="itemDiv"><strong>반품요청</strong></div>
                        <div class="valueDiv"><c:out value="${summary.STATE_10}"/></div>
                        <div class="unitDiv"><strong>건</strong></div>
                    </div> 

                    <div class="stateOuterDiv">
                        <div class="itemDiv"><strong>반품대기</strong></div>
                        <div class="valueDiv"><c:out value="${summary.STATE_11}"/></div>
                        <div class="unitDiv"><strong>건</strong></div>
                    </div>

                    <div class="stateOuterDiv">
                        <div class="itemDiv"><strong>반품거부</strong></div>
                        <div class="valueDiv"><c:out value="${summary.STATE_12}"/></div>
                        <div class="unitDiv"><strong>건</strong></div>
                    </div>

                </div>            
            </div>
            <div id="product_container">
                <h3 class="title">🎁 상품 현황</h3>
                <div class="spandiv">

                    <div class="stateOuterDiv">
                        <div class="itemDiv"><strong>전체</strong></div>
                        <div class="valueDiv"><c:out value="${summary.ALL_PRODUCT}"/></div>
                        <div class="unitDiv"><strong>건</strong></div>
                    </div>
                    <hr>
                    <hr>
                    <div class="stateOuterDiv">
                        <div class="itemDiv"><strong>판매중</strong></div>
                        <div class="valueDiv"><c:out value="${summary.STATE_13}"/></div>
                        <div class="unitDiv"><strong>건</strong></div>
                    </div>

                    <div class="stateOuterDiv">
                        <div class="itemDiv"><strong>거래중</strong></div>
                        <div class="valueDiv"><c:out value="${summary.STATE_14}"/></div>
                        <div class="unitDiv"><strong>건</strong></div>
                    </div>

                    <div class="stateOuterDiv">
                        <div class="itemDiv"><strong>판매완료</strong></div>
                        <div class="valueDiv"><c:out value="${summary.STATE_15}"/></div>
                        <div class="unitDiv"><strong>건</strong></div>
                    </div>                    
                    <hr>
                    <hr>
                    <div class="stateOuterDiv">
                        <div class="itemDiv"><strong>공개</strong></div>
                        <div class="valueDiv"><c:out value="${summary.STATE_16}"/></div>
                        <div class="unitDiv"><strong>건</strong></div>
                    </div>

                    <div class="stateOuterDiv">
                        <div class="itemDiv"><strong>비공개</strong></div>
                        <div class="valueDiv"><c:out value="${summary.STATE_17}"/></div>
                        <div class="unitDiv"><strong>건</strong></div>
                    </div>
                </div>
            </div>
            <div id="resell_container">
                <h3 class="title">🤝 '내 가구 팔기' 현황</h3>
                <div class="spandiv">

                    <div class="stateOuterDiv">
                        <div class="itemDiv"><strong>전체</strong></div>
                        <div class="valueDiv"><c:out value="${summary.ALL_RESELL}"/></div>
                        <div class="unitDiv"><strong>건</strong></div>
                    </div>
                    <hr>
                    <hr>
                    <div class="stateOuterDiv">
                        <div class="itemDiv"><strong>승인검토</strong></div>
                        <div class="valueDiv"><c:out value="${summary.STATE_18}"/></div>
                        <div class="unitDiv"><strong>건</strong></div>
                    </div>

                    <div class="stateOuterDiv">
                        <div class="itemDiv"><strong>수정요청</strong></div>
                        <div class="valueDiv"><c:out value="${summary.STATE_19}"/></div>
                        <div class="unitDiv"><strong>건</strong></div>
                    </div>

                    <div class="stateOuterDiv">
                        <div class="itemDiv"><strong>승인완료</strong></div>
                        <div class="valueDiv"><c:out value="${summary.STATE_20}"/></div>
                        <div class="unitDiv"><strong>건</strong></div>
                    </div>

                    <div class="stateOuterDiv">
                        <div class="itemDiv"><strong>승인거부</strong></div>
                        <div class="valueDiv"><c:out value="${summary.STATE_21}"/></div>
                        <div class="unitDiv"><strong>건</strong></div>
                    </div>

                    <div class="stateOuterDiv">
                        <div class="itemDiv"><strong>수거대기</strong></div>
                        <div class="valueDiv"><c:out value="${summary.STATE_22}"/></div>
                        <div class="unitDiv"><strong>건</strong></div>
                    </div>

                    <div class="stateOuterDiv">
                        <div class="itemDiv"><strong>수거완료</strong></div>
                        <div class="valueDiv"><c:out value="${summary.STATE_23}"/></div>
                        <div class="unitDiv"><strong>건</strong></div>
                    </div>

                    <div class="stateOuterDiv">
                        <div class="itemDiv"><strong>입금완료</strong></div>
                        <div class="valueDiv"><c:out value="${summary.STATE_24}"/></div>
                        <div class="unitDiv"><strong>건</strong></div>
                    </div>
                </div>
            </div>
        </div>   
    </div>
    <br>
    <hr>
    <div id="divBot">
        <div id="mixedGraph_Outercontainer">
            <div id="mixedGraph_container">
                <h3 class="title">주문수/매출액</h3>
                <canvas id="orderNprofit"></canvas>        
             </div>
        </div>
        <div id="basicGraph_container">
            <div id="graph2_container">
                <h3 class="title">상품별 주문수요</h3>
                <canvas id="itemDemand"></canvas>
            </div>
            
            <div id="graph3_container">
                <h3 class="title">내가구팔기 가구비율</h3>
                <canvas id="resellMine"></canvas>
            </div>
        </div>
    </div> 


</section>
</body>
</html>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>