<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/> 

<!-- css -->
<link rel="stylesheet" href="${path }/resources/css/common/index.css"/>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<section>
	<%-- <div>
		${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.memberId}
		${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.memberName}
		${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.email}
	</div> --%>
	<div class="flexDiv">
	    <img src="${path }/resources/images/mainpage/mainPicture.jpg" class="mainSize">
	</div>
	
	<div id="iconDiv" class="flexDiv">
		<div class="mainSize" id="iconContainer">
			<div class="icon" onclick="fn_selectItem(event);">
				<img src="${path }/resources/images/mainpage/전체.png">
				<p>전체</p>
			</div>
			<div class="icon" onclick="fn_selectItem(event);">
				<img src="${path }/resources/images/mainpage/책장.png">
				<p>책장</p>
			</div>
			<div class="icon" onclick="fn_selectItem(event);">
				<img src="${path }/resources/images/mainpage/의자.png">
				<p>의자</p>
			</div>
			<div class="icon" onclick="fn_selectItem(event);">
				<img src="${path }/resources/images/mainpage/화장대.png">
				<p>화장대</p>
			</div>
			<div class="icon" onclick="fn_selectItem(event);">
				<img src="${path }/resources/images/mainpage/침대.png">
				<p>침대</p>
			</div>
			<div class="icon" onclick="fn_selectItem(event);">
				<img src="${path }/resources/images/mainpage/서랍장.png">
				<p>서랍장</p>
			</div>
			<div class="icon" onclick="fn_selectItem(event);">
				<img src="${path }/resources/images/mainpage/책상.png">
				<p>책상</p>
			</div>
			<div class="icon" onclick="fn_selectItem(event);">
				<img src="${path }/resources/images/mainpage/쇼파.png">
				<p>소파</p>
			</div>
			<div class="icon" onclick="fn_selectItem(event);">
				<img src="${path }/resources/images/mainpage/옷장.png">
				<p>옷장</p>
			</div>
		</div>
	</div>
	<br><br>
	
	<input type="text" name="item" value="전체" hidden>
	
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
			<div class="select" tabindex="1" onchange="fn_changeSort();">
		        <input class="selectopt" name="sort" value="최근등록일순" type="radio" id="opt0" checked>
		        <label for="opt0" class="option">🏳‍🌈 최근등록일순</label>
		        <input class="selectopt" name="sort" value="금액낮은순" type="radio" id="opt1">
		        <label for="opt1" class="option">🏁 금액 낮은순</label>
		        <input class="selectopt" name="sort" value="금액높은순" type="radio" id="opt2">
		        <label for="opt2" class="option">🏴 금액 높은순</label>
		    </div>
		</div>
	</div>
	
	
	<div id="checkDiv" style="display: none">
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
				<li><label><input type="checkbox" name="grade" value="최상" checked> 최상</label></li>
				<li><label><input type="checkbox" name="grade" value="상" checked> 상</label></li>
				<li><label><input type="checkbox" name="grade" value="중" checked> 중</label></li>
			</ul>
		</div>
		<hr>
		
		<div class="container">
			<h5>[가로사이즈]</h5>
			<ul class="list">	
				<li><label><input type="radio" name="width" value="1000" > ~100cm</label></li>
				<li><label><input type="radio" name="width" value="1200" > ~120cm</label></li>
				<li><label><input type="radio" name="width" value="1400" > ~140cm</label></li>
				<li><label><input type="radio" name="width" value="1600" > ~160cm</label></li>
				<li><label><input type="radio" name="width" value="1800" > ~180cm</label></li>
				<li><label><input type="radio" name="width" value="2000" > ~200cm</label></li>
				<li><label><input type="radio" name="width" value="2010" > 201cm~</label></li>
				<li><label><input type="radio" name="width" value="전체" checked> 전체</label></li>
			</ul>
		</div>
		
		<div id="checkBtn"> 
			<input type="button" onclick="fn_reset();" value="초기화">
			<input type="button" onclick="fn_paging(1);" value="적용">
		</div>
	</div>	
	<br><br><br>

	<script>
		//조건검색 슬라이드
		 $("#slidebtn").click(e=>{
	        $("#checkDiv").slideToggle(500);
	    });
		
		//색깔 최소 한개 선택 (0개선택 X)
		const color = $("input[name=color]");
		color.change(e=>{
			if(color.eq(0).prop("checked")==false 
				&& color.eq(1).prop("checked")==false 
				&& color.eq(2).prop("checked")==false 
				&& color.eq(3).prop("checked")==false 
				&& color.eq(4).prop("checked")==false 
				&& color.eq(5).prop("checked")==false 
				&& color.eq(6).prop("checked")==false 
				&& color.eq(7).prop("checked")==false 
				&& color.eq(8).prop("checked")==false 
				&& color.eq(9).prop("checked")==false){
					
				$(e.target).prop("checked",true);
			}
		});
		
		//소재 최소 한개 선택(0개 선택 X)
		const material = $("input[name=material]");
		material.change(e=>{
			if(material.eq(0).prop("checked")==false
				&& material.eq(1).prop("checked")==false
				&& material.eq(2).prop("checked")==false
				&& material.eq(3).prop("checked")==false
				&& material.eq(4).prop("checked")==false
				&& material.eq(5).prop("checked")==false
				&& material.eq(6).prop("checked")==false
				&& material.eq(7).prop("checked")==false){
					
				$(e.target).prop("checked",true);
			}
				
		});
	
		//등급 최소 한개 선택 (0개선택 X)
		const grade = $("input[name=grade]");
		grade.change(e=>{
			if(grade.eq(0).prop("checked")==false 
				&& grade.eq(1).prop("checked")==false 
				&& grade.eq(2).prop("checked")==false){
				
				$(e.target).prop("checked",true);
			}
		});
		
		//초기화 버튼
		const fn_reset=()=>{
			color.prop("checked",true);
			material.prop("checked",true);
			grade.prop("checked",true);
			$("input[name=width]").eq(7).prop("checked",true);
		}
		
		//카테고리 이미지 클릭시 클릭한 item 값 넘겨주면서 ajax에 데이터 넘겨주기
		const fn_selectItem=(e)=>{
			let item = $(e.target).parents(".icon").children("p").text();
			$("input[name=item]").val(item);
			fn_paging(1);
		}
		
		//정렬 selectbox 변경할때마다 ajax 구동
		const fn_changeSort=()=>{
			fn_paging(1);			
		}
		
			
		//조건에 따라 제품출력하는 ajax
//		const fn_printProductList=(cPage=1,numPerpage=10)=>{
		const fn_printProductList=(cPage=1)=>{
			$("#checkDiv").slideUp(200);
			
			let colorArr = [];
			$.each($("input[name=color]:checked"), function(i,v){
				colorArr[i] = $(v).val(); 	
			});
			
			let materialArr = [];
			$.each($("input[name=material]:checked"), function(i,v){
				materialArr[i] = $(v).val(); 	
			});
			let gradeArr = [];
			$.each($("input[name=grade]:checked"), function(i,v){
				gradeArr[i] = $(v).val(); 	
			});
			let item = $("input[name=item]").val();
			let width = $("input[name='width']:checked").val(); 
			let sort = $("input[name='sort']:checked").val();
			
			$.ajax({
				url : "${path}/product/productList.do",
				type : "post",
				//controller에서 map으로 데이터를 받을때 배열은 못 받기때문에 
				//contentType:"application/json"와 data에 JSON.stringify 추가
				contentType:"application/json",
				data :	JSON.stringify({
					cPage:cPage,
					//numPerpage:numPerpage,
					color: colorArr, 
					material: materialArr, 
					grade: gradeArr, 
					item: item, 
					width: width, 
					sort: sort}),
				success : list =>{
					console.log(list);
					$("#productContainer").html("");
					if(list==""){
						$("#productContainer").html("<h1 style='color: grey; text-align: center;'>조건에 맞는 가구가 없습니다.</h1>");
					}
					
					//list.forEach(e=>{})
					for(let i=0; i<list.length; i++){
						let productWrap = $("<div>").addClass("productWrap");
						let productNo = $("<input>").attr("type","number").attr("name","productNo")
										.attr("value",list[i].productNo).attr("readonly",true);
						let showProduct = $("<div>").addClass("showProduct");
						
						let imgDiv = $("<div>").addClass("imgDiv")
									.append($("<img>").attr("src","${path }/resources/upload/product/"+list[i].files[0].renamedFileName));
						//imgDiv.append($("<img>").attr("src","${path}/resources/images/product/soldOutEasy.png").addClass("showProduct"))
						
						let infoDiv = $("<div>").addClass("infoDiv");
						let productTitle = $("<div>").addClass("productTitle")
										.html("<span>"+list[i].title+"</span>");
						let grade = $("<div>").addClass("grade")
									.html("<span>등급 : </span><span>"+list[i].grade+"</span>");
						let size = $("<div>").addClass("size")
									.html("<span>"+list[i].widths+"</span><span>mm</span><span> * </span><span>"
											+list[i].depths+"</span><span>mm</span><span> * </span><span>"+list[i].heights
											+"</span><span>mm</span>");
						let price = $("<div>").addClass("price")
									.html("<span>"+list[i].price+"</span><span>원</span>");
						let date = $("<div>").addClass("date")
									.append($("<span>")).text(list[i].productEnrollDate);
						
						
						productWrap.append(productNo).append(showProduct);
						showProduct.append(imgDiv).append(infoDiv);
						infoDiv.append(productTitle).append(grade).append(size).append(price).append(date);
						
						//생성된 태그에 이벤트 걸어서 제품 div 클릭시 상세페이지로 연결
						productWrap.on("click",function(e){
							console.log($(e.target).parents(".productWrap").children(".showProduct").prev().val());
							let productNo = $(e.target).parents(".productWrap").children(".showProduct").prev().val();
							location.assign("${path}/product/view.do?productNo="+productNo);
						});
						
						$("#productContainer").append(productWrap);
					}
				}
			});
		}
		
		//페이징 ajax
		function fn_paging(cPage=1){
			//매물 조회에 필요한 value값 저장하는 변수들
			let colorArr = [];
			$.each($("input[name=color]:checked"), function(i,v){
				colorArr[i] = $(v).val(); 	
			});
			
			let materialArr = [];
			$.each($("input[name=material]:checked"), function(i,v){
				materialArr[i] = $(v).val(); 	
			});
			let gradeArr = [];
			$.each($("input[name=grade]:checked"), function(i,v){
				gradeArr[i] = $(v).val(); 	
			});
			let item = $("input[name=item]").val();
			let width = $("input[name='width']:checked").val(); 
			let sort = $("input[name='sort']:checked").val();
			
			$.ajax({
				url : "${path}/product/page.do",
				type : "post",
				tradtional:true,
				contentType:"application/json",
				data :JSON.stringify({
					cPage:cPage,
					//numPerpage:numPerpage,
					color: colorArr, 
					material: materialArr, 
					grade: gradeArr, 
					item: item, 
					width: width, 
					sort: sort 
					}),
				success : data =>{
					fn_printProductList(cPage);
					//console.log(data);
					$("#pagebar").html(data);
				}
			});
		}
	</script>
	
	<div id="pro" style="display:flex; justify-content:center;">
		<div id="productContainer">
		
		<!-- $(v).next().next().find(".imgDiv").find("#img")-->
			<c:forEach items="${productList}" var="product">
				<div class="productWrap" >
					<input type="text" class="productSoldOutState" value="${product.soldOutState }">
	                <input type="number" name="productNo" id="productNo" value="${product.productNo }" readonly>
	                
	                <div class="showProduct">
		                <div class="imgDiv">
		                    <img id="img" src="${path}/resources/upload/product/${product.files[0].renamedFileName}" alt="">
		                    <img class="soldOutImage" src="${path}/resources/images/product/soldOutEasy.png">
		                </div>
		                
		                <div class="infoDiv">
		                    <div class="productTitle">
		                    	<span>${product.title}</span>
		                    </div>
		                    <div class="grade">
		                    	<span>등급 : </span>
		                    	<span>${product.grade}</span>
		                    </div>
		                    <div class="size">
		                    	<span>${product.widths}</span>
		                    	<span>mm</span>
		                    	<span> * </span>
		                    	<span>${product.depths}</span>
		                    	<span>mm</span>
		                    	<span> * </span>
		                    	<span>${product.heights}</span>
		                    	<span>mm</span>
		                    </div>
		                    <div class="price">
		                    	<span><c:out value="${product.price}"/></span>
		                    	<%-- <span><fmt:formatNumber value="${product.price}" type="currency"/></span> --%>
		                    	<span>원</span>
		                    </div>
		                    <div class="date">
		                    	<span><fmt:formatDate value="${product.productEnrollDate}" type="date" pattern="yyyy-MM-dd(E)"/></span>
		                    </div>
		                </div>
	                </div> 
	            </div>
            </c:forEach>
            
            <br><br>
		</div>
	</div>
	
	<div id="pagebarDiv">
		<div id="pagebar" >
			${pageBar}
		</div>
    </div>	
	
</section>
	<script>
		//이미지 soldout 처리하기
		$('.productSoldOutState').each (function (i,v){
			//console.log($(v).val());			
			if($(v).val()=='I' || $(v).val()=='Y'){
				//console.log($(v).next().next().find(".imgDiv").find(".soldOutImage"));
				
				$(v).next().next().find(".imgDiv").find("#img").css('filter','blur(2px)');
				$(v).next().next().find(".imgDiv").find("#img").css('-webkit-filter','blur(4px)');
				$(v).next().next().find(".imgDiv").find(".soldOutImage").show();
				
			}
			else{
				$(v).next().next().find(".imgDiv").find(".soldOutImage").hide(); 	
			} 
		});
		
		//매물정보 클릭시 상세페이지로 이동
		$(".productWrap").on("click",function(e){
			console.log($(e.target).parents(".productWrap").children(".showProduct").prev().val());
			let productNo = $(e.target).parents(".productWrap").children(".showProduct").prev().val();
			location.assign("${path}/product/view.do?productNo="+productNo);
		});
	</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>