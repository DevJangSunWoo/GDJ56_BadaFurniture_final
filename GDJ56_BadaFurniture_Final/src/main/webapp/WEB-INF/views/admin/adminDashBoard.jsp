<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/adminHeader.jsp"/>
<style>
/*     div{        
        border: 1px solid blue;
    } */
   
    canvas{
        border: 1px solid #3934348a;
        
    } 

    #divTop{
        display: flex;
        justify-content: center;
        justify-items: center;
        padding: 30px;


    }
    #divMidOuter{
        display: flex;
        justify-content: center;
        justify-items: center;   
        width: auto;
    }

    #divMid{
        display: flex;
        justify-content: center;
        justify-items: center;
        width: 100%;
        padding: 10px;
        
        /* border: 1px solid #393434; */
        border-radius: 8px;

    }
    #divMid>div{
        border: 1px solid #3934348a;
        border-radius: 8px;
    }
    #divMid>div{
        width: 100%;
        margin: 5px;
        padding: 10px;
    }

    .state,.orderCount,#totalOrder{

        font-size: 17px;        

    }

    .state,#totalOrder{
        padding-right: 7%;
        font-weight: bold;
        margin-top: 30px;
        margin-bottom: 30px;
        
    }
    /* .orderCount,#totalOrder{

    } */
    #totalOrder{
       margin-right: 32px;
    }
    .countUnit{
        font-weight: bold;
        font-size: 17px;
        margin-left: 10px;

    }
    .title{
        font-size: 23px;
    }

    .spanDiv{
        padding: 10px;
    }

    #divBot{
        display: flex;
        justify-content: space-evenly;
        justify-items: center;
        width: auto;
        padding: 5px;       
    }
    #divBot div{
        width: 100%;
        margin: 5px;
    }
    #divBot>#mixedGraph_container{
        display: block;
        width:65%;

    }
    #divBot>#mixedGraph_container>canvas{
        height: 100%;
    }
    #divBot>#basicGraph_container{
        display: block;
        width:33%;
    }
    #divBot>#basicGraph_container>div{
        width:100%;
    }
    #divBot>#basicGraph_container canvas{
        height: 100%;
    }
    canvas{
        width: 100%;
    }
    .stateOuterDiv{
        margin-bottom: 10px;
        margin-left: 15px;
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