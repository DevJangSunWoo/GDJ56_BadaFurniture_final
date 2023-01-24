<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/adminHeader.jsp"/>
<link rel="stylesheet" href="${path }/resources/css/admin/adminDashBoard.css"/>

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
                        <span id="totalOrder" style="margin-right: 60px;">전체</span><span class="orderCount">111111</span><span class="countUnit">건</span>
                    </div>   
                    <div class="stateOuterDiv">
                        <span class="state" style="margin-right: 30px;">입금대기</span><span class="orderCount">111111</span><span class="countUnit">건</span>
                    </div>           
                    <div class="stateOuterDiv">
                        <span class="state" style="margin-right: 30px;">입금완료</span><span class="orderCount">111</span><span class="countUnit">건</span>
                    </div>
                    <div class="stateOuterDiv">
                        <span class="state" style="margin-right: 30px;">결제완료</span><span class="orderCount">111</span><span class="countUnit">건</span>
                    </div>    
                </div>            
            </div>
            <div id="orderDetail_container">
                <h3 class="title">🛒 주문 취소 현황</h3>
                <div class="spandiv">                                    
                    <div class="stateOuterDiv">
                        <span class="state" style="margin-right: 30px;">취소요청</span><span class="orderCount">111</span><span class="countUnit">건</span>
                    </div>
                    <div class="stateOuterDiv">
                        <span class="state" style="margin-right: 30px;">반품요청</span><span class="orderCount">111</span><span class="countUnit">건</span>
                    </div>
                    <div class="stateOuterDiv">
                        <span class="state" style="margin-right: 30px;">반품대기</span><span class="orderCount">111</span><span class="countUnit">건</span>
                    </div>
                </div>            
            </div>
            <div id="delivery_container">
                <h3 class="title">🚚 배송 현황</h3>
                <div class="spandiv">
                    <div class="stateOuterDiv">
                        <span class="state" style="margin-right: 30px;">배송준비</span><span class="orderCount">111111</span><span class="countUnit">건</span>
                    </div>
                    <div class="stateOuterDiv">
                        <span class="state" style="margin-right: 45px;">배송중</span><span class="orderCount">111111</span><span class="countUnit">건</span>
                    </div>
                </div>            
            </div>
            <div id="product_container">
                <h3 class="title">🎁 상품 현황</h3>
                <div class="spandiv">
                    <div class="stateOuterDiv">
                        <span class="state" style="margin-right: 30px;">판매중</span><span class="orderCount">111111</span><span class="countUnit">건</span>
                    </div>
                    <div class="stateOuterDiv">
                        <span class="state" style="margin-right: 30px;">비공개</span><span class="orderCount">111111</span><span class="countUnit">건</span>
                    </div>
                </div>
            </div>
            <div id="resell_container">
                <h3 class="title">🤝 '내 가구 팔기' 현황</h3>
                <div class="spandiv">
                    <div class="stateOuterDiv">
                        <span class="state" style="margin-right: 30px;">승인검토</span><span class="orderCount">111111</span><span class="countUnit">건</span>
                    </div>
                    <div class="stateOuterDiv">
                        <span class="state" style="margin-right: 30px;">수정요청</span><span class="orderCount">111111</span><span class="countUnit">건</span>
                    </div>
                    <div class="stateOuterDiv">
                        <span class="state" style="margin-right: 45px;">미입금</span><span class="orderCount">111111</span><span class="countUnit">건</span>
                    </div>
                    <div class="stateOuterDiv">
                        <span class="state" style="margin-right: 30px;">수거대기</span><span class="orderCount">111111</span><span class="countUnit">건</span>
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