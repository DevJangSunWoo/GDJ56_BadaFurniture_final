<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<style>
	section#sellpage>div#title{
		display:flex;
		justify-content:center;
		font-size:30px;
		color:rgb(52, 132, 146);
		font-weight:bolder;
		width:100%;
		height:120px;
		align-items:center;
	}
	div#sellWrap{
		width:100%;
		height:1000px; /* 수정요망 */
		display:flex;
		justify-content: center;
	}
	div#sellWrap>div#sellContent{
		width:618px; 
		height:1000px; /* 수정요망 */
		/* border: 2px solid red; */
	}
	div#sellWrap>div#sellContent>div.sellRow{
		display:flex;
	}
	div.sellRow>div.sellColLeft{
		width:150px;
		height:50px;
		display:flex;
		align-items:center;
		justify-content:left;
		padding-left:15px;
		background-color:rgb(52, 132, 146);
		color:white;
		font-weight:bolder;
		font-size:15px;
		border:1px solid white;
	}
	div.sellRow>div.sellColRight{
		border-top:1px solid black;
		border-right:1px solid black;
		width:100%;
		display:flex;
		justify-content:left;
		align-items:center;
		padding-left:15px;
	}
	div.sellRow>div.sellColRight *{
		font-size:14px;
	}
	div.sellRow select#category{

	}
	div.sellColRight>div.sellImageUpload{
		width:200px;
		height:200px;
		border: 2px solid rgb(52, 132, 146);
		margin-right:20px;
	}
	div#addressContainer>*{
		margin:3px;
	}
	div#accountContainer>*{
		margin:3px;
	}
	div.sellRow input#resellBtn{
		width:600px;
		height:50px;
		margin-top:20px;
		color:white;
		background-color:rgb(52, 132, 146);
		border:none;
		font-size:20px;
		border-radius:20px;
	}
</style>
<section id="sellpage">
	<div id="title">
		중고 가구 판매 신청하기
	</div>
	<form action="${path}/" method="post">
	<div id="sellWrap">
		<div id="sellContent">
			<div class="sellRow">
				<div class="sellColLeft" style="border-radius:20px 0px 0px 0px;">
					카테고리 선택
				</div>
				<div class="sellColRight" style="border-radius:0px 20px 0px 0px;">
					<select id="item">
						<option>세부 항목을 선택해주세요.</option>
						<option>책장</option>
						<option>의자</option>
						<option>화장대</option>
						<option>침대</option>
						<option>서랍장</option>
						<option>책상</option>
						<option>소파</option>
						<option>옷장</option>
					</select>
				</div>	
			</div>
			<div class="sellRow">
				<div class="sellColLeft">
					크기 입력
				</div>
				<div class="sellColRight">
					<span style="margin-right:30px;">가로 <input type="number" name="widthes" style="width:50px" min="1"> cm</span>
					<span style="margin-right:30px;">세로 <input type="number" name="depthes" style="width:50px" min="1"> cm</span>
					<span>높이 <input type="number" name="heightes" style="width:50px" min="1"> cm</span>
				</div>		
			</div>
			<div class="sellRow">
				<div class="sellColLeft">
					색상 선택
				</div>
				<div class="sellColRight">
					<select id="color">
						<option>세부 항목을 선택해주세요.</option>
						<option>블랙</option>
						<option>화이트</option>
						<option>브라운</option>
						<option>그레이</option>
						<option>네이비</option>
						<option>레드</option>
						<option>옐로우</option>
						<option>그린</option>
						<option>블루</option>
						<option>퍼플</option>
					</select>
				</div>		
			</div>
			<div class="sellRow">
				<div class="sellColLeft">
					상태 선택
				</div>
				<div class="sellColRight">
					<select id="grade">
						<option>세부 항목을 선택해주세요.</option>
						<option>최상</option>
						<option>상</option>
						<option>중</option>
					</select>
				</div>		
			</div>
			<div class="sellRow">
				<div class="sellColLeft" style="height:250px !important;">
					사진 등록
				</div>
				<div class="sellColRight" style="height:250px !important;display:flex;">
					<div class="sellImageUpload">
						
					</div>
					<div class="sellImageUpload">
						
					</div>
				</div>		
			</div>
			<div class="sellRow">
				<div class="sellColLeft" style="height:110px !important;">
					참고사항 작성
				</div>
				<div class="sellColRight" style="height:110px !important;">
					<textarea cols="60" rows="6" style="resize:none"></textarea>
				</div>		
			</div>
			<div class="sellRow">
				<div class="sellColLeft" style="height:110px !important;">
					주소 입력
				</div>
				<div class="sellColRight" style="height:110px !important;">
					<div id="addressContainer">
						<input type="text" id="sample4_postcode" placeholder="우편번호" style="width:100px;">
						<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
						<input type="text" id="sample4_roadAddress" placeholder="도로명주소" style="width:210px;">
						<input type="text" id="sample4_jibunAddress" placeholder="지번주소" style="width:210px;">
						<span id="guide" style="color:#999;display:none"></span><br>
						<input type="text" id="sample4_detailAddress" placeholder="상세주소" style="width:210px;">
						<input type="text" id="sample4_extraAddress" placeholder="참고항목" style="width:210px;"> 
					</div>
				</div>		
			</div>
			<div class="sellRow">
				<div class="sellColLeft">
					희망수거일 입력
				</div>
				<div class="sellColRight">
					<input type="date">
				</div>		
			</div>
			<div class="sellRow">
				<div class="sellColLeft">
					판매희망금액
				</div>
				<div class="sellColRight">
					<input type="number" min="1"> &nbsp;원
				</div>		
			</div>
			<div class="sellRow">
				<div class="sellColLeft" style="height:80px !important;border-radius:0px 0px 0px 20px;">
					계좌번호 입력
				</div>
				<div class="sellColRight" style="height:80px !important;border-bottom: 1px solid black;border-radius:0px 0px 20px 0px;">
					<div id="accountContainer">
						은행명 : 
						<select id="bankName">
							<option>은행명 선택</option>
	                        <option value="7">국민은행</option>
	                        <option value="5">기업은행</option>
	                        <option value="15">농협중앙회</option>
	                        <option value="37">새마을금고</option>
	                        <option value="11">수협중앙회</option>
	                        <option value="60">신한은행</option>
	                        <option value="9">외환은행</option>
	                        <option value="19">우리은행</option>
	                        <option value="56">우체국</option>
	                        <option value="68">카카오뱅크</option>
	                        <option value="67">케이뱅크</option>
	                        <option value="59">하나은행</option>
	                        <option value="23">한국씨티은행</option>
	                        <option value="45">HSBC은행</option>
	                        <option value="21">SC제일은행</option>
						</select>
						예금주 : <input type="text" placeholder="예금주명 입력" style="width:100px">
						<br>
						계좌번호 : <input type="text" placeholder="계좌번호 입력" style="width:257px">
					</div>
				</div>		
			</div>
			<div class="sellRow" id="buttonContainer" style="dislpay:flex;justify-content:center;">
				<div>
					<input id="resellBtn" type="submit" value="제출하기">
				</div>
			</div>
		</div>
	</div>
	</form>
</section>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function sample4_execDaumPostcode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var roadAddr = data.roadAddress; // 도로명 주소 변수
	            var extraRoadAddr = ''; // 참고 항목 변수
	
	            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                extraRoadAddr += data.bname;
	            }
	            // 건물명이 있고, 공동주택일 경우 추가한다.
	            if(data.buildingName !== '' && data.apartment === 'Y'){
	               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	            }
	            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	            if(extraRoadAddr !== ''){
	                extraRoadAddr = ' (' + extraRoadAddr + ')';
	            }
	
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('sample4_postcode').value = data.zonecode;
	            document.getElementById("sample4_roadAddress").value = roadAddr;
	            document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
	            
	            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
	            if(roadAddr !== ''){
	                document.getElementById("sample4_extraAddress").value = extraRoadAddr;
	            } else {
	                document.getElementById("sample4_extraAddress").value = '';
	            }
	
	            var guideTextBox = document.getElementById("guide");
	            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
	            if(data.autoRoadAddress) {
	                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
	                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
	                guideTextBox.style.display = 'block';
	
	            } else if(data.autoJibunAddress) {
	                var expJibunAddr = data.autoJibunAddress;
	                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
	                guideTextBox.style.display = 'block';
	            } else {
	                guideTextBox.innerHTML = '';
	                guideTextBox.style.display = 'none';
	            }
	        }
	    }).open();
	}
</script>
</body>
</html>