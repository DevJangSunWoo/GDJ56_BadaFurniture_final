var PLCC = {
    getMinPayAmt: function() {
        return 1000;
    },
    getMinPayAmtByFirstPayDiscount : function() {
        return PLCC.getMinPayAmt() + PLCC.getPLCCFirstPayDiscountAmt();
    },
    setPLCCData: function() {
        var plccData = '';
        $.ajax({
            type: "GET",
            url: "/app/plcc/getPlcc?channelCode=ORDER",
            dataType: "json",
            success: function(response) {
                plccData = response.data;
                if (plccData.plccOpenYn == 'Y') {
                    if (plccData.cd == 1) {
                        $('.search_plcc_info_area').hide();
                        PLCC.getFirstPayDiscountInfo(plccData.firstCardDiscountAvailable, PLCC.showPLCCFirstDiscountArea);
                        PLCC.showPLCCDiscountArea(plccData.cardYN, plccData.cardUnderperformYN, plccData.discountAmount, plccData.kind);
                        PLCC.showPLCCIssueArea(plccData.cardYN, plccData.firstCardDiscountUseYn);
                        PLCC.checkExcludeInterestFreeText();
                    } else {
                        // PLCC 데이터 정보 읽기 실패
                        $('.btn_billing').hide();
                        $('.search_plcc_info_area').show();
                    }
                } else {
                    $('.order_hyundaicard').hide();
                }
            }
        });
    },
    getFirstPayDiscountInfo: function (firstCardDiscountAvailable, callback) {
        $.ajax({
            type: 'GET',
            async: false,
            url: '/app/plcc/first_payment_discount_info',
            dataType: 'json',
            success: function (response) {
                if (response.data) {
                    var plccDiscountInfo = response.data;
                    firstDiscountInfo.setEventKind(plccDiscountInfo.event_kind);
                    firstDiscountInfo.setEventName(plccDiscountInfo.event_nm);
                    firstDiscountInfo.setType(plccDiscountInfo.dc_type);
                    firstDiscountInfo.setAmount(plccDiscountInfo.dc_amt);
                    firstDiscountInfo.setRate(plccDiscountInfo.dc_rate);
                    firstDiscountInfo.setMinAmount(plccDiscountInfo.min_dc_amt);
                    firstDiscountInfo.setMaxAmount(plccDiscountInfo.max_dc_amt);
                    firstDiscountInfo.setMinAmountUseYn(plccDiscountInfo.min_dc_amt_use_yn);
                    firstDiscountInfo.setMaxAmountUseYn(plccDiscountInfo.max_dc_amt_use_yn);
                }
            },
            complete: function () {
                callback(firstCardDiscountAvailable);
            }
        });
    },
    showPLCCFirstDiscountArea: function(firstCardDiscountAvailable) {
        $('[name=first_cart_discount_name]').text(firstDiscountInfo.eventName);
        if (!firstCardDiscountAvailable) {
            $(".first_card_discount_area").hide();
            $(".first_card_discount_txt").hide();
        } else {
            $(".first_card_discount_area").show();
            $(".first_card_discount_txt").show();

            // 장바구니에서 주문서작성 이동 시, 첫결제즉시할인 버튼 자동 선택 or 결제하기 페이지 바로 진입 시, 자동 선택
            if ((isCheckedOrderDiscount() && getCookie("clicked_first_plcc_dc") == 'true') || !isCheckedOrderDiscount()) {
                var plccDiscountAmount = PLCC.getPLCCFirstPayDiscountAmt();
                if (plccDiscountAmount > 0) {
                    PLCC.setPLCCFirstPayDiscountCard();
                    if ($('#limit_plcc_dc_yn').length && $('#limit_plcc_dc_yn').val() === 'Y') {
                        PLCC.changePLCCFirstPayDiscountYn('N');
                    } else {
                        PLCC.changePLCCFirstPayDiscountYn('Y');
                    }
                    PLCC.setClickedYnFirstPayDiscount();
                }
            }
        }
    },
    /* 첫결제즉시할인 유효성 체크 */
    validatePLCCFirstPayDiscount: function() {
        if (firstDiscountInfo.minAmountUseYn === 'Y') {
            if (PLCC.getPLCCFirstPayDiscountAmt() < firstDiscountInfo.minAmount) {
                alert('현대카드 즉시할인은 할인 금액이 ' + Comma(firstDiscountInfo.minAmount) + '이상인 경우 적용 가능 합니다.');
                return false;
            }
        }

        if (Order.getPayAmt() < PLCC.getMinPayAmtByFirstPayDiscount()) {
            alert('결제 금액 ' + Comma(PLCC.getMinPayAmt()) + '원 이상 일 때 적용 가능합니다.');
            return false;
        }
        return true;
    },
    /* 첫결제즉시할인 적용 여부 */
    isActivePLCCFirstPayDiscountBtn: function() {
        return $(".hyundaicard-firstpayment").hasClass("is-active");
    },
    /* 첫결제즉시할인 적용/미적용 금액 계산 */
    changePLCCFirstPayDiscountYn: function(clicked_yn) {
        var cartDcAmt = 0;

        if (clicked_yn == 'Y') {
            PLCC.setPLCCFirstPayDiscountCard(); // 카드 자동 선택

            $(".hyundaicard-firstpayment").addClass("is-active");
            $('#hyundaicardFirstPayment').addClass('is-active');

            cartDcAmt = PLCC.getPLCCFirstPayDiscountAmt();
            $("input[name='chk_plcc_first_pay_dc']").prop("checked", true);
            $('.payment-tit-comment').hide();
        }

        if (clicked_yn == 'N') {
            $(".hyundaicard-firstpayment").removeClass("is-active");
            $('#hyundaicardFirstPayment').removeClass('is-active');
            $("input[name='chk_plcc_first_pay_dc']").prop("checked", false);
        }

        $('#span_plccDiscountAmount').html('-' + Comma(cartDcAmt) + '원');
        $('[name=cart_dc_amt]').val(cartDcAmt);
        $('.cart_dc_amt').html(Comma(cartDcAmt));

        Order.isDiscountAmtExceedsPriceByProduct();
        Order.CalculateAmt();
    },
    setClickedYnFirstPayDiscount: function() {
        var clicked_yn = PLCC.isActivePLCCFirstPayDiscountBtn() ? 'Y' : 'N';
        $('#clicked_yn_first_dc_amt_btn').val(clicked_yn);
    },
    getClickedYnFirstPayDiscount: function() {
        return $('#clicked_yn_first_dc_amt_btn').val();
    },
    getCardType : function() {
        return $(".order_hyundaicard input[name='card_type']").val();
    },
    /** 첫결제즉시할인 적용 시, PLCC 카드 자동 선택 **/
    setPLCCFirstPayDiscountCard: function() {
        if (Order.isMsspaySupported()) {
            var plccIndex = Msspay.getPLCCIndex();
            if (typeof plccIndex != 'undefined') {
                if (!Msspay.isPLCCBySelectedPayment()) {
                    Msspay.changeCardSwiperMethod(plccIndex);
                }
                $('input[type=radio][name=payment_choice][value=msspay]').trigger('click', 'noCheckUsePLCC');
            } else {
                if ($('div[id^="__msspay-method-"]').size() === 0) {
                    Msspay.changeCardSwiperMethod(1);
                } else {
                    Msspay.changeCardSwiperMethod(0);
                }
                $('input[type=radio][name=payment_choice][value=msspay]').trigger('click', 'noCheckUsePLCC');
            }
        }
    },
    showPLCCDiscountArea: function(cardYN, cardUnderperformYn, discountCardDCAmt, cardType) {
        if (cardYN == 'Y') {
            $(".card_discount_area").show();

            $("input[name='card_underperform_yn']").val(cardUnderperformYn);    // 전월 실적 미달 여부
            $('#possible_card_dc_amt').text(Comma(discountCardDCAmt));          // 잔여 한도 금액
            $("input[name='card_type']").val(cardType);                         // 카드 종류

            Order.setPLCCDiscount();    // 청구할인액 계산

            $(".card_discount_type").text((cardType == "CREDIT_CARD")? "청구" : "캐시백");
            $(".card_percent_discount_type").text((cardType == "CREDIT_CARD")? "5% 청구할인" : "3% 캐시백");

            if (cardUnderperformYn == 'N') {
                $('.card_perform').show();
                $('.card_underperform').hide();
                if (Msspay.isPLCCBySelectedPayment() && Order.isMsspaySelected() && !Order.isCardUnderPerform()) {
                    $('.total_card_discount_area').show();
                    $('.btn_billing').show();
                } else {
                    $('.total_card_discount_area').hide();
                    $('.btn_billing').hide();
                }
            } else {
                $('.card_perform').hide();
                $('.card_underperform').show();
                $('.total_card_discount_area').hide();
                $('.btn_billing').hide();
            }
        } else {
            $(".card_discount_area").hide();
            $('.btn_billing').hide();
        }
    },
    showPLCCIssueArea : function(cardYN, firstCardDiscountUseYN) {
        if (cardYN == 'Y') {
            $(".hyundaicard-not").hide();
            if ($('.swiper-wrapper div#__msspay-issue-area').css('display') === 'block') {
                $('.get-card-button').addClass('__msspay-add-method-button').attr("href", "javascript:void(0)");
                $('.get-card-button').html('무신사 현대카드 등록하기');
                $('.issued_msspay_txt').show();
                $('.not_issued_msspay_txt').hide();
            }
        } else {
            $(".hyundaicard-not").show();
            if (firstCardDiscountUseYN == 'N') {
                $(".first_card_discount_txt").hide();
                $(".first_card_discount_area").hide();
            } else {
                $(".first_card_discount_txt").show();
                $(".first_card_discount_area").show();
            }
        }
    },
    checkExcludeInterestFreeText: function () {
        if (Msspay.isPLCCBySelectedPayment()
            && Msspay.isCardQuotaInterestFreeBySelectedPayment()
            && Order.isMsspaySelected()
            && !Order.isCardUnderPerform()
            && PLCC.getCardType() == 'CREDIT_CARD'
        ) {
            $('#txt_exclude_interest_free').show();
        } else {
            $('#txt_exclude_interest_free').hide();
        }
    },
    checkPLCCFirstPayDiscountByCardSwiper: function() {
        if (!Msspay.isPLCCBySelectedPayment()) {
            PLCC.changePLCCFirstPayDiscountYn('N');
            return false;
        }

        if (PLCC.getClickedYnFirstPayDiscount() != 'Y') {
            return false;
        }

        var totalPayAmt = Order.getPayAmt();
        if (totalPayAmt >= PLCC.getMinPayAmtByFirstPayDiscount()) {
            PLCC.changePLCCFirstPayDiscountYn('Y');
        }
    },
    checkUsePLCCFirstPayDiscountByPaymentChoice: function(paymentChoice) {
        if (paymentChoice != 'msspay') {
            if (PLCC.isActivePLCCFirstPayDiscountBtn()) {
                PLCC.changePLCCFirstPayDiscountYn('N');
                $('.payment-tit-comment').show();
            }
            return false;
        }

        $('.payment-tit-comment').hide();

        if (PLCC.isActivePLCCFirstPayDiscountBtn()) {
            return false;
        }

        if (PLCC.getClickedYnFirstPayDiscount() != 'Y') {
            return false;
        }

        if (!Msspay.isPLCCBySelectedPayment()) {
            return false;
        }

        var totalPayAmt = Order.getPayAmt();
        if (totalPayAmt >= PLCC.getMinPayAmtByFirstPayDiscount()) {
            PLCC.changePLCCFirstPayDiscountYn('Y');
        }
    },
    checkPLCCDiscount: function(paymentChoice) {
        if (Order.isMsspaySelected()
            && Msspay.isPLCCBySelectedPayment()
            && !Order.isCardUnderPerform()
        ) {
            Order.setPLCCDiscount();
            $('.btn_billing').show();
            $('.total_card_discount_area').show();
        } else {
            $('.btn_billing').hide();
            $('.total_card_discount_area').hide();
        }
    },
   	getPLCCFirstPayDiscountAmt: function () {
   		var totalProductAmount = parseInt(f1.order_prd_amt.value);
        var plccDiscountAmount = (firstDiscountInfo.type === 'amt') ? firstDiscountInfo.amount : Math.round(totalProductAmount * (firstDiscountInfo.rate / 100));

   		if (firstDiscountInfo.minAmountUseYn === 'Y' && plccDiscountAmount < firstDiscountInfo.minAmount) {
   			plccDiscountAmount = 0;
   		} else if (firstDiscountInfo.maxAmountUseYn === 'Y' && plccDiscountAmount > firstDiscountInfo.maxAmount) {
   			plccDiscountAmount = firstDiscountInfo.maxAmount;
   		}

   		if (plccDiscountAmount <= 0) {
   			plccDiscountAmount = 0;
   		}

   		return plccDiscountAmount;
   	}
}