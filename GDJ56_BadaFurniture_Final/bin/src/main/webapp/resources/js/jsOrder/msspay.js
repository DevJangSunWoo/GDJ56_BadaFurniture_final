window.Msspay = window.Msspay || {};

Msspay.install = function(config) {
    config = config || {};

    const self = this;

    var immediateDiscountMaxAmt = 0;

    const methodAddWindow = new PopupWindow('msspayMethodAddWindow', {
        onAfterClosed: function() {
            if (repository.status.isUnregistered()) {
                self.loadMsspayMethodList();
            }
        }
    });

    const payWindow = new PopupWindow('msspayPayWindow');

    const methodIdIssuer = new function() {
        var methodId = 0;

        const issue = function() {
            return ++methodId;
        };

        return {
            issue: issue
        };
    };

    const CARD_PRESET_METHOD = {
        'CCKM': {'name': '국민카드', 'designCode': 'card0', 'class': 'kookmin'},
        'CCBC': {'name': 'BC카드', 'designCode': 'card1', 'class': 'bc'},
        'CCHN': {'name': '하나카드', 'designCode': 'card2', 'class': 'hana'},
        'CCLG': {'name': '신한카드', 'designCode': 'card3', 'class': 'shinhan'},
        'CCSS': {'name': '삼성카드', 'designCode': 'card4', 'class': 'samsung'},
        'CCDI': {'name': '현대카드', 'designCode': 'card5', 'class': 'hyundai'},
        'CCLO': {'name': '롯데카드', 'designCode': 'card6', 'class': 'lotte'},
        'CCNH': {'name': 'NH농협카드', 'designCode': 'card7', 'class': 'nonghyup'},
        'CC33': {'name': '우리카드', 'designCode': 'card8', 'class': 'woori'},
        'CCSU': {'name': '수협카드', 'designCode': 'card9', 'class': 'suhyup'},
        'CCJB': {'name': '전북카드', 'designCode': 'card10', 'class': 'jeonbuk'},
        'CCKJ': {'name': '광주카드', 'designCode': 'card11', 'class': 'kwangju'},
        'CCCJ': {'name': '제주카드', 'designCode': 'card12', 'class': 'jeju'},
        'CCCT': {'name': '씨티카드', 'designCode': 'card13', 'class': 'citi'},
        'CC303': {'name': '토스뱅크카드', 'designCode': 'bank24', 'class': 'toss'},
        'CCPL': {'name': '무신사현대카드', 'designCode': 'card5', 'class': 'hyundai'}
    };
    Object.freeze(CARD_PRESET_METHOD);

    const BANK_PRESET_METHOD = {
        'BK11': {'name': '농협은행', 'designCode': 'bank0', 'class': 'nonghyup'},
        'BK20': {'name': '우리은행', 'designCode': 'bank1', 'class': 'woori'},
        'BK88': {'name': '신한은행', 'designCode': 'bank2', 'class': 'shinhan'},
        'BK04': {'name': '국민은행', 'designCode': 'bank3', 'class': 'kookmin'},
        'BK81': {'name': '하나은행', 'designCode': 'bank4', 'class': 'hana'},
        'BK27': {'name': '한국시티은행', 'designCode': 'bank5', 'class': 'citi'},
        'BK03': {'name': '기업은행', 'designCode': 'bank6', 'class': 'ibk'},
        'BK02': {'name': '산업은행', 'designCode': 'bank7', 'class': 'kdb'},
        'BK23': {'name': 'SC제일은행', 'designCode': 'bank8', 'class': 'sc'},
        'BK31': {'name': '대구은행', 'designCode': 'bank9', 'class': 'daegu'},
        'BK32': {'name': '부산은행', 'designCode': 'bank10', 'class': 'busan'},
        'BK37': {'name': '전북은행', 'designCode': 'bank11', 'class': 'jeonbuk'},
        'BK39': {'name': '경남은행', 'designCode': 'bank12', 'class': 'kyongnam'},
        'BK35': {'name': '제주은행', 'designCode': 'bank13', 'class': 'jeju'},
        'BK34': {'name': '광주은행', 'designCode': 'bank14', 'class': 'kwangju'},
        'BK45': {'name': '새마을금고', 'designCode': 'bank15', 'class': 'mg'},
        'BK07': {'name': '수협은행', 'designCode': 'bank16', 'class': 'suhyup'},
        'BK48': {'name': '신협은행', 'designCode': 'bank17', 'class': 'shinhyup'},
        'BK71': {'name': '우체국', 'designCode': 'bank18', 'class': 'epost'},
        'BK89': {'name': '케이뱅크', 'designCode': 'bank19', 'class': 'kbank'},
        'BK90': {'name': '카카오뱅크', 'designCode': 'bank20', 'class': 'kakao'},
        'BK64': {'name': '산림조합', 'designCode': 'bank22', 'class': 'sanlim'},
        'BK103': {'name': 'SBI저축은행', 'designCode': 'bank23', 'class': 'sbi'},
        'BK888': {'name': '토스뱅크', 'designCode': 'bank24', 'class': 'toss'}
    };
    Object.freeze(BANK_PRESET_METHOD);

    const PLCC_DESIGN_CODE = {
        'DS' : 'DS',
        'DT' : 'DT',
        'DU' : 'DU',
        'DV' : 'DV',
        'DW' : 'DW',
        'DX' : 'DX',
        'DY' : 'DY',
        'DZ' : 'DZ',
        'D1' : 'D1',
        'UI' : 'card5',
    };
    Object.freeze(PLCC_DESIGN_CODE);

    const MsspayMethod = function(method) {
        const methodId = methodIdIssuer.issue();

        const getId = function() {
            return methodId;
        };

        const getName = function() {
            if (method.kind === 'TRANSFER') {
                return BANK_PRESET_METHOD[method.code] && BANK_PRESET_METHOD[method.code].name || '기타은행';
            } else {
                return CARD_PRESET_METHOD[method.code] && CARD_PRESET_METHOD[method.code].name || '기타카드';
            }
        };

        const getNameAlias = function() {
           return method.nameAlias || '';
        };

        const getDesignCode = function() {
            if (method.kind === 'TRANSFER') {
                return BANK_PRESET_METHOD[method.code] && BANK_PRESET_METHOD[method.code].designCode || 'bank100';
            } else {
                var designCode = CARD_PRESET_METHOD[method.code] && CARD_PRESET_METHOD[method.code].designCode || 'card14';
                const attributeDesignCode = method.attribute && JSON.parse(method.attribute).designCode;
                if (attributeDesignCode && attributeDesignCode != '') {
                    designCode = PLCC_DESIGN_CODE[attributeDesignCode];
                }
                return designCode;
            }
        };

        const getClass = function() {
            if (method.kind === 'TRANSFER') {
                return BANK_PRESET_METHOD[method.code] && BANK_PRESET_METHOD[method.code].class || 'default';
            }

            return CARD_PRESET_METHOD[method.code] && CARD_PRESET_METHOD[method.code].class || 'default';
        };

        const getSerialNo = function() {
            return method.serialNo;
        };

        const getMaskedNo = function() {
            return method.maskedNo;
        };

        const getAttribute = function() {
            return method.attribute;
        }

        const getDiscount = function() {
            return method.discount;
        }

        const getDiscounts = function() {
            return method.discounts;
        }

        const isDiscountCard = function() {
            if (!!method.discount && !!method.discount.discountAmount && method.discount.discountAmount > 0) {
                return true;
            }

            return false;
        }

        const isCreditCard = function() {
            if (method.type === 0) {
                return true;
            }

            if (method.type === '0') {
                return true;
            }

            return false;
        };

        const getPaymentTypeName = function() {
            if (method.kind == 'card' || method.kind == 'CARD') {
                if (method.type === 0 || method.type === '0') {
                    return '신용카드';
                }

                return '체크카드';
            } else {
                return '계좌';
            }
        };

        const getPayKind = function() {
            return method.kind;
        };

        const isCard = function() {
            return method.kind == 'card' || method.kind == 'CARD';
        };

        const isTransfer = function() {
            return method.kind == 'transfer' || method.kind == 'TRANSFER';
        };

        const getCardFreeInterest = function() {
            return method.cardFreeInterest;
        };

        const getCardQuota = function() {
            var cardQuota = $('#__msspay-method-' + methodId + ' select.__msspay-card-quota').val()

            if (isNaN(cardQuota) || cardQuota < 2) {
                cardQuota = 0;
            }

            return cardQuota;
        };

        const isCardQuotaInterestFree = function() {
            var cardQuota = $('#__msspay-method-' + methodId + ' select.__msspay-card-quota').val()
            var cardQuotaInterestFreeYn = $('#__msspay-method-' + methodId).find("option:selected").data('interest-free-yn');

            if (isNaN(cardQuota) || cardQuota < 2) {
                cardQuotaInterestFreeYn = 'N';
            }

            return cardQuotaInterestFreeYn === 'N' ? false: true;
        };

        const isPLCC = function() {
            var attribute = method.attribute && JSON.parse(method.attribute).designCode;
            if (PLCC_DESIGN_CODE[attribute]) {
                return true;
            } else {
                return false;
            }
        };

        return {
            getId: getId,
            getName: getName,
            getNameAlias: getNameAlias,
            getDesignCode: getDesignCode,
            getClass: getClass,
            getSerialNo: getSerialNo,
            getMaskedNo: getMaskedNo,
            getAttribute : getAttribute,
            isDiscountCard : isDiscountCard,
            isCreditCard: isCreditCard,
            getPaymentTypeName: getPaymentTypeName,
            getPayKind: getPayKind,
            getCardQuota: getCardQuota,
            isCardQuotaInterestFree: isCardQuotaInterestFree,
            getCardFreeInterest: getCardFreeInterest,
            getDiscount: getDiscount,
            getDiscounts: getDiscounts,
            isPLCC: isPLCC,
            isCard: isCard,
            isTransfer: isTransfer
        };
    };

    const locker = new function() {
        var isLocking = false;

        const lock = function() {
            isLocking = true;
        };

        const unlock = function() {
            isLocking = false;
        };

        const isLocked = function() {
            return isLocking;
        };

        return {
            lock: lock,
            unlock: unlock,
            isLocked: isLocked
        };
    };

    const repository = new function() {
        const status = new function() {
            const STATUS = {
                UNKNOWN: 'unknown', // 초기상태
                FAILED: 'failed', // 결제수단 정보조회 실패됨
                UNREGISTERED: 'unregistered', // 미가입 상태로 확인됨
                UNAVAILABLE: 'unavailable', // 사용불가(=점검중)
                OK: 'ok', // 결제수단 정보조회 완료됨
            };

            var status = STATUS.UNKNOWN;

            const isFailed = function() {
                return status === STATUS.FAILED;
            };

            const updateToFailed = function() {
                console.log('RepositoryStatusChanged', status, STATUS.FAILED);
                return status = STATUS.FAILED;
            };

            const isUnregistered = function() {
                return status === STATUS.UNREGISTERED;
            };

            const updateToUnregistered = function() {
                console.log('RepositoryStatusChanged', status, STATUS.UNREGISTERED);
                return status = STATUS.UNREGISTERED;
            };

            const isUnavailable = function() {
                return status === STATUS.UNAVAILABLE;
            };

            const updateToUnavailable = function() {
                console.log('RepositoryStatusChanged', status, STATUS.UNAVAILABLE);
                return status = STATUS.UNAVAILABLE;
            };

            const isOk = function() {
                return status === STATUS.OK;
            };

            const isNotOk = function() {
                return !isOk();
            };

            const updateToOk = function() {
                console.log('RepositoryStatusChanged', status, STATUS.OK);
                return status = STATUS.OK;
            };

            return {
                isFailed: isFailed,
                updateToFailed: updateToFailed,
                isUnregistered: isUnregistered,
                updateToUnregistered: updateToUnregistered,
                isUnavailable: isUnavailable,
                updateToUnavailable: updateToUnavailable,
                isOk: isOk,
                isNotOk: isNotOk,
                updateToOk: updateToOk
            };
        };

        const methodList = [];

        const loadMethodList = function() {
            $.ajax({
                url: '/app/msspay/method_list',
                type: 'get',
                async: false,
                cache: false,
                dataType: 'json',
                success: function(data, textStatus, jqXHR) {
                    if (data.code !== '0000') { // 결제수단 조회실패
                        switch (data.code) {
                            case '3004' : // 무신사페이 미가입 상태
                                repository.status.updateToUnregistered();
                                return;

                            case 'E999' : // 무신사페이 점검중
                                repository.status.updateToUnavailable();
                                return;

                            default :
                                // pass
                        }

                        repository.status.updateToFailed();
                        console.log('MethodListLoadFailed', data.code, data.message);
                        return;
                    }

                    try {
                        discardMethodList();

                        const it = data.methodList || [];
                        for (var i in it.reverse()) {
                            if (it.hasOwnProperty(i)) {
                                prependMethod(new MsspayMethod(it[i]));
                            }
                        }

                        repository.status.updateToOk();
                        console.log('MethodListLoadOk', methodList.length);

                        const cashReceiptInfo = data.cashReceiptInfo || {};

                        if (config.onLoadedUserCashReceiptInfo) {
                            config.onLoadedUserCashReceiptInfo(cashReceiptInfo);
                        } else {
                            setCashReceipt(cashReceiptInfo);
                        }
                    } catch(e) {
                        this.error(jqXHR, textStatus, e);
                    }
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    repository.status.updateToFailed();
                    console.log('MethodListLoadFailed', textStatus, errorThrown);
                }
            });
        };

        const prependMethod = function(method) {
            methodList.unshift(method);
        };

        const discardMethodList = function() {
            while (methodList.length > 0) {
                methodList.pop();
            }
        };

        const getMethodList = function() {
            return methodList;
        };

        const getMethod = function(index) {
            return methodList[index] || null;
        };

        const hasMethod = function() {
            return methodList.length > 0;
        };

        const hasNoMethod = function() {
            return !hasMethod();
        };

        const setCashReceipt = function(cashReceiptInfo) {
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

        return {
            status: status,
            loadMethodList: loadMethodList,
            prependMethod: prependMethod,
            getMethodList: getMethodList,
            getMethod: getMethod,
            hasMethod: hasMethod,
            hasNoMethod: hasNoMethod,
            setCashReceipt: setCashReceipt
        };
    };

    const methodListView = new function() {
        const methodListViewConfig = config.methodListView || {};

        const cardSwiper = methodListViewConfig.cardSwiper || new Swiper('#cardSwiper', {
            slidesPerView: 'auto',
            simulateTouch: false,
            centeredSlides: true,
            spaceBetween: 20,
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev'
            }
        });

        const makeAddedMethodHtml = methodListViewConfig.makeAddedMethodHtml || function (method) {
            const methodId = method.getId();
            const maskedNo = method.getMaskedNo();
            const methodName = method.getName();
            const methodNameAlias = method.getNameAlias();
            const designCode = method.getDesignCode();
            const isDiscountCard = method.isDiscountCard();
            const isCreditCard = method.isCreditCard();
            const paymentTypeName = method.getPaymentTypeName();
            const attributeDesignCode = method.getAttribute() && JSON.parse(method.getAttribute()).designCode;
            const cardFreeInterest = method.getCardFreeInterest();
            var installmentMonths = [];

            if (cardFreeInterest && cardFreeInterest.installmentMonths) {
                installmentMonths = cardFreeInterest.installmentMonths;
            }

            var mssTagStart = '';
            var mssTagEnd = '';

            var cardTag = '';
            var cardBottomTagStart = '';
            var cardBottomTagEnd = '';

            var firstPayDcTag = '';

            var interestTagStart = '';
            var interestTagBody = '';
            var interestTagEnd = '';
            var plccInterestTagId = '';

            mssTagStart = '' +
                '<div id="__msspay-method-' + methodId + '" class="swiper-slide">' +
                    '<input type="hidden" id="__msspay-attribute-designcode-' + attributeDesignCode + '" value="' + methodId + '" style="display:none" >';

            if (!method.isPLCC() || attributeDesignCode == 'UI') {
                // (UI - PLCC 발급 후 카드 디자인 코드 값이 바로 안넘어오는 경우, 임시로 현대카드 디자인으로 표시)
                cardTag = '' +
                    '<div class="card-list ' + designCode + '">' +
                        '<div class="card-text font-mss">' +
                            '<span class="card-info">' +
                                methodName +
                                '<span class="card-method">' + paymentTypeName + '</span>' +
                            '</span>' +
                            '<span class="card-number">' +
                                maskedNo +
                                '<span class="card-nickname">' + methodNameAlias + '</span>'  +
                            '</span>' +
                        '</div>' +
                        '<span class="logo"></span>';
                if (isDiscountCard) {
                    cardTag += '<span class="card-list__event-text"></span>';
                }
                cardTag +='</div>';
            } else {
                cardTag = '' +
                    '<div class="card-list card--' + designCode + '">';
                    if (isDiscountCard) {
                        cardTag += '<span class="card-list__event-text card-list__event-text--hyundai"></span>';
                    }
                cardTag += '' +
                    '</div>';
            }

            if (!method.isPLCC()) {
                cardBottomTagStart = '' +
                    '<div class="n-select-wrap">';
            } else {
                cardBottomTagStart = '' +
                    '<div class="n-select-wrap n-select-wrap--plcc">';

                firstPayDcTag = '' +
                        '<div class="firstpay-input first_card_discount_area" style="display:none">' +
                            '<input type="checkbox" class="n-check check-only" value="Y" id="chk_plcc_first_pay_dc_' + methodId + '" name="chk_plcc_first_pay_dc" onClick="checkPLCCFirstPayDiscount();">' +
                            '<label for="chk_plcc_first_pay_dc_' + methodId + '" class="firstpay-input__text" name="first_cart_discount_name">무신사 현대카드 즉시할인 사용</label>' +
                        '</div>';
            }

            if (isCreditCard) {
                // 신용카드 할부
                if (method.isPLCC()) {
                    plccInterestTagId = ' id="__msspay-plcc-interest-' + methodId + '" ';
                }
                interestTagStart = '' +
                        '<div class="n-select">' +
                            '<select class="__msspay-card-quota" ' + plccInterestTagId + '>';

                const interestObj = getInstallmentMonthsObj(installmentMonths);
                for (var key in interestObj) {
                    interestTagBody += '<option value="' + key + '" data-interest-free-yn="' + interestObj[key]['interest_free_yn'] + '">'
                                        + interestObj[key]['interest_txt']
                                    + '</option>';
                }

                interestTagEnd = '' +
                            '</select>' +
                        '</div>';
            }

            cardBottomTagEnd = '' +
                    '</div>';

            mssTagEnd =
            '</div>';

            return mssTagStart +
                        cardTag +
                        cardBottomTagStart +
                            firstPayDcTag +
                            interestTagStart +
                                interestTagBody +
                            interestTagEnd +
                        cardBottomTagEnd +
                    mssTagEnd;
        };

        /**
         * 무이자할부 가능 개월 조회
         */
        const getInstallmentMonthsObj = function(installmentMonths) {
            const interestObj = {
                0: {
                    "interest_txt" : "일시불",
                    "interest_free_yn" : "N"
                }
            };

            for (var i = 2; i <= 12; i++) {
                interestObj[i] = new Array();
                if (installmentMonths.indexOf(i) > -1) {
                    interestObj[i]["interest_txt"] = i + "개월 (무이자)";
                    interestObj[i]["interest_free_yn"] = "Y";
                } else {
                    interestObj[i]["interest_txt"] = i + "개월";
                    interestObj[i]["interest_free_yn"] = "N";
                }
            }

            return interestObj;
        };


        const updateCardQuotaDesign = function() {
            $('select.__msspay-card-quota').selectmenu({
                width:'100%',
                icons:{
                    button:"ico ico-sm ico-ar00",
                },
                classes: {
                    "ui-selectmenu-button-open": "is-active",
                }
            });

            if (config.getAmount() - methodListView.getImmediateDiscountAmtBySelectedPayment() < 50000) {
                $('select.__msspay-card-quota').find('option:eq(0)').prop('selected', true);
                $('select.__msspay-card-quota').selectmenu('refresh');

                $('select.__msspay-card-quota').selectmenu('disable');
                $('.n-select-wrap .n-select').addClass('n-select--disable');
            } else {
                $('select.__msspay-card-quota').selectmenu('enable');
            }
        };

        const getImmediateDiscountCardInfo = function () {
            var immediateDiscountCardInfo = [];

            $.ajax({
                url: '/app/msspay/discount_list',
                type: 'get',
                async: false,
                cache: false,
                dataType: 'json',
                success: function (data, textStatus, jqXHR) {
                    try {
                        var cardName = '';
                        var cardNameList = [];
                        var discountAmount = 0;
                        var maxDiscountAmount = 0;

                        var discountList = data.discount_list;
                        for (var key in discountList) {
                            cardName = (CARD_PRESET_METHOD[discountList[key].payMethod] && CARD_PRESET_METHOD[discountList[key].payMethod].name || '기타카드').replace('카드', '');

                            if (cardNameList.includes(cardName) === true) {
                                continue;
                            }

                            cardNameList.push(cardName);
                            discountAmount = discountList[key] && discountList[key].discountAmount ? discountList[key].discountAmount : 0;
                            maxDiscountAmount = (maxDiscountAmount > discountAmount) ? maxDiscountAmount : discountAmount;
                        }

                        immediateDiscountCardInfo = {
                            'cardNameList': cardNameList,
                            'maxDiscountAmt': maxDiscountAmount
                        };
                    } catch (e) {
                        this.error(jqXHR, textStatus, e);
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    if (textStatus === 'success') {
                        console.log('무신사페이 즉시할인 조회 실패\n' + errorThrown.message);
                    } else {
                        console.log('무신사페이 즉시할인 조회 실패(' + textStatus + ')\n' + errorThrown.message);
                    }
                }
            });

            return immediateDiscountCardInfo;
        };

        const update = methodListViewConfig.onUpdate && methodListViewConfig.onUpdate(self, repository) || function() {
            self.updatePaymentView('msspay');

            if (repository.status.isNotOk() && !repository.status.isUnregistered()) {
                return;
            }

            $('.no-card-swiper-area').hide();
            $('.no-plcc-card-swiper-area').hide();
            $('.swiper-area').hide();

            cardSwiper.removeAllSlides();

            var isPLCCinCardList = false;
            if (repository.hasMethod()) {
                $('.swiper-area').show();

                const methodList = repository.getMethodList();
                const newMethodHtmlList = [];

                for (var key in methodList) {
                    const method = methodList[key];
                    newMethodHtmlList[newMethodHtmlList.length] = makeAddedMethodHtml(method);
                    if (method.isPLCC()) {
                        isPLCCinCardList = true;
                    }
                }

                const methodNoPLCCAddSlide = $('.no-plcc-card-swiper-area div.swiper-slide:first-child');
                if (!isPLCCinCardList && methodNoPLCCAddSlide.html()) {
                    cardSwiper.appendSlide(methodNoPLCCAddSlide.clone(true));
                }

                cardSwiper.appendSlide(newMethodHtmlList);

                const methodNoCardAddSlide = $('.no-card-swiper-area div.swiper-slide:first-child').clone(true);
                cardSwiper.appendSlide(methodNoCardAddSlide);
            } else {
                const methodNoPLCCAddSlide = $('.no-plcc-card-swiper-area div.swiper-slide:first-child');
                if (!methodNoPLCCAddSlide.html()) {
                    // PLCC OFF이면 카드 추가 영역만 보임.
                    $('.no-card-swiper-area').show();
                } else {
                    $('.swiper-area').show();

                    const methodNoCardAddSlide = $('.no-card-swiper-area div.swiper-slide:first-child').clone(true);
                    cardSwiper.appendSlide(methodNoCardAddSlide);
                    cardSwiper.appendSlide(methodNoPLCCAddSlide.clone(true));
                }
            }

            cardSwiper.update();
            cardSwiper.slideTo(0);
            updateCardQuotaDesign();
            cardSwiperEvent();
            showCashReceiptByPaymentType();
            setImmediateDiscount();

            if (plcc_open_yn == 'Y' && isPLCCinCardList) {
                if ($('.cart_discount_method.first_card_discount_area').css('display') != 'none') {
                    PLCC.showPLCCFirstDiscountArea(true);
                    if (PLCC.isActivePLCCFirstPayDiscountBtn()) {
                        PLCC.changePLCCFirstPayDiscountYn('Y');
                    }
                }

                var cardUnderperformYn = $("input[name='card_underperform_yn']").val();
                var discountCardDcAmt = unComma($('#possible_card_dc_amt').text());
                var cardType = $("input[name='card_type']").val();
                PLCC.showPLCCDiscountArea('Y', cardUnderperformYn, discountCardDcAmt, cardType);
            }

            if (typeof config.showImmediateDiscountCardName === 'function') {
                const immediateDiscountCardInfo = getImmediateDiscountCardInfo();
                config.showImmediateDiscountCardName(immediateDiscountCardInfo);
                immediateDiscountMaxAmt = immediateDiscountCardInfo['maxDiscountAmt'];
            }

            if (typeof config.onAfterLoadList === 'function') {
                config.onAfterLoadList();
            }

            console.log('MethodListViewUpdated');
            if (typeof config.onMethodListUpdated === 'function') {
                config.onMethodListUpdated();
            }
        };

        const getSelectedMethod = function() {
            var realIndex = cardSwiper.realIndex;
            if ($('.swiper-wrapper div#__msspay-issue-area').css('display') == 'block') {
                realIndex--;
            }
            return repository.getMethod(realIndex);
        };

        const getPLCCIndex = function() {
            var cardList = repository.getMethodList();
            for (var key in cardList) {
                if (cardList[key].isPLCC()) {
                    return key;
                }
            }
        };

        const changeCardSwiperMethod = function(page) {
            cardSwiper.slideTo(page);
        };

        const isPLCCBySelectedPayment = function() {
            var cardList = repository.getMethodList();
            if (cardList && cardList[cardSwiper.realIndex] && cardList[cardSwiper.realIndex].isPLCC()) {
                return true;
            }
            return false;
        };

        const cardSwiperEvent = function() {
            cardSwiper.on('realIndexChange', function () {
                if (plcc_open_yn == 'Y') {
                    PLCC.checkPLCCFirstPayDiscountByCardSwiper();
                    PLCC.checkPLCCDiscount('msspay');
                    PLCC.checkExcludeInterestFreeText();
                }
                showCashReceiptByPaymentType();
                setImmediateDiscount();
            });
        };

        const getImmediateDiscountAmtBySelectedPayment = function() {
            var immediateDiscountAmt = 0;
            var card = methodListView.getSelectedMethod();
            if (card) {
                var discounts = card.getDiscounts();

                if (discounts && discounts.length > 0) {
                    const totalPayAmt = Order.getPayAmt();
                    discounts.forEach(function(discount) {
                        if (discount.discountAmount > 0
                            && totalPayAmt >= discount.minimumAmount
                            && totalPayAmt <= discount.maximumAmount
                        ) {
                            if (immediateDiscountAmt < discount.discountAmount) {
                                immediateDiscountAmt = discount.discountAmount;
                            }
                        }
                    });
                }
            }

            return immediateDiscountAmt;
        };

        const getMaximumImmediateDiscountAmtBySelectedPayment = function() {
            let maximumImmediateDiscountAmt = 0;
            const card = methodListView.getSelectedMethod();
            if (card) {
                const discounts = card.getDiscounts();

                if (discounts && discounts.length > 0) {
                    discounts.forEach(function(discount) {
                        if (discount.discountAmount > 0) {
                            if (maximumImmediateDiscountAmt < discount.discountAmount) {
                                maximumImmediateDiscountAmt = discount.discountAmount;
                            }
                        }
                    });
                }
            }

            return maximumImmediateDiscountAmt;
        };

        const displayImmediateDiscountBadge = function(immediateDiscountAmt, isMaximum) {
            const card = methodListView.getSelectedMethod();
            if (card === null) {
                return;
            }

            const cardDiscountBadge = $('#__msspay-method-' + card.getId()).find('.card-list__event-text');
            if (immediateDiscountAmt > 0) {
                let badge = Comma(immediateDiscountAmt) + '원 즉시 할인';
                if (isMaximum === true) {
                    badge = '최대 ' + badge;
                }
                cardDiscountBadge.show();
                cardDiscountBadge.text(badge);
            } else {
                cardDiscountBadge.hide();
            }
        };

        const setImmediateDiscount = function() {
            if (!window.Order) {
                return;
            }

            var totalMsspayAmt = 0;
            var totalPayAmt = Order.getPayAmt();
            var immediateDiscountAmt = getImmediateDiscountAmtBySelectedPayment();
            const maximumImmediateDiscountAmt = getMaximumImmediateDiscountAmtBySelectedPayment();
            const isMaximum = immediateDiscountAmt === maximumImmediateDiscountAmt;

            displayImmediateDiscountBadge(immediateDiscountAmt, isMaximum);

            if (Order.isMsspaySelected() && immediateDiscountAmt > 0) {
                totalMsspayAmt = totalPayAmt-immediateDiscountAmt;
                $(".total_msspay_area").show();
            } else {
                totalMsspayAmt = totalPayAmt;
                $(".total_msspay_area").hide();
            }

            $("#btn-pay_amt").text(Comma(totalMsspayAmt));
            $("[name=total_msspay_amt]").text(Comma(totalMsspayAmt));
        };

        const getPayKindBySelectedPayment = function() {
            if (window.Order && !Order.isMsspaySelected()) {
                return null;
            }

            var card = methodListView.getSelectedMethod();
            return card && card.getPayKind();
        };

        const showCashReceiptByPaymentType = function() {
            if (Msspay.getPayKindBySelectedPayment() === 'TRANSFER' || $('input[type=radio][name=kyejae]:checked').val() == "virtual") {
                $('.article_cash_receipt').show();
            } else {
                $('.article_cash_receipt').hide();
            }
        };

        const isCardQuotaInterestFreeBySelectedPayment = function() {
            var isCardQuotaInterestFree = false;
            var card = methodListView.getSelectedMethod();

            if (card) {
                isCardQuotaInterestFree = card.isCardQuotaInterestFree();
            }

            return isCardQuotaInterestFree;
        };

        return {
            update: update,
            updateCardQuotaDesign: updateCardQuotaDesign,
            getSelectedMethod: getSelectedMethod,
            changeCardSwiperMethod: changeCardSwiperMethod,
            cardSwiperEvent: cardSwiperEvent,
            isPLCCBySelectedPayment: isPLCCBySelectedPayment,
            getPLCCIndex: getPLCCIndex,
            getImmediateDiscountAmtBySelectedPayment: getImmediateDiscountAmtBySelectedPayment,
            setImmediateDiscount: setImmediateDiscount,
            getImmediateDiscountCardInfo: getImmediateDiscountCardInfo,
            getPayKindBySelectedPayment: getPayKindBySelectedPayment,
            showCashReceiptByPaymentType: showCashReceiptByPaymentType,
            isCardQuotaInterestFreeBySelectedPayment: isCardQuotaInterestFreeBySelectedPayment
        };
    };

    self.updateCardQuotaDesign = methodListView.updateCardQuotaDesign;

    self.changeCardSwiperMethod = methodListView.changeCardSwiperMethod;

    self.cardSwiperEvent = methodListView.cardSwiperEvent;

    self.isPLCCBySelectedPayment = methodListView.isPLCCBySelectedPayment;

    self.getPLCCIndex = methodListView.getPLCCIndex;

    self.getImmediateDiscountAmtBySelectedPayment = methodListView.getImmediateDiscountAmtBySelectedPayment;

    self.setImmediateDiscount = methodListView.setImmediateDiscount;

    self.getPayKindBySelectedPayment = methodListView.getPayKindBySelectedPayment;

    self.showCashReceiptByPaymentType = methodListView.showCashReceiptByPaymentType;

    self.isCardQuotaInterestFreeBySelectedPayment = methodListView.isCardQuotaInterestFreeBySelectedPayment;


    const paymentObjectAfterOpenMsspayPay = new function() {
        var name = '';
        var designCode = '';
        var id = 0;

        const setName = function(name) {
            paymentObjectAfterOpenMsspayPay.name = name;
        };

        const getName = function() {
            return paymentObjectAfterOpenMsspayPay.name;
        };

        const setDesignCode = function(designCode) {
            paymentObjectAfterOpenMsspayPay.designCode = designCode;
        };

        const getDesignCode = function() {
            return paymentObjectAfterOpenMsspayPay.designCode;
        };

        const setId = function(id) {
            paymentObjectAfterOpenMsspayPay.id = id;
        };

        const getId = function(id) {
            return paymentObjectAfterOpenMsspayPay.id;
        };

        return {
            setName : setName,
            setDesignCode : setDesignCode,
            setId : setId,
            getName : getName,
            getDesignCode : getDesignCode,
            getId : getId,
        };
    };

    self.setPaymentNameAfterOpenMsspayPay = paymentObjectAfterOpenMsspayPay.setName;

    self.setPaymentDesignCodeAfterOpenMsspayPay = paymentObjectAfterOpenMsspayPay.setDesignCode;

    self.setPaymentIdAfterOpenMsspayPay = paymentObjectAfterOpenMsspayPay.setId;

    self.getPaymentNameAfterOpenMsspayPay = paymentObjectAfterOpenMsspayPay.getName;

    self.getPaymentDesignCodeAfterOpenMsspayPay = paymentObjectAfterOpenMsspayPay.getDesignCode;

    self.getPaymentIdAfterOpenMsspayPay = paymentObjectAfterOpenMsspayPay.getId;


    self.onNewMethodAddFailed = function(failCode, failMessage, debugData, traceId) {
        methodAddWindow.close();

        console.log('NewMethodAddFailed', traceId, debugData);
        alert('[' +failCode+ '] ' + failMessage);
    };

    self.onNewMethodAddOk = function(serialNo, code, type, kind, maskedNo, payInstallmentMonths, payMinimumAmount, attribute, discountAmount, discountMinimumAmount, discounts) {
        methodAddWindow.closeSilently();

        if (repository.status.isUnregistered()) {
            self.loadMsspayMethodList();
            return;
        }

        var a_payInstallmentMonths = payInstallmentMonths.split(',');
        a_payInstallmentMonths.forEach(function (value, key) {
            a_payInstallmentMonths[key] = parseInt(value);
        });

        const cardFreeInterest = {
            'installmentMonths' : a_payInstallmentMonths,
            'minimumAmount'     : payMinimumAmount
        };

        const discount = {
            'discountAmount'    : discountAmount,
            'minimumAmount'     : discountMinimumAmount
        };

        const method = {
            serialNo: serialNo,
            code: code,
            type: type,
            kind : kind,
            maskedNo: maskedNo,
            attribute: attribute,
            cardFreeInterest: cardFreeInterest,
            discount: discount,
            discounts: discounts
        };
        console.log('NewMethodAddOk', method);
        const newMethod = new MsspayMethod(method);
        repository.prependMethod(newMethod);
        methodListView.update();
    };

    self.updatePaymentView = function(viewType) {
        console.debug('updatePaymentViewRequested', viewType);
        $('.__payment-view').hide();

        if (viewType === 'msspay') {
            $('.__payment-msspay-view').show();
            $('.__msspay-user-view').hide();

            var tootipCookie = getCookie("msspay-tooltip-close-button");

            if (repository.status.isUnregistered()) {
                $('.__msspay-unregistered-user-view').show();
            } else if (repository.status.isUnavailable()) {
                $('.__msspay-unavailable-user-view').show();
            } else if (repository.status.isOk()) {
                $('.__msspay-ok-user-view').show();
                if (tootipCookie === "1") {
                    $("#msspay_tooltip").hide();
                }
            } else {
                $('.__msspay-failed-user-view').show();
            }
        } else {
            $('.__payment-pg-view').show();
        }
    };

    self.openMsspayMethodAddWindow = function() {
        if (self.testModeHelper.isEnabled()) {
            const discounts = [{"discountAmount":1000,"expireDate":"2022-11-20","minimumAmount":10000,"maximumAmount":100000},{"discountAmount":2000,"expireDate":"2022-11-20","minimumAmount":30000,"maximumAmount":100000},{"discountAmount":3000,"expireDate":"2022-11-20","minimumAmount":50000,"maximumAmount":100000}];
            self.onNewMethodAddOk('t_new', 'CC__', 0, 'card', 'test********1234', '1,2,3', '50000', '', 500, 1000, discounts);
            return;
        }

        if (locker.isLocked()) {
            alert('결제 요청중입니다.');
            return;
        }

        if (payWindow.isOpened()) {
            payWindow.close();

        }

        methodAddWindow.openWithForm(document.msspay_method_add_form, function(form) {
            return true;
        });
    };

    const openMsspayPayWindow = function() {
        payWindow.openWithForm(document.msspay_pay_form, function(form) {
            if (repository.hasNoMethod()) {
                alert('무신사페이로 결제하시려면 가입 및 카드 등록이 필요합니다.');
                return false;
            }

            const method = methodListView.getSelectedMethod();

            if (method === null) {
                alert('무신사페이 결제수단을 선택해 주세요.');
                return false;
            }

            if (method.getCardQuota() > 1) {
                if (config.getAmount() - methodListView.getImmediateDiscountAmtBySelectedPayment() < 50000) {
                    alert('50,000원 미만은 할부가 불가능합니다.');
                    return false;
                }
            }

            const $form = $(form).empty();
            const orderNo = config.getOrderNo();
            const amount = config.getAmount();
            const taxFreeAmount = config.getTaxFreeAmount();
            const orderTitle = config.getOrderTitle();
            const isCardPointUse = config.isCardPointUse();
            const firstDiscountYN = config.getFirstDiscountYN();
            const isEasyOrder = (typeof config.isEasyOrder == 'function') && config.isEasyOrder();
            const cashReceiptRegistrationType = config.getCashReceiptRegistrationType();
            const cashReceiptNumberType = config.getCashReceiptNumberType();
            const cashReceiptRegistrationNumber = config.getCashReceiptRegistrationNumber();
            const isSaveCashReceipt = config.isSaveCashReceipt();

            var isPrepared = false;

            let authFormRequestUrl = '/app/order/msspay_auth_form/' + orderNo + '/' + amount;
            if (config.serviceType) {
                authFormRequestUrl += '/' + config.serviceType;
            }

            $.ajax({
                url: authFormRequestUrl,
                type: 'get',
                async: false,
                cache: false,
                dataType: 'json',
                success: function(data, textStatus, jqXHR) {
                    try {
                        const formItems = data.items;

                        formItems.goodName = orderTitle;
                        formItems.payNo = method.getSerialNo();
                        formItems.cardQuota = method.getCardQuota();
                        formItems.cardPointUse = isCardPointUse ? 'Y' : 'N';
                        formItems.taxFreeAmount = taxFreeAmount;
                        formItems.userParam01 = (firstDiscountYN === 'Y') ? 'FSTPRM' : '';
                        formItems.userParam02 = isEasyOrder ? 'SPDYMPAY' : '';
                        if (Msspay.getPayKindBySelectedPayment() === 'TRANSFER') {
                            formItems.cashReceiptRegistrationType = cashReceiptRegistrationType;
                            formItems.cashReceiptNumberType = cashReceiptNumberType;
                            formItems.cashReceiptRegistrationNumber = cashReceiptRegistrationNumber;
                            formItems.saveCashReceipt = (isSaveCashReceipt && cashReceiptRegistrationType !== 'NONE') ? 'Y' : 'N';
                        }

                        $.each(formItems, function(name, value) {
                            $('<input type="hidden" name="' + name + '" value="' + value + '" />').appendTo($form);
                        });

                        form.action = data.actionUrl;

                        isPrepared = true;

                        // 결제하기 버튼 클릭 누른 이후 결제하기 수단 변경 되었는지 체크 하기 위함.
                        Msspay.setPaymentNameAfterOpenMsspayPay(method.getName());
                        Msspay.setPaymentDesignCodeAfterOpenMsspayPay(method.getDesignCode());
                        Msspay.setPaymentIdAfterOpenMsspayPay(method.getId());
                    } catch(e) {
                        this.error(jqXHR, textStatus, e);
                    }
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    if (textStatus === 'success') {
                        alert('무신사페이 결제인증 요청실패\n' + errorThrown.message);
                    } else {
                        alert('무신사페이 결제인증 요청실패(' + textStatus + ')\n' + errorThrown.message);
                    }
                }
            });

            return isPrepared;
        });
    };

    self.loadMsspayMethodList = function() {
        repository.loadMethodList();
        methodListView.update();
    };

    self.pay = function() {
        if (methodAddWindow.isOpened()) {
            methodAddWindow.close();
        }

        if (payWindow.isOpened()) {
            payWindow.focus();
            return;
        }

        if (locker.isLocked()) {
            alert('결제 요청 중입니다.\n잠시만 기다려 주세요.');
            return;
        }

        if (config.isValidToPay) {
            if (config.isValidToPay() !== true) {
                return false;
            }
        }

        try {
            openMsspayPayWindow();
        } catch (e) {
            console.log('MsspayPayWindowOpenFailed', e);
        }
    };

    self.onAuthFailed = function(failCode, failMessage, debugData) {
        payWindow.close();

        console.log('AuthFailed', debugData);
        alert('[' +failCode+ '] ' + failMessage);
    };

    self.onAuthOk = config.onAuthOk && config.onAuthOk(payWindow, locker) || function(orderNo, authedToken) {
        payWindow.close();

        const orderForm = document.order_info;

        if (orderForm.ord_no.value !== orderNo) {
            alert('[인증오류] 인증에 실패했습니다. (주문번호 불일치)');
            console.debug('Received:', orderNo);
            return;
        }

        if (!authedToken) {
            alert('[인증오류] 인증에 실패했습니다. (인증토큰 누락)');
            return;
        }

        // 결제하기 버튼 클릭 누른 이후 결제하기 수단 변경 되었는지 체크 하기 위함.
        const method = methodListView.getSelectedMethod();
        const selectedPaymentName = Msspay.getPaymentNameAfterOpenMsspayPay();
        const selectedPaymentDesignCode =  Msspay.getPaymentDesignCodeAfterOpenMsspayPay();
        const selectedPaymentId = Msspay.getPaymentIdAfterOpenMsspayPay();

        if (method.getName() != selectedPaymentName || method.getDesignCode() != selectedPaymentDesignCode || method.getId() != selectedPaymentId) {
            alert('결제 수단 불일치로 실패했습니다.');
            return;
        }

        locker.lock();

        orderForm.pg_pay_method.value = '';
        orderForm.pg_kind.value = 'msspay';
        if (Msspay.getPayKindBySelectedPayment() === 'TRANSFER') {
            orderForm.kyejae.value = 'transfer';
        } else{
            orderForm.kyejae.value = 'card';
        }
        orderForm.msspay_authed_token.value = authedToken;

        orderForm.action = '/app/order/payment_save';
        orderForm.onsubmit = '';
        orderForm.submit();
    };

    if (typeof config.onAfterInstalled == 'function') {
        config.onAfterInstalled(self);
        console.log('onAfterInstalledExecuted');
    }

    self.loadMsspayMethodList();
};

(function bindTestModeHelper(_) {
    _.testModeHelper = new function() {
        var isTestMode = false;

        const enable = function() {
            isTestMode = true;
        };

        const disable = function() {
            isTestMode = false;
        };

        const isEnabled = function() {
            return isTestMode;
        };

        return {
            enable: enable,
            disable: disable,
            isEnabled: isEnabled
        };
    };

    console.log('TestModeHelperBound');
})(Msspay);
