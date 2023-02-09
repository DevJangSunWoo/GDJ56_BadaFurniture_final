<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${path }/resources/css/admin/adminDashBoard.css"/>

<!-- chart.js 라이브러리 CDN 로드 -->    
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.5.0/chart.min.js"></script> -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.5.0/dist/chart.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.0.0"></script>

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
                        <div class="valueDiv"><a id="a0"><c:out value="${summary.ALL_ORDER}"/></a></div>
                        <div class="unitDiv"><strong>건</strong></div>
                    </div>                     
                    <hr>
                    <hr>
                    <div class="stateOuterDiv">
                        <div class="itemDiv"><strong>입금대기</strong></div>
                        <div class="valueDiv"><a id="a1"><c:out value="${summary.STATE_1}"/></a></div>
                        <div class="unitDiv"><strong>건</strong></div>
                    </div> 

                    <div class="stateOuterDiv">
                        <div class="itemDiv"><strong>입금완료</strong></div>
                        <div class="valueDiv"><a id="a2"><c:out value="${summary.STATE_2}"/></a></div>
                        <div class="unitDiv"><strong>건</strong></div>
                    </div>    
                    <hr>
                    <div class="stateOuterDiv">
                        <div class="itemDiv"><strong>카드결제</strong></div>
                        <div class="valueDiv"><a id="a3"><c:out value="${summary.STATE_3}"/></a></div>
                        <div class="unitDiv"><strong>건</strong></div>
                    </div>    

                </div>            
            </div>
            
            <div id="delivery_container">
                <h3 class="title">🚚 배송 현황</h3>
                <div class="spandiv">

                    <div class="stateOuterDiv">
                        <div class="itemDiv"><strong>배송대기</strong></div>
                        <div class="valueDiv"><a id="a4"><c:out value="${summary.STATE_4}"/></a></div>
                        <div class="unitDiv"><strong>건</strong></div>
                    </div>   

                    <div class="stateOuterDiv">
                        <div class="itemDiv"><strong>배송중</strong></div>
                        <div class="valueDiv"><a id="a5"><c:out value="${summary.STATE_5}"/></a></div>
                        <div class="unitDiv"><strong>건</strong></div>
                    </div>  

                    <div class="stateOuterDiv">
                        <div class="itemDiv"><strong>배송완료</strong></div>
                        <div class="valueDiv"><a id="a6"><c:out value="${summary.STATE_6}"/></a></div>
                        <div class="unitDiv"><strong>건</strong></div>
                    </div>  
                </div>            
            </div>
           
            <div id="orderDetail_container">
                <h3 class="title">🛒 취소/반품 현황</h3>
                <div class="spandiv">                                    

                    <div class="stateOuterDiv">
                        <div class="itemDiv"><strong>전체</strong></div>
                        <div class="valueDiv"><a id="a00"><c:out value="${summary.ALL_REFUND}"/></a></div>
                        <div class="unitDiv"><strong>건</strong></div>
                    </div> 
                    <hr>
                    <hr>
                    <div class="stateOuterDiv">
                        <div class="itemDiv"><strong>취소요청</strong></div>
                        <div class="valueDiv"><a id="a7"><c:out value="${summary.STATE_7}"/></a></div>
                        <div class="unitDiv"><strong>건</strong></div>
                    </div> 
                    <div class="stateOuterDiv">
                        <div class="itemDiv"><strong>취소완료</strong></div>
                        <div class="valueDiv"><a id="a8"><c:out value="${summary.STATE_8}"/></a></div>
                        <div class="unitDiv"><strong>건</strong></div>
                    </div> 

                    <div class="stateOuterDiv">
                        <div class="itemDiv"><strong>취소거부</strong></div>
                        <div class="valueDiv"><a id="a9"><c:out value="${summary.STATE_9}"/></a></div>
                        <div class="unitDiv"><strong>건</strong></div>
                    </div> 
                    <hr>
                    <hr>
                    <div class="stateOuterDiv">
                        <div class="itemDiv"><strong>반품요청</strong></div>
                        <div class="valueDiv"><a id="a10"><c:out value="${summary.STATE_10}"/></a></div>
                        <div class="unitDiv"><strong>건</strong></div>
                    </div> 

                    <div class="stateOuterDiv">
                        <div class="itemDiv"><strong>반품대기</strong></div>
                        <div class="valueDiv"><a id="a11"><c:out value="${summary.STATE_11}"/></a></div>
                        <div class="unitDiv"><strong>건</strong></div>
                    </div>

                    <div class="stateOuterDiv">
                        <div class="itemDiv"><strong>반품거부</strong></div>
                        <div class="valueDiv"><a id="a12"><c:out value="${summary.STATE_12}"/></a></div>
                        <div class="unitDiv"><strong>건</strong></div>
                    </div>

                </div>            
            </div>
            <div id="product_container">
                <h3 class="title">🎁 상품 현황</h3>
                <div class="spandiv">

                    <div class="stateOuterDiv">
                        <div class="itemDiv"><strong>전체</strong></div>
                        <div class="valueDiv"><a id="a000"><c:out value="${summary.ALL_PRODUCT}"/></a></div>
                        <div class="unitDiv"><strong>건</strong></div>
                    </div>
                    <hr>
                    <hr>
                    <div class="stateOuterDiv">
                        <div class="itemDiv"><strong>판매중</strong></div>
                        <div class="valueDiv"><a id="a13"><c:out value="${summary.STATE_13}"/></a></div>
                        <div class="unitDiv"><strong>건</strong></div>
                    </div>

                    <div class="stateOuterDiv">
                        <div class="itemDiv"><strong>거래중</strong></div>
                        <div class="valueDiv"><a id="a14"><c:out value="${summary.STATE_14}"/></a></div>
                        <div class="unitDiv"><strong>건</strong></div>
                    </div>

                    <div class="stateOuterDiv">
                        <div class="itemDiv"><strong>판매완료</strong></div>
                        <div class="valueDiv"><a id="a15"><c:out value="${summary.STATE_15}"/></a></div>
                        <div class="unitDiv"><strong>건</strong></div>
                    </div>                    
                    <hr>
                    <hr>
                    <div class="stateOuterDiv">
                        <div class="itemDiv"><strong>공개</strong></div>
                        <div class="valueDiv"><a id="a16"><c:out value="${summary.STATE_16}"/></a></div>
                        <div class="unitDiv"><strong>건</strong></div>
                    </div>

                    <div class="stateOuterDiv">
                        <div class="itemDiv"><strong>비공개</strong></div>
                        <div class="valueDiv"><a id="a17"><c:out value="${summary.STATE_17}"/></a></div>
                        <div class="unitDiv"><strong>건</strong></div>
                    </div>
                </div>
            </div>
            <div id="resell_container">
                <h3 class="title">🤝 '내 가구 팔기' 현황</h3>
                <div class="spandiv">

                    <div class="stateOuterDiv">
                        <div class="itemDiv"><strong>전체</strong></div>
                        <div class="valueDiv"><a id="a0000"><c:out value="${summary.ALL_RESELL}"/></a></div>
                        <div class="unitDiv"><strong>건</strong></div>
                    </div>
                    <hr>
                    <hr>
                    <div class="stateOuterDiv">
                        <div class="itemDiv"><strong>승인검토</strong></div>
                        <div class="valueDiv"><a id="a18"><c:out value="${summary.STATE_18}"/></a></div>
                        <div class="unitDiv"><strong>건</strong></div>
                    </div>

                    <div class="stateOuterDiv">
                        <div class="itemDiv"><strong>수정요청</strong></div>
                        <div class="valueDiv"><a id="a19"><c:out value="${summary.STATE_19}"/></a></div>
                        <div class="unitDiv"><strong>건</strong></div>
                    </div>

                    <div class="stateOuterDiv">
                        <div class="itemDiv"><strong>승인완료</strong></div>
                        <div class="valueDiv"><a id="a20"><c:out value="${summary.STATE_20}"/></a></div>
                        <div class="unitDiv"><strong>건</strong></div>
                    </div>

                    <div class="stateOuterDiv">
                        <div class="itemDiv"><strong>승인거부</strong></div>
                        <div class="valueDiv"><a id="a21"><c:out value="${summary.STATE_21}"/></a></div>
                        <div class="unitDiv"><strong>건</strong></div>
                    </div>

                    <div class="stateOuterDiv">
                        <div class="itemDiv"><strong>수거대기</strong></div>
                        <div class="valueDiv"><a id="a22"><c:out value="${summary.STATE_22}"/></a></div>
                        <div class="unitDiv"><strong>건</strong></div>
                    </div>

                    <div class="stateOuterDiv">
                        <div class="itemDiv"><strong>수거완료</strong></div>
                        <div class="valueDiv"><a id="a23"><c:out value="${summary.STATE_23}"/></a></div>
                        <div class="unitDiv"><strong>건</strong></div>
                    </div>

                    <div class="stateOuterDiv">
                        <div class="itemDiv"><strong>입금완료</strong></div>
                        <div class="valueDiv"><a id="a24"><c:out value="${summary.STATE_24}"/></a></div>
                        <div class="unitDiv"><strong>건</strong></div>
                    </div>
                </div>
            </div>
        </div>   
    </div>
    <hr>
    <div id="divBot">
        <div class="titleNcanvas" style="margin-left: 3%;">
            <h3 class="title">주문수/매출액 (일)</h3>
            <canvas id="orderNsales" width="600" height="400"></canvas>    

        </div>
        <div class="titleNcanvas" style="margin-right: 7%;margin-left: 3%;">
            <h3 class="title">주문수/매출액 (월)</h3>
            <canvas id="orderNsalesMonthly" width="600" height="400"></canvas>    

        </div>
        <div class="titleNcanvas" >
            <h3 class="title">상품별 주문수요</h3>
            <canvas id="itemDemand" width="400" height="400"></canvas>
        </div>
        
        <div class="titleNcanvas">
            <h3 class="title">내가구팔기 가구비율</h3>
            <canvas id="resellMine" width="400" height="400"></canvas>
        </div>       

    </div> 

</section>
</body>
</html>
<script>

    //주문수 및 매출액
    $(()=>{
        $.ajax({
			url: "${path}/admin/chartOrdersSales.do",
			contentType:"application/json;charset=utf-8",
			success:function(result){

                console.log(result.resultOrders);
                console.log(result.resultSales);
                
                var orderData=[];
                orderData.push(result.resultOrders['7일전']);
                orderData.push(result.resultOrders['6일전']);
                orderData.push(result.resultOrders['5일전']);
                orderData.push(result.resultOrders['4일전']);
                orderData.push(result.resultOrders['3일전']);
                orderData.push(result.resultOrders['2일전']);
                orderData.push(result.resultOrders['1일전']);
                orderData.push(result.resultOrders['0일전']);
     
                var salesData=[];
                salesData.push(result.resultSales['7일전']);
                salesData.push(result.resultSales['6일전']);
                salesData.push(result.resultSales['5일전']);
                salesData.push(result.resultSales['4일전']);
                salesData.push(result.resultSales['3일전']);
                salesData.push(result.resultSales['2일전']);
                salesData.push(result.resultSales['1일전']);
                salesData.push(result.resultSales['0일전']);

                console.log("주문건 데이터 :"+orderData);
                console.log("매출 데이터 :"+salesData);

				var resultlabel=['7일전','6일전','5일전','4일전','3일전','2일전','1일전','오늘'];			                
               
                new Chart(document.getElementById("orderNsales"), {
                    plugins: [ChartDataLabels],
                    type: 'bar',
                    data: {
                        labels: resultlabel,
                        datasets: 
                            [
                            {
                                label:'주문건수',
                                yAxisID:'B',
                                data:orderData,                                
                                type:'line',
                                lineTension:0.1,
                                borderColor: '#FFACB7',
                                scaleBeginAtZero: true
                            }
                                ,{ 
                                label:'매출액',
                                yAxisID:'A',
                                data: salesData, 
                                backgroundColor: [
                                    '#9DCEFF'

                                    ],
                                scaleBeginAtZero: true
                            }]
                    },
                    options: {
                        responsive:false,
                        title: {
                            display: true,
                            text: '상품별 주문수요'
                        },                           
                        datalabels: { // datalables 플러그인 세팅
                            formatter: function (value, context) {
                            var idx = context.dataIndex; // 각 데이터 인덱스
            
                            // 출력 텍스트
                            return context.chart.data.labels[idx] + value;
                            },
                            align: 'top', // 도넛 차트에서 툴팁이 잘리는 경우 사용
                        }
                        
                    }
                })        
                                


            }
        })
    })
    //주문수 및 매출액 (월)
    $(()=>{
        $.ajax({
			url: "${path}/admin/chartOrdersSalesMonthly.do",
			contentType:"application/json;charset=utf-8",
			success:function(result){

                console.log(result.resultOrdersMonthly);
                console.log(result.resultSalesMonthly);
                
                var orderData=[];
                orderData.push(result.resultOrdersMonthly['7달전']);
                orderData.push(result.resultOrdersMonthly['6달전']);
                orderData.push(result.resultOrdersMonthly['5달전']);
                orderData.push(result.resultOrdersMonthly['4달전']);
                orderData.push(result.resultOrdersMonthly['3달전']);
                orderData.push(result.resultOrdersMonthly['2달전']);
                orderData.push(result.resultOrdersMonthly['1달전']);
                orderData.push(result.resultOrdersMonthly['0달전']);
     
                var salesData=[];
                salesData.push(result.resultSalesMonthly['7달전']);
                salesData.push(result.resultSalesMonthly['6달전']);
                salesData.push(result.resultSalesMonthly['5달전']);
                salesData.push(result.resultSalesMonthly['4달전']);
                salesData.push(result.resultSalesMonthly['3달전']);
                salesData.push(result.resultSalesMonthly['2달전']);
                salesData.push(result.resultSalesMonthly['1달전']);
                salesData.push(result.resultSalesMonthly['0달전']);

                console.log("주문건 데이터 :"+orderData);
                console.log("매출 데이터 :"+salesData);

				var resultlabel=['7달전','6달전','5달전','4달전','3달전','2달전','1달전','이번 달'];			                
               
                new Chart(document.getElementById("orderNsalesMonthly"), {
                    plugins: [ChartDataLabels],
                    type: 'bar',
                    data: {
                        labels: resultlabel,
                        datasets: 
                            [
                            {
                                label:'주문건수',
                                yAxisID:'B',
                                data:orderData,                                
                                type:'line',
                                lineTension:0.1,
                                borderColor: '#FFACB7',
                                scaleBeginAtZero: true
                            }
                                ,{ 
                                label:'매출액',
                                yAxisID:'A',
                                data: salesData, 
                                backgroundColor: [
                                    '#9DCEFF'

                                    ],
                                scaleBeginAtZero: true
                            }]
                    },
                    options: {
                        responsive:false,
                        title: {
                            display: true,
                            text: '상품별 주문수요'
                        },                           
                        datalabels: { // datalables 플러그인 세팅
                            formatter: function (value, context) {
                            var idx = context.dataIndex; // 각 데이터 인덱스
            
                            // 출력 텍스트
                            return context.chart.data.labels[idx] + value;
                            },
                            align: 'top', // 도넛 차트에서 툴팁이 잘리는 경우 사용
                        }
                        
                    }
                })        
                                


            }
        })
    })

    //내가구팔기 가구비율
    $(()=>{
        $.ajax({
			url: "${path}/admin/chartResell.do",
			contentType:"application/json;charset=utf-8",
			success:function(result){

                // console.log(result);
                // console.log(result['의자']);
                
                var resultData=[];
                resultData.push(result['의자']);
                resultData.push(result['침대']);
                resultData.push(result['화장대']);
                resultData.push(result['책상']);
                resultData.push(result['옷장']);
                resultData.push(result['소파']);
                resultData.push(result['책장']);
                resultData.push(result['서랍장']);

                //console.log(resultData);
                

				var resultlabel=["의자","침대","화장대","책상","옷장","소파","책장","서랍장"];					


                //차트
                new Chart(document.getElementById("resellMine"), {
                    plugins: [ChartDataLabels],
                    type: 'doughnut',
                    data: {
                        labels: resultlabel,
                        datasets: 
                            [{ 
                                data: resultData, 
                                backgroundColor: [
                                    '#4FC0E8',
                                    '#FFACB7',
                                    '#FB6E52',
                                    '#ED5466',
                                    '#9DB6FF',
                                    '#8CC051',
                                    '#AC92ED',
                                    '#36BC9B'

                                    ],
                                borderWidth: 0,
                                scaleBeginAtZero: true,
                                fill: true
                            }]
                    },
                    options: {
                        responsive:false,	//차트 크기 조정용
                        title: {
                            display: true,
                            text: '상품별 주문수요',
                            datalabels: { // datalables 플러그인 세팅
                                formatter: function (value, context) {
                                var idx = context.dataIndex; // 각 데이터 인덱스
                
                                // 출력 텍스트
                                return context.chart.data.labels[idx] + value;
                                },
                                align: 'top', // 도넛 차트에서 툴팁이 잘리는 경우 사용
                            },                           
                        },
                        legend:{
                            display:true,
                            position:'bottom'
                        }


                        
                    }
                })   
                //차트               
                                


            }
        })
    })

    //상품별 주문수요
    $(()=>{
        $.ajax({
			url: "${path}/admin/chartDemand.do",
			contentType:"application/json;charset=utf-8",
			success:function(result){

                //console.log(result);
                // console.log(result['의자']);
                
                var resultData=[];
                resultData.push(result['의자']);
                resultData.push(result['침대']);
                resultData.push(result['화장대']);
                resultData.push(result['책상']);
                resultData.push(result['옷장']);
                resultData.push(result['소파']);
                resultData.push(result['책장']);
                resultData.push(result['서랍장']);

                //console.log(resultData);
                

				var resultlabel=["의자","침대","화장대","책상","옷장","소파","책장","서랍장"];					


                //차트
                new Chart(document.getElementById("itemDemand"), {
                    plugins: [ChartDataLabels],
                    type: 'doughnut',
                    data: {
                        labels: resultlabel,
                        datasets: 
                            [{ 
                                data: resultData, 
                                backgroundColor: [
                                    '#4FC0E8',
                                    '#FFACB7',
                                    '#FB6E52',
                                    '#ED5466',
                                    '#9DB6FF',
                                    '#8CC051',
                                    '#AC92ED',
                                    '#36BC9B'

                                    ],
                                borderWidth: 0,
                                scaleBeginAtZero: true,
                                fill: true
                            }]
                    },
                    options: {
                        responsive:false,
                        maintainAspectRatio:false,
                        title: {
                            display: true,
                            text: '상품별 주문수요',
                            datalabels: { // datalabels 플러그인 세팅
                                formatter: function (value, context) {
                                var idx = context.dataIndex; // 각 데이터 인덱스
                
                                // 출력 텍스트
                                return context.chart.data.labels[idx] + value;
                                },
                                align: 'top', // 도넛 차트에서 툴팁이 잘리는 경우 사용
                            },                           
                        }


                        
                    }
                })   
                //차트               
                                


            }
        })
    })
		

    $(()=>{
        //주문현황
        $("#a0").attr("href","${path}/admin/order.do");
        $("#a1").attr("href","${path}/admin/order.do?searchKeyword=입금대기&searchType=PAYMENT_STATE");
        $("#a2").attr("href","${path}/admin/order.do?searchKeyword=입금완료&searchType=PAYMENT_STATE");
        $("#a3").attr("href","${path}/admin/order.do?searchKeyword=카드결제완료&searchType=PAYMENT_STATE");

        //배송현황
        $("#a4").attr("href","${path}/admin/delivery.do?searchKeyword=배송대기&searchType=DELIVERY_STATE");
        $("#a5").attr("href","${path}/admin/delivery.do?searchKeyword=배송중&searchType=DELIVERY_STATE");
        $("#a6").attr("href","${path}/admin/delivery.do?searchKeyword=배송완료&searchType=DELIVERY_STATE");
        
        //취소반품 현황
        $("#a00").attr("href","${path}/admin/refund.do");
        $("#a7").attr("href","${path}/admin/refund.do?searchKeyword=취소요청&searchType=REFUND_STATE");
        $("#a8").attr("href","${path}/admin/refund.do?searchKeyword=취소완료&searchType=REFUND_STATE");
        $("#a9").attr("href","${path}/admin/refund.do?searchKeyword=취소거부&searchType=REFUND_STATE");
        $("#a10").attr("href","${path}/admin/refund.do?searchKeyword=반품요청&searchType=REFUND_STATE");
        $("#a11").attr("href","${path}/admin/refund.do?searchKeyword=반품대기&searchType=REFUND_STATE");
        $("#a12").attr("href","${path}/admin/refund.do?searchKeyword=반품거부&searchType=REFUND_STATE");
        
        //상품현황
        $("#a000").attr("href","${path}/admin/product.do");
        $("#a13").attr("href","${path}/admin/product.do?searchKeyword=N&searchType=SOLD_OUT_STATE");
        $("#a14").attr("href","${path}/admin/product.do?searchKeyword=I&searchType=SOLD_OUT_STATE");
        $("#a15").attr("href","${path}/admin/product.do?searchKeyword=Y&searchType=SOLD_OUT_STATE");
        $("#a16").attr("href","${path}/admin/product.do?searchKeyword=Y&searchType=SHOW_STATE");
        $("#a17").attr("href","${path}/admin/product.do?searchKeyword=N&searchType=SHOW_STATE");
        
        //내...현황
        $("#a0000").attr("href","${path}/admin/resell.do");
        $("#a18").attr("href","${path}/admin/resell.do?searchKeyword=승인검토&searchType=PROGRESS_STATE");
        $("#a19").attr("href","${path}/admin/resell.do?searchKeyword=수정요청&searchType=PROGRESS_STATE");
        $("#a20").attr("href","${path}/admin/resell.do?searchKeyword=승인완료&searchType=PROGRESS_STATE");
        $("#a21").attr("href","${path}/admin/resell.do?searchKeyword=승인거부&searchType=PROGRESS_STATE");
        $("#a22").attr("href","${path}/admin/resell.do?searchKeyword=수거대기&searchType=PROGRESS_STATE");
        $("#a23").attr("href","${path}/admin/resell.do?searchKeyword=수거완료&searchType=PROGRESS_STATE");
        $("#a24").attr("href","${path}/admin/resell.do?searchKeyword=입금완료&searchType=PROGRESS_STATE");

    })

</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>