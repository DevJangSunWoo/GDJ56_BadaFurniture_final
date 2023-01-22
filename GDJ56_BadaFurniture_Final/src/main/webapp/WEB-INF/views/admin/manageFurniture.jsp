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
	.searchInput{
		width:160px
	}
</style>

<section>
	<div id="listContainer">
		<h2>가구관리</h2>
		<div id="summaryContainer">
			<table id="summaryTable">
				<tr>
					<th class="tableTh">전체</th>
					<td class="tableTd">10</td>
				</tr>
				<tr>
					<th class="tableTh">판매중</th>
					<td class="tableTd">5</td>
				</tr>
				<tr>
					<th class="tableTh">거래중</th>
					<td class="tableTd">3</td>
				</tr>
				<tr>
					<th class="tableTh">숨긴 가구</th>
					<td class="tableTd">3</td>
				</tr>
			</table>
		</div>
		
		<div id="search-container">
			<span style="font-size: 17px;">검색타입 : </span> 
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
                <select name="searchKeyword" class="searchInput">
                    <option value="책상">책상</option>
                    <option value="의자">의자</option>
                    <option value="화장대">화장대</option>
                    <option value="침대">침대</option>
                    <option value="서랍장">서랍장</option>
					<option value="책장">책장</option>
                    <option value="소파">소파</option>
                    <option value="옷장">옷장</option>
                </select>

       			<input type="hidden" name="searchType" value="BROKER_NO">
       			<button class="searchBtn">검색</button>
        	</div>
        	
        	<div id="search-productNo">
       			<input type="text" name="searchKeyword" size="30" 
       			placeholder="검색할 가구번호 입력" class="searchInput">
       			<input type="hidden" name="searchType" value="BROKER_NO">
       			<button class="searchBtn">검색</button>
        	</div>
        	
        	<div id="search-price">
       			<input type="number" name="searchKeyword" size="30" 
       			placeholder="가격 입력" class="searchInput"> 이하
       			<input type="hidden" name="searchType" value="BROKER_NO">
	      		<button class="searchBtn">검색</button>
        	</div>    	
        	
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
							<td><a href="">가구번호</a></td>
							<td>분류</td>
							<td>사진</td>
							<td>사이즈</td>
							<td>색상</td>
							<td>가격</td>
							<td>업로드일</td>
							<td>판매일자</td>
							<td>
								<select name="">
									<option value="판매중">판매중</option>
									<option value="거래중">거래중</option>
									<option value="판매완료">판매완료</option>
								</select>

							</td>
							<td>
								<select name="">
									<option value="Y">공개</option>
									<option value="N">숨김</option>
								</select>

							</td>
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

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>