<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<c:set var="loginMember" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/> 

<!-- 주소검색 api -->
<!-- <script src="http://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> -->
<!-- <script src="https://ssl.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js?autoload=false"></script> -->
<script src = "https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>

<!-- css -->
<link rel="stylesheet" href="${path }/resources/css/member/updateMember.css"/>

<div class="flexDiv" style="justify-content: center;">
    <h1 style="color: #348492; font-size: 40px;">정보수정</h1>
</div>
<br>

<div class="flexDiv" style="justify-content: center;">
    <div id="enrollDiv">
        <form action="${path}/member/updateMemberEnd.do" method="post">
            <br>
            <div class="flexDiv" style="justify-content: center;">
                <div style="border: 1px solid grey; width: 80%;">
                    <h5> ❗ 아이디와 이메일은 변경 불가합니다</h5>
                </div>
            </div>
            <br>
            
            <div class="flexDiv" style="justify-content: center;">
                <div id="inputDiv">
          	<div class="flexDiv">
                  <img src="${path }/resources/images/member/아이디.png">
                  <div class="input-container">		
                      <input type="text" name="id" class="form__input" value="${loginMember.memberId}" readonly/>
                      <label class="form__label" id="idTxt">아이디</label>
                  </div>
              </div>
              <br>
              
                    <div class="flexDiv">
                        <img src="${path }/resources/images/member/메일.png">
                        <div class="input-container" >
                            <input type="email" name="email" id="email" class="form__input" value="${loginMember.email}" readonly/>
                            <label class="form__label" id="mailTxt">이메일</label>
                        </div>
                    </div>
                    
                    <br><br>
                    <div class="flexDiv" id="passwordbtn">
                    	<input type="button" value="비밀번호 변경" onclick="fn_updatePassword();">
                    </div>
                    <br><br>
                    
                    <script>
                     const fn_updatePassword=()=>{
             			//새창으로 패스워드 수정페이지 연결
             			open("${path}/member/updatePassword.do?userId=${loginMember.memberId!=null ? loginMember.memberId : ""}",
             					"_blank","width=400, height=260, left=500, top=200");
             		}
                    </script>
                    
                    <div class="flexDiv">
                        <img src="${path }/resources/images/member/이름.png">
                        <div class="input-container">		
                            <input type="text" name="memberName" class="form__input" value="${loginMember.memberName}" placeholder="이름" required/>
                            <label class="form__label">이름</label>
                        </div>
                    </div>
                    <br>
                    <div class="flexDiv">
                        <img src="${path }/resources/images/member/전화.png">
                        <div class="input-container">
                            <input type="text" name="phone" class="form__input" value="${loginMember.phone}" placeholder="전화번호(-포함)" required/>
                            <label class="form__label">전화번호</label>		
                        </div>
                    </div>
                    <br>
                    <div class="flexDiv">
                        <img src="${path }/resources/images/member/은행.png">
                        <div class="input-container" style="display: flex;">
							<select name="bank" id="bankName">
								<option value="">은행명 선택</option>
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
                            <input type="text" id="bank" name="bankName" class="form__input" value="${loginMember.bankName }" placeholder="거래은행" readonly/>
                        </div>
                    </div>
                    <br>
                    <script>
                    	$("#bankName").change(function(){
                    		//console.log($("#bankName").val());
                    		$("#bank").val($("#bankName").val());
                    	});
                    </script>
                    
                    <div class="flexDiv">
                        <img src="${path }/resources/images/member/계좌번호.png">
                        <div class="input-container">
                            <input type="text" name="accountCode" class="form__input" value="${loginMember.accountCode}" placeholder="계좌번호(-포함)"/>
                            <label class="form__label">계좌번호</label>		
                        </div>
                    </div>
                    <br>
                    
                    <div class="flexDiv">
                        <img src="${path }/resources/images/member/주소.png">
                        <input type="button" value="주소찾기" class="oribtn" onclick="sample5_execDaumPostcode()">
                    </div>
                    <br>
                    <div class="flexDiv">
                        <img src="${path }/resources/images/member/그림.png">
                        <div class="input-container">
                            <input type="text" id="postCode" name="postCode" class="form__input" value="${loginMember.postCode}" placeholder="우편번호" required/>
                            <label class="form__label">우편번호</label>		
                        </div>
                    </div>
                    <br>
                    <div class="flexDiv">
                        <img src="${path }/resources/images/member/그림.png">
                        <div class="input-container">
                            <input type="text" id="address" name="address" class="form__input" value="${loginMember.address}" placeholder="주소" required/>
                            <label class="form__label">주소</label>		
                        </div>
                    </div>
                    <br>
                    <div class="flexDiv">
                        <img src="${path }/resources/images/member/그림.png">
                        <div class="input-container">
                            <input type="text" name="detailAddress" class="form__input" value="${loginMember.detailAddress}" placeholder="상세주소"/>
                            <label class="form__label">상세주소</label>		
                        </div>
                    </div>
                </div>
            </div>
	
<script>
             function sample5_execDaumPostcode() {
                 new daum.Postcode({
                     oncomplete: function(data) {
                         addr = data.address; // 최종 주소 변수

                         // 주소 정보를 해당 필드에 넣는다.
                         document.getElementById("address").value = addr;
                         document.getElementById("postCode").value = data.zonecode;
                         
             			console.log(data);
             			console.log(addr);
                       	console.log(data.zonecode);
             			//console.log(data.jibunAddress);
             			//console.log(document.getElementById("sample5_address").value);
             			
                //geocoder.addressSearch(addr, callback); 
                     }
                 }).open();
             }
         </script>
			
			<input type="hidden" name="memberId" value="${loginMember.memberId }">
			
            <br><br><br>
            <div class="flexDiv" style="justify-content: center;">
                <button type="submit" class="btn">정보수정</button>
            </div>
            <br>
        </form>
    </div>
</div>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>