(function ($, window, document, undefined) {
    var pluginName = "muArrowNav",
        defaults = {
            loop: false,
            categories: ""
        };

    function Plugin(element, options) {
        this.element = element;

        this.settings = $.extend({}, defaults, options);
        this._defaults = defaults;
        this._name = pluginName;
        this.init();
    }

    $.extend(Plugin.prototype, {
        init: function () {
            $(this.element).find(".nav-btn")
                .on('click', $.proxy(this.navigate, this));

        },
        findCurrentCate: function () {
            var currentCateName = $(this.element).attr("class").split(" ")[1];

            return $.inArray(currentCateName, this.settings.categories)
        },
        navigate: function (e) {
            var $currentTarget = $(e.currentTarget),
                $currentElement = $(this.element),
                currentCateIndex = this.findCurrentCate(),
                categories = this.settings.categories,
                categoriesString = categories.join(" ");


            if (currentCateIndex === -1) {
                return false;
            }

            if ($currentTarget.hasClass("prev") && currentCateIndex > 0) {
                $currentElement
                    .removeClass(categoriesString)
                    .addClass(categories[currentCateIndex - 1]);
            } else if ($currentTarget.hasClass("next") && currentCateIndex < categories.length - 1) {
                $currentElement
                    .removeClass(categoriesString)
                    .addClass(categories[currentCateIndex + 1])
            }
        }
    });

    $.fn[pluginName] = function (options) {
        this.each(function () {
            if (!$.data(this, "plugin_" + pluginName)) {
                $.data(this, "plugin_" + pluginName, new Plugin(this, options));
            }
        });

        // chain jQuery functions
        return this;
    };

})(jQuery, window, document);

(function ($, window, document, undefined) {

    var pluginName = "muTabNav",
        defaults = {
            //설정값 우선순위 : html > 피라미터 > 기본속성
            defaulttab: true,//디폴트로 탭선택 여부
            active: "", //초기에 보여줄 탭 selector
            random: false, //초기에 보여줄 탭 순서를 랜덤으로 결정
            styleOnly: false // 탭 기능 해제, init 함수내에서 해당 옵션 체크.
        };

    function Plugin(element, options) {
        this.element = element;
        this.settings = $.extend({}, defaults, options);
        for (var attrName in this.settings) {
            if ($(element).data(attrName) !== undefined) {
                this.settings[attrName] = $(element).data(attrName);
            }
        }
        this.$el = {
            $element: $(element),
            $tabBtns: $(element).find('.tab-btn'),
            $navBtns: $(element).find('.nav-btn').not('.deactivated'),
            $contentContainers: $(element).find('.tab')
        };
        this._defaults = defaults;
        this._name = pluginName;
        this.init();
    }

    $.extend(Plugin.prototype, {
        init: function () {
            if (this.settings.styleOnly) {
                return false;
            }
            this.setListener();
            this.showActiveWrapper();
            this.checkActiveStatus();
        },
        setListener: function () {
            var self = this;
            this.$el.$element.on('tabbed', function (e, $element) {
				if(self.$el.$element.attr("br-data-name")) self.toggleTab($element,self.$el.$element.attr("br-data-name"));
                else self.toggleTab($element);
                self.toggleContainer($element);
				
            });

            this.$el.$tabBtns.on('click', function () {
                self.$el.$element.trigger('tabbed', [$(this)]);
            });

            this.$el.$navBtns.on('click', function () {
                var activeTabIndex = self.getTabIndex(self.findActiveTab()),
                    $tabToShow, tabToShowIndex;

                if ($(this).hasClass('next')) {
                    tabToShowIndex = activeTabIndex + 1
                } else if ($(this).hasClass('prev')) {
                    tabToShowIndex = activeTabIndex - 1
                } else {
                    tabToShowIndex = activeTabIndex
                }
                if (tabToShowIndex < 0) {
                    if (self.$el.$element.hasClass('infinite')) {
                        $tabToShow = self.$el.$tabBtns.eq(self.$el.$tabBtns.length - 1)
                    }
                } else if (tabToShowIndex == 0) {
                    $tabToShow = self.$el.$tabBtns.eq(0)
                } else if (tabToShowIndex == self.$el.$tabBtns.length - 1) {
                    $tabToShow = self.$el.$tabBtns.eq(self.$el.$tabBtns.length - 1);
                } else if (tabToShowIndex > self.$el.$tabBtns.length - 1) {
                    if (self.$el.$element.hasClass('infinite')) {
                        $tabToShow = self.$el.$tabBtns.eq(0)
                    }
                } else {
                    $tabToShow = self.$el.$tabBtns.eq(tabToShowIndex);
                }

                self.$el.$element.trigger('tabbed', [$tabToShow]);
            });

            this.$el.$contentContainers.on('click', '.close-btn', function () {
                $(this).parent().toggleClass('active');
            });
        },
        checkActiveStatus: function () {
            if (this.settings.random) {
                var randomNum = Math.floor(Math.random() * (this.$el.$tabBtns.length));
                this.$el.$contentContainers.removeClass('active');
                this.$el.$tabBtns.removeClass('active');
                this.$el.$element.trigger('tabbed', [this.$el.$tabBtns.eq(randomNum)]);
            } else {
                //모든 tab-btn active 클랙스 가 없을 경우 첫번째 tab-btn에 active 클래스 부여
				if(!this.$el.$element.attr("not-activate-first")) {
					if (!this.$el.$tabBtns.hasClass('active') && this.settings.defaulttab) {
						this.$el.$tabBtns.eq(0).addClass('active');
					}
				}
            }
        },
        toggleTab: function ($target,data_name) {
            var targetName = $target.data('for');
			var targetName2 = $target.attr('brfor')?$target.attr('brfor'):$target.data('for');
            if (!targetName && !targetName2) {
                this.$el.$tabBtns.removeClass('active');
            } else {
                $target.siblings('.tab-btn').removeClass('active');
				if(data_name) {
					setBrowserData(data_name,targetName ? targetName : targetName2);
				}
            }

            $target.addClass('active');
        },
        toggleContainer: function ($tabBtn) {
            var targetName = $tabBtn.data('for'),
                $targetContentContainers, tabBtnIndex;

            if (!targetName) {
                tabBtnIndex = this.getTabIndex($tabBtn);
                this.$el.$contentContainers
                    .removeClass('active');

                $targetContentContainers = this.$el.$contentContainers.eq(tabBtnIndex);
            } else {
                $targetContentContainers = targetName == "showAll" ? this.$el.$contentContainers : this.$el.$contentContainers.filter('.' + targetName);
                $targetContentContainers.siblings('.tab')
                    .removeClass('active');
            }
			$( window ).trigger( "lazyloadupdate" );
            $targetContentContainers
                .addClass('active');
        },
        findActiveTab: function () {
            if (this.settings.active) {
                return this.$el.$tabBtns.filter(this.settings.active);
            }

            var $activeTab = this.$el.$tabBtns.filter('.active');

            if ($activeTab.length) {
                return $activeTab.eq(0);
            }

            if(this.$el.$element.attr("not-activate-first")) return -1;
			else return this.$el.$tabBtns.eq(0);
        },
        getTabIndex: function ($tabBtn) {
            return $.inArray($tabBtn[0], this.$el.$tabBtns);
        },
        showActiveWrapper: function () {
            if (!this.$el.$element.data('hide')) {
                var $activeTab = this.findActiveTab();
                if($activeTab==-1) return;
				else this.toggleContainer($activeTab);
            }
        }
    });

    $.fn[pluginName] = function (options) {
        this.each(function () {
            if (!$.data(this, "plugin_" + pluginName)) {
                $.data(this, "plugin_" + pluginName, new Plugin(this, options));
            }
        });

        return this;
    };

})(jQuery, window, document);


(function ($, window, document, undefined) {

    var pluginName = "canIUse";

    $[pluginName] = function (featureName) {
        var feature = false,
            domPrefixes = 'Webkit Moz ms O'.split(' '),
            elm = document.createElement('div'),
            featurenameCapital = null,
            featureName = featureName.toLowerCase();

        if (elm.style[featureName] !== undefined) {
            feature = true;
        }

        if (feature === false) {
            featurenameCapital = featureName.charAt(0).toUpperCase() + featureName.substr(1);
            for (var i = 0; i < domPrefixes.length; i++) {
                if (elm.style[domPrefixes[i] + featurenameCapital] !== undefined) {
                    feature = true;
                    break;
                }
            }
        }

        return feature;
    };

})(jQuery, window, document);


(function ($, window, document, undefined) {
    var pluginName = "muToggle",
        defaults = {};

    function Plugin(element, options) {
        this.element = element;
        this.settings = $.extend({}, defaults, options);
        this.$el = {
            $element: $(element),
            $toggleBtn: $(element).find('.toggle-btn'),
            $toggleTarget: $(element).find('.toggleTarget')
        };
        this._defaults = defaults;
        this._name = pluginName;
        this.init();
    }

    $.extend(Plugin.prototype, {
        init: function () {
            var self = this;

            this.$el.$element.on('toggled', function (e, $toggleBtn, $toggleTarget, customClass) {
                $toggleBtn.toggleClass('active');
                $toggleTarget.toggleClass("active");
                if (customClass) {
                    $toggleTarget.toggleClass(customClass);
                }
            });

            this.$el.$toggleBtn.on('click', function (e) {
                var customClass,
                    $toggleBtn,
                    $toggleTarget;

                e.stopPropagation();

                if ($(this).data("customClass")) {
                    customClass = $(this).data("customClass");
                }

                $toggleBtn = $(this);

                if ($toggleBtn.data("for")) {
                    $toggleTarget = self.$el.$toggleTarget.filter("." + $toggleBtn.data("for"));
                    if (!$toggleTarget.length) {
                        $toggleTarget = $('#' + $toggleBtn.data("for"));
                    }
                } else {
                    $toggleTarget = self.$el.$toggleTarget;
                }

                self.$el.$element.trigger('toggled', [$toggleBtn, $toggleTarget, customClass]);

                return false;
            });


        }
    });

    $.fn[pluginName] = function (options) {
        this.each(function () {
            if (!$.data(this, "plugin_" + pluginName)) {
                $.data(this, "plugin_" + pluginName, new Plugin(this, options));
            }
        });

        return this;
    };

})(jQuery, window, document);

(function ($, window, document, undefined) {
    var pluginName = "muAccordion",
        defaults = {};

    function Plugin(element, options) {
        this.element = element;
        this.settings = $.extend({}, defaults, options);

        this.$el = $(element);
        this.$listItems = this.$el.find('.listItem');

        this._defaults = defaults;
        this._name = pluginName;
        this.init();
    }

    $.extend(Plugin.prototype, {
        init: function () {
            var self = this;
            this.$el.on('click', '> .listItem', function () {
                self.$listItems.removeClass('active');
                $(this).addClass('active');
            });
        }
    });

    $.fn[pluginName] = function (options) {
        this.each(function () {
            if (!$.data(this, "plugin_" + pluginName)) {
                $.data(this, "plugin_" + pluginName, new Plugin(this, options));
            }
        });

        return this;
    };

})(jQuery, window, document);

(function ($, window, document, undefined) {
    var pluginName = "muTabSlider",
        defaults = {};

    function Plugin(element, options) {
        this.element = element;
        this.settings = $.extend({}, defaults, options);
        this.$el = $(element);
        this._defaults = defaults;
        this._name = pluginName;
		var that = this;
		if(this.$el.data("preinit") && typeof(muTabSliderPreInit)=='function') muTabSliderPreInit(function() {
			that.init();
		});
		else if(this.$el.data("preinit2") && typeof(muTabSliderPreInit2)=='function') muTabSliderPreInit2(function() {
			that.init();
		});
        else this.init();
    }

    $.extend(Plugin.prototype, {
        init: function () {
            var $tabSlider = this.$el,
                $navBtnBox = $tabSlider.find('.navBtnBox'),
                $pagingBox = $tabSlider.find('.pagingBox'),
                $curPageNum = $navBtnBox.find('.currentPageNum'),
                $totalPageNum = $navBtnBox.find('.totalPageNum'),
                $iscrollWrapper = $tabSlider.find('.iscroll-wrapper'),
                $tabBtnBox = $tabSlider.find('.snb'),
                $tabBtns = $tabBtnBox.find('.tab-btn'),
                $slideList = $iscrollWrapper.find('.slide-list'),
                $slides = $slideList.find('>.listItem'),
                $contentSlides = $slides.not(function (n, el) {
                    return $(el).hasClass('adSlide')
                }),
                totalSlideNum = $slides.length,
                contentSlideNum = $contentSlides.length,
                isInfinite = $tabSlider.hasClass('infinite'),
				noAddEl = (this.$el.data('noAddEl')?true:false),
                isMouseDisabled = $tabSlider.data('disableMouse'),
                isRandomDisplay = $tabSlider.data("random"),
                wrapperWidth,
                myScroll;

			var $iscrollPaging = $("#"+$tabSlider.attr("iscrollPaging"));
            /*
             자연스러운 페이지 전환을 위해 리스트 양쪽 끝에 추가로 엘리먼트를 추가함
             */
            function addExtraEl() {
			   var $_fstEl = $slides.eq(0).clone();
			   var $_endEl = $slides.eq(totalSlideNum - 1).clone();
               $slideList.append($_fstEl);
               $slideList.prepend($_endEl);
               $slides = $slideList.find('>.listItem');
               $contentSlides = $slides.not(function (n, el) {
                   return $(el).hasClass('adSlide')
               });
               totalSlideNum = $slides.length;				
            }

            function getCurPageNum() {
                var curPageNum = $contentSlides.index($slides.eq(myScroll.currentPage.pageX));
                if (!isInfinite) {
                    curPageNum++;
                }
                return curPageNum
            }

            function setCurPageNum() {
                var curPageNum = getCurPageNum();
                if (curPageNum == -1 && $slides.eq(myScroll.currentPage.pageX).hasClass("adSlide")) {
                    $curPageNum.html("광고");
                    $totalPageNum.html("");
                } else {
                    $curPageNum.html(curPageNum);
                    $totalPageNum.html(" / " + (contentSlideNum));
                }
            }

            function setTab() {
                var curPageNum = myScroll.currentPage.pageX;
                $tabBtns.removeClass('active');
                $tabBtns.each(function (num, el) {
                    var prevTabNum = $(el).prev().data('page') || $(el).prev().index() + 1,
                        tabNum = $(el).data('page') || curPageNum,
                        nextTabNum = $(el).next().data('page') || $(el).next().index() + 1;

                    if (curPageNum > (prevTabNum || 0) && curPageNum >= tabNum && curPageNum < (nextTabNum || totalSlideNum - 1)) {
                        $(el).addClass('active');
						if($(el).attr("allviewLink")) $tabBtnBox.find(".btn-all-view").prop("href",$(el).attr("allviewLink"));
                    }

                });
            }

            if (isInfinite && !noAddEl) {
                addExtraEl();
            }

            wrapperWidth = $iscrollWrapper.width();
            $slides.width(wrapperWidth);
            $slideList.width(wrapperWidth * totalSlideNum);

            $(window).resize(function () {
                wrapperWidth = $iscrollWrapper.width();
                $slides.width(wrapperWidth);
                $slideList.width(wrapperWidth * totalSlideNum);
				$tabSlider.data('myScroll').refresh();
            });

			$slideList.css("height",$iscrollWrapper.innerHeight());

            myScroll = new IScroll($iscrollWrapper.get(0), {
                scrollX: true,
                scrollY: false,
                momentum: false,
                snap: true,
                snapSpeed: 400,
                snapThreshold: 0.16,
                eventPassthrough: true,
                disableMouse: isMouseDisabled || false,
                disablePointer: isMouseDisabled || false,
                disableTouch: isMouseDisabled || false
            });

			if ($iscrollPaging.length>0) {
				$iscrollPaging.html((myScroll.currentPage.pageX+1)+"/"+myScroll.pages.length);
			}

            $tabSlider.data('myScroll', myScroll);

            if (isInfinite) {
                myScroll.goToPage(1, 0, 0)

            }

            setCurPageNum();

            $navBtnBox
                .on('click', '.prev', function () {
                    if (myScroll.currentPage.pageX == 0) {
                        $tabSlider.trigger('startPage');
                    }
                    myScroll.prev();
                })
                .on('click', '.next', function () {
                    if (myScroll.currentPage.pageX == myScroll.pages.length - 1) {
                        $tabSlider.trigger('endPage');
                    }
                    myScroll.next();
                });

            $pagingBox
                .on('click', '.left-arrow-btn', function () {
                    myScroll.prev();
                })
                .on('click', '.right-arrow-btn', function () {
                    myScroll.next();
                });

			$(document).on('click', '.arrowBtnBox .arrow-btn', function () {
				if($(this).hasClass('left-arrow-btn')) {
					myScroll.prev();
				} else if ($(this).hasClass('right-arrow-btn')) {
					myScroll.next();
				}
			});

            $tabBtns.on('click', function () {
                var pageToGo = $(this).data('page') || $(this).index() + 1;
                myScroll.goToPage(pageToGo, 0);
            });

            $pagingBox.on('click', '.number-btn', function () {
                var pageToGo = Number($(this).find('span').html()) - 1;
                myScroll.goToPage(pageToGo, 0);
            });

			myScroll.on('refresh',function(){
				console.log('refreshed');
                if ($iscrollPaging.length>0) {					
					$iscrollPaging.html((this.currentPage.pageX+1)+"/"+this.pages.length);
                }
			});

            myScroll.on('scrollEnd', function () {
                var curPageNum = myScroll.currentPage.pageX;

                if (isInfinite) {
                    if (curPageNum === 0) {
                        curPageNum = totalSlideNum - 2
                        myScroll.goToPage(curPageNum, 0, 0);
                    } else if (curPageNum === totalSlideNum - 1) {
                        curPageNum = 1;
                        myScroll.goToPage(curPageNum, 0, 0);

                    }
                }

                setCurPageNum();
                setTab();
				$( window ).trigger( "lazyloadupdate" );
				if(typeof(sideStroeCallback)=='function') sideStroeCallback($slides.eq(curPageNum));
				if(typeof(lqPageCallBack)=='function') lqPageCallBack($slides.eq(curPageNum+1));
				if(typeof($tabSlider.data("scrollCallbackEtc")) == 'function') $tabSlider.data("scrollCallbackEtc")(myScroll,myScroll.currentPage.pageX);

                if ($pagingBox) {
                    var $pagingListItem = $pagingBox.find('.page-list').find('.listItem');
                    $pagingListItem.removeClass('active');
                    $pagingListItem.eq(curPageNum).addClass('active');
                }

                if ($iscrollPaging.length>0) {					
					$iscrollPaging.html((this.currentPage.pageX+1)+"/"+this.pages.length);
                }
            });

            if (isRandomDisplay) {
                var randomTabNum = Math.floor(Math.random() * ($tabBtns.length));
                $tabBtns.removeClass('active');
                $tabBtns.eq(randomTabNum).addClass('active');
				if($tabBtns.eq(randomTabNum).attr("allviewLink")) $tabBtnBox.find(".btn-all-view").prop("href",$tabBtns.eq(randomTabNum).attr("allviewLink"));
                $tabSlider.data('myScroll').goToPage($tabBtns.eq(randomTabNum).data("page") || randomTabNum + 1, 0, 0);

                setCurPageNum();
            }
        }		
    });

    $.fn[pluginName] = function (options) {
        this.each(function () {
            if (!$.data(this, "plugin_" + pluginName)) {
                $.data(this, "plugin_" + pluginName, new Plugin(this, options));
            }
        });

        return this;
    };

	/* 애니메이션이 끝난 후 모드 가이드 아이콘 삭제 */
	setTimeout(function(){
		$('.modeGuide').hide(0);
	},3000);

})(jQuery, window, document);