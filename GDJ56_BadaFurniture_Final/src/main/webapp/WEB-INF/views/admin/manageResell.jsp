<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/adminHeader.jsp"/>

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

    div#search-soldOutState{display:inline-block;}
    div#search-memberName{display:none;}
    div#search-resellNo{display:none;}

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

	th{
		background-color: #393434;
		color: white;
	}
	td{
		background-color: #dcd5c32b;
	}
	button{
		cursor: pointer;
	}
	button:hover{
        box-shadow: 200px 0 0 0 rgba(0,0,0,0.25) inset, 
                   -200px 0 0 0 rgba(0,0,0,0.25) inset;
    }
	a{
		text-decoration: none;
	}

	/* a:visited{
		color: black;
	} */

	select{
		font-size: 16px;
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

	.searchInput{
		width: 200px;
	}


</style>

<section>

	<div id="listContainer">
		<h2>'내 가구 팔기' 관리</h2>
		<div id="summaryContainer">
			<table id="summaryTable">
				<tr>
					<th>전체신청</th>
					<td>10</td>
				</tr>
				<tr>
					<th>승인검토</th>
					<td>5</td>
				</tr>
				<tr>
					<th>수정요청</th>
					<td>5</td>
				</tr>
				<tr>
					<th>미입금</th>
					<td>3</td>
				</tr>
				<tr>
					<th>수거대기</th>
					<td>2</td>
				</tr>
	
			</table>
		</div>
		<div id="search-container">
			검색타입 : 
        	<select id="searchType">
				<option value="soldOutState">판매상태</option>
        		<option value="memberName">신청자</option>
        		<option value="resellNo">신청번호</option>
        	</select>

        	<div id="search-soldOutState">
                <select name="searchKeyword" class="searchInput">
					<option value="승인검토">승인검토</option>
					<option value="수정요청">수정요청</option>
                    <option value="승인거부">승인거부</option>
                    <option value="수거대기">수거대기</option>
                    <option value="수거완료">수거완료</option>
                    <option value="입금완료">입금완료</option>
                </select>

       			<input type="hidden" name="searchType" value="BROKER_NO">
       			<button class="searchBtn">검색</button>
        	</div>
        	
        	<div id="search-memberName">
       			<input type="text" name="searchKeyword" size="30" 
       			placeholder="검색할 신청자 이름을 입력하세요" class="searchInput">
       			<input type="hidden" name="searchType" value="BROKER_NO">
       			<button class="searchBtn">검색</button>
        	</div>
        	
        	<div id="search-resellNo">
       			<input type="text" name="searchKeyword" size="30" 
       			placeholder="검색할 신청번호를 입력하세요" class="searchInput">
       			<input type="hidden" name="searchType" value="BROKER_NO">
       			<button class="searchBtn">검색</button>
        	</div>

        </div>
		<div id="propertyContainer" class = "tableContainer">
			<table id="propertyTable">
				<thead>
					<tr>
						<th>신청번호</th>
						<th>신청일자</th>
						<th>최종수정일</th>
						<th>분류</th>
						<th>사진</th>
						<th>상태</th>
						<th>거래희망가</th>
						<th>신청자</th>
						<th>수거희망일</th>
						<th>상태</th>		
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><a href="">신청번호</a></td>
						<td>신청일자</td>
						<td>최종수정일</td>
						<td>분류</td>
						<td>사진</td>
						<td>상태</td>
						<td>거래희망가</td>
						<td>신청자</td>
						<td>수거희망일</td>
						<td>
							<select>
								<option value="승인검토">승인검토</option>
								<option value="수정요청">수정요청</option>
								<option value="승인완료">승인완료</option>
								<option value="승인거부">승인거부</option>
								<option value="수거대기">수거대기</option>
								<option value="수거완료">수거완료</option>
								<option value="입금완료">입금완료</option>

							</select>

						</td>
					</tr>
				</tbody>		

			</table>
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

</script>

</body>
</html>

</body>
</html>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>