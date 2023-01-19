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
    div#search-showState{display:none;}
    div#search-item{display:none;}
    div#search-productNo{display:none;}
    div#search-price{display:none;}

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



</style>

<section>
	<div id="listContainer">
		<h2>'내 가구 팔기' 관리</h2>
		<div id="search-container">
			검색타입 : 
        	<select id="searchType">
				<option value="soldOutState">판매상태</option>
        		<option value="showState">신청자</option>
        		<option value="item">신청번호</option>
        	</select>

        	<div id="search-soldOutState">
                <select name="searchKeyword">
                    <option value="승인대기">승인대기</option>
                    <option value="승인완료">승인완료</option>
                    <option value="승인거부">승인거부</option>
                    <option value="수거대기">수거대기</option>
                    <option value="수거완료">수거완료</option>
                    <option value="입금완료">입금완료</option>
                </select>

       			<input type="hidden" name="searchType" value="BROKER_NO">
       			<button class="searchBtn">검색</button>
        	</div>
        	
        	<div id="search-productNo">
       			<input type="text" name="searchKeyword" size="30" 
       			placeholder="검색할 신청자 이름을 입력하세요">
       			<input type="hidden" name="searchType" value="BROKER_NO">
       			<button class="searchBtn">검색</button>
        	</div>
        	
        	<div id="search-productNo">
       			<input type="text" name="searchKeyword" size="30" 
       			placeholder="검색할 신청번호를 입력하세요">
       			<input type="hidden" name="searchType" value="BROKER_NO">
       			<button class="searchBtn">검색</button>
        	</div>
        	
        	<div id="search-productNo">
       			<input type="text" name="searchKeyword" size="30" 
       			placeholder="검색할 신ㅊ를 입력하세요">
       			<input type="hidden" name="searchType" value="BROKER_NO">
       			<button class="searchBtn">검색</button>
        	</div>
        	
	

        	<input type="hidden" name="searchType" value="clear">
        	<button  class="searchBtn">초기화</button>
        	
        </div>
		<div id="propertyContainer" class = "tableContainer">
			<table id="propertyTable">
				<thead>
					<tr>
						<th><input type="checkbox" name="chk"></th>
						<th>가구번호</th>
						<th>분류</th>
						<th>사진</th>
						<th>사이즈</th>
						<th>색상</th>
						<th>가격</th>
						<th>업로드일</th>
						<th>판매일자</th>
						<th>판매상태</th>
						<th>공개상태</th>
						<th></th>					
					</tr>
					<tbody>
						<tr>
							<td style="width: 10px;"><input type="checkbox" name="chk"></td>
							<td>가구번호</td>
							<td>분류</td>
							<td>사진</td>
							<td>사이즈</td>
							<td>색상</td>
							<td>가격</td>
							<td>업로드일</td>
							<td>판매일자</td>
							<td>판매상태</td>
							<td>공개상태</td>
							<td style="width: 80px;"><button class="updateBtn">수정</button></td>
						</tr>
					</tbody>
				</thead>

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