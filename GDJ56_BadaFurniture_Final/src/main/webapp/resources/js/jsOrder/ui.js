// document ready
$(document).ready(function(){
	layerOption = '';
	layerVal = '';
	// layer btn
	$('.ui-layer-btn').on('click',function(e){
		layerBtn = $(this);
		uiLayerType = layerBtn.data('type');
		uiLayer = layerBtn.attr('href');

		// dimm
		if(layerBtn.hasClass('layer-dimm')){
			layerOption = 'dimm';
			layerVal = layerBtn.data('dimm');
		}

		// video
		if(layerBtn.hasClass('layer-video')){
			layerOption = 'video';
			layerVal = layerBtn.data('video');
		}

		if(uiLayerType === 'basic') uiLayerBasic(uiLayer, layerOption, layerVal);
		else if(uiLayerType === 'toggle') uiLayerToggle();
		e.preventDefault();
	});

	// layer close
	$('.ui-layer-close').on('click',function(){
		uiLayerClose();
	});

	// tab btn
	$('.ui-tab-btn .ui-btn').on('click',function(e){
		var tabBtn = $(this)
			, tabBtnWrap = tabBtn.parents('.ui-tab-btn')
			, tabName = tabBtnWrap.data('tab')
			, tabCont = tabBtn.attr('href')
			, tabContWrap = $('.ui-tab-cont[data-tab="'+ tabName +'"]');
		if(!tabBtn.hasClass('is-active')){
			tabBtnWrap.find('.ui-btn').removeClass('is-active');
			tabBtn.addClass('is-active');
			tabContWrap.find('.ui-cont').removeClass('is-active');
			$(tabCont).addClass('is-active');
		}
		e.preventDefault();
	});

	// datepicker
	if($('.n-datepicker').length){
		$( ".n-datepicker > input" ).datepicker({
			showOn: "button",
			buttonImage: "//image.msscdn.net/skin/musinsa/images/ico_calendar.png?20200528",
			buttonImageOnly: true,
			buttonText: "날짜 선택",
			showMonthAfterYear: true,
			dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
			monthNames: ['1','2','3','4','5','6','7','8','9','10','11','12'],
			dateFormat: "yy.mm.dd",
			firstDay: 1,
			onSelect: function(dateText) {
				if (typeof selDatePicker == "function") {
					selDatePicker(this, dateText);
				}
			}
		});
	}

	// select
	if($('.n-select').length){
		$('.n-select > select').selectmenu({
			width:'100%',
			icons:{
				button:"ico ico-sm ico-ar00",
			},
			classes: {
				"ui-selectmenu-button-open": "is-active",
			}
		});
	}

	// score
	$('.n-score.clickable .score').on('click',function(e){
		var $this = $(this)
		 	, wrap = $this.parent('.n-score');
		if(!$this.hasClass('is-active')){
			wrap.addClass('is-active').find('.score').removeClass('is-active');
			$this.addClass('is-active');
			setTimeout(function(){
				wrap.removeClass('is-active');
			},100);
		}
		e.preventDefault();
	});

	// tab
	$('.tab-btn').on('click',function(){
		var $this = $(this)
			, $tab = $this.data('tab')
			, $parents = $this.parents('.tab-wrap');
		if(!$this.hasClass('is-active')){
			$parents.find('.tab-btn').removeClass('is-active');
			$parents.find('.tab-block').removeClass('is-active');
			$this.addClass('is-active');
			$parents.find('.tab-block[data-tab="'+ $tab +'"]').addClass('is-active');
		}
	});

	// toggle
	$('.ui-toggle-btn').on('click',function(){
		if($(this).hasClass('is-active')) $(this).removeClass('is-active');
		else $(this).addClass('is-active');
	});

	// comment
	$('.n-comment-input').on('click',function(){
		if(!$(this).hasClass('is-focus')){
			$(this).addClass('is-active is-focus').find('textarea').focus();
		}
	});
});

// layer basic open
function uiLayerBasic(uiLayer,layerOption,layerVal){
	var dimmZ = $(uiLayer).css('z-index') - 1;
	$('body').addClass('fixedScroll');
	$('.ui-layer-close.fixed').css({'display':'block','z-index':dimmZ});

	if(layerOption === 'dimm') $('.ui-layer-close.fixed').css('background',layerVal);
	if(layerOption === 'video') $(uiLayer).find('.layer-video').attr('src','https://www.youtube.com/embed/' + layerVal + '?autoplay=1');

	$(uiLayer).addClass('is-active');
	var top = $(uiLayer).innerHeight() / 2;
	$(uiLayer).css('margin-top',-top + 'px');

	if($(uiLayer).offset().top < 0){
		$(uiLayer).css({position:'absolute',top:'20px',marginTop:'0'});
		$('body').removeClass('fixedScroll');
	}
}

// layer close
function uiLayerClose(){
	$('.ui-layer').removeClass('is-active');
	$('.ui-layer-close.fixed').attr('style','');
	$('.ui-layer .layer-video').attr('src','');
	$('body').removeClass('fixedScroll');
	layerOption = '';
	layerVal = '';
}

// layer toggle
function uiLayerToggle(){
	if(layerBtn.hasClass('is-active')){
		layerBtn.removeClass('is-active');
		if($(uiLayer).length) $(uiLayer).removeClass('is-active');
	}
	else{
		layerBtn.addClass('is-active');
		if($(uiLayer).length) $(uiLayer).addClass('is-active');
	}
}
