window.Mpay = (function() {
    const Auth = function(authConfig) {
        authConfig = authConfig || {};

        const prepareAuthForm = function(authForm) {
            var isSuccess = false;
            var message = '';

            $(authForm).empty();
            authForm.action = '';

            const requestData = {
                orderNo : authConfig.getOrderNo(),
                orderKey : authConfig.getOrderKey(),
                itemList : authConfig.getItemList(),
            };

            $.ajax({
                url: '/app/order/mpay_auth_form',
                type: 'post',
                data: requestData,
                async: false,
                cache: false,
                dataType: 'json',
                success: function(responseData, textStatus, jqXHR) {
                    const responseDataItems = responseData.items;

                    if (responseData.isSuccess === true) {
                        $.each(responseDataItems, function (name, value) {
                            $('<input type="hidden" name="' + name + '" value="' + value + '" />').appendTo($(authForm));
                        });

                        authForm.action = responseData.actionUrl;
                        isSuccess = true;
                    } else {
                        message = '[' + responseData.code + '] ' + responseData.message;
                    }
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    console.log(errorThrown);
                    $(authForm).empty();

                    if (textStatus === 'error') {
                        textStatus = jqXHR.status + ' ' + jqXHR.statusText;
                    }

                    message = '[FormFailed] 요청실패(' + textStatus + ')';
                }
            });

            return {
                isSuccess : isSuccess,
                message : message
            };
        };

        const prepareVTransferForm = function(authForm) {
            var isSuccess = false;
            var message = '';

            authForm.action = '';

            const cashReceiptData = {
                cashReceiptRegistrationType : authConfig.getCashReceiptRegistrationType(),
                cashReceiptNumberType : authConfig.getCashReceiptNumberType(),
                cashReceiptRegistrationNumber : authConfig.getCashReceiptRegistrationNumber(),
                isSaveCashReceipt : authConfig.isSaveCashReceipt()
            };
            if(cashReceiptData.cashReceiptNumberType == "CORPNUM") {
                if(cashReceiptData.cashReceiptRegistrationNumber.length < 10) {
                    message = '[VTransferFormFailed] 잘못된 사업자 번호입니다.';
                    return {
                        isSuccess : isSuccess,
                        message : message
                    };
                }
            }
            $.each(cashReceiptData, function (name, value) {
                if (!value) {
                    message = '[VTransferFormFailed] 요청실패(현금영수증 정보가 잘못되었습니다.)';
                    return false;
                }
                $('<input type="hidden" name="' + name + '" value="' + value + '" />').appendTo($(authForm));
            });
            $('<input type="hidden" name="resultCode" value="0000">').appendTo($(authForm));
            $('<input type="hidden" name="resultMessage" value="정상처리">').appendTo($(authForm));
            $('<input type="hidden" name="pgKind" value="mpay">').appendTo($(authForm));

            authForm.action = document.f1.pay_server.value + "/app/order/payment_check/mpay";
            isSuccess = true;

            return {
                isSuccess : isSuccess,
                message : message
            };
        };

        const saveOrderForm = function(orderForm) {
            var isSuccess = false;
            var message = '';

            const requestData = $(orderForm).serialize();

            $.ajax({
                url: '/app/order/order_ready',
                type: 'post',
                data: requestData,
                async: false,
                cache: false,
                dataType: 'json',
                success: function(responseData, textStatus, jqXHR) {
                    if (responseData.is_order_saved === true) {
                        isSuccess = true;
                    } else {
                        message = '[' + responseData.res_cd + '] ' + responseData.res_msg;
                    }
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    console.log(errorThrown);

                    if (textStatus === 'error') {
                        textStatus = jqXHR.status + ' ' + jqXHR.statusText;
                    }

                    message = '[ReadyFailed] 요청실패(' + textStatus + ')';
                }
            });

            return {
                isSuccess : isSuccess,
                message : message
            };
        }

        return {
            request: function() {
                const orderForm = document.order_info;
                const orderFormSaveResult = saveOrderForm(orderForm);
                if (orderFormSaveResult.isSuccess !== true) {
                    alert(orderFormSaveResult.message);
                    return false;
                }

                const authForm = authConfig.form;
                const authFormPrepareResult = prepareAuthForm(authForm);
                if (authFormPrepareResult.isSuccess !== true) {
                    alert(authFormPrepareResult.message);
                    return false;
                }

                if (authForm.payKind.value == "VTRANSFER") {
                    const vTransferPrepareResult = prepareVTransferForm(authForm);
                    if (vTransferPrepareResult.isSuccess !== true) {
                        alert(vTransferPrepareResult.message);
                        return false;
                    }
                }

                authConfig.onPrepared(authForm);
            }
        };
    };

    const install = function(config) {
        config = config || {};

        this.Auth = new Auth(config.auth);

        if (typeof config.onAfterInstalled == 'function') {
            config.onAfterInstalled(this);
            console.log('onAfterInstalledExecuted');
        }
    };

    return {
        install: install
    };
})();
