var RefundAccount = {

    checkRefundAccount : function(authParams) {
        var authResult = {
            isSuccess : false,
            isPgError : false
        };

        $.ajax({
            type: 'GET',
            url: '/app/order/validate_bank_account',
            dataType: 'json',
            data: authParams,
            cache: false,
            async: false,
            success: function (result) {
                if (result.isSuccess === false && result.isPgError === false) {     // 예금주명 오류, 계좌번호 오류 등으로 계좌인증이 완료되지 않은 경우
                    alert("환불 계좌 인증이 실패되었습니다. \n" + result.message);
                } else if (result.isSuccess === false && result.isPgError === true) {   // PG사 장애로 인해 계좌인증이 완료되지 않았을 경우
                    if (confirm(result.message)) {
                        authResult.isPgError = true;
                    }
                } else if (result.isSuccess === true && result.isPgError === false) {
                    authResult.isSuccess = true;
                }
            },
            error: function (request) {
                authResult.isSuccess = false;
                alert("환불 계좌 인증이 실패 되었습니다.\n" + " code : " + request.status + "\nmessage : " + request.responseText);
            }
        });

        return authResult;
    },

    saveRefundAccount : function(refundParams) {
        var saveResult = false;

        $.ajax({
            type: 'POST',
            url: '/app/api/member/save_member_refund_account',
            dataType: 'json',
            data: refundParams,
            cache: false,
            async: false,
            success: function (result) {
                if (result.data.isSuccess !== true) {
                    saveResult = false;
                    alert("환불 계좌 등록이 실패되었습니다. \n" + result.data.message);
                } else {
                    saveResult = true;
                    alert('환불계좌가 등록되었습니다.');
                }
            },
            error: function (request) {
                saveResult = false;
                alert("환불 계좌 등록이 실패 되었습니다. \n" + "code : " + request.status + "\nmessage : " + request.responseText);
            }
        });

        return saveResult;
    },

    deleteRefundAccount : function() {
        var deleteResult = false;

        $.ajax({
            type: 'POST',
            url: '/app/api/member/delete_member_refund_account',
            dataType: 'json',
            cache: false,
            async: false,
            success: function (result) {
                if (result.data.isSuccess !== true) {
                    alert("환불 계좌 삭제가 실패 되었습니다. : " + result.message);
                    deleteResult = false;
                } else {
                    deleteResult = true;
                    alert('환불 계좌가 삭제 되었습니다.');
                }
            },
            error: function (request) {
                deleteResult = false;
                alert("환불 계좌 삭제가 실패 되었습니다. \n" + "code : " + request.status + "\nmessage : " + request.responseText);
            }
        });

        return deleteResult;
    },

    getRefundAccount : function() {
        var getResult = {
            isSuccess : false,
            detailResult : {}
        };

        $.ajax({
            type: 'POST',
            url: '/app/api/member/get_member_refund_account',
            dataType: 'json',
            cache: false,
            async: false,
            success: function (result) {
                if (result) {
                    getResult.isSuccess = true;
                    getResult.detailResult = {
                        refundAccount : result.data.refund_account,
                        refundBank : result.data.refund_bank,
                        refundDepositor : result.data.refund_depositor,
                    };
                } else {
                    getResult.isSuccess = false;
                    alert("환불 계좌 데이터 조회에 실패 되었습니다. : " + result.message);
                }
            },
            error: function (request) {
                getResult = false;
                alert("환불 계좌 데이터 조회가 실패 되었습니다. \n" + "code : " + request.status + "\nmessage : " + request.responseText);
            }
        });

        return getResult;
    },

    showRefundAccount : function(cmd, ord_no) {
        var div_id = "refund_account_list";
        var param = "";
        if (cmd) {
            param += "&cmd=" + cmd;
        }
        if (ord_no) {
            param += "&ord_no="+ ord_no;
        }
        var service_url = "/app/member/refund_account?isModified=Y" + param;

        window.open(service_url, div_id, "width=480, height=408");
    },

    /**
     *
     * @param cmd( undefined | 'return_payment' )
     */
    showRefundAccountLayer : function(cmd, ord_no) {
        $.ajax({
            type: "POST",
            data: {
                cmd:cmd,
                ord_no:ord_no
            },
            url: "/app/member/refund_account/true",
            success: function(msg) {
                $("#account-layer").html(msg);
                $("#account-layer").addClass("active");
            }
        });
    }
}