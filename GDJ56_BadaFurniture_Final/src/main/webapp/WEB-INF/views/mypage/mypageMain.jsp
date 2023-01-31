<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<style>
	section.mypage>div#title{
		width:100%;
		height:200px;
	}
	section.mypage>div#title>div#innerTitle{
		display:flex;
		align-items:center;
		justify-content:center;
		width:100%;
		height:200px;
		font-family:"Courier New";
		font-weight:bolder;
		font-size:50px;
	}
	div#mypageMenu{
		width:100%;
		height:660px;
		/* border:1px solid red; */
	}
	div#mypageMenu *{
		font-family: 'Nanum Gothic' !important;
	}
	div#mypageMenu>div.mypageRow{
		width:100%;
		height:212px;
		/* border:1px solid blue; */
		display:flex;
		justify-content:center;
	}
	div#mypageMenu>div.mypageRow>div.mypageCol{
		width:200px;
		height:200px;
		border:2px solid black;
		margin: 5px 3px 3px 5px;
		cursor:pointer;
	}
	div#mypageMenu>div.mypageRow>div.mypageCol>div.innerTitle1{
		text-align: center;
		font-family: "Verdana";
		font-size:25px;
		height:40px;
		padding-top:15px;
	}
	div#mypageMenu>div.mypageRow>div.mypageCol>div.innerTitle2{
		text-align:center;
		font-size:13px;
	}
	div#mypageMenu>div.mypageRow>div.mypageCol>div.innerImg{
		text-align:center;
		margin-top:8px;
		margin-bottom:8px;
	}
	div#mypageMenu>div.mypageRow>div.mypageCol>div.innerImg>img{
		width:60px;
		height:60px;
	}
	div#mypageMenu>div.mypageRow>div.mypageCol>div.innerContent{
		text-align:center;
		font-size:13px;
	}
	div#mypageMenu>div.mypageRow>div.mypageColEmpty{
		background-color:rgb(52, 132, 146);
		border:2px solid rgb(52, 132, 146);
		font-family:"Arial";
		color:white;
		font-weight:bolder;
		font-size:30px;
		display:flex;
		align-items:center;
		justify-content:center;
		width:200px;
		height:200px;
		margin: 5px 3px 3px 5px;
	}
</style>
	<section class="mypage">
		<div id="title">
			<div id="innerTitle">
				MyPage
			</div>
		</div>
		<div id="mypageMenu">
			<div class="mypageRow">
				<div class="mypageCol">
					<input type="hidden" value="/member/updateMember.do"/>
					<div class="innerTitle1">
						Edit
					</div>
					<div class="innerTitle2">
						회원 정보 수정
					</div>
					<div class="innerImg">
						<img src="${path}/resources/images/mypage/edit.png">
					</div>
					<div class="innerContent">
						고객님의 회원정보를
						<br>
						수정하실 수 있습니다.
					</div>
				</div>
				<div class="mypageCol">
					<input type="hidden" value="/mypage/alert.do"/>
					<div class="innerTitle1">
						Alert
					</div>
					<div class="innerTitle2">
						알림함
					</div>
					<div class="innerImg">
						<img src="${path}/resources/images/mypage/bell.png">
					</div>
					<div class="innerContent">
						알림 내역을
						<br>
						확인하실 수 있습니다.
					</div>
				</div>
				<div class="mypageCol">
					<input type="hidden" value="/mypage/cart.do"/>
					<div class="innerTitle1">
						Cart
					</div>
					<div class="innerTitle2">
						장바구니
					</div>
					<div class="innerImg">
						<img src="${path}/resources/images/mypage/shopping-cart.png">
					</div>
					<div class="innerContent">
						장바구니에 담긴 가구들을
						<br>
						확인하실 수 있습니다.
					</div>
				</div>
			</div>
			<div class="mypageRow">
				<div class="mypageCol">
					<input type="hidden" value="/mypage/order.do"/>
					<div class="innerTitle1">
						Order
					</div>
					<div class="innerTitle2">
						주문내역 조회
					</div>
					<div class="innerImg">
						<img src="${path}/resources/images/mypage/box.png">
					</div>
					<div class="innerContent">
						주문내역을
						<br>
						확인하실 수 있습니다.
					</div>
				</div>
				<div class="mypageCol">
					<input type="hidden" value="/mypage/refund.do"/>
					<div class="innerTitle1">
						Refund
					</div>
					<div class="innerTitle2">
						취소/반품내역 조회
					</div>
					<div class="innerImg">
						<img src="${path}/resources/images/mypage/return.png">
					</div>
					<div class="innerContent">
						고객님의 주문취소/반품내역을
						<br>
						확인하실 수 있습니다.
					</div>
				</div>
				<div class="mypageCol">
					<input type="hidden" value="/mypage/resell.do"/>
					<div class="innerTitle1">
						Resell
					</div>
					<div class="innerTitle2">
						내 가구 팔기 목록
					</div>
					<div class="innerImg">
						<img src="${path}/resources/images/mypage/files.png">
					</div>
					<div class="innerContent">
						판매 신청하신 가구 목록을
						<br>
						확인하실 수 있습니다.
					</div>
				</div>
			</div>
			<div class="mypageRow">
				<div class="mypageColEmpty">
					Bada
				</div>
				<div class="mypageColEmpty">
					Furniture
				</div>
				<div class="mypageCol">
					<input type="hidden" value="/mypage/quit.do"/>
					<div class="innerTitle1">
						Quit
					</div>
					<div class="innerTitle2">
						회원탈퇴
					</div>
					<div class="innerImg">
						<img src="${path}/resources/images/mypage/door.png">
					</div>
					<div class="innerContent">
						Bada Furniture를
						<br>
						탈퇴하실 수 있습니다.
					</div>
				</div>
			</div>
		</div>
	</section>
	<script>
		$("div.mypageCol").click(e=>{
			let mapping;
			if($(e.target).attr("class") != "mypageCol"){
				mapping = $(e.target).parents("div.mypageCol").children().first().val();
			} else {
				mapping = $(e.target).children().first().val();
			}
			//알림 페이지를 클릭했을 때, 알림 읽음처리 
			if(mapping == "/mypage/alert.do"){
				$.ajax({
					url:"${path}/alert/updateReadState.do"
				});
			}
			let url = "${path}" + mapping;
			location.assign(url);
		});
	</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>