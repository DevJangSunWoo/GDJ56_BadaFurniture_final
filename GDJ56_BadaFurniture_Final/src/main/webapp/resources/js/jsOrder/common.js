(function ($, window, document, undefined) {
    "use strict";

    //호환성보기 모드 지원
    var isCompat = document.compatMode === 'CSS1Compat' ? false : true;
    if (isCompat) {
		/*
        setTimeout(function () {
            $('body').append('<link type="text/css" rel="stylesheet" href="css/common/ieCompat.css" /><script type="text/javascript" src="js/vendor/ie7.js"></script><script type="text/javascript" src="js/vendor/ie7-squish.js"></script>');
        }, 100);
		*/

    }
	$(document).ready(function() {

        /* tabSlider 실행 start*/
        $('.tabSlider').muTabSlider();

        //iscroll 사용시 잔상이 남는 크롬버그 때문에 아래 코드 추가 https://code.google.com/p/chromium/issues/detail?id=288747
        setTimeout(function () {
            $('.tabSlider').find('.iscroll-wrapper').css("-webkit-transform", "translateZ(0)");
        }, 0)

        /* tabSlider 실행 end*/
        $('.tabBox').muTabNav();
        $('.toggleBox').muToggle();
        $('.accordion-list').muAccordion();

        $('.delete-item-btn').on('click', function () {
            $(this).parent().remove();
        });

        $('.mu-icon-thumbType').on('click', function (e) {
			var _key = $(this).parent().attr("br-data-name");
            $('.mu-icon-thumbType').removeClass('active');
            $(this).addClass('active');
            if ($(this).hasClass('largeThumb')) {
                $('.article-list').addClass('enlarged');
				if(_key) setBrowserData(_key,'large');
            } else {
                $('.article-list').removeClass('enlarged');
				if(_key) setBrowserData(_key,'small');
            }
        });

        /* 멤버가격 표시 */
        $('.memberPriceBox').on('click', '>.header, .close-btn', function (e) {
            if ($(this).hasClass('close-btn')) {
                $(e.delegateTarget).removeClass('active');
                return;
            }
            $('.memberPriceBox').removeClass('active');
            $(e.delegateTarget).addClass('active');
        });

		/* keyword stx decode */
		$(".keyword-dec").each(function(i,o) {
			var _kw = $(o).data("origval");
			var _nkw = $('<textarea />').html(_kw).text();
			if($(o).prop("tagName").toLowerCase()=='input') $(o).val(_nkw);
			else $(o).html(decodeURIComponent(_nkw));
		});
    });
})(jQuery, window, document);