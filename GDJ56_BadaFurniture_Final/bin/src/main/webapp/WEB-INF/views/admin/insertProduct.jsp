<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${path }/resources/css/admin/insertProduct.css"/>

<jsp:include page="/WEB-INF/views/common/adminHeader.jsp"/>

<section>
    <div id="divTop">
        <div id="title_container">            
            <h1>가구 올리기</h1>
        </div>        
    </div>
    <div id="divOuter1">
        <div id="divOuter2">    
            <div id="divMid">
                <form name="productFrm" action="${path }/admin/insertEnd.do" method="post" enctype="multipart/form-data">
                    <div id="divContent">            
                        <span>상품명</span>
                        <input type="text" name="title" placeholder="상품명" required><br>

                        <span>가격</span>
                        <input type="text" name="price" placeholder="가격" required><br>

                        <span>분류</span>
                        <select name="item" required>
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
                        <select name="grade" required>
                            <option value="최상">최상</option>
                            <option value="상">상</option>
                            <option value="중">중</option>
                        </select>
                        <br>
                        
                        <span>소재</span>
                        <select name="material" required>
                            <option value="철제">철제</option>
                            <option value="플라스틱">플라스틱</option>
                            <option value="합판">합판</option>
                            <option value="원목">원목</option>
                            <option value="가죽">가죽</option>
                            <option value="패브릭">패브릭</option>
                            <option value="메쉬">메쉬</option>
                            <option value="유리">유리</option>
                        </select>
                        <br>

                        <span>크기</span>
                        <span style="width:50px">가로</span>
                        <input type="number" name="widths" placeholder="가로" style="width:350px" required>&nbsp;&nbsp;mm<br>
                        
                        <span>&nbsp;&nbsp;</span>
                        <span style="width:50px">세로</span>
                        <input type="number" name="depths" placeholder="세로" style="width:350px" required>&nbsp;&nbsp;mm<br>
                        
                        <span>&nbsp;&nbsp;</span>
                        <span style="width:50px">높이</span>
                        <input type="number" name="heights" placeholder="높이" style="width:350px" required>&nbsp;&nbsp;mm
                        <br>

                        <span>색상</span>
                        <select name="color" required>
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
                            name="photo1" onclick="fn_upFile1();" width="180px" height="180px" class="fileImg">
                        <input type="file" id="photoFile1" name="upFile" style="display: none;" required>
                        <br>                
                        
                        <img src="${path }/resources/images/admin/addImage.png" 
                            name="photo2" onclick="fn_upFile2();" width="110px" height="110px" class="fileImg">
                        <input type="file" id="photoFile2" name="upFile" style="display: none;">

                        <img src="${path }/resources/images/admin/addImage.png" 
                            name="photo3" onclick="fn_upFile3();" width="110px" height="110px" class="fileImg">
                        <input type="file" id="photoFile3" name="upFile" style="display: none;">

                        <img src="${path }/resources/images/admin/addImage.png" 
                            name="photo4" onclick="fn_upFile4();" width="110px" height="110px" class="fileImg">
                        <input type="file" id="photoFile4" name="upFile" style="display: none;">

                        <img src="${path }/resources/images/admin/addImage.png" 
                            name="photo5" onclick="fn_upFile5();" width="110px" height="110px" class="fileImg">
                        <input type="file" id="photoFile5" name="upFile" style="display: none;">           

                        <br>
                        <span>상세 내용</span><br>
                        <textarea name="detail" cols="73" rows="10" style="resize:none;margin-left: 15px;" required></textarea>
                        <br>
                    </div>
                    <div id="divBtn">
                        <button id="insertBtn">가구 올리기</button>
                    </div>        
                </form>
            </div>
        </div>    
    </div>


</section>
</body>
</html>
<script>
    //메인 사진 업로드 (1)
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
    
    //추가 사진 업로드 (2)
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

    //추가 사진 업로드 (3)
    const fn_upFile3=()=>{
        $("#photoFile3").click();
    }

    $("#photoFile3").change(e=>{
        const reader = new FileReader();
        reader.onload = e =>{
            $("img[name=photo3]").attr("src",e.target.result);
        }
		if(e.target.value.length == 0){
			$("img[name=photo3]").attr("src","${path}/resources/images/admin/addImage.png");
		} else {
			reader.readAsDataURL(e.target.files[0]);  
		} 
    });   

    //추가 사진 업로드 (4)
    const fn_upFile4=()=>{
        $("#photoFile4").click();
    }

    $("#photoFile4").change(e=>{
        const reader = new FileReader();
        reader.onload = e =>{
            $("img[name=photo4]").attr("src",e.target.result);
        }
		if(e.target.value.length == 0){
			$("img[name=photo4").attr("src","${path}/resources/images/admin/addImage.png");
		} else {
			reader.readAsDataURL(e.target.files[0]);  
		}   
    });   

    //추가 물품사진 업로드 (5)
    const fn_upFile5=()=>{
        $("#photoFile5").click();
    }

    $("#photoFile5").change(e=>{
        const reader = new FileReader();
        reader.onload = e =>{
            $("img[name=photo5]").attr("src",e.target.result);
        }
		if(e.target.value.length == 0){
			$("img[name=photo5]").attr("src","${path}/resources/images/admin/addImage.png");
		} else {
			reader.readAsDataURL(e.target.files[0]);  
		}
    });   

    //

</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>