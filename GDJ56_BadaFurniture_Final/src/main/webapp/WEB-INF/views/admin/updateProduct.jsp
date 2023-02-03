<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/adminHeader.jsp"/>
<link rel="stylesheet" href="${path }/resources/css/admin/updateProduct.css"/>

<section>
    <div id="divTop">
        <div id="title_container">            
            <h1>가구 수정하기</h1>
        </div>        
    </div>
    <div id="divOuter1">
        <div id="divOuter2">   
            <div id="divMid">
                <form action="${path}/admin/updateEnd.do" method="post">
                    <div id="divContent">            
                        <span>가구번호</span>
                        <input type="text" name="productNo" style="border-style: none;" value="${product.productNo}" readonly><br>

                        <span>상품명</span>
                        <input type="text" name="title" placeholder="상품명" value="${product.title}" required><br>

                        <span>가격</span>
                        <input type="number" name="price" id="price" placeholder="가격" value="${product.price}" required><br>

                        <span>분류</span>
                        <select name="item" required>
                            <option value="책상" ${fn:contains(product.item,'책상')?"selected":""}>책상</option>
                            <option value="의자" ${fn:contains(product.item,'의자')?"selected":""}>의자</option>
                            <option value="화장대" ${fn:contains(product.item,'화장대')?"selected":""}>화장대</option>
                            <option value="침대" ${fn:contains(product.item,'침대')?"selected":""}>침대</option>
                            <option value="서랍장" ${fn:contains(product.item,'서랍장')?"selected":""}>서랍장</option>
                            <option value="소파" ${fn:contains(product.item,'소파')?"selected":""}>소파</option>
                        </select>
                        <br>

                        <span>상태</span>
                        <select name="grade" required>
                            <option value="최상" ${fn:contains(product.grade,'최상')?"selected":""}>최상</option>
                            <option value="상" ${fn:contains(product.grade,'상')?"selected":""}>상</option>
                            <option value="중" ${fn:contains(product.grade,'중')?"selected":""}>중</option>
                        </select>
                        <br>
                        
                        <span>소재</span>
                        <select name="material" required>
                            <option value="철제" ${fn:contains(product.material,'철제')?"selected":""}>철제</option>
                            <option value="원목" ${fn:contains(product.material,'원목')?"selected":""}>원목</option>
                            <option value="가죽" ${fn:contains(product.material,'가죽')?"selected":""}>가죽</option>
                            <option value="패브릭" ${fn:contains(product.material,'패브릭')?"selected":""}>패브릭</option>
                            <option value="메쉬" ${fn:contains(product.material,'메쉬')?"selected":""}>메쉬</option>
                            <option value="유리" ${fn:contains(product.material,'유리')?"selected":""}>유리</option>
                        </select>
                        <br>
                        <span>크기</span> 
                        <span style="width:50px">가로</span>
                        <input type="number" name="widths" placeholder="가로" style="width:325px" value="${product.widths}" required>&nbsp;&nbsp;mm<br>
                        
                        <span>&nbsp;&nbsp;</span>
                        <span style="width:50px">세로</span>
                        <input type="number" name="depths" placeholder="세로" style="width:325px" value="${product.depths}" required>&nbsp;&nbsp;mm<br>
                        
                        <span>&nbsp;&nbsp;</span>
                        <span style="width:50px">높이</span>
                        <input type="number" name="heights" placeholder="높이" style="width:325px" value="${product.heights}"  required>&nbsp;&nbsp;mm
                        <br>

                        <span>색상</span>
                        <select name="color" required>
                            <option value="블랙" ${fn:contains(product.color,'블랙')?"selected":""}>블랙</option>
                            <option value="화이트" ${fn:contains(product.color,'화이트')?"selected":""}>화이트</option>
                            <option value="브라운" ${fn:contains(product.color,'브라운')?"selected":""}>브라운</option>
                            <option value="그레이" ${fn:contains(product.color,'그레이')?"selected":""}>그레이</option>
                            <option value="네이비" ${fn:contains(product.color,'네이비')?"selected":""}>네이비</option>
                            <option value="레드" ${fn:contains(product.color,'레드')?"selected":""}>레드</option>
                            <option value="옐로우" ${fn:contains(product.color,'옐로우')?"selected":""}>옐로우</option>
                            <option value="그린" ${fn:contains(product.color,'그린')?"selected":""}>그린</option>
                            <option value="블루" ${fn:contains(product.color,'블루')?"selected":""}>블루</option>
                            <option value="퍼플" ${fn:contains(product.color,'퍼플')?"selected":""}>퍼플</option>
                        </select>
                        <br>
                        <span>물품 사진</span>

                        <br>
                        <img src="${path }/resources/upload/product/${product.files.get(0).renamedFileName}" 
                            name="photo1" width="180px" height="180px" class="fileImg" id="thumbTst">
                        <!-- <input type="file" name="upFile1" style="display: none;" required> -->
                        <br>                        
                        <c:forEach var="i" begin="1" end="4">
                            <c:if test="${product.files.size()>i}">
                                <img src="${path }/resources/upload/product/${product.files.get(i).renamedFileName}" 
                                name="photo2" width="110px" height="110px" class="fileImg">
                                <!-- <input type="file" name="upFile2" style="display: none;"> -->
                            </c:if>
                            <!-- <c:if test="${i>=product.files.size()}">
                                <img src="${path}/resources/images/admin/none.png" 
                                name="photo2" onclick="" width="110px" height="110px" class="fileImg">
                                <input type="file" name="upFile2" style="display: none;">
                            </c:if>  -->
                        </c:forEach>

                        
                        <br>
                        <span>상세 내용</span><br>
                        <textarea name="detail" cols="73" rows="10" style="resize:none;margin-left: 15px;" required>${product.detail}</textarea>
                        <br>
                    </div>
                    <div id="divBtn">
                        <button id="updateBtn">가구 수정하기</button>
                    </div>        
                </form>
         </div>
     </div>    
    </div>        


</section>
</body>
</html>
<script>


</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>