<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet"> 
<style>
	section#sellpage * {
		font-family: 'Nanum Gothic' !important;
	}

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
		/* height:1000px; */ /* 수정요망 */
		display:flex;
		justify-content: center;
	}
	div#sellWrap>div#sellContent{
		width:618px; 
		/* height:1000px; */ /* 수정요망 */
		/* border: 2px solid red; */
	}
	div#sellWrap>div#sellContent>div.sellRow{
		display:flex;
	}
	div.sellRow>div.sellColLeft{
		width:170px;
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
		width:220px;
		height:220px;
		border: 2px solid rgb(52, 132, 146);
		margin-right:0px;
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
		font-size:25px;
		border-radius:20px;
		font-weight:bolder;
	}
</style>
<c:set var="loginMember" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal}"/>
<section id="sellpage">
	<div id="title">
		내 가구 판매 신청하기
	</div>
	<form action="${path}/resell/writeEnd.do" method="post" onsubmit="return checkSubmit();"  enctype="multipart/form-data">
	<div id="sellWrap">
		<input type="hidden" name="memberNo" value="${loginMember.memberNo}">
		<div id="sellContent">
			<div class="sellRow">
				<div class="sellColLeft" style="border-radius:20px 0px 0px 0px;">
					카테고리 선택
				</div>
				<div class="sellColRight" style="border-radius:0px 20px 0px 0px;">
					<select name="item">
						<option value="none">세부 항목을 선택해주세요.</option>
						<option value="책상">책상</option>
                        <option value="의자">의자</option>
                        <option value="화장대">화장대</option>
                        <option value="침대">침대</option>
                        <option value="서랍장">서랍장</option>
                        <option value="책장">책장</option>
                        <option value="소파">소파</option>
                        <option value="옷장">옷장</option>
					</select>
				</div>	
			</div>
			<div class="sellRow">
				<div class="sellColLeft">
					크기 입력
				</div>
				<div class="sellColRight">
					<span style="margin-right:30px;">가로 <input type="number" name="widths" style="width:50px" min="1"> mm</span>
					<span style="margin-right:30px;">세로 <input type="number" name="depths" style="width:50px" min="1"> mm</span>
					<span>높이 <input type="number" name="heights" style="width:50px" min="1"> mm</span>
				</div>		
			</div>
			<div class="sellRow">
				<div class="sellColLeft">
					색상 선택
				</div>
				<div class="sellColRight">
					<select name="color">
						<option value="none">세부 항목을 선택해주세요.</option>
						<option value="블랙">블랙</option>
                        <option value="화이트">화이트</option>
                        <option value="브라운">브라운</option>
                        <option value="그레이">그레이</option>
                        <option value="네이비">네이비</option>
                        <option value="레드">레드</option>
                        <option value="옐로우">옐로우</option>
                        <option value="그린">그린</option>
                        <option value="블루">블루</option>
                        <option value="퍼플">퍼플</option>
					</select>
				</div>		
			</div>
			<div class="sellRow">
				<div class="sellColLeft">
					상태 선택
				</div>
				<div class="sellColRight">
					<select name="grade">
						<option value="none">세부 항목을 선택해주세요.</option>
						<option value="최상">최상</option>
                        <option value="상">상</option>
                        <option value="중">중</option>
					</select>
				</div>		
			</div>
			<div class="sellRow">
				<div class="sellColLeft" style="height:250px !important;">
					사진 등록
				</div>
				<div class="sellColRight" style="height:250px !important;display:flex;">
					<div class="sellImageUpload">
						<img src="${path }/resources/images/admin/addImage.png" 
                            name="photo1" onclick="fn_upFile1();" width="100%" height="100%" style="cursor:pointer;">
                        <input type="file" id="photoFile1" name="upFile" accept="image/jpeg, image/png" style="display: none;">
					</div>
					<div class="sellImageUpload" style="border-left:0px;">
						<img src="${path }/resources/images/admin/addImage.png" 
                            name="photo2" onclick="fn_upFile2();" width="100%" height="100%" style="cursor:pointer;">
                        <input type="file" id="photoFile2" name="upFile" accept="image/jpeg, image/png" style="display: none;">
					</div>
				</div>		
			</div>
			<div class="sellRow">
				<div class="sellColLeft" style="height:110px !important;">
					참고사항 작성
				</div>
				<div class="sellColRight" style="height:110px !important;">
					<textarea cols="58" rows="6" style="resize:none" name="detail"></textarea>
				</div>		
			</div>
			<div class="sellRow">
				<div class="sellColLeft" style="height:110px !important;">
					주소 입력
				</div>
				<div class="sellColRight" style="height:110px !important;">
					<div id="addressContainer">
						<input type="text" id="sample6_postcode" placeholder="우편번호" style="width:100px;"name="postCode" disabled>
						<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" style="cursor:pointer;"><br>
						<input type="text" id="sample6_address" placeholder="주소" style="width:435px;"name="address" disabled><br>
						<input type="text" id="sample6_detailAddress" placeholder="상세주소" style="width:210px;"name="addressDetail">
						<input type="hidden" id="sample6_extraAddress" placeholder="참고항목" style="width:210px;"name="addressExtra" disabled>
					</div>
				</div>		
			</div>
			<div class="sellRow">
				<div class="sellColLeft">
					희망수거일 입력
				</div>
				<div class="sellColRight">
					<input type="date" name="pickUpDate"> 
					<span style="margin-left:10px;color:grey;font-size:13px;">
						* 희망수거일은 7일 이후부터 선택할 수 있습니다.
					</span>
				</div>		
			</div>
			<div class="sellRow">
				<div class="sellColLeft">
					판매희망금액
				</div>
				<div class="sellColRight">
					<input type="number" min="1" name="hopePrice"> &nbsp;원
				</div>		
			</div>
			<div class="sellRow">
				<div class="sellColLeft" style="height:80px !important;border-radius:0px 0px 0px 20px;">
					계좌번호 입력
				</div>
				<div class="sellColRight" style="height:80px !important;border-bottom: 1px solid black;border-radius:0px 0px 20px 0px;">
					<div id="accountContainer">
						은행명 : 
						<select name="bankName">
							<option value="none">은행명 선택</option>
	                        <option value="국민은행">국민은행</option>
	                        <option value="기업은행">기업은행</option>
	                        <option value="농협중앙회">농협중앙회</option>
	                        <option value="새마을금고">새마을금고</option>
	                        <option value="수협중앙회">수협중앙회</option>
	                        <option value="신한은행">신한은행</option>
	                        <option value="외환은행">외환은행</option>
	                        <option value="우리은행">우리은행</option>
	                        <option value="우체국">우체국</option>
	                        <option value="카카오뱅크">카카오뱅크</option>
	                        <option value="케이뱅크">케이뱅크</option>
	                        <option value="하나은행">하나은행</option>
	                        <option value="한국씨티은행">한국씨티은행</option>
	                        <option value="HSBC은행">HSBC은행</option>
	                        <option value="SC제일은행">SC제일은행</option>
						</select>
						예금주 : <input type="text" placeholder="예금주명 입력" style="width:100px"name="depositorName">
						<br>
						계좌번호 : <input type="text" placeholder="계좌번호 입력" style="width:257px"name="accountCode">
					</div>
				</div>		
			</div>
			<div class="sellRow" id="buttonContainer" style="dislpay:flex;justify-content:center;">
				<div>
					<input id="resellBtn" type="submit" value="신청하기" style="cursor:pointer;">
				</div>
			</div>
		</div>
	</div>
	</form>
</section>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	$(()=>{
		// 지금 날짜 + 7일*24시간*60분*60초*1000ms로 세팅
		var now_utc = Date.now() + 7*24*60*60*1000;
		// getTimezoneOffset()은 위 시간과의 차이를 분 단위로 반환
		var timeOff = new Date().getTimezoneOffset()*60000; 
		var sevenAfterDay = new Date(now_utc-timeOff).toISOString().split("T")[0];
		$("input[name=pickUpDate]").attr("min",sevenAfterDay);
	});

	// onsubmit 함수
	const checkSubmit = () => {
		console.log($("input[name=upFile]").length);
		if($("select[name=item]").val()=='none'){
			alert("카테고리를 선택해주세요.");
			return false;
		} else if($("input[name=widths]").val()==''){
			alert("가로 길이를 입력해주세요.");
			return false;
		} else if($("input[name=depths]").val()==''){
			alert("세로 길이를 입력해주세요.");
			return false;
		} else if($("input[name=heights]").val()==''){
			alert("높이를 입력해주세요.");
			return false;
		} else if($("select[name=color]").val()=='none'){
			alert("색상을 선택해주세요.");
			return false;
		} else if($("select[name=grade]").val()=='none'){
			alert("상태를 선택해주세요.");
			return false;
		} else if($("input[name=upFile]").first().val()=='' ||$("input[name=upFile]").last().val()==''){
			alert("사진을 2장 업로드 해주세요.");
			return false;
		} else if($("textarea[name=detail]").val()=='') {
			alert("참고사항을 작성해주세요.");	
			return false;
		} else if($("input[name=postCode]").val()=='') {
			alert("주소를 입력해주세요.");
			return false;
		} else if($("input[name=pickUpDate]").val()==''){
			alert("희망수거일을 입력해주세요.");
			return false;
		} else if($("input[name=hopePrice]").val()==''){
			alert("판매희망금액을 입력해주세요.");
			return false;
		} else if($("select[name=bankName]").val()=='none') {
			alert("은행명을 선택해주세요.");
			return false;
		} else if($("select[name=depositorName]").val()==''){
			alert("예금주를 입력해주세요.");
			return false;
		} else if($("input[name=accountCode]").val()==''){
			alert("계좌번호를 입력해주세요.");
			return false;
		}
		$("input[name=postCode]").attr("disabled", false);
		$("input[name=address]").attr("disabled", false);
		return true;
	}
	
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
    
    //사진 추가 이미지를 클릭했을 때
    const fn_upFile1=()=>{
        $("#photoFile1").click();
    }

    $("#photoFile1").change(e=>{
        const reader = new FileReader();
        reader.onload = e =>{
            $("img[name=photo1]").attr("src",e.target.result);
        } 
		if(e.target.value.length == 0){
			$("img[name=photo1]").attr("src","${path}/resources/images/admin/addImage.png");
		} else {
			reader.readAsDataURL(e.target.files[0]);  
		}
    });
    
  //사진 추가 이미지를 클릭했을 때
    const fn_upFile2=()=>{
        $("#photoFile2").click();
    }

    $("#photoFile2").change(e=>{
    	const reader = new FileReader();
        reader.onload = e =>{
            $("img[name=photo2]").attr("src",e.target.result);
        } 
		if(e.target.value.length == 0){
			$("img[name=photo2]").attr("src","${path}/resources/images/admin/addImage.png");
		} else {
			reader.readAsDataURL(e.target.files[0]);  
		}  
    });
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
