const firstDiscountInfo = new function() {
    var eventKind = '';
    var eventName = '';
    var type = '';
    var amount = 0;
    var rate = 0;
    var minAmount = 0;
    var maxAmount = 0;
    var minAmountUseYn = '';
    var maxAmountUseYn = '';

    const setEventKind = function (eventKind) {
        firstDiscountInfo.eventKind = eventKind;
    };

    const setEventName = function (eventName) {
        firstDiscountInfo.eventName = eventName;
    };

    const setType = function(type) {
        firstDiscountInfo.type = type;
    };

    const setAmount = function (amount) {
        firstDiscountInfo.amount = parseInt(amount);
    };

    const setRate = function (rate) {
        firstDiscountInfo.rate = parseInt(rate);
    };

    const setMinAmount = function (minAmount) {
        firstDiscountInfo.minAmount = parseInt(minAmount);
    };

    const setMaxAmount = function (maxAmount) {
        firstDiscountInfo.maxAmount = parseInt(maxAmount);
    };

    const setMinAmountUseYn = function (minAmountUseYn) {
         firstDiscountInfo.minAmountUseYn = minAmountUseYn;
     };

     const setMaxAmountUseYn = function (maxAmountUseYn) {
         firstDiscountInfo.maxAmountUseYn = maxAmountUseYn;
     };

    return {
        setEventKind: setEventKind,
        setEventName: setEventName,
        setType: setType,
        setAmount: setAmount,
        setRate: setRate,
        setMinAmount: setMinAmount,
        setMaxAmount: setMaxAmount,
        setMinAmountUseYn: setMinAmountUseYn,
        setMaxAmountUseYn: setMaxAmountUseYn,
    };
};