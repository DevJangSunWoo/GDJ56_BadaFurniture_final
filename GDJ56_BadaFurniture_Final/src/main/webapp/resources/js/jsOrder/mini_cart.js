var miniCart = new function()
{
	this.id	 			= 'mini_cart';
	this.service_url	= '/app/svc/mini_cart/';
	this.offset			= null;
	this.width			= 174;
	this.isWorking		= false;

	this.checkStock = function(goodsNo, goodsSub, option, qty, shop_no)
	{
		var shop_no = shop_no || 1;
		var result = false;

		$.ajax({
			type: 'post',
			async: false,
			url: '/app/svc/check_stock/' + [goodsNo, goodsSub].join('/'),
			data: {
				option: option,
				qty: qty,
				shop_no:shop_no
			},
			dataType: 'json',
			success: function(response) {
				result = response.isEnoughQty;
			}
		});

		return result;
	}

	this.chkJaego = function(goods_no, goods_sub, opt, goods_cnt)
	{
		var self = miniCart;
		var result = 0;
		$.ajax({
			type: "POST",
			async: false,
			url: "/app/svc/jaego_chk/" + goods_no + "/" + goods_sub,
			data: "goods_opt=" + urlEncode(opt) + "&goods_cnt=" + goods_cnt,
			success: function(msg) {
				eval("var response = " + msg);
				result = response.result;
			}
		});
		return result;
	}

	this.deleteCart = function(str)
	{
		if (miniCart.isWorking === true) {
			alert('상품 삭제 중입니다.');
			return;
		}

		miniCart.isWorking = true;

		$.ajax({
			type : 'POST',
			url: '/app/cart/delete',
			data: {
				delete_no: str
			},
			dataType: 'json',
			success: function(result) {
				var slide_cart_id = "slide_cart_" + str;
				$("#" + slide_cart_id).remove();
				if($("#slide_cart > li").length < 3){
					$("#slide_cart").css("height","");
				}
				//shoppingSlide.viewCart(false);
			},
			complete: function() {
				miniCart.isWorking = false;
			}
		});
	}

	this.directOrder = function()
	{
		document.location.href = '/app/order/order_form';
	}

	this.allOrder = function()
	{
		var cart_idxs = "";

		if (miniCart.isWorking === true) {
			alert('주문 진행 중입니다.');
			return;
		}

		miniCart.isWorking = true;

		var callAjax = function (guestYn) {
			$.ajax({
				type: 'POST',
				url: '/app/cart/select_order',
				data: 'cart_idxs=' + cart_idxs,
				dataType: 'json',
				success: function(result) {
					if (result.success === true) {
						window.dataLayer = window.dataLayer || [];
						window.dataLayer.push ({
							'event': 'evOrder'
						});
						location.href = guestYn == 'Y' ? getServiceUrl('login') : '/app/order/order_form';
					} else {
						if (typeof result.message !== 'undefined' && result.message !== '') {
							alert(result.message);
						}
					}
				},
				complete: function() {
					miniCart.isWorking = false;
				}
			});
		}

		if (!checkSelfCert('001', function(response) {
			callAjax(typeof response == 'object' && response.data && response.data.guest_yn);
		})) {
			return;
		}
		callAjax();
	}

}
