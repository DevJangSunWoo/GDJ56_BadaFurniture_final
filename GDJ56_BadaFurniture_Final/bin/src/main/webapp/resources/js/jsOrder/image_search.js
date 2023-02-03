$(document).ready(function(){
    window.image_search = new function(){

        var thisobj = this;
        var resultDomain = '';
        var apiDomain = '';

        var req_url = '';
        var api_req_url = '';
        var form_req_url = '';
        var upload_api_url = '';
        var image_search_method = '/';
        var logging_method = 'log_image_search/';
        var api_type = $('#imageSearchType').val() || '';
        var form_top = '125px';
        var in_process = false;
        var file_upload_webServer = false;

        var debug = false;

        this.init = function(){
            thisobj.setDebug();
            thisobj.initImageSearch();
        };

        this.setUrl = function(domain) {
            resultDomain = domain;
            apiDomain = domain.replace('www', 'search');

            req_url = apiDomain + '/api/search';
            api_req_url = req_url + '/v1/image';
            form_req_url = resultDomain + '/search/image';
            upload_api_url = req_url + '/v2/file/upload-image';
        }

        this.setDebug = function(){
            var url = document.documentURI || document.URL;

            if (url.search('debug') >= 0) {
                debug = true;
            }
        };

        this.initImageSearch = function(){
            // 스크립트 로드
            if (typeof $('body').lazyload == 'undefined') {
                $('head').append('<script src="//static.msscdn.net/skin/musinsa/js/jquery.lazyload.min.js?20160119" type="text/javascript"></script>');
            }

            // 검색창 이벤트 추가
            if ($('#search_form').length > 0 && $('.cam-btn.ui-head-search-btn').length > 0) {

                if($("#search_form input[name='call_domain']").length > 0) {
                    domain = $("#search_form input[name='call_domain']").val();
                }
                $('.cam-btn.ui-head-search-btn').click(function(){
                    try{ form_top = ($('#search_query').offset().top + $('#search_query').height() + 2) + 'px'; } catch(e){ }
                    $('.wrap_image_search_form.top').css('top', form_top).show();
                    $('.wrap_image_search_form.top').find('.image_url').focus();
                    $('.wrap_image_search_form_mask').show();
                    $('#search_kwd').attr('style', 'display:none;');
                });

                $('.wrap_image_search_form_mask').click(function(){
                    $('.wrap_image_search_form.top').hide();
                    $('.wrap_image_search_form_mask').hide();
                });
            }

            // 스크롤 이벤트 추가
            if ($('.wrap_right ul').length > 0) {
                $('.wrap_right ul').scroll(function(){
                    $(window).scroll();
                });
            }

            // 파일 검색 시 업로드 이벤트 추가
            if ($('#image_file').length > 0) {
                $('#image_file').on('change', function(e) {
                    thisobj.uploadImageFile(this.files[0]);
                })
            }
            if ($('.image_file').length > 0) {
                $('.image_file').on('change', function(e){
                    $('#image_file')[0].files = this.files;
                });
            }
            if ($('.wrap_image_search_form').length > 0) {
                $('.wrap_image_search_form').find('.image_file_btn').click(function(){
                    $('#image_file').click();
                });
            }

            // 이미지 검색 결과 페이지에서 상품정보 클릭이벤트 추가
            $('#searchList > li').find('a').each(function(){
                var href = $(this).attr('href');
                if (href && href.indexOf('/app/product/detail/') >= 0) {
                    $(this).css('cursor', 'pointer').click(function(){
                        var prd_url = href + (href.indexOf('?') >= 0 ? '&' : '?') + 'wh=image_search&loc=' + api_type;
                        var goods_no = prd_url.split("/");
                        goods_no = goods_no[goods_no.length - 2];
                        thisobj.href(prd_url, 'image_search', goods_no, 0);
                    });
                    $(this).removeAttr('href');
                }
            });


            // 검색폼 이벤트 추가
            thisobj.initSearchFormEvent(true);
        };

        this.uploadImageFile = function(imageFile) {
            if (!imageFile) return;

            if (/\.(jpe?g|png|gif)$/i.test(imageFile.name) === false) {
                alert('이미지 파일을 선택해주세요.');
                return;
            }

            var formData = new FormData();
            formData.append('file', imageFile);

            thisobj.beforeSearchUi();

            $.ajax(
                {
                    method: "PUT",
                    url: upload_api_url,
                    data: formData,
                    timeout: 10000,
                    contentType: false,
                    processData: false
                }
            ).done(
                function (responseData) {
                    if (responseData.data != null && responseData.data.responseImageUrl.length > 1) {
                        file_upload_webServer = true;
                        $('.wrap_image_search_form').find('.image_url').val(responseData.data.responseImageUrl);
                        var $imageSearchButton = $('.wrap_image_search_form').find('.image_url_btn');
                        $($imageSearchButton[0]).click();
                    } else {
                        alert("이미지 업로드에 실패하였습니다.");
                        thisobj.afterSearch();
                    }
                }
            ).fail(
                function () {
                    alert('이미지 업로드에 실패하였습니다.');
                    thisobj.afterSearch();
                }
            )
        }

        this.initSearchFormEvent = function(first){
            if (first) {
                $.event.props.push('dataTransfer');

                $('.wrap_image_search_form').on({
                    dragover: function(e){
                        e.preventDefault();

                        e.dataTransfer.dropEffect = 'copy';
                        var style = (thisobj.isTopForm() ? ('top:' + form_top + ';') : '') + 'display:flex;';
                        $('.wrap_image_search_form_cover' + (thisobj.isTopForm() ? '.top' : '.middle')).attr('style', style);
                    },
                    dragleave: function(e){
                        e.preventDefault();
                        $('.wrap_image_search_form_cover' + (thisobj.isTopForm() ? '.top' : '.middle')).attr('style', '');
                    },
                    drop: function(e){
                        e.preventDefault();

                        var filelist = url = null;

                        try {
                            filelist = e.dataTransfer.files;
                            url = e.dataTransfer.getData('text/html');
                        } catch (e) {}

                        if (filelist.length > 0) {
                            $('.wrap_image_search_form_cover').attr('style', '');
                            thisobj.uploadImageFile(filelist[0]);
                        } else {
                            alert('이미지를 찾을 수 없습니다.');
                            thisobj.afterSearch();
                        }
                        return false;
                    }
                });


            }

            $('.wrap_image_search_form .tab_menu span').each(function(){
                $(this).click(function(){
                    if ($(this).hasClass('t1')) {
                        $(this).addClass('active');
                        $('.wrap_image_search_form' + (thisobj.isTopForm() ? '.top' : '.middle') + ' .tab_menu .t2').removeClass('active');
                        $('.wrap_image_search_form' + (thisobj.isTopForm() ? '.top' : '.middle') + ' .content .c1').show();
                        $('.wrap_image_search_form' + (thisobj.isTopForm() ? '.top' : '.middle') + ' .content .c2').hide();
                        $('.wrap_image_search_form' + (thisobj.isTopForm() ? '.top' : '.middle')).find('.image_url').focus();
                    }
                    else {
                        $(this).addClass('active');
                        $('.wrap_image_search_form' + (thisobj.isTopForm() ? '.top' : '.middle') + ' .tab_menu .t1').removeClass('active');
                        $('.wrap_image_search_form' + (thisobj.isTopForm() ? '.top' : '.middle') + ' .content .c2').show();
                        $('.wrap_image_search_form' + (thisobj.isTopForm() ? '.top' : '.middle') + ' .content .c1').hide();
                    }
                });
            });

            $('.wrap_image_search_form').find('.image_url_btn').click(function(e){
                var url = $('.wrap_image_search_form' + (thisobj.isTopForm() ? '.top' : '.middle')).find('.image_url').val();

                thisobj.searchGoodsImageApi(url, api_type);
            });
        };

        this.searchGoodsImageApi = function (imageUrl, imageSearchType) {
            if (!thisobj.checkUrl(imageUrl)) {
                alert('이미지 URL을 입력해주세요.');
                return;
            }

            thisobj.beforeSearch();

            $.ajax(
                {
                    method: 'GET',
                    url: api_req_url,
                    data: {
                        imageUrl: imageUrl,
                        imageSearchType: imageSearchType
                    }
                }
            ).done(
                function(result) {
                    if (result && result.data.boxList.length > 0) {
                        thisobj.sendSearchPage(imageUrl, 0);
                    } else {
                        alert('검색 결과가 존재하지 않습니다.')
                        thisobj.afterSearch();
                    }
                }
            ).fail(
                function () {
                    alert('검색 결과가 존재하지 않습니다.');
                    thisobj.afterSearch();
                }
            )
        }

        this.beforeSearch = function(){
            in_process = true;
            thisobj.beforeSearchUi();
        };

        this.beforeSearchUi = function() {
            $('.wrap_image_search_form_cover').html('파일 업로드<span class="loader loader-quart"></span>');

            var style = (thisobj.isTopForm() ? ('top:' + form_top + ';') : '') + 'display:flex;';
            $('.wrap_image_search_form_cover' + (thisobj.isTopForm() ? '.top' : '.middle')).attr('style', style);
        }

        this.afterSearch = function(){
            in_process = false;

            $('.wrap_image_search_form_cover').html('여기에 이미지를 드롭하세요.');
            $('.wrap_image_search_form_cover' + (thisobj.isTopForm() ? '.top' : '.middle')).attr('style', 'display:none;');
        };

        this.drawBoxList = function(image_url, box_list){
            if (typeof image_url == 'undefined') return;
            if (typeof box_list == 'undefined') return;

            var img = new Image();
            img.onload = function(){
                for (var i = 0; i < box_list.length; i++) {
                    (function(_box, _thisobj, _img){
                        var index = _box.boxIndex;
                        var span = $('<span id="bounds_' + index + '" class="bound' + (box_index == index ? ' active' : '') + '"></span>');
                        if (box_index != index) span.click(function(){
                            _thisobj.sendSearchPage(image_url, index);
                        });

                        var img_width = _img.width;
                        var img_height = _img.height;
                        var left = -1 * img_width * _box.leftTopX;
                        var top = -1 * img_height * _box.leftTopY;
                        var width = img_width * (_box.rightBottomX - _box.leftTopX);
                        var height = img_height * (_box.rightBottomY - _box.leftTopY);

                        var zoom_ratio = top_margin = left_margin = 0;
                        if (width > height) {
                            zoom_ratio = 100 / width;
                            top_margin = (100 - (height * zoom_ratio)) / 2;
                        }
                        else {
                            zoom_ratio = 100 / height;
                            left_margin = (100 - (width * zoom_ratio)) / 2;
                        }

                        if (top_margin + (top * zoom_ratio) > 0) {
                            top_margin = 0;
                        }
                        if (left_margin + (left * zoom_ratio) > 0) {
                            left_margin = 0;
                        }
                        if ((-1 * (top_margin + (top * zoom_ratio) - 100)) > (img_height * zoom_ratio)) {
                            top_margin += (-1 * (top_margin + (top * zoom_ratio) - 102)) - (img_height * zoom_ratio);
                        }
                        if ((-1 * (left_margin + (left * zoom_ratio) - 100)) > (img_width * zoom_ratio)) {
                            left_margin += (-1 * (left_margin + (left * zoom_ratio) - 102)) - (img_width * zoom_ratio);
                        }

                        span.css('background-image', 'url(' + image_url + ')');
                        span.css('background-repeat', 'no-repeat');
                        span.css('background-position-x', (left_margin + (left * zoom_ratio)) + 'px');
                        span.css('background-position-y', (top_margin + (top * zoom_ratio)) + 'px');
                        span.css('background-size', (img_width * zoom_ratio) + 'px ' + (img_height * zoom_ratio) + 'px');
                        span.css('visibility', 'hidden');
                        $('.wrap_bounds_list').append(span);

                        // 바운드 개수가 많아져서 100픽셀 아래로 떨어진경우 처리
                        (function(_span, _zoom_ratio){
                            setTimeout(function(){
                                if (_span.width() < 100 && _span.width() != 96) {
                                    var left_margin = (100 - _span.width()) / 2;
                                    _span.css('background-position-x', Number(_span.css('background-position-x').replace('px', '')) - left_margin);
                                }
                                _span.css('visibility', 'visible');
                            }, 100);
                        })(span, zoom_ratio);
                    })(box_list[i], thisobj, this);
                }

                $('.wrap_image_search_result .main_image').attr('style', 'background-image:none;');
                if (this.width > this.height) {
                    $('.wrap_image_search_result .main_image .img').attr('style', 'visibility:visible; width:100%;');
                }
                else {
                    $('.wrap_image_search_result .main_image .img').attr('style', 'visibility:visible; height:100%;');
                }
            };
            img.src = image_url;
        };

        this.sendSearchPage = function(image_url, box_index){
            $('.image_file').val('');
            $('#image_file').val('');

            var searchPageUrl = form_req_url + '?imageUrl=' + encodeURIComponent(image_url) + '&boxIndex=' + box_index + '&imageSearchType=' + api_type;

            if (box_index == -1) {
                setTimeout(function(){
                    location.href = searchPageUrl;
                }, 1000);
            }
            else{
                location.href = searchPageUrl;
            }
        };

        this.href = function(url, search_type, clicked_goods_no, is_popup){
            /* 클릭 로그 삭제
            var params = {
                api_kind: api_type,
                search_type: search_type,
                device: 'pc',
                p_goods_no: (search_type == 'similar_goods' ? p_goods_no : 0),
                goods_no: clicked_goods_no,
                reffer_url: document.documentURI
            };
            thisobj.request(logging_method, params);
            */
            location.href = url;
        };

        this.checkUrl = function(value){
            return /^(?:(?:(?:https?|ftp):)?\/\/)(?:\S+(?::\S*)?@)?(?:(?!(?:10|127)(?:\.\d{1,3}){3})(?!(?:169\.254|192\.168)(?:\.\d{1,3}){2})(?!172\.(?:1[6-9]|2\d|3[0-1])(?:\.\d{1,3}){2})(?:[1-9]\d?|1\d\d|2[01]\d|22[0-3])(?:\.(?:1?\d{1,2}|2[0-4]\d|25[0-5])){2}(?:\.(?:[1-9]\d?|1\d\d|2[0-4]\d|25[0-4]))|(?:(?:[a-z\u00a1-\uffff0-9]-*)*[a-z\u00a1-\uffff0-9]+)(?:\.(?:[a-z\u00a1-\uffff0-9]-*)*[a-z\u00a1-\uffff0-9]+)*(?:\.(?:[a-z\u00a1-\uffff]{2,})))(?::\d{2,5})?(?:[/?#]\S*)?$/i.test(value);
        };

        this.getPrice = function(price){
            price = String(price);
            return price.replace(/(\d)(?=(\d{3})+\b)/g,'$1,') + '원';
        };

        this.isTopForm = function(){
            return ($('.wrap_image_search_form.top').css('display') == 'block');
        };

        this.imageSearchRequestCallback = function () {
            alert('')
        }

        try {
            if (!window.image_search) {
                this.init();
            }
        }
        catch (e) {
            console.log('image search exception catched : ' + e);
        }
    };
});
