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
		<h2>가구관리</h2>
		<div id="search-container">
			검색타입 : 
        	<select id="searchType">
				<option value="soldOutState">판매상태</option>
        		<option value="showState">공개상태</option>
        		<option value="item">가구분류</option>
        		<option value="productNo">가구번호</option>
        		<option value="price">가격</option>
        	</select>
			        	
			<div id="search-soldOutState">
				   <label><input type="radio" name="searchKeyword" value="판매중">판매중</label> 
				   <label><input type="radio" name="searchKeyword" value="거래중">거래중</label>
				   <label><input type="radio" name="searchKeyword" value="거래완료">거래완료</label>
				   <input type="hidden" name="searchType" value="HIDING">
				   <button class="searchBtn">검색</button>
			</div>
			
        	<div id="search-showState">
       			<label><input type="radio" name="searchKeyword" value="Y">공개</label> 
       			<label><input type="radio" name="searchKeyword" value="N">숨김</label>
       			<input type="hidden" name="searchType" value="HIDING">
       			<button class="searchBtn">검색</button>
        	</div>

        	<div id="search-item">
                <select name="searchKeyword">
                    <option value="책상">책상</option>
                    <option value="의자">의자</option>
                    <option value="화장대">화장대</option>
                    <option value="침대">침대</option>
                    <option value="서랍장">서랍장</option>
                    <option value="소파">소파</option>
                </select>

       			<input type="hidden" name="searchType" value="BROKER_NO">
       			<button class="searchBtn">검색</button>
        	</div>
        	
        	<div id="search-productNo">
       			<input type="text" name="searchKeyword" size="30" 
       			placeholder="검색할 가구번호를 입력하세요">
       			<input type="hidden" name="searchType" value="BROKER_NO">
       			<button class="searchBtn">검색</button>
        	</div>
        	
        	<div id="search-price">
       			<input type="number" name="searchKeyword" size="30" 
       			placeholder="가격 입력"> 이하
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