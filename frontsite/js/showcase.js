/**
 * @fileOverview 展示台脚本
 * @copyright (c) 2011 (jrj.com)
 * @author zihua.wang@jrj.com.cn 
 * @date 2011.7.4
 * @depend jquery-1.4.4
 * @version 0.1
 */

var ImageViewer = {
	total : 4,
	visualFirst : 0,
	//visualImgNum : 3,
	visualFocusIndex : 0,
	
	/*
	 * arrowTop 右侧缩略图箭头定位 自动从li中获取
	 */
	arrowTop : [],
	
	init : function(elConfig){
		//左侧大图ID前缀
		this.prefix_id_big = elConfig['prefix_id_big'];
		
		//右侧预览图列表DIV的id
		this.scroll_list_id = elConfig['scroll_list_id'];
		
		//箭头ID
		this.arrow = elConfig['arrowID'];
		
		//右侧说明文字DIV的id
		this.prefix_id_textinfo = elConfig['prefix_id_textinfo'];
		
		this.total = elConfig['total'];
		
	
		this.currPic = $("#" + this.prefix_id_big + "0");
		new JRJ.ui.ImageScroll(this.scroll_list_id, {autoPlay:false,
			delay:3,
			speed:30,
			direction:"v",
			leftBtn:"up",
			rightBtn:"down",
			onScroll: function(upOrDown){
				var imageViewer = ImageViewer;

				var index = imageViewer.visualFirst;
				if(index == 0 && upOrDown == -1){
					index = imageViewer.total - 1;
				}else if(index == imageViewer.total - 1 && upOrDown == 1){
					index = 0;
				}else{
					index += upOrDown;
				}
				
				imageViewer.visualFirst = index;
				
				var focusIndex = index + imageViewer.visualFocusIndex;				
				if(focusIndex >= imageViewer.total){
					focusIndex = focusIndex - imageViewer.total;
				}else {
					focusIndex = focusIndex;
				}

			  imageViewer.focusNavPic(focusIndex);
			  imageViewer.switchBigPic(focusIndex);
			  imageViewer.switchInfoText(focusIndex);
			}
		});
		
		this.navUL = $("#" + this.scroll_list_id).find("ul");
		this.navPics = this.navUL.find("a");
		this.navPics.click(function(){
			var index = this.id.split("_")[2];
					
			var lis = ImageViewer.navUL[0].getElementsByTagName("li");
			var li = this.parentNode;
			ImageViewer.visualFocusIndex = jQuery.inArray(li,lis);
		
			ImageViewer.focusNavPic(index);
			ImageViewer.switchBigPic(index);
			ImageViewer.switchInfoText(index);
		});
		
		//定位ARROW
		$.each(this.navUL.find("li"), function (i, c){
			ImageViewer.arrowTop.push($(c).position().top);
		});
		
		if($("#" + this.arrow)){
			$("#" + this.arrow).css("top", this.arrowTop[0]);
		}
	},
	
	//添加右侧小图的hover样式
	focusNavPic : function(index){
		this.navPics.find('img[id *= img_color_]').hide().end()
		.find('img[id *= img_gray_]').show();
		
		$(this.navPics[index]).find('img[id *= img_color_]').show().end()
		.find('img[id *= img_gray_]').hide();
	},

	switchBigPic : function(index){
		this.currPic.hide();
		this.currPic = $("#" + this.prefix_id_big + index);
		this.currPic.fadeIn("slow");	
		if($("#" + this.arrow)){
			$("#" + this.arrow).css("top", this.arrowTop[this.visualFocusIndex]);
		}
	},
	
	switchInfoText: function (index){
		$('div.textinfo').hide();
		$('#' + this.prefix_id_textinfo + index).show();
	}
}
