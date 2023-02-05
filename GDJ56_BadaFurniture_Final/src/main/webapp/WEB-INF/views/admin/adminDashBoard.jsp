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
                        <div class="itemDiv"><strong>배송대기</strong></div>
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
    <hr>
    <div id="divBot">
        <div class="titleNcanvas" style="margin-right: 7%;margin-left: 3%;">
            <h3 class="title">주문수/매출액</h3>
            <canvas id="orderNsales" width="600" height="400"></canvas>    

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
		

</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>