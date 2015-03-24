/*
扩展js文件
*/
$(function(){
		/*详情页滚动*/
		var sliderPlugin = function(){
		var _this = this;
		this.scrollLeftNode = $('#picDetailSlide .leftBtn');
		this.scrollRightNode = $('#picDetailSlide .rightBtn');
		this.scrollWidth = 0;
		this.showItems = 4;
		var mainPicSlideLi=$('.mainPicSlide ul li').eq(0);
		this.itemsWidth = mainPicSlideLi.width()+14;
		this.sliderWidth = this.itemsWidth * this.showItems;
		this.groupLength = Math.ceil($('.mainPicSlide ul li').length/4);
		$('.mainPicSlide ul').css('width', this.itemsWidth * $('.mainPicSlide ul li').length);
		this.run = function(){
			_this.scrollLeftNode.on('click', function(e){
				e.preventDefault();
				_this.scrollWidth+=652;
				if (_this.scrollWidth>0) {
					_this.scrollWidth = 0;
				};

				$('.mainPicSlide ul').animate({
					left:_this.scrollWidth
				});
			});
			_this.scrollRightNode.on('click', function(e){
				e.preventDefault();
				_this.scrollWidth-=652;
				if (_this.scrollWidth < -(_this.groupLength-1)*_this.sliderWidth) {
					_this.scrollWidth = -(_this.groupLength-1)*_this.sliderWidth;
				};
				$('.mainPicSlide ul').animate({
					left:_this.scrollWidth
				});
			});
		};
	};
	var sliderObj = new sliderPlugin();
	sliderObj.run();

	/*搜索框获取焦点*/
	$('.search .inp').val('请输入关键字');
	$('.search .inp').focus(function(){
		$('.search .inp').val('');
		$(this).parents('.search').addClass('searchFocus');
	}).blur(function(){
		$(this).parents('.search').removeClass('searchFocus');
		if($(this).val()==''){
			$('.search .inp').val('请输入关键字');
		}
	});

	/*首页的banner*/
	$("#slideBox").slide({mainCell:".bd ul",autoPlay:true});

	/*市政图片轮播*/
	$("#politicSlide").slide({mainCell:".bd ul",effect:"left",autoPlay:true});

	/*会员作品轮播*/
	$("#memberSlide").slide({mainCell:".bd ul",effect:"topLoop",autoPlay:true});

	/*老照片轮播*/
	$("#oldSlide").slide({mainCell:".bd ul",effect:"left",autoPlay:true});
});

