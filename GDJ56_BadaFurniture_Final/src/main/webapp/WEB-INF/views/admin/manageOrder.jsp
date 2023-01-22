<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/adminHeader.jsp"/>

<!-- datepicker -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

<style>

/*     div#search-container>div {        
        border: 1px solid blue;
    } */

    div#listContainer>h2{
        text-align:center;
        font-size:25px;
        font-weight:bolder;
        padding:15px;
		margin-top: 35px;
    }
    div.tableContainer>table{
        width:100%;
        text-align: center;
        border-collapse : collapse;
		margin-top: 40px;
    }
    div.tableContainer>table th,td{
        border : 1px solid black;
        padding:5px 10px 5px 10px;
    }

    div#pageBarContainer{
        display:flex;
        justify-content: center;
    }

    div#search-container{text-align:center;}

    div#search-orderState{display:inline-block;}
    div#search-deliveryState{display:none;}
    div#search-orderSheetNo{display:none;}
    div#search-orderSheetEnrollDate{display:none;}
    div#search-memberName{display:none;}

    div#search-container {margin:0 0 10px 0; padding:3px; }
    div#numPerpage-container{text-align:right; padding:0px 40px 20px 0px;}
    button#hidingBtnToY{
        background-color: white;
        color:black;
        border:none;
    }
    button#hidingBtnToN{
        background-color: rgb(7, 90, 42);
        color:white;
        border:none;
    }

	button.updateBtn,.searchBtn{
		background-color:#348492;
		border: none;
		color: white;
		width: 80px;
		border-radius: 5px;
		padding: 5px;

	}
	.searchBtn{
		margin-left: 5px;
	}

	.tableTh{
		background-color: #393434;
		color: white;
	}
	.tableTd{ 
		background-color: #dcd5c32b;
	}

	select{
		font-size: 16px;
	}

	a{
		text-decoration: none;
	}

	/* a:visited{
		color: black;
	} */

	button{
		cursor: pointer;
	}

	button:hover{
        box-shadow: 200px 0 0 0 rgba(0,0,0,0.25) inset, 
                   -200px 0 0 0 rgba(0,0,0,0.25) inset;
    }
	div#summaryContainer{
		display: flex;
		justify-content: center;
		margin-top: 30px;
		margin-bottom: 30px;
	}
	div#summaryContainer th,td{
		width: 100px;
		height: 30px;
		text-align: center;
		border: none;
	}

	/* 날짜선택 사이즈 조절 */
	.daterangepicker {width: 660px;}
	#orderDateRange{
		width: 170px;
	}

	.searchInput{
		width:170px;
	}



	/* 모달 */
	.modalTitle{
		display: flex;
		justify-content: center;
	}

	.closeBtn {
          background-color: #348492;
          padding: 5px 10px;
          border-radius: 4px;
          cursor: pointer;
		  border:none;
		  color: white;
        }

        .modals {
          position: fixed;
          top: 0;
          left: 0;
          width: 100%;
          height: 100%;
          display: flex;
          justify-content: center;
          align-items: center;
        }

        .modals .bg {
          width: 100%;
          height: 100%;
          background-color: rgba(0, 0, 0, 0.6);
        }

        .modalBox {
          position: absolute;
          background-color: #fff;
          width: 400px;
          height: 200px;
          padding: 15px;
        }

        .modalBox button {
          display: block;
          width: 80px;
          margin: 0 auto;
        }

        .hiddens {
          display: none;
        }

		.modalContentInnerDiv{
			margin:8px;
		}

		#modalBtnArea{
			display: flex;
			justify-content: center;
			padding: 15px;
		}

</style>

<section>

	<div id="listContainer">
		<h2>주문관리</h2>
		<div id="summaryContainer">
			<table id="summaryTable">
				<tr>
					<th class="tableTh">전체주문</th>
					<td class="tableTd">10</td>
				</tr>
				<tr>
					<th class="tableTh">입금대기</th>
					<td class="tableTd">2</td>
				</tr>	
				<tr>
					<th class="tableTh">입금완료</th>
					<td class="tableTd">2</td>
				</tr>	
				<tr>
					<th class="tableTh">반품요청</th>
					<td class="tableTd">3</td>
				</tr>
				<tr>
					<th class="tableTh">반품대기</th>
					<td class="tableTd">2</td>
				</tr>
				<tr>
					<th class="tableTh">취소요청</th>
					<td class="tableTd">2</td>
				</tr>

			</table>
		</div>
		<div id="search-container">
			<span style="font-size: 17px;">검색타입 : </span> 
        	<select id="searchType" class="searchInput">
				<option value="orderState">주문상태</option>
        		<option value="deliveryState">배송상태</option>
        		<option value="orderSheetNo">주문번호</option>
        		<option value="memberName">주문자</option>
        		<option value="orderSheetEnrollDate">주문일자</option>
        	</select>
			        	
			<div id="search-orderState">
				<select name="searchKeyword" class="searchInput">
                    <option value="입금대기">입금대기</option>
                    <option value="입금완료">입금완료</option>
                    <option value="결제완료">결제완료</option>
                    <option value="반품요청">반품요청</option>
                    <option value="반품대기">반품대기</option>
                    <option value="반품완료">반품완료</option>
                    <option value="취소요청">취소요청</option>
                    <option value="취소완료">취소완료</option>
                    <option value="주문확정">주문확정</option>
                </select>

				<input type="hidden" name="searchType" value="HIDING">
				<button class="searchBtn">검색</button>
			</div>

			<div id="search-deliveryState">
				<select name="searchKeyword" class="searchInput">
                    <option value="배송준비">배송준비</option>
                    <option value="배송중">배송중</option>
                    <option value="배송완료">배송완료</option>
                </select>

				<input type="hidden" name="searchType" value="HIDING">
				<button class="searchBtn">검색</button>
			</div>
        	
        	<div id="search-orderSheetNo">
       			<input type="text" name="searchKeyword" size="30" 
       			placeholder="검색할 주문번호 입력" class="searchInput">
       			<input type="hidden" name="searchType" value="BROKER_NO">
       			<button class="searchBtn">검색</button>
        	</div>
			<div id="search-memberName">
				<input type="text" name="searchKeyword" size="30" 
				placeholder="검색할 주문자 이름 입력" class="searchInput">
				<input type="hidden" name="searchType" value="BROKER_NO">
				<button class="searchBtn">검색</button>
		 	</div>

			<!-- 주문일자 기간선택 -->
        	<div id="search-orderSheetEnrollDate">
				<input type="text" id="orderDateRange" name="orderDateRange" value=""  class="searchInput">
       			<input type="hidden" name="searchType" value="BROKER_NO">
       			<button class="searchBtn">검색</button>
        	</div>


        	
        </div>
		<div id="propertyContainer" class = "tableContainer">
			<table id="propertyTable">
				<thead>
					<tr>
						<th class="tableTh"><input type="checkbox" name="chk"></th>
						<th class="tableTh">주문번호</th>
						<th class="tableTh">주문일자</th>
						<th class="tableTh">가구번호</th>
						<th class="tableTh">분류</th>
						<th class="tableTh">사진</th>
						<th class="tableTh">가격</th>
						<th class="tableTh">주문자</th>
						<th class="tableTh">결제수단</th>
						<th class="tableTh">배송상태</th>
						<th class="tableTh">주문상태</th>
						<th class="tableTh">취소/반품</th>					
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 10px;"><input type="checkbox" name="chk" class="tableTd"></td>
						<td class="tableTd"><a href="">주문번호</a></td>
						<td class="tableTd">주문일자</td>
						<td class="tableTd">가구번호</td>
						<td class="tableTd">분류</td>
						<td class="tableTd">사진</td>
						<td class="tableTd">가격</td>
						<td class="tableTd">주문자</td>
						<td class="tableTd">결제수단</td>
						<td class="tableTd">
							<select name="">
								<option value="배송준비">배송준비</option>
								<option value="배송중">배송중</option>
								<option value="배송완료">배송완료</option>
							</select>
							
						</td>
						<td class="tableTd">
							<select name="">
								<option value="입금대기">입금대기</option>
								<option value="입금완료">입금완료</option>
								<option value="결제완료">결제완료</option>
								<option value="반품요청">반품요청</option>
								<option value="반품대기">반품대기</option>
								<option value="반품완료">반품완료</option>
								<option value="취소요청">취소요청</option>
								<option value="취소완료">취소완료</option>
								<option value="주문확정">주문확정</option>
							</select>	

						</td>
						<td class="tableTd" style="width: 80px;"><button id="detailModalBtn" class="updateBtn" onclick="">상세확인</button></td>
					</tr>
				</tbody>
			</table>
			
			<!-- 취소상세확인 모달 -->
			<!-- <div id="refundModal" class="refundModal-overlay">
				<div class="refundModal-window">
					<div class="modalTitle">
						<h1>반품/취소 상세내역</h1>
					</div>
					<div class="modalContent">
						<span>주문 상세번호</span><span>1111</span>
						<span>반품/취소 신청일</span><span>23-01-20</span>
						<span>반품/취소 사유</span><span>단순변심</span>
					</div>
					<div class="close-area">
						<button id="closebutton">닫기</button>
					</div>
				</div>
			</div> -->
			<!-- 모달 끝 -->


			<div class="modals hiddens">
			<div class="bg"></div>
			<div class="modalBox">
				<div class="modalTitle">
					<h1>반품/취소 상세내역</h1>
				</div>
				<div class="modalContent">
					<div class="modalContentInnerDiv">
						<span>✔️ 주문 상세번호 : </span><span>1111</span>
					</div>
					<div class="modalContentInnerDiv">
						<span>✔️ 반품/취소 신청일 : </span><span>23-01-20</span>
					</div>
					<div class="modalContentInnerDiv">
						<span>✔️ 반품/취소 사유 : </span><span>단순변심</span>
					</div>
				</div>
				<div id="modalBtnArea">
					<button class="closeBtn">닫기</button>
				</div>
			</div>
			</div>





		</div>
		<div id="pageBarContainer">
			<div id=pageBar></div>
		</div>
	</div>
</section>
<script>
	$("select#searchType").change(e=>{
		const type = $(e.target).val();
		$("div#search-container>div").hide();
		$("div#search-"+type).css("display","inline-block");
		$("input[name=searchKeyword][type=text]").val("");
		$("div#search-hiding>label>input[name=searchKeyword]").first().prop("checked",true);
	});



	// datepicker
	$('#orderDateRange').daterangepicker({
    "locale": {
        "format": "YYYY-MM-DD",
        "separator": " ~ ",
        "applyLabel": "확인",
        "cancelLabel": "취소",
        "fromLabel": "From",
        "toLabel": "To",
        "customRangeLabel": "Custom",
        "weekLabel": "W",
        "daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
        "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
    },
    "startDate": new Date(),
    "endDate": new Date(),
    "drops": "auto"
	}, 
	function (start, end, label) {
	    console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')');
	}
	);


	//취소/반품 확인 모달
	const open = () => {
		document.querySelector(".modals").classList.remove("hiddens");
	}

	const close = () => {
		document.querySelector(".modals").classList.add("hiddens");
	}

	document.querySelector("#detailModalBtn").addEventListener("click", open);
	document.querySelector(".closeBtn").addEventListener("click", close);
	document.querySelector(".bg").addEventListener("click", close);




</script>

</body>
</html>

</body>
</html>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>