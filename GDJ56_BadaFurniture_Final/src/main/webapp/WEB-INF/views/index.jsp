<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/> 

<!-- css -->
<link rel="stylesheet" href="${path }/resources/css/common/index.css"/>

<section>
	<div class="flexDiv">
	    <img src="${path }/resources/images/mainpage/mainPicture.jpg" class="mainSize">
	</div>
	
	<form action="${path}/member/test.do" id="form">
		<div id="iconDiv" class="flexDiv">
			<div class="mainSize" id="iconContainer">
				<div class="icon" onclick="fn_selectItem(event);">
					<img src="${path }/resources/images/mainpage/전체.png">
					<h3>전체</h3>
				</div>
				<div class="icon" onclick="fn_selectItem(event);">
					<img src="${path }/resources/images/mainpage/책장.png">
					<h3>책장</h3>
				</div>
				<div class="icon" onclick="fn_selectItem(event);">
					<img src="${path }/resources/images/mainpage/의자.png">
					<h3>의자</h3>
				</div>
				<div class="icon" onclick="fn_selectItem(event);">
					<img src="${path }/resources/images/mainpage/화장대.png">
					<h3>화장대</h3>
				</div>
				<div class="icon" onclick="fn_selectItem(event);">
					<img src="${path }/resources/images/mainpage/침대.png">
					<h3>침대</h3>
				</div>
				<div class="icon" onclick="fn_selectItem(event);">
					<img src="${path }/resources/images/mainpage/서랍장.png">
					<h3>서랍장</h3>
				</div>
				<div class="icon" onclick="fn_selectItem(event);">
					<img src="${path }/resources/images/mainpage/책상.png">
					<h3>책상</h3>
				</div>
				<div class="icon" onclick="fn_selectItem(event);">
					<img src="${path }/resources/images/mainpage/쇼파.png">
					<h3>소파</h3>
				</div>
				<div class="icon" onclick="fn_selectItem(event);">
					<img src="${path }/resources/images/mainpage/옷장.png">
					<h3>옷장</h3>
				</div>
			</div>
		</div>
		<br><br>
		
		<input type="text" name="item" value="전체" hidden>
		<script>
			// 이미지 클릭시 클릭한 item 값 넘겨주면서 form태그 submit
			const fn_selectItem=(e)=>{
				let item = $(e.target).parents(".icon").children("h3").text();
				console.log(item);
				
				$("input[name=item]").val(item);
				$("#form").submit();
			}
		</script>
		
		<div class="flexDiv">
			<p id="listTitle"> / Furniture List / </p>
		</div>
	
	
<!------------------------------------------------------------------------------------------------------------------>	
		<div style="display:flex; justify-content: space-between;">
			<!-- 조건검색 -->
			<div>
				<input type="button" id="slidebtn" value="🤍조건검색">
			</div>
			
			<!-- select Box -->		
			<div>
				<div class="select" tabindex="1">
			        <input class="selectopt" name="sort" value="최근등록일순" type="radio" id="opt0" checked>
			        <label for="opt0" class="option">🏳‍🌈 최근등록일순</label>
			        <input class="selectopt" name="sort" value="금액낮은순" type="radio" id="opt1">
			        <label for="opt1" class="option">🏁 금액 낮은순</label>
			        <input class="selectopt" name="sort" value="금액높은순" type="radio" id="opt2">
			        <label for="opt2" class="option">🏴 금액 높은순</label>
			    </div>
			</div>
			<script>
				
			</script>
			
			
		</div>
		<div id="checkDiv">
			<div class="container">
					<h5>[색상]</h5>
				<ul class="ks-cboxtags">
			    	<li><input type="checkbox" name="color" id="checkboxOne" value="블랙" checked><label for="checkboxOne">블랙</label></li>
			    	<li><input type="checkbox" name="color" id="checkboxTwo" value="화이트" checked><label for="checkboxTwo">화이트</label></li>
			    	<li><input type="checkbox" name="color" id="checkboxThree" value="브라운" checked><label for="checkboxThree">브라운</label></li>
			    	<li><input type="checkbox" name="color" id="checkboxFour" value="그레이" checked><label for="checkboxFour">그레이</label></li>
			    	<li><input type="checkbox" name="color" id="checkboxFive" value="레드" checked><label for="checkboxFive">레드</label></li>
			    	<li><input type="checkbox" name="color" id="checkboxSix" value="옐로우" checked><label for="checkboxSix">옐로우</label></li>
			    	<li><input type="checkbox" name="color" id="checkboxSeven" value="그린" checked><label for="checkboxSeven">그린</label></li>
			    	<li><input type="checkbox" name="color" id="checkboxEight" value="블루" checked><label for="checkboxEight">블루</label></li>
			    	<li><input type="checkbox" name="color" id="checkboxNine" value="네이비" checked><label for="checkboxNine">네이비</label></li>
			    	<li><input type="checkbox" name="color" id="checkboxTen" value="퍼플" checked><label for="checkboxTen">퍼플</label></li>
			   	</ul>
			</div>
			<hr>
			
			<div class="container">
				<h5>[소재]</h5>
				<ul class="list">	
					<li><label><input type="checkbox" name="material" value="철제" checked> 철제</label></li>
					<li><label><input type="checkbox" name="material" value="플라스틱" checked> 플라스틱</label></li>
					<li><label><input type="checkbox" name="material" value="합판" checked> 합판</label></li>
					<li><label><input type="checkbox" name="material" value="원목" checked> 원목</label></li>
					<li><label><input type="checkbox" name="material" value="가죽" checked> 가죽</label></li>
					<li><label><input type="checkbox" name="material" value="패브릭" checked> 패브릭</label></li>
					<li><label><input type="checkbox" name="material" value="메쉬" checked> 메쉬</label></li>
					<li><label><input type="checkbox" name="material" value="유리" checked> 유리</label></li>
				</ul>
			</div>
			<hr>
			
			<div class="container">
				<h5>[등급]</h5>
				<ul class="list">	
					<li><label><input type="checkbox" name="level" value="최상" checked> 최상</label></li>
					<li><label><input type="checkbox" name="level" value="상" checked> 상</label></li>
					<li><label><input type="checkbox" name="level" value="중" checked> 중</label></li>
				</ul>
			</div>
			<hr>
			
			<div class="container">
				<h5>[가로사이즈]</h5>
				<ul class="list">	
					<li><label><input type="radio" name="size" value="1000" > ~100cm</label></li>
					<li><label><input type="radio" name="size" value="1200" > ~120cm</label></li>
					<li><label><input type="radio" name="size" value="1400" > ~140cm</label></li>
					<li><label><input type="radio" name="size" value="1600" > ~160cm</label></li>
					<li><label><input type="radio" name="size" value="1800" > ~180cm</label></li>
					<li><label><input type="radio" name="size" value="2000" > ~200cm</label></li>
					<li><label><input type="radio" name="size" value="2010" > 201cm~</label></li>
					<li><label><input type="radio" name="size" value="전체" checked> 전체</label></li>
				</ul>
			</div>
			
			<div id="checkBtn"> 
				<input type="button" value="초기화">
				<input type="submit" value="적용">
			</div>
		</div>	
	</form>
	<script>
		//조건검색 슬라이드
		 $("#slidebtn").click(e=>{
	         $("#checkDiv").slideToggle(600);
	     });
	</script>
	
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br>
</section>
	


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>