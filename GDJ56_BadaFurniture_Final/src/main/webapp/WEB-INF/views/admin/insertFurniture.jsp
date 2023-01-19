<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/adminHeader.jsp"/>
<style>
/*     div{        
        border: 1px solid blue;
    } */
    canvas{
        border: 1px solid black;

    }
    body {
    
    }

    #divTop{
        display: flex;
        justify-content: center;
        justify-items: center;
        padding: 30px;
    }
    #divMid{
        display: flex;
        justify-content: center;
        justify-items: center;
        width: auto;
        padding: 10px;

    }
    #divMid *{
        display: inline-block;
        width: auto;
        padding: 10px;        
        margin-bottom: 15px;

    }
    #divBtn{
        display: flex;
        justify-content: center;
        justify-items: center;
        width: auto;
        padding: 10px;  
    }

    #divMid span{
        width:100px;
        font-size: 20px;
        font-weight: bold;

    }
    #divMid input{
        width:400px;

    }
    #divMid select{
        width:425px;

    }
    #insertBtn{
        width:400px;
        border-radius: 3px;
        background-color: #348492 ;
        border-style: none;
        color: white;
        font-size: 16px;
        font-weight: bold;
    }
	
	select{
		font-size: 16px;
	}
    button{
		cursor: pointer;
	}
    button:hover{
        box-shadow: 200px 0 0 0 rgba(0,0,0,0.25) inset, 
                   -200px 0 0 0 rgba(0,0,0,0.25) inset;
    }

    .fileImg:hover{
        cursor: pointer;
    } 


</style>
<section>
    <div id="divTop">
        <div id="title_container">            
            <h1>가구 올리기</h1>
        </div>        
    </div>
    <div id="divMid">
        <form action="" method="">
            <div id="divContent">            
                <span>상품명</span>
                <input type="text" placeholder="상품명"><br>

                <span>가격</span>
                <input type="text" placeholder="상품명"><br>

                <span>분류</span>
                <select name="item">
                    <option value="책상">책상</option>
                    <option value="의자">의자</option>
                    <option value="화장대">화장대</option>
                    <option value="침대">침대</option>
                    <option value="서랍장">서랍장</option>
                    <option value="책장">책장</option>
                    <option value="소파">소파</option>
                    <option value="옷장">옷장</option>
                </select>
                <br>

                <span>상태</span>
                <select>
                    <option value="최상">최상</option>
                    <option value="상">상</option>
                    <option value="중">중</option>
                </select>
                <br>
                
                <span>소재</span>
                <input type="text" placeholder="상품명"><br>

                <span>크기</span>
                <span style="width:50px">가로</span>
                <input type="number" placeholder="가로" style="width:325px">&nbsp;&nbsp;cm<br>
                
                <span>&nbsp;&nbsp;</span>
                <span style="width:50px">세로</span>
                <input type="number" placeholder="세로" style="width:325px">&nbsp;&nbsp;cm<br>
                
                <span>&nbsp;&nbsp;</span>
                <span style="width:50px">높이</span>
                <input type="number" placeholder="높이" style="width:325px">&nbsp;&nbsp;cm
                <br>

                <span>색상</span>
                <select>
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
                <br>
                <span>물품 사진</span>

                <br>
                <img src="${path }/resources/images/admin/addThumbnail.png" 
                    name="photo1" onclick="" width="180px" height="180px" class="fileImg">
                <input type="file" name="upFile1" style="display: none;">
                <br>
                <img src="${path }/resources/images/admin/addImage.png" 
                    name="photo2" onclick="" width="110px" height="110px" class="fileImg">
                <input type="file" name="upFile2" style="display: none;">
                <img src="${path }/resources/images/admin/addImage.png" 
                    name="photo3" onclick="" width="110px" height="110px" class="fileImg">
                <input type="file" name="upFile3" style="display: none;">
                <img src="${path }/resources/images/admin/addImage.png" 
                    name="photo4" onclick="" width="110px" height="110px" class="fileImg">
                <input type="file" name="upFile4" style="display: none;">
                <img src="${path }/resources/images/admin/addImage.png" 
                    name="photo5" onclick="" width="110px" height="110px" class="fileImg">
                <input type="file" name="upFile5" style="display: none;">           

                <br>
                <span>상세 내용</span><br>
                <textarea cols="70" rows="5" style="resize:none;margin-left: 15px;"></textarea>
                <br>
            </div>
            <div id="divBtn">
                <button id="insertBtn">가구 올리기</button>
            </div>        
        </form>
    </div>
        


</section>
</body>
</html>