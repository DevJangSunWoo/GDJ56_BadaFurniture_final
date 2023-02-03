var Order = new function()
{
	this.id	 			= 'orderform';
	this.offset			= null;
	this.isPreVirtualOrderData = false;
	this.isLogin = false;

	this.viewCouponPop = function()
	{
		window.open( "/app/order/order_coupon/1", "coupon_view","status = 0, height = 515, width = 900, resizable = 1,scrollbars = 1" );
	};

	this.showInterestBenefitInfo = function()
	{
		var div_id = "interest_benefit_info";
		var service_url = "/app/order/interest_benefit_info";

		window.open(service_url, div_id, "status = 0, height = 1016, width = 680, resizable = 1, scrollbars = 1");
	};
	
	this.getPayAmt = function() 
	{
		var ff = document.f1;
		var guest = ff.guest.value;

		// 총 할인금액
		var total_pay_dc_amt = this.getPayDcAmt();

		// 상품금액(정상가)
		var total_normal_amt = $('#f1 [name=total_normal_add_opt_amt]').val();

		// 배송비
		var dlv_amt = document.getElementById("dlv_amt").childNodes[0].nodeValue;

		// 결제금액 : 정상가 + 배송비 - 할인금액
		var total_pay_amt = unComma(total_normal_amt) + unComma(dlv_amt) - total_pay_dc_amt;

		// 결제 수수료
		var pay_fee = this.getPayFee(total_pay_amt);

		// 총 결제금액 : 결제금액 + 결제 수수료
		total_pay_amt = total_pay_amt + pay_fee;

		return total_pay_amt;
	};

	this.getPayFee = function(total_pay_amt)
	{
		let payFee = 0;

		if (this.isNotMsspaySelected()) {
			const payKind = document.f1.pay_kind.value;
			if ($('#pay-fee-rate-' + payKind).length > 0) {
				const payFeeRate = $('#pay-fee-rate-' + payKind).val();
				payFee = total_pay_amt * payFeeRate / 100;
				payFee = ceil(payFee, 1);
			}
		}

		document.getElementById('pay_fee').innerHTML = Comma(payFee);
		return payFee;
	};

	this.checkIncludesDigitalProduct = function() {
		var cart_goods_info = $("input[name='cart_info'][type='hidden']");
		var goods_form_types = $("input[name='goods_form_type'][type='hidden']");
		var cart_goods_list = [];
		var digital_goods_list = [];

		for (var i = 0; i < cart_goods_info.length; i++) {
			var goods_no_sub_array = cart_goods_info[i].value.split('|');
			var goods_no_sub = goods_no_sub_array[0] + '_' + goods_no_sub_array[1];
			if (cart_goods_list.indexOf(goods_no_sub) < 0) {
				cart_goods_list.push(goods_no_sub);
				if (goods_form_types[i].value === 'DIGITAL_PRODUCT' && digital_goods_list.indexOf(goods_no_sub) < 0) {
					digital_goods_list.push(goods_no_sub);
				}
			}
		}

		if (cart_goods_list.length > 1 && digital_goods_list.length > 0) {
			// 상품 품목이 2개 이상이고 무형상품 1개 이상 포함인 경우
			alert('티켓, 이용권과 같이 실물 배송이 없는 상품은 개별 상품으로만 구매 가능하며 다른 상품과 합주문할 수 없습니다. \n주문상품을 확인해 주세요.');
			// document.location.href = '/app/cart';
		}
	}
	
	this.initPayAmt = function()
	{
		document.f1.kcoupon.value = 0;
		document.f1.prepoint.value = 0;
		document.f1.point.value = 0;

		this.CalculateAmt();

		var cartCouponInfoCount = document.getElementById('cartCouponInfoCount').value;
		var orderCartNos = document.querySelector('input[name=order_cart_nos]').value;
		if (orderCartNos === '') {
			alert('주문서 작성 초기화 시 오류가 발생하였습니다. 다시 시도하여 주십시오.');
			document.location.href = '/app/cart';
		}

		if (cartCouponInfoCount > 0) {
			$.ajax({
				type: 'post',
				async: false,
				url: '/app/order/reset',
				dataType: 'json',
				data: {
					orderCartNos: orderCartNos.split(',')
				},
				success: function (result) {
					if (result.success === false) {
						alert('주문서 작성 초기화 시 오류가 발생하였습니다. 다시 시도하여 주십시오.');
						document.location.href = '/app/cart';
					}
				}
			});
		}
	};

	this.initMemberRecentPayment = function() {
		$.ajax({
			type: 'GET',
			url: '/app/order/get_member_recent_payment',
			data: {},
			dataType: 'json',
			success: function(result) {
				if (!!result.data) {
					const payKind = result.data.payKind;
					const cardCode = result.data.cardCode;
					const cardQuota = result.data.cardQuota;
					const virtualBankCode = result.data.virtualBankCode;

					if (payKind) {
						if (Order.isMsspaySupported()) {
							if (payKind === 'MPAY') {
								$('input[type=radio][name=payment_choice][value=msspay]').click();
								return;
							}

							$('input[type=radio][name=payment_choice][value=pg]').click();
						}

						if (payKind !== 'MPAY') {
							if ($('#btn-paykind-' + payKind).length) {
								$('#btn-paykind-' + payKind).trigger('click');
							} else {
								$('#btn-paykind-CARD').trigger('click');
							}
						}
					} else {
						$('#btn-paykind-CARD').trigger('click');
					}

					if (cardCode) {
						if (!$('select#card_code').val(cardCode).val()) {
							$('select#card_code').val('');
						}
					}

					if (cardQuota > 0) {
						if ($('#card_quota').prop('disabled') === false) {
							$('select#card_quota').val(cardQuota);
						}
					}

					if (virtualBankCode) {
						if (!$('select[name=virtual_bank_code]').val(virtualBankCode).val()) {
							$('select[name=virtual_bank_code]').val('');
						}
						$('select[name=virtual_bank_code]').trigger('change');
					}
				}
			}
		});
	}

	// 할인 금액 계산
	this.getPayDcAmt = function()
	{
		var ff = document.f1;
		var guest = ff.guest.value;

		var prepoint_price = "0";
		var point_price = "0";
		var coupon_price = "0";
		var dc_price = "0";
		var ptn_dc_amt = "0";
		var cart_dc_amt = 0;
		var group_dc_amt = 0;

		var total_sale_amt = $('#f1 [name=total_sale_add_opt_amt]').val();
		var total_pay_dc_amt = 0;
		
		if( guest == "Y" ){
		}else{
			document.getElementById("coupon_price").innerHTML = Comma(document.f1.kcoupon.value);
			document.getElementById("prepoint_price").innerHTML = Comma(unComma(document.f1.prepoint.value || 0));
			document.getElementById("point_price").innerHTML = Comma(unComma(document.f1.point.value));

			// 적립금 선할인
			prepoint_price = document.getElementById("prepoint_price").childNodes[0].nodeValue;
			// 사용적립금
			point_price = document.getElementById("point_price").childNodes[0].nodeValue;
			// 쿠폰할인 금액
			coupon_price = document.getElementById("coupon_price").childNodes[0].nodeValue;
			// 그룹 할인
			if(document.getElementById("dc_price")) {
				dc_price = document.getElementById("dc_price").childNodes[0].nodeValue;
			}
			// 제휴할인
			if(document.getElementById("ptn_dc_amt")) {
				ptn_dc_amt = document.getElementById("ptn_dc_amt").childNodes[0].nodeValue;
			}
			// 장바구니 할인
			cart_dc_amt = document.f1.cart_dc_amt.value;
			// 스냅 그룹 할인
			group_dc_amt = document.f1.group_dc_amt.value;

			total_pay_dc_amt = unComma(prepoint_price) + unComma(point_price) + unComma(coupon_price) + unComma(dc_price) + unComma(ptn_dc_amt) + unComma(cart_dc_amt) + unComma(group_dc_amt);
		}

		total_pay_dc_amt += unComma(total_sale_amt);

		document.getElementById("total_pay_dc_amt").innerHTML = Comma(total_pay_dc_amt);
		return total_pay_dc_amt;
	};

	/*
	 * 적립금 선할인 사용
	 */
	this.CheckPayPrepoint = function(prepoint){

		var ff = document.f1;

		var pre_point_use_yn = (document.getElementById("prepointUse").checked) ? "Y" : "N";

		if(pre_point_use_yn == "Y"){	// 적립금 선할인 사용
			var total_pay_amt = this.getPayAmt();
			if( prepoint > total_pay_amt ){
				alert("적립금 선할인 금액이 결제 금액보다 많습니다.");
				document.getElementById("prepointUse").checked = false;
				ff.prepoint.value = 0;
				return false;
			}
			//$("#prepointGuide").show();
			ff.prepoint.value = Comma(prepoint);
		} else {	// 적립금 선할인 미사용
			//$("#prepointGuide").hide();
			ff.prepoint.value = "0";
		}
	};

	/*
	 * 적립금 사용여부 확인
	 */
	this.CheckPointUse = function (){
		var point_use_yn = (document.getElementById("pointUse").checked) ? "Y" : "N";
		var user_point = unComma($("#user_point").text());
		var max_use_point = unComma($("#max_use_point").text());

		if(point_use_yn == "Y"){	// 보유적립금 사용
			$("#have_point_li1").addClass("box_extend");
			$("#have_point_li2").addClass("box_extend");

			if(user_point >= 5000) {
				if(max_use_point > user_point){
					$("input[name=point]").val(Comma(user_point));
				} else {
					$("input[name=point]").val(Comma(max_use_point));
				}
				this.CheckPayPoint();
				this.CalculateAmt();
			} else {
				$("input[name=point]").attr("disabled", true);
			}
		} else {	// 보유적립금 미사용
			$("#have_point_li1").removeClass("box_extend");
			$("#have_point_li2").removeClass("box_extend");
			document.f1.point.value = "0";
			this.CalculateAmt();
		}
	};
	
	/*
	 * 적립금 사용액 체크
	 */
	this.CheckPayPoint = function(){
		
		var ff = document.f1;
		var point = parseInt(unComma(ff.point.value));

		var total_pay_amt = this.getPayAmt();

		total_pay_amt = parseInt(total_pay_amt, 10) + parseInt(point, 10);

		var max_use_point = parseInt(unComma(document.getElementById("max_use_point").innerHTML), 10);
		var user_point = parseInt(unComma(document.getElementById("user_point").innerHTML), 10);

		if( point > total_pay_amt ){
			alert("적립금 사용액이 결제 금액보다 많습니다.");
			ff.point.value = 0;
			return false;
		}  else if(point > user_point){
			alert("보유하신 적립금을 초과하였습니다.");
			ff.point.value = 0;
			return false;
		}  else if(point > max_use_point){
			alert("최대로 사용할 수 있는 적립금을 초과하였습니다.");
			ff.point.value = max_use_point;
			return false;
		}
		return true;
	};

	/*
	 *	계산식 NaN 방지 
	 */
	this.MustBeZero = function( obj ){
		if( obj.value == "" ){
			obj.value = 0;
		}
	};
	
	/*
	 *	적립금 결제 활성화 
	 */
	this.PointPayForm = function( flag ){
		/*
		var ff = document.f1;
		if(ff.kyejae != undefined) {
			if( flag ) {
				for(i = 0; i < ff.kyejae.length; i++ ) {
					if(ff.kyejae[i].value == "point") {
						ff.kyejae[i].checked = true;
						ff.kyejae[i].disabled = false;
					} else {
						ff.kyejae[i].checked = false;
						ff.kyejae[i].disabled = true;
					}
				}		
			} else {
				for(i = 0; i < ff.kyejae.length; i++ ) {
					if(ff.kyejae[i].value == "point") {
						ff.kyejae[i].checked = false;
						ff.kyejae[i].disabled = true;
					} else {
						//ff.kyejae[i].checked = false;
						ff.kyejae[i].disabled = false;
					}
				}
			}
		}
		*/
	};

	this.isDiscountAmtExceedsPriceByProduct = function(coupon_cart_no, goods_dc_amt) {

		/*
		* 아래 두 파라미터가 존재하는 경우 쿠폰 적용 시 validate하는 케이스
		** coupon_cart_no : 쿠폰 적용할 상품 장바구니 번호
		** goods_dc_amt : 적용하려는 쿠폰 금액
		* */

		var ff = document.f1;
		var cart_info = $("input[name='cart_info'][type='hidden']");

		var total_point_prd_amt = parseInt(unComma($("#total_point_prd_amt").val()));
		var total_group_dc_prd_amt = parseInt(unComma($("#total_group_dc_prd_amt").val()));
		var total_prd_amt = parseInt(unComma($("#total_prd_amt").val()));
		var pay_fee_txt = $("#pay_fee").text();
		var dlv_amt_txt = $('#dlv_amt').text();
		var pay_fee = (pay_fee_txt != undefined) ? parseInt(unComma(pay_fee_txt)) : 0;
		var dlv_amt = (dlv_amt_txt != undefined) ? parseInt(unComma(dlv_amt_txt)) : 0;
		var point = parseInt(unComma(ff.point.value || 0));
		var cart_dc_amt = ($('[name=cart_dc_amt]').val() != undefined) ? parseInt(unComma($('[name=cart_dc_amt]').val())) : 0;
		var group_dc_amt = ($('[name=group_dc_amt]').val() != undefined) ? parseInt(unComma($('[name=group_dc_amt]').val())) : 0;

		var use_pay_fee = 0;
		var info = "";
		var sum_point_amt = 0;
		var sum_pay_fee = 0;
		var sum_cart_dc_amt = 0;
		var sum_group_dc_amt = 0;
		var last_use_point_n_index = null;
		var last_group_dc_index = null;

		for ( var i = 0 ; i < cart_info.length ; i++ ) {
			info = $(cart_info[i]).attr("value").split("|");
			var cart_no = info[9];
			var use_point_yn = info[10];	// Y이면 보유적립금 사용X, N이면 보유적립금 사용O
			if (use_point_yn != 'Y') {
				last_use_point_n_index = i;
			}

			var group_dc_limit_yn = $("#group_dc_limit_yn_" + cart_no + "").val();
			if (group_dc_limit_yn == 'N') {
				last_group_dc_index = i;
			}
		}

		for(var i = 0 ; i < cart_info.length ; i++) {
			var $cart_info = $(cart_info[i]);
			info = $cart_info.attr("value").split("|");

			var goods_no = info[0];
			var goods_sub = info[1];
			var goods_opt = info[2];
			var group_sum = parseInt(info[3]);
			var ptn_dc_amt = parseInt(info[4]);
			var dc_amt = parseInt(info[5]);
			var prepoint = parseInt(info[6]);
			var prepoint_yn = info[7];
			var tax_yn = info[8];
			var cart_no = info[9];
			var use_point_yn = info[10];	// Y이면 보유적립금 사용X, N이면 보유적립금 사용O
			if (goods_dc_amt !== undefined && cart_no == coupon_cart_no) {
				var coupon_amt = parseInt(goods_dc_amt);
			} else {
				var coupon_amt = parseInt($("input[name='coupon_amt_"+cart_no+"'][type='hidden']").attr("value")) || 0;
			}
			var group_dc_limit_yn = $("#group_dc_limit_yn_" + cart_no + "").val();

			var use_point = 0;
			var use_cart_dc_amt = 0;
			var use_group_dc_amt = 0;

			if(prepoint_yn == "N" || ff.prepointUse.value != "Y"){
				prepoint = 0;
			}

			if(point > 0 && use_point_yn != 'Y') {
				use_point = Math.round(point * group_sum / total_point_prd_amt);
				if (point < (sum_point_amt + use_point)) {
					use_point = point - sum_point_amt;
				}
				sum_point_amt += use_point;
			}

			if(pay_fee > 0){
				if(i == last_use_point_n_index){
					use_pay_fee = pay_fee - sum_point_amt;
				} else{
					use_pay_fee = Math.round(pay_fee*group_sum/total_prd_amt);
				}
				sum_pay_fee += use_pay_fee;
			}

			if (cart_dc_amt > 0) {
				use_cart_dc_amt = Math.round(cart_dc_amt * group_sum / total_prd_amt);
				if (cart_dc_amt < (sum_cart_dc_amt + use_cart_dc_amt)) {
					use_cart_dc_amt = cart_dc_amt - sum_cart_dc_amt;
				}
				sum_cart_dc_amt += use_cart_dc_amt;
			}

			if (group_dc_amt > 0) {
				if (group_dc_limit_yn == 'N') {
					if (i == last_group_dc_index) {
						use_group_dc_amt = group_dc_amt - sum_group_dc_amt;
					} else {
						use_group_dc_amt = Math.round(group_dc_amt * group_sum / total_group_dc_prd_amt);
					}
					sum_group_dc_amt += use_group_dc_amt;
					$('#group_dc_amt_' + cart_no).text(Comma(use_group_dc_amt));
				}
			}

			var discountAmt = dc_amt + ptn_dc_amt + coupon_amt + prepoint + use_point - use_pay_fee + use_cart_dc_amt + use_group_dc_amt;

			/************* 테스트용 주석 **************/
			// console.log('------ ', cart_no, '------');
			// console.log('dc_amt : ', dc_amt); // 등급할인
			// console.log('ptn_dc_amt : ', ptn_dc_amt); // 제휴할인
			// console.log('coupon_amt : ', coupon_amt); // 쿠폰 할인
			// console.log('prepoint : ', prepoint); // 적립금 선할인
			// console.log('use_point : ', use_point); // 적립금 사용
			// console.log('use_pay_fee : ', use_pay_fee);
			// console.log('use_cart_dc_amt : ', use_cart_dc_amt); // 즉시할인
			// console.log('use_group_dc_amt : ', use_group_dc_amt); // 스냅그룹할인
			// console.log('---------------------------');
			// console.log('group_sum : ', group_sum, '/ discount_amt : ', discountAmt);
			// console.log('---------------------------');

			try {
				if (group_sum <= discountAmt) {
					/* 할인금액이 상품가를 초과하는 경우 */

					// 적립금 사용 불가 처리
					// 입력된 보유 적립금 할인 0원 초과인 경우
					if ($('.use-point-limited').is(':hidden')) {

						// 한도초과 문구 표시
						$('[name="point"]').closest('.cell_discount_detail2').hide();
						$('.use-point-limited').show();

						$('[name="use_point_yn_' + cart_no + '"]').val('N');
						$('#limit_use_point_yn').val('Y');

						if ($('#pointUse').length > 0) {
							$('#pointUse').attr('checked', false);
							Order.CheckPointUse();
						}

						console.log('적립금 사용 불가 처리 : ', goods_no);
						if (coupon_cart_no !== undefined && goods_dc_amt !== undefined) {
							// console.log('쿠폰 적용인 경우');
							return this.isDiscountAmtExceedsPriceByProduct(coupon_cart_no, goods_dc_amt);
						} else {
							// console.log('쿠폰 적용 아닌 경우');
							return this.isDiscountAmtExceedsPriceByProduct();
						}
					}

					// 적립금 선할인 불가 처리
					// 적립금 선할인 사용으로 되어있을 경우
					if ($('.prepoint-limited').is(':hidden')) {

						$('#prepointUse').closest('.cell_discount_detail').hide();
						$('.prepoint-limited').show();

						$('[name="prepoint_yn_' + cart_no + '"]').val('N');
						$('#limit_prepoint_yn').val('Y');

						// CheckPrepoint(), total_point_amt -> order_form.html에 정의됨
						$('#prepointUse').prop('checked', false);
						Order.CheckPayPrepoint(total_prepoint_amt);
						Order.CalculateAmt();
						CheckPrepoint(total_prepoint_amt, total_point_amt);

						console.log('해당 상품 적립금 선할인 취소 : ', goods_no);
						if (coupon_cart_no !== undefined && goods_dc_amt !== undefined) {
							// console.log('쿠폰 적용인 경우');
							return this.isDiscountAmtExceedsPriceByProduct(coupon_cart_no, goods_dc_amt);
						} else {
							// console.log('쿠폰 적용 아닌 경우');
							return this.isDiscountAmtExceedsPriceByProduct();
						}
					}

					// 즉시할인 취소
					// 즉시할인 제한 없을 경우
					if (window.PLCC && $('#limit_plcc_dc_yn').val() !== 'Y') {
						console.log('즉시할인 제한 : ', cart_no);

						// 즉시할인 전체 미사용 처리
						$(".hyundaicard-firstpayment").removeClass("is-active");
						$('#hyundaicardFirstPayment').removeClass('is-active');
						$("input[name='chk_plcc_first_pay_dc']").prop("checked", false);
						PLCC.setClickedYnFirstPayDiscount();
						$('#span_plccDiscountAmount').html('-0원');
						$('[name=cart_dc_amt]').val(0);
						$('.cart_dc_amt').html(Comma(0));

						Order.CalculateAmt();

						// 즉시할인 제한 문구 표시
						$('.cart_discount_method .cart_discount .plcc-discount-limited').show().css('display', 'inline-block');
						$('#hyundaicardFirstPayment').hide();

						// 결제수단 영역 2만원 할인 사용 체크박스 비활성화
						if ($("input[name='chk_plcc_first_pay_dc']").length) {
							$("input[name='chk_plcc_first_pay_dc']").prop("disabled", true);
						}

						$('[name="plcc_dc_yn_' + cart_no + '"]').val('N');
						$('#limit_plcc_dc_yn').val('Y');

						if (coupon_cart_no !== undefined && goods_dc_amt !== undefined) {
							// console.log('쿠폰 적용인 경우');
							return this.isDiscountAmtExceedsPriceByProduct(coupon_cart_no, goods_dc_amt);
						} else {
							// console.log('쿠폰 적용 아닌 경우');
							return this.isDiscountAmtExceedsPriceByProduct();
						}
					}

					// 쿠폰 할인 제한
					// 쿠폰은 ApplyCoupon 함수에서 장바구니 데이터에 저장해야하기 때문에 할인금액 반환
					if (
						coupon_cart_no !== undefined
						&& goods_dc_amt !== undefined
						&& coupon_cart_no == cart_no
					) {
						// 쿠폰 적용 한도 금액 설정
						var coupon_amt_available = group_sum - (dc_amt - use_pay_fee + use_group_dc_amt);
						if (goods_dc_amt >= coupon_amt_available) {
							$('.coupon-limited').show().css('display', 'inline-block');
							$('[name="limit_coupon_amt_yn_' + cart_no + '"]').val('Y');
							console.log('쿠폰 한도설정 : ', coupon_amt_available);
							return coupon_amt_available;
						} else {
							$('[name="limit_coupon_amt_yn_' + cart_no + '"]').val('N');
							console.log('쿠폰 한도설정 해제 : ', goods_dc_amt)
						}
					}

				} else {
					/* 할인금액이 상품가를 초과하지 않는 경우 할인 수단 정상화 */

					// 쿠폰 적용 가능 상태로 변경
					if ($('[name^="limit_coupon_amt_yn_"]').length === $('[name^="limit_coupon_amt_yn_"][value="N"]').length) {
						$('.coupon-limited').hide();
						console.log('쿠폰 적용 : ', coupon_cart_no);
					}

					// 즉시할인 적용 가능 상태로 변경
					// 즉시할인 제한 있는 경우
					if (window.PLCC && $('#limit_plcc_dc_yn').val() === 'Y') {
						$('[name="plcc_dc_yn_' + cart_no + '"]').val('Y');

						if ($('[name^="plcc_dc_yn_"]').length === $('[name^="plcc_dc_yn_"][value="Y"]').length) {
							console.log('즉시할인 적용 : ', cart_no);

							// 즉시할인 제한 문구 가리기
							$('.cart_discount_method .cart_discount .plcc-discount-limited').hide();
							$('#hyundaicardFirstPayment').show();

							// 결제수단 영역 2만원 할인 사용 체크박스 활성화
							if ($("input[name='chk_plcc_first_pay_dc']").length) {
								$("input[name='chk_plcc_first_pay_dc']").prop("disabled", false);
							}

							$('[name^="plcc_dc_yn_"]').val('Y');
							$('#limit_plcc_dc_yn').val('N');

							if (coupon_cart_no !== undefined && goods_dc_amt !== undefined) {
								return this.isDiscountAmtExceedsPriceByProduct(coupon_cart_no, goods_dc_amt);
							} else {
								return this.isDiscountAmtExceedsPriceByProduct();
							}
						}
					}

					// 해당 상품 적립금 선할인 사용 가능으로 변경
					// 적립금 선할인 제한 있는 경우
					if ($('#limit_prepoint_yn').val() === 'Y') {

						$('[name="prepoint_yn_' + cart_no + '"]').val('Y');

						if ($('[name^="prepoint_yn_"][value="Y"]').length === $('[name^="prepoint_yn_"]').length) {
							// console.log('적립금 선할인 제한 표시 삭제')
							$('#prepointUse').closest('.cell_discount_detail').show();
							$('.prepoint-limited').hide();

							$('#limit_prepoint_yn').val('N');

							Order.CheckPayPrepoint(total_prepoint_amt);
							Order.CalculateAmt();
							CheckPrepoint(total_prepoint_amt, total_point_amt);

							console.log('해당 상품 적립금 선할인 적용 : ', goods_no);
							if (coupon_cart_no !== undefined && goods_dc_amt !== undefined) {
								return this.isDiscountAmtExceedsPriceByProduct(coupon_cart_no, goods_dc_amt);
							} else {
								return this.isDiscountAmtExceedsPriceByProduct();
							}
						}
					}

					// 적립금 사용 가능으로 변경
					// 보유 적립금 사용 제한 있는 경우
					if ($('#limit_use_point_yn').val() === 'Y') {

						$('[name="use_point_yn_' + cart_no + '"]').val('Y');

						if ($('[name^="use_point_yn_"][value="Y"]').length === $('[name^="use_point_yn_"]').length) {
							$('[name="point"]').closest('.cell_discount_detail2').show();
							$('.use-point-limited').hide();

							$('#limit_use_point_yn').val('N');
							console.log('보유 적립금 사용 가능 처리');
						}
					}
				}
			} catch (error) {
				$.ajax({
					type: 'POST',
					url: '/app/order/send_discount_validation_error',
					data: {
						cart_no: cart_no,
						error_msg: error
					},
					dataType: "json",
					success: function(response) {
					}
				});
				return false;
			}
		}

		return false;
	}

	//  비과세 계산
	this.CalculateVat = function() 
	{
		var ff = document.f1;
		var cart_info = $("input[name='cart_info'][type='hidden']");

		//var total_pay_amt = parseInt(this.getPayAmt());total_point_prd_amt
		var total_point_prd_amt = parseInt(unComma($("#total_point_prd_amt").val()));
		var total_group_dc_prd_amt = parseInt(unComma($("#total_group_dc_prd_amt").val()));
		var total_prd_amt = parseInt(unComma($("#total_prd_amt").val()));
		var pay_fee = ($("#pay_fee").html() != undefined) ? parseInt(unComma($("#pay_fee").html())) : 0;
		var dlv_amt = ($("#dlv_amt").html() != undefined) ? parseInt(unComma($("#dlv_amt").html())) : 0;
		var point = parseInt(unComma(ff.point.value));
		var cart_dc_amt = ($('[name=cart_dc_amt]').val() != undefined) ? parseInt(unComma($('[name=cart_dc_amt]').val())) : 0;
		var group_dc_amt = ($('[name=group_dc_amt]').val() != undefined) ? parseInt(unComma($('[name=group_dc_amt]').val())) : 0;

		var use_pay_fee = 0;
		var info = "";
		var comm_tax_mny = 0;
		var comm_free_mny = 0;
		var comm_vat_mny = 0;
		var sum_point_amt = 0;
		var sum_pay_fee = 0;
		var sum_cart_dc_amt = 0;
		var sum_group_dc_amt = 0;
		var last_use_point_n_index = null;
		var last_group_dc_index = null;

		for ( var i = 0 ; i < cart_info.length ; i++ ) {
			info = $(cart_info[i]).attr("value").split("|");
			var cart_no = info[9];
			var use_point_yn = info[10];	// Y이면 보유적립금 사용X, N이면 보유적립금 사용O
			if (use_point_yn != 'Y') {
				last_use_point_n_index = i;
			}
			var group_dc_limit_yn = $("#group_dc_limit_yn_" + cart_no + "").val();
			if (group_dc_limit_yn == 'N') {
				last_group_dc_index = i;
			}
		}

		for ( var i = 0 ; i < cart_info.length ; i++ ) {
			info = $(cart_info[i]).attr("value").split("|");
			var goods_no = info[0];
			var goods_sub = info[1];
			var goods_opt = info[2];
			var group_sum = info[3];
			var ptn_dc_amt = info[4];
			var dc_amt = info[5];
			var prepoint = info[6];
			var prepoint_yn = info[7];
			var tax_yn = info[8];
			var cart_no = info[9];
			var use_point_yn = info[10];	// Y이면 보유적립금 사용X, N이면 보유적립금 사용O
			var coupon_amt = $("input[name='coupon_amt_"+cart_no+"'][type='hidden']").attr("value");
			var group_dc_limit_yn = $("#group_dc_limit_yn_" + cart_no + "").val();

			var use_point = 0;
            var use_cart_dc_amt = 0;
            var use_group_dc_amt = 0;

			if(prepoint_yn == "N" || !$("input:checkbox[id='prepointUse']").is(":checked")){
				prepoint = 0;
			}

			// 어떤 이유로 최대 사용으로 체크해야만 포인트금액을 설정하는지는 모르겠으나.
			// // 네이버페이 결제창 호출은 과세, 비과세 금액과 결제금액이 동일해야하므로 point 값을 0으로 변경하지않는다.
			// if(!$("input:checkbox[id='pointUse']").is(":checked") && (pg_kind != "naverpay")){
			// 	point = 0;
			// }

			if(point > 0 && use_point_yn != 'Y'){
				use_point = Math.round(point * group_sum / total_point_prd_amt);
				if (point < (sum_point_amt + use_point)) {
					use_point = point - sum_point_amt;
				}
				sum_point_amt += use_point;
			}

			if(pay_fee > 0){
				if(i == last_use_point_n_index){
					use_pay_fee = pay_fee - sum_point_amt;
				} else{
					use_pay_fee = Math.round(pay_fee*group_sum / total_prd_amt);
				}
				sum_pay_fee += use_pay_fee;
			}

			if (cart_dc_amt > 0) {
				use_cart_dc_amt = Math.round(cart_dc_amt * group_sum / total_prd_amt);
				if (cart_dc_amt < (sum_cart_dc_amt + use_cart_dc_amt)) {
					use_cart_dc_amt = cart_dc_amt - sum_cart_dc_amt;
				}
				sum_cart_dc_amt += use_cart_dc_amt;
			}

			if (group_dc_amt > 0) {
				if (group_dc_limit_yn == 'N') {
					if (i == last_group_dc_index) {
						use_group_dc_amt = group_dc_amt - sum_group_dc_amt;
					} else {
						use_group_dc_amt = Math.round(group_dc_amt * group_sum / total_group_dc_prd_amt);
					}
					sum_group_dc_amt += use_group_dc_amt;
				}
			}

			var payment = parseInt(group_sum - dc_amt - ptn_dc_amt - coupon_amt - prepoint - use_point + use_pay_fee - use_cart_dc_amt - use_group_dc_amt);

			if (tax_yn == "Y") {
				comm_tax_mny += Math.floor(payment/1.1);
				comm_vat_mny += payment - Math.floor(payment/1.1);				
			} else {
				comm_free_mny += payment;
			}
		}
		
		// 배송비의 경우에는 order_opt에 부분적으로 들어가기(대표가되는 곳에) 때문에 
		// 부분환불 시 각각 과세 금액 계산 따라서 주문 시 구하는 과세 금액도 각각 구해야 함.
		var dlv_tax_amt = 0;
		var dlv_vat_amt = 0;

		for(var i=0; i<$("input:hidden[name=group_dlv_amt]").length; i++) {
			var group_dlv_amt = parseInt($("input:hidden[name=group_dlv_amt]").eq(i).val());
			dlv_tax_amt += Math.floor(group_dlv_amt/1.1);
			dlv_vat_amt += group_dlv_amt - Math.floor(group_dlv_amt/1.1);
		}

		ff.comm_tax_mny.value = comm_tax_mny+dlv_tax_amt;
		ff.comm_free_mny.value = comm_free_mny;
		ff.comm_vat_mny.value = comm_vat_mny+dlv_vat_amt;
		
		//console.log(dlv_amt);
		//console.log(ff.comm_tax_mny.value);
		//console.log(ff.comm_free_mny.value);
		//console.log(ff.comm_vat_mny.value);
	}

	this.isCardUnderPerform = function()
	{
		var cardUnderPerformYN = $("input[name='card_underperform_yn']").val();
		return cardUnderPerformYN != 'N';
	}

	// plcc 청구할인 금액 계산
    this.setPLCCDiscount = function() {
        var cardDcAmt = 0;

        var discountCardDCAmt = unComma($('#possible_card_dc_amt').text());     // 잔여 한도 금액
        var cardType = $("input[name='card_type']").val();                      // 카드 종류

        if (!Order.isCardUnderPerform()) {
            var immediateDiscountAmt = (Order.isMsspaySupported()) ? Msspay.getImmediateDiscountAmtBySelectedPayment() : 0;
            var totalPayAmt = Order.getPayAmt() - immediateDiscountAmt;
            cardDCAmt = (cardType == "CREDIT_CARD")? Math.round(totalPayAmt * 0.05) : Math.round(totalPayAmt * 0.03);

            if (cardDCAmt > discountCardDCAmt) {
                cardDCAmt = discountCardDCAmt;
            }
            $("[name=card_dc_amt]").text(Comma(cardDCAmt));

			var btnCardDCAmt = (cardType == "CREDIT_CARD")? (totalPayAmt-cardDCAmt) : cardDCAmt;
			$("[name=total_expected_billing_dc_amt]").text(Comma(btnCardDCAmt));
        }
    }

	// 결제 금액 계산
	this.CalculateAmt = function() 
	{
		var total_pay_amt = this.getPayAmt();
		var total_pay_dc_amt = this.getPayDcAmt();
		var pay_fee = unComma($('#pay_fee').text());

		// 할인 비율 얻기
		var total_dc = (total_pay_dc_amt/(total_pay_amt-pay_fee+total_pay_dc_amt))*100;
		var total_dc_rate = (total_dc > 99 && total_dc < 100)? 99 : Math.round(total_dc);

		document.getElementById("total_dc_rate").innerHTML = total_dc_rate;
		document.getElementById("pay_amt").innerHTML = Comma(total_pay_amt);
		document.getElementById("btn-pay_amt").innerHTML = Comma(total_pay_amt);

		var ff = document.f1;
		var guest = ff.guest.value;
		if( guest != "Y") {
			var point = parseInt(unComma(ff.point.value));
			if( total_pay_amt == 0 && point > 0 ) {
				this.PointPayForm(true);
			} else {
				this.PointPayForm(false);
			}
		}
		
		// 5만원 미만일 경우 카드 할부 제한 처리
		if(total_pay_amt < 50000) {
			$("#card_quota").find("option:eq(0)").prop("selected", true);
			$("#card_quota").prop("disabled", true);
		} else {
			$("#card_quota").prop("disabled", false);
		}

		if (Order.isMsspaySupported()) {
			Msspay.updateCardQuotaDesign();
		}
		
		// 과세_면세 처리
		this.CalculateVat();

		// plcc 청구할인 금액 계산
		this.setPLCCDiscount();

		// 무신사페이 즉시할인 금액 계산
		if (Order.isMsspaySupported()) {
			Msspay.setImmediateDiscount();
		}
	};

	this.isMsspaySupported = function()
	{
		if (window.Msspay) {
			return true;
		}

		return false;
	};

	this.isMsspaySelected = function()
	{
		if ($('input[name=payment_choice]:checked').val() === 'msspay') {
			return true;
		}

		return false;
	};

	this.isNotMsspaySelected = function() {
		return !Order.isMsspaySelected();
	};

	this.payment = function ()
	{
		if (Order.isMsspaySupported() && Order.isMsspaySelected()) {
			if (Order.valid()) {
				Msspay.pay();
			}
			return;
		}

		unbindPayment();

		if (Order.valid()) {
			var pg_kind = convertPgKind();
			Order.PGPay(pg_kind);
		}

		// 3 초후 다시 bind처리.
		setTimeout(function () {
			bindPayment();
		}, 3000);
	};

	this.valid = function()
	{
		this.checkIncludesDigitalProduct();

		this.initOrderNo();

		var ff = document.f1;
		var guest = ff.guest.value;
		var user_mail_authed = (ff.user_mail_authed_yn.value === 'Y');
		var v = new MiyaValidator(ff);
		const payKind = document.f1.pay_kind.value;

		//로그인 체크
		if( guest != "Y" ) {
			var http_host = location.host;
			var target_url = encodeURIComponent("http://"+ http_host);
			
			if( !Order.checkLogin() ){
				alert("다시 로그인하여 주십시오.");
				document.location.href = "/app/member/login?target_url=" + target_url;
				return false;
			}
		}

		if (Order.isNotMsspaySelected()) {
			if (!payKind) {
				alert('결제수단을 선택해 주십시오.');
				return false;
			}
		}
		
		// 결제수단이 카드일 경우 카드사 선택 확인
		if (payKind === 'CARD') {
			if (ff.card_code.value == "") {
				alert("결제할 카드의 종류를 선택해 주십시오.");
				ff.card_code.focus();
				return false;
			}
		}
		
		// 결제수단이 가상계좌일 경우 입금은행 선택 확인
		if (payKind === 'VTRANSFER') {
			if(ff.virtual_bank_code.value == "") {
				alert("입금은행을 선택해 주십시오.");
				ff.virtual_bank_code.focus();
				return false;
			}
		}

		// 결제 수단별 최소 결제금액 처리
		if (this.getPayAmt() < 1000) {
			alert('최소 결제 금액은 1,000 원 입니다');
			return false;
		}
		
		if (payKind === 'PHONE'){
			if (this.getPayAmt() > 500000) {
				alert('휴대폰 결제 가능 최대 금액 50만원을 초과하였습니다.');
				return false;
			}

			var objCartGoodsCnt = $('form[name="f1"] input[name="cart_goods_cnt[]"]');
			var totalCartCnt = 0;
			for (var i = 0; i < objCartGoodsCnt.length; i++) {
				totalCartCnt += parseInt(objCartGoodsCnt[i].value);
				if (totalCartCnt > 1) {
					alert('결제하시려는 상품이 1개를 초과할 경우, 휴대폰 결제 이용이 제한됩니다. 다른 결제수단을 이용해주시기 바랍니다.');
					return false;
				}
			}
		}

		// 가상계좌 주문 제한 체크
		if (payKind === 'VTRANSFER') {
			if (!this.validVirtualPayType()) {
				return false;
			}
		}

		// 무신사 페이 & 현대카드 전용 상품 체크
		if (!this.ValidExclusiveMsspayEvent()) {
			return false;
		}

		if (guest == "Y") {
			// 주문자 정보 확인
			var ordr_nm = ff.ordr_nm.value;
			ff.ordr_nm.value = ordr_nm.replace(/\s*/g, '');

			var ordr_nm_pattern = /[^(가-힣a-zA-Z)]/;
			if (ordr_nm_pattern.test(ff.ordr_nm.value)) {
				alert("주문자명은 한글과 영문만 입력할 수 있습니다.");
				ff.ordr_nm.focus();
				return false;
			}
			v.add("ordr_nm", {required: true, name: "주문자명"});
			v.add("omobile1", {required: true, option: "phone", span: 3, glue: '-', name: "휴대폰번호"});
		}

		// 배송지 등록 여부 확인
		if ($('.delivery__item__info').css('display') === 'none') {
			alert("[배송지]를 입력해주세요.");
			return false;
		}

		// 수령자 정보 확인
		var rcvr_nm = ff.rcvr_nm.value;
		ff.rcvr_nm.value = rcvr_nm.replace(/\s*/g, '');
		if (ff.rcvr_nm.value == "") {
			var recipientNameText = '수령인';
			if (digital_product_order_yn === 'Y') {
				recipientNameText = '이름';
			}
			alert("["+ recipientNameText +"] 반드시 입력하셔야 하는 항목입니다.");
			ff.rcvr_nm.focus();
			return false;
		}
		v.add("rcvr_nm", {required: true, name: "수령자명"});
		v.add("rmobile1", {required: true, option: "phone", span: 3, glue: '-', name: "휴대전화"});
		if (digital_product_order_yn === 'N') {
			var zipcode = $('#f1 [name=rzip_cd1]').val();
			if (!this.validZipCode(zipcode)) {
				return false;
			}
			v.add("rzip_cd1", {required: true, name: "우편번호"});
			v.add("rzip_addr1", {required: true, name: "주소"});
			v.add("rzip_addr2", {required: true, name: "상세주소"});

			// 배송 메세지
			ff.dlv_msg.value = ($("#dlv_selectbox").val() == 'etc') ? $("#etc_textarea").val() : $("#dlv_selectbox").val();

			// 배송 출입 타입 체크
			if (!this.validDeliveryEntrance()) {
				return false;
			}
		}

		if (Order.isMsspaySupported() || payKind === 'VTRANSFER') {
			if (Msspay.getPayKindBySelectedPayment() === 'TRANSFER' || payKind === 'VTRANSFER') {
				if ($('input[type="radio"][name="cash_btn"]:checked').val() === "INCOME") {
					v.add("income_type_number", {required: true, option: "number", name: "현금영수증"});
				} else if ($('input[type="radio"][name="cash_btn"]:checked').val() === "SPENDING") {
					v.add("spending_type_number", {required: true, option: "number", name: "현금영수증"});
				}

                var phoneRegExp = /(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/g;
                var cashReceiptNumber = getCashReceiptNumber();
                if (getCashReceiptNumberType() === "PHONE"
                    && (cashReceiptNumber.length > 11 || !phoneRegExp.test(cashReceiptNumber))
                ) {
                    alert("현금영수증의 휴대폰 번호를 정확히 입력해 주십시오.");
                    return false;
                } else if (getCashReceiptNumberType() === "CARDNUM" && cashReceiptNumber.length > 19) {
                    alert("현금영수증의 현금 영수증 카드 번호를 정확히 입력해 주십시오.");
                    return false;
                } else if (getCashReceiptNumberType() === "CORPNUM" && cashReceiptNumber.length > 18) {
                    alert("현금영수증의 사업자번호를 정확히 입력해 주십시오.");
                    return false;
                }
			}
		}
		
		var result = v.validate();
		if (!result) {
			alert(v.getErrorMessage("{message}"));
			v.getErrorElement().focus();
			return false;
		}

		//사은품 정보 얻기
		ff.order_gift.value = this.getOrderGift();

		// 환불계좌 확인
		if (Order.isNotMsspaySelected() && (payKind === 'VTRANSFER' || payKind === 'TRANSFER')) {
			if (ff.cert_state.value != "Y") {
				alert("환불 받을 계좌가 이전에 인증 완료되지 않았거나, 존재하지 않습니다.\n환불 받을 계좌를 인증 및 등록해주세요.");
				return false;
			}

			var refundableBankNames = ($('[name=implode_refundable_bank_names]').val()).split('|');
			if (refundableBankNames.indexOf(ff.refund_bank.value) < 0) {
				alert("사용 불가능한 환불 계좌 은행입니다. 다시 등록해주세요.");
				return false;
			}
		}

		// PLCC 카드인지 확인
		if (ff.cart_dc_amt.value > 0) {
			if (!Order.isMsspaySelected() || !Msspay.isPLCCBySelectedPayment()) {
				alert("무신사 현대카드 즉시 할인 사용이 불가능한 결제수단입니다.");
				return false;
			}
			if (!$(".hyundaicard-firstpayment").hasClass('is-active')) {
				alert("무신사 현대카드 즉시 할인이 제대로 적용되지 않았습니다. 다시 시도해주세요.");
				return false;
			}
		} else if ($(".hyundaicard-firstpayment").hasClass('is-active')) {
			alert("무신사 현대카드 즉시 할인이 제대로 적용되지 않았습니다. 다시 시도해주세요.");
			return false;
		}
		
		/////결제금액 값
		ff.order_dlv_fee.value		= unComma(document.getElementById("dlv_amt").childNodes[0].nodeValue);
		if(guest == "Y"){
			ff.order_coupon_amt.value	= 0;
			ff.order_prepoint_amt.value	= 0;
			ff.order_point_amt.value	= 0;
			ff.order_cart_dc_amt.value 	= 0;
			ff.order_group_dc_amt.value = 0;
			ff.order_dc_amt.value		= 0;
		} else {
			ff.order_coupon_amt.value	= unComma(document.getElementById("coupon_price").childNodes[0].nodeValue);
			ff.order_prepoint_amt.value	= unComma(ff.prepoint.value);
			ff.order_point_amt.value	= unComma(ff.point.value);
			ff.order_cart_dc_amt.value 	= unComma(ff.cart_dc_amt.value);
			ff.order_group_dc_amt.value = unComma(ff.group_dc_amt.value);

			if (document.getElementById("dc_price") || document.getElementById("ptn_dc_amt")) {
				ff.order_dc_amt.value	= unComma(document.getElementById("dc_price").childNodes[0].nodeValue)
										 + unComma(document.getElementById("ptn_dc_amt").childNodes[0].nodeValue);
			}
		}

		// 결제 수수료
		ff.order_pay_fee.value		= unComma(document.getElementById("pay_fee").childNodes[0].nodeValue);
		ff.order_pay_amt.value		= this.getPayAmt();

		if ( hex_md5(ff.order_prd_amt.value) == ff.kval.value )
		{
			var order_form = document.order_info;

			order_form.order_prd_amt.value = ff.order_prd_amt.value;
			order_form.order_normal_amt.value = unComma(ff.total_normal_amt.value);
			order_form.order_sale_amt.value = unComma(ff.total_sale_amt.value);
			order_form.order_dlv_fee.value = ff.order_dlv_fee.value;
			order_form.order_coupon_amt.value = ff.order_coupon_amt.value;
			order_form.order_prepoint_amt.value = ff.order_prepoint_amt.value;
			order_form.order_point_amt.value = ff.order_point_amt.value;
			order_form.order_cart_dc_amt.value = ff.order_cart_dc_amt.value;
			order_form.order_group_dc_amt.value = ff.order_group_dc_amt.value;
			order_form.order_dc_amt.value = ff.order_dc_amt.value;
			order_form.order_pay_fee.value = ff.order_pay_fee.value;
			order_form.order_pay_amt.value = ff.order_pay_amt.value;

			order_form.ordr_nm.value = freplace(ff.ordr_nm.value);
			if (digital_product_order_yn === 'N') {
				order_form.ophone1.value = ff.omobile1.value;
				order_form.ophone2.value = ff.omobile2.value;
				order_form.ophone3.value = ff.omobile3.value;
			}
			order_form.omobile1.value = ff.omobile1.value;
			order_form.omobile2.value = ff.omobile2.value;
			order_form.omobile3.value = ff.omobile3.value;
			order_form.rcvr_nm.value = freplace(ff.rcvr_nm.value);
			order_form.rmobile1.value = ff.rmobile1.value;
			order_form.rmobile2.value = ff.rmobile2.value;
			order_form.rmobile3.value = ff.rmobile3.value;
			if (digital_product_order_yn === 'N') {
				order_form.rtitle.value = ff.rtitle.value;
				order_form.rphone1.value = ff.rmobile1.value;
				order_form.rphone2.value = ff.rmobile2.value;
				order_form.rphone3.value = ff.rmobile3.value;
				order_form.rzip_cd1.value = ff.rzip_cd1.value;
				order_form.rzip_addr1.value = freplace(ff.rzip_addr1.value);
				order_form.rzip_addr2.value = freplace(ff.rzip_addr2.value);
				order_form.dlv_msg.value = freplace(ff.dlv_msg.value);

				order_form.dlv_entrance_type.value = $('[name=dlv_entrance_type]:checked').val() ? $('[name=dlv_entrance_type]:checked').val() : '';
				order_form.dlv_entrance_memo.value = ff.dlv_entrance_memo ? freplace(ff.dlv_entrance_memo.value) : '';
			}

			// 매장 픽업 장소
			if (typeof ff.shop_pickup_location !== 'undefined') {
				order_form.shop_pickup_location.value = ff.shop_pickup_location.value;
			}

			// 사은품
			order_form.order_gift.value = ff.order_gift.value;

			// 결제 수단 지정
			order_form.pay_kind.value = ff.pay_kind.value;
			order_form.kyejae.value = ff.kyejae.value;
			
			// TOSS 설정 고정
			if (payKind === 'TOSSPAY') {
				order_form.kyejae.value = "transfer";
			}

			/**
			 * 	KCP 결제수단별 코드
			 * 
			 *	신용카드	100000000000 
			 *	계좌이체	010000000000
			 *	가상계좌	001000000000 
			 *	포인트		000100000000 
			 *	휴대폰		000010000000 
			 *	상품권		000000001000 
			 *	교통카드	000000000100 
			 *	ARS			000000000010
			 *
			 *
			 * LGDACOM 결제수단별 코드
			 * 신용카드 SC0010
			 * 계좌이체 SC0030
			 * 가상계좌 SC0040
			 * 휴대폰 SC0060
			 *
			 */			
			// 카드 : card
			if (payKind == 'CARD') {
				order_form.pay_method.value = "100000000000";
				var card_code = ff.card_code.value.split("|");

				// BIZEST 에서 사용하는 최근 선택한 카드코드
				order_form.user_card_code.value = ff.card_code.value;
				
				// bizest에서 사용할 변수에 적용
				order_form.user_card_quota.value = ff.card_quota.value;	// 할부
			}
			// 해외카드 : oversea_card
			if (payKind === 'OVERSEA_CARD') {
				order_form.pay_method.value = "100000000000";
				order_form.kyejae.value = "card";
			}
			// 계좌이체 : transfer
			if (payKind === 'TRANSFER') {
				order_form.pay_method.value = "010000000000";
			}
			// 가상계좌 : virtual
			if (payKind == 'VTRANSFER') {
				order_form.pay_method.value = "001000000000";
				// bizest에서 사용할 변수에 적용
				order_form.user_virtual_bank_code.value = ff.virtual_bank_code.value;	// 입금은행
			}
			// 핸드폰 : mobile
			if (payKind == 'PHONE') {
				order_form.pay_method.value = "000010000000";
			}

			if (parseInt(order_form.order_pay_amt.value, 10) != order_form.order_pay_amt.value) {
				alert('[결제금액 오류] 재시도 부탁드립니다.');
				window.location.reload();
				return false;
			}

			// PLCC 여부
			if (Order.isMsspaySupported()) {
				order_form.plcc_pay_use_yn.value = (Order.isMsspaySelected() && Msspay.isPLCCBySelectedPayment()) ? 'Y' : 'N';
				order_form.cart_dc_event_type.value = (ff.order_cart_dc_amt.value > 0 && firstDiscountInfo) ? firstDiscountInfo.eventKind : '';
			}

			// PG사 전달
			order_form.good_mny.value = order_form.order_pay_amt.value;
			//과세
			order_form.comm_tax_mny.value = ff.comm_tax_mny.value;
			//부가세
			order_form.comm_vat_mny.value = ff.comm_vat_mny.value;
			//비과세
			order_form.comm_free_mny.value = ff.comm_free_mny.value;
			order_form.buyr_name.value = freplace(order_form.ordr_nm.value);

			/* 이메일 직접입력의 경우 */
			var email_tail = "";
			if (ff.email2.value == "etc") {				
				email_tail = ff.email_etc.value;				
			} else {
				email_tail = ff.email2.value;
			}

			if (guest == "Y") {
				var ordr_email = ff.email1.value + "@" + email_tail;
				var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
				if (!filter.test(ordr_email)) {
					alert('잘못된 이메일 주소입니다.');
					return false;
				}

				if (user_mail_authed === true) {
					order_form.ordr_email.value = freplace(ordr_email);
					order_form.buyr_mail.value = freplace(ordr_email);
					order_form.rcvr_mail.value = freplace(ordr_email);
				} else {
					// 회원정보의 이메일이 인증되지 않을 경우(회원 / 비회원 모두), order_mst 저장용도로 따로 서버로 넘김
					order_form.save_order_email.value = freplace(ordr_email);
				}
			}
			order_form.buyr_tel1.value = order_form.ophone1.value + "-" + order_form.ophone2.value + "-" + order_form.ophone3.value;
			order_form.buyr_tel2.value = order_form.omobile1.value + "-" + order_form.omobile2.value + "-" + order_form.omobile3.value;
			if(order_form.order_pay_amt.value >= 50000) order_form.quotaopt.value = "12";
			else  order_form.quotaopt.value = "0";
			order_form.rcvr_name.value = freplace(order_form.rcvr_nm.value);
			order_form.rtitle.value = order_form.rtitle.value;
			order_form.rcvr_tel2.value = order_form.rmobile1.value + "-" + order_form.rmobile2.value + "-" + order_form.rmobile3.value;
			if (digital_product_order_yn === 'N') {
				order_form.rcvr_tel1.value = order_form.rphone1.value + "-" + order_form.rphone2.value + "-" + order_form.rphone3.value;
				order_form.rcvr_zipx.value = order_form.rzip_cd1.value;
				order_form.rcvr_add1.value = freplace(order_form.rzip_addr1.value);
				order_form.rcvr_add2.value = freplace(order_form.rzip_addr2.value);
			}

			// 가상계좌, 계좌이체, 무통장입금이면 환불 정보 설정
			if (Order.isNotMsspaySelected() && (payKind === 'VTRANSFER' || payKind === 'TRANSFER')) {
				order_form.refund_bank.value = ff.refund_bank.value;
				order_form.refund_account.value = ff.refund_account.value;
				order_form.refund_depositor.value = ff.refund_depositor.value;
			}

			//아웃터 페스티벌
			if(order_form.recommend_id != undefined && ff.recommend_id != undefined) {
				order_form.recommend_id.value = ff.recommend_id.value;
			}

			// 신규이벤트 구매대상 체크
			if(!this.ValidEvent()) {
				return false;
			}

			window.dataLayer = window.dataLayer || [];
			window.dataLayer.push({
				'event': 'evPayment',
				'layerLabel': payKind
			});

			return true;
		} else {
			return false;
		}
	};
	
	this.PGPay = function(pg_kind)
	{
		var order_form = document.order_info;
		this.mpayReady(order_form, pg_kind);
	};

	this.OnlyNum = function () {
		if(
			(
				( event.keyCode == 9 )			// tab
				||	( event.keyCode == 8 )		// bs
				||	( event.keyCode == 46 )		// delete
				||	( event.keyCode > 47 && event.keyCode < 58 )		// 1 ~ 0
				||	( event.keyCode >= 96 && event.keyCode <= 105 )		// numpad 1~0
			) == false
		) {
			event.returnValue = false;
		}
	};

	this.getOrderGift = function () {

		var gift = document.f1.gift;
		var order_gift = "";

		if(gift) {
			if(gift.length) {
				for(i=0; i<gift.length; i++){
					gift_val = gift[i].value.split("|");	//사은품 정보- 번호|증정구분|적용구매금액
					var gift_no = (gift_val[0]) ? gift_val[0] : "";
					if(gift[i].checked && gift_no != ""){
						order_gift += (i>0) ? ","+gift_no : gift_no ;
					}
				}
			} else {
				gift_val = gift.value.split("|");	//사은품 정보- 번호|증정구분|적용구매금액
				var gift_no = (gift_val[0]) ? gift_val[0] : "";
				if(gift.checked && gift_no != ""){
					order_gift = gift_no;
				}
			}
		}
		return order_gift;
	};

	this.mpayReady = function(order_form, pg_kind)
	{
		pg_kind = pg_kind == 'payco' ? 'kcp_payco' : pg_kind;
		order_form.pg_kind.value = pg_kind;
		order_form.kyejae.value = pg_kind;
		Mpay.Auth.request();
	}

	/*
	* 이벤트상품 구매 요청시 검증
	* 스크립트에서는 2가지만 체크한다.
	* 1) 이벤트상품 개수 체크
	* 2) 주문 금액 체크 (이벤트 상품 금액을 제외하고 결제 금액이 {{eventMinPayAmt}}원 이상이여야한다.)
	* */
	this.ValidEvent = function () {
		var used_yn = $("input[name='used_yn'][type='hidden']");
		var price = $("input[name='price'][type='hidden']");
		var eventMinPayAmt = $("input[id='event_min_pay_amt'][type='hidden']").val();
		var cntEventProducts = 0;
		var eventProductAmt = 0;
		for (var i = 0; i < used_yn.length; i++) {
			if (used_yn[i].value == 'E') {
				cntEventProducts++;
				eventProductAmt = price[i].value;
			}
		}

		if (cntEventProducts > 1) {
			alert('신규회원 이벤트 상품은 1개만 구매 가능합니다.');
			return false;
		}

		if (cntEventProducts > 0) {
			if (this.getPayAmt() - eventProductAmt < eventMinPayAmt) {
				alert('이벤트 상품 외 [쿠폰 및 적립금 사용 후 최종 결제 금액 ' + Comma(eventMinPayAmt) + '원 이상] 주문 시 이벤트 상품 구매가 가능합니다.');
				return false;
			}

			var outMemberEventEntryYn = Event.getOutMemberEvent();
			if (outMemberEventEntryYn == 'Y') {
				alert('이벤트에 이미 참여 하셨습니다.(이벤트 상품 1회 1개만 구매 가능)');
				return false;
			}
		}
		return true;
	}

	this.initPreVirtualOrder = function () {
		if (!this.isPreVirtualOrderData) {
			var isSubmit = false;
			$.ajax({
				type: 'GET',
				async: false,
				url: '/app/order/pre_virtual_order',
				dataType: 'json',
				success: function (data) {
					var ff = document.f1;
					ff.unpay_order_cnt.value = data.unpay_order_cnt;
					ff.unpay_goods_cnt.value = data.unpay_goods_cnt;
					ff.cancel_order_cnt.value = data.cancel_order_cnt;
					ff.cancel_order_dday.value = data.cancel_order_dday;
					ff.cancel_goods_cnt.value = data.cancel_goods_cnt;
					ff.refund_goods_cnt.value = data.refund_goods_cnt;
					ff.unpay_limited_goods_cnt.value = data.unpay_limited_goods_cnt;
					ff.limited_goods_order_yn.value = data.limited_goods_order_yn;

					isSubmit = true;
				}
			});
			this.isPreVirtualOrderData = isSubmit;
		}
	}

	/**
	 * 가상 계좌 결제 수단 검증
	 */
	this.validVirtualPayType = function () {
		this.initPreVirtualOrder();

		if (!this.isPreVirtualOrderData) {
			alert('가상 계좌 결제 요청이 일시적으로 실패되었습니다.');
			return false;
		}

		var ff = document.f1;

		var unpayOrderCnt = parseInt(ff.unpay_order_cnt.value);
		if (unpayOrderCnt > 10) {
			alert('여러 고객님들께 구매 기회를 드리기 위해 가상 계좌 다수 주문을 제한하고 있습니다. 이전 가상 계좌 주문건의 입금 혹은 주문취소 부탁드립니다.');
			return false;
		}

		var unpayGoodsCnt = parseInt(ff.unpay_goods_cnt.value);
		if (unpayGoodsCnt > 0) {
			alert('동일 상품의 미결제 주문건이 있습니다. 이전 가상 계좌 주문건의 입금 혹은 주문취소 부탁드립니다.');
			return false;
		}

		var cancelOrderCnt = parseInt(ff.cancel_order_cnt.value);
		var cancelOrderDday = ff.cancel_order_dday.value;
		if (cancelOrderCnt > 2) {
			alert('가상 계좌 주문 후 반복적인 주문 취소 시 가상 계좌 주문이 ' + cancelOrderDday + '일간 제한됩니다. 다른 결제수단을 이용하거나 제한 해제일 이후 주문 부탁드립니다.');
			return false;
		}

		var cancelGoodsCnt = parseInt(ff.cancel_goods_cnt.value);
		if (cancelGoodsCnt > 0) {
			alert('가상 계좌 주문 후 입금되지 않아 금일 취소된 상품은 다른 결제 수단 이용 부탁드립니다.');
			return false;
		}

		var refundGoodsCnt = parseInt(ff.refund_goods_cnt.value);
		if (refundGoodsCnt > 0) {
			alert('최근 3회 이상 환불완료 한 상품으로 주문이 제한됩니다. 다른 상품을 이용하여 주십시오.');
			return false;
		}

		// 한정 상품의 경우 입금되지 않은 주문은 최대 2건까지만 주문 가능
		var unpayLimitedGoodsCnt = parseInt(ff.unpay_limited_goods_cnt.value);
		if (unpayLimitedGoodsCnt > 2) {
			alert('수량 제한 상품의 경우 가상계좌로는 최대 2개만 주문할 수 있습니다.\n타 결제 수단 이용 부탁드립니다.');
			return false;
		}

		// 한정 상품의 경우 주문취소했을 경우 기존 동일 상품 옵션으로 24시간(당일)동안 재주문이 안됨.
		var limitedGoodsOrderYn = ff.limited_goods_order_yn.value;
		if (limitedGoodsOrderYn == 'N') {
			alert('가상계좌 결제 후 주문 취소한 상품은 24시간 내 가상계좌 재주문이 불가합니다.\n다른 결제 수단을 이용해주세요.');
			return false;
		}

		// 단일상품 최대 30개까지만 허용
		var objCartGoodsCnt = $('form[name="f1"] input[name="cart_goods_cnt[]"]');
		if (objCartGoodsCnt.length == 1) {
			if (parseInt(objCartGoodsCnt[0].value) > 30) {
				alert("가상 계좌 구매 시, 최대 구매 수량은 30개 입니다.\n다른 결제 수단을 이용해주세요.");
				return false;
			}
		}

		return true;
	}

	/*
	 * 무신사페이 & 현대카드 전용 상품 검증
	 */
	this.ValidExclusiveMsspayEvent = function () {
		var ff = document.f1;

		var exclusive_msspay = $("input[name='exclusive_msspay'][type='hidden']");
		var exclusive_msspay_hyundaicard = $("input[name='exclusive_msspay_hyundaicard'][type='hidden']");

		var is_exclusive_msspay = false;
		var is_exclusive_msspay_hyundaicard = false;

		for (var i = 0; i < exclusive_msspay.length; i++) {
			if (exclusive_msspay[i].value == 'Y') {
				is_exclusive_msspay = true;
				if (exclusive_msspay_hyundaicard[i].value == 'Y') {
					is_exclusive_msspay_hyundaicard = true;
				}
			}
		}

		if (is_exclusive_msspay) {
			if (!Order.isMsspaySelected()) {
				alert('무신사페이 전용 상품입니다. 무신사페이로 결제 부탁드립니다.');
				return false;
			}

			if (is_exclusive_msspay_hyundaicard) {
				if (!Msspay.isPLCCBySelectedPayment()) {
					alert('무신사 현대카드 전용 상품입니다. 무신사 현대카드로 결제 부탁드립니다.');
					return false;
				}
			}
		}

		return true;
	}

	/**
	 * 우편번호 자릿수 검증
	 */
	this.validZipCode = function(zipcode) {
		if (zipcode.length != 5) {
			if (confirm('우편법시행령에 따라, 6자리 우편번호는 사용이 불가합니다. 배송지 수정을 통해 5자리 우편번호로 변경해주세요.')) {
                showDelivery();
            }
			return false;
		}

		return true;
	}

	/**
	 * 배송 출입 타입 검증
	 */
	this.validDeliveryEntrance = function() {
		if ($('#dawnDeliveryYN').val() === 'N') {
			return true;
		}

		if ($('input[name=dlv_entrance_type]:checked').val() === undefined) {
			alert("출입방법을 선택해주세요.\n(새벽배송 해당되지 않는 지역은 '해당없음'에 체크)");
			return false;
		}

		if ($('input[name=dlv_entrance_type]:checked').val() === 'password' && $('#dlv_entrance_memo').val() === '') {
			alert("공동현관 비밀번호를 입력해주세요.");
			return false;
		}

		return true;
	}

	this.initOrderNo = function() {
		if (document.order_info.ord_no.value == '') {
			$.ajax({
				type: 'POST',
				async: false,
				url: '/app/order/generate_order_no',
				data: {},
				dataType: 'json',
				success: function (response) {
					document.order_info.ord_verify_key.value = response.ord_verify_key;
					document.order_info.ord_key.value = response.ord_key;
					document.order_info.ord_no.value = response.ord_no;
					document.order_info.ordr_idxx.value = response.ord_no;
					document.order_info.good_info.value = document.order_info.good_info.value.replace(/ordr_numb=/g, 'ordr_numb=' + response.ord_no);
					window.name = 'order_form_' + response.ord_no;
				}
			});
		}
	};

	this.checkLogin = function() {
		if (Order.isLogin === true) {
			return true;
		}

		$.ajax({
			type: 'GET',
			async: false,
			url: '/app/order/login_check',
			dataType: 'json',
			success: function(response) {
				if (response.result === 1) {
					Order.isLogin = true;
				}
			}
		});

		return Order.isLogin;
	}

	this.setCashReceipt = function(cashReceiptInfo) {
		if (Object.keys(cashReceiptInfo).length === 0 || cashReceiptInfo.registrationType  === 'NONE') {
			showCashReceiptByType('INCOME');
			return ;
		}

		$('input[type="radio"][name="cash_btn"][value=' + cashReceiptInfo.registrationType + ']').click();
		if (cashReceiptInfo.registrationType  === 'INCOME') {
			$('[name="income_type_number"]').val(cashReceiptInfo.registrationNumber);
			$('[name=select-income]').val(cashReceiptInfo.numberType).selectmenu().selectmenu('refresh');
		} else if (cashReceiptInfo.registrationType  === 'SPENDING') {
			$('[name="spending_type_number"]').val(cashReceiptInfo.registrationNumber);
			$('[name=select-spending]').val(cashReceiptInfo.numberType).selectmenu().selectmenu('refresh');
		}
		showCashReceiptByType(cashReceiptInfo.registrationType);
	};

	this.orderTooltip = function (uiTooltip) {
		const tooltipInner = $(uiTooltip).prev('.order__tooltip').attr('data-tooltip');
		const tooltipActive = tooltipInner + `--active`;

		$(uiTooltip).toggleClass(tooltipActive);

		if ($(uiTooltip).hasClass(tooltipActive)) {
			$(window).scroll(function () {
				$(uiTooltip).removeClass(tooltipActive);
			});
		}
	};

	this.showDeliveryForm = function (type) {
		const ff = document.f1;
		const divId = "delivery_form";
		let serviceUrl = "/app/delivery/delivery_form?return_type=N";
		if (type === 'edit') {
			serviceUrl += "&name=" + encodeURIComponent(ff.rcvr_nm.value);
			serviceUrl += "&title=" + encodeURIComponent(ff.rtitle.value);
			serviceUrl += "&zipcode1=" + encodeURIComponent(ff.rzip_cd1.value);
			serviceUrl += "&addr1=" + encodeURIComponent(ff.rzip_addr1.value);
			serviceUrl += "&addr2=" + encodeURIComponent(ff.rzip_addr2.value);
			serviceUrl += "&mobile1=" + encodeURIComponent(ff.rmobile1.value);
			serviceUrl += "&mobile2=" + encodeURIComponent(ff.rmobile2.value);
			serviceUrl += "&mobile3=" + encodeURIComponent(ff.rmobile3.value);
			serviceUrl += "&phone1=" + encodeURIComponent(ff.rphone1.value);
			serviceUrl += "&phone2=" + encodeURIComponent(ff.rphone2.value);
			serviceUrl += "&phone3=" + encodeURIComponent(ff.rphone3.value);
			serviceUrl += "&dlv_msg=" + encodeURIComponent(ff.dlv_msg.value);
			serviceUrl += "&no=" + encodeURIComponent(ff.rselectedNo.value);
		}
		window.open(serviceUrl, divId, "width=570, height=630, scrollbars=no");
	};
};

/*
	Funcion : freplace
	특수문자 치환
	
	Parameters:		
		item - 특수문자
		 		
	See Also:		
*/
function freplace(item) {
	
	item = item.replace(/\'/g,''); 
	item = item.replace(/\"/g,''); 
	item = item.replace(/&/g,''); 
	item = item.replace(/;/g,''); 
	item = item.replace(/\\n/g,''); 
	item = item.replace(/\\/g,''); 
	item = item.replace(/|/g,''); 

	return item;
}

function showClaim() // 환불 계좌 항목 UI toggle 함수
{
	$("#SoldoutContTitle").hide();
	$("#SoldoutCont").hide();
	$("#soldOutNonRefundablePayment").hide();

	const payKind = document.f1.pay_kind.value;

	if ((payKind === 'VTRANSFER' || payKind === 'TRANSFER')
		&& (!Order.isMsspaySupported() || (Order.isMsspaySupported() && !Order.isMsspaySelected()))
	) {
		$("#SoldoutContTitle").show();
		$("#SoldoutCont").show();
	} else {
		$("#soldOutNonRefundablePayment").show();
	}
}

/**
 * 현금영수증 발급 목적
 * @returns {string}
 */
function getCashReceiptType() {
	return $('input[type="radio"][name="cash_btn"]:checked').val();
}

/**
 * 현금영수증 발급번호 타입
 * @returns {string}
 */
function getCashReceiptNumberType() {
	var cashReceiptType = getCashReceiptType();
	if (cashReceiptType === 'INCOME') {
		return $('[name="select-income"]').val();
	} else if (cashReceiptType === 'SPENDING') {
		return $('[name="select-spending"]').val();
	}
	return '';
}

/**
 * 현금영수증 발급번호
 * @returns {string}
 */
function getCashReceiptNumber() {
	var cashReceiptType = getCashReceiptType();
	if (cashReceiptType === 'INCOME') {
		return $('[name="income_type_number"]').val();
	} else if (cashReceiptType === 'SPENDING') {
		return $('[name="spending_type_number"]').val();
	}
	return '';
}

function checkAccountForGuest()
{
	Order.initOrderNo();

	var ff = document.f1;

	if (ff.guest.value != "Y") {
		return false;
	}

	var refundBankCode = $('#refund_bank_select option:selected').val();
	var refundAccount = $('#refund_account_input').val();
	var refundDepositor = $('#refund_depositor_input').val();

	if (refundBankCode == "") {
		alert("환불 입금은행을 확인해주세요.");
		return false;
	}

	if (refundAccount == "") {
		alert("환불 계좌번호를 확인해주세요.");
		return false;
	}

	if (refundAccount.length < 10 || refundAccount.length > 20) {
		alert("환불 계좌번호는 10자리 ~ 20자리를 입력해 주십시오.");
		return false;
	}

	if (!isNumVal(refundAccount)) {
		alert("환불 계좌번호는 숫자만 입력할 수 있습니다.");
		return false;
	}

	if(refundDepositor == ""){
		alert("환불 예금주를 확인해주세요.");
		return false;
	}

	var authParams = {
		bankCode : refundBankCode,
		accountNo : refundAccount,
		holderName : refundDepositor,
	};

	var authResult = RefundAccount.checkRefundAccount(authParams);

	if (authResult.isSuccess === true && authResult.isPgError === false) {
		alert("계좌 인증이 완료되었습니다.");
		ff.refund_bank.value = $('#refund_bank_select option:selected').text();
		ff.refund_account.value = refundAccount;
		ff.refund_depositor.value = refundDepositor;
		ff.cert_state.value = "Y";
	} else {
		ff.refund_bank.value = '';
		ff.refund_account.value = '';
		ff.refund_depositor.value = '';
		ff.cert_state.value = "N";
	}
}

function getRefundAccount() {
	var ff = document.f1;
	var result = RefundAccount.getRefundAccount();

	var refundBank = result.detailResult.refundBank;
	var refundAccount = result.detailResult.refundAccount;
	var refundDepositor = result.detailResult.refundDepositor;

	if (refundAccount === undefined || refundBank === undefined || refundDepositor === undefined) {
		$("#refund_info").html("환불 받을 계좌를 등록해주세요.");
		$("#refund_info").addClass("account-none");
		$("#refund_info_button").text("등록하기");
		ff.refund_bank.value = '';
		ff.refund_account.value = '';
		ff.refund_depositor.value = '';
		ff.cert_state.value = "N";
	} else {
		$("#refund_info").html(refundDepositor + " | " + refundBank  + " " + refundAccount);
		$("#refund_info").removeClass("account-none");
		$("#refund_info_button").text("변경하기");
		ff.refund_bank.value = refundBank;
		ff.refund_account.value = refundAccount;
		ff.refund_depositor.value = refundDepositor;
		ff.cert_state.value = "Y";
	}
}

/**
 * 2019.10.05
 * 결제수단(pg_pay_method) 결정
 * pg_pay_method 결제수단으로 pg_kind를 선정하기위해 함수 추가
 */
function setPgPayMethod(pg_pay_method) {
	if (pg_pay_method != "") {
		document.f1.pg_pay_method.value = pg_pay_method;
		document.order_info.pg_pay_method.value = pg_pay_method;
	} else {
		alert("결제수단이 누락되었습니다.");
	}
}

function setPayKind(payKind) {
	if (payKind != "") {
		document.f1.pay_kind.value = payKind;
	} else {
		alert("결제수단이 누락되었습니다.");
	}
}

/*
*  PAYMETHOD 별 DEFAULT_PG 값을 변경하기위해 설정.
* */
function convertPgKind() {
	var pg_pay_method = document.f1.pg_pay_method.value;
	var pg_kind = "";

	switch (pg_pay_method) {
		case "ACNT" :
		case "MOBILE" :
		case "CARD" :
		case "VCNT" :
		case "BANK" :
		case "OVERSEA_CARD" :
			pg_kind = "mpay";
			break;
		case "KCP_SSP" :
			pg_kind = "kcp_ssp";
			break;
		case "PAYCO" :
			pg_kind = "payco";
			break;
		case "KKOPAY" :
			pg_kind = "kkopay";
			break;
		case "NAVERPAY" :
			pg_kind = "naverpay";
			break;
		case "TOSS" :
			pg_kind = "toss";
			break;
	}

	return pg_kind;
}

function unbindPayment()
{
	$("#btn_pay").attr("onclick", "").unbind("click");
}

function bindPayment()
{
	$("#btn_pay").attr("onclick", "Order.payment()");
}

// naverpay 상품정보 제공을 위해 dataLayer 값 사용
function getProductInfo()
{
	var product_info = [];

	dataLayer.forEach(function (element) {
		if (element.orderInfo) {
			for (var i = 0; i < element.orderInfo.list.length; i++) {
				product_info.push(element.orderInfo.list[i]);
			}
		}
	});

	return product_info;
}

function showDelivery() {
	var div_id = "delivery_list";
	var service_url = "/app/delivery/lists";

	if(document.f1.rselectedNo.value != ''){
		service_url += "?selected_no="+document.f1.rselectedNo.value;
	}

	window.open(service_url, div_id, "width=500, height=974,resizable=yes,scrollbars=yes");
}

const Pickup = {
	// 픽업 장소 선택
	selectLocation: function(deliveryCode) {
		const activeClass = 'cell_pickup_button--active';
		const buttons = document.querySelectorAll('.btn-pickup-location');
		const shopPickupLocation = document.querySelector('input[name=shop_pickup_location]');

		shopPickupLocation.value = deliveryCode;

		for (let i = 0; i < buttons.length; i++) {
			if (buttons[i].dataset.key === deliveryCode) {
				buttons[i].classList.add(activeClass);
			} else {
				buttons[i].classList.remove(activeClass, 'dss');
			}
		}
	}
};