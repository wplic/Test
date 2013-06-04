// 自定义全局通用函数
//
// Version 1.0
(function($) {
	//消息提示框
	jShowMsg = function(type, message) {
		$('#message').removeClass();
		$('#message').addClass( type );
		$('#message').children().remove();
		$('#message').html("<ul><li>"+ message +"</li></ul>");
		$('#message').show();
		$('#message').fadeTo(500,0.3).fadeTo(500,1.0).fadeTo(500,0.3).fadeTo(500,1.0);
	}
	jHideMsg = function(){
		$('#message').hide();
	}
	//loading层
	showLoading = function(obj){
		var w = obj.outerWidth();  //innerWidth
		var h = obj.outerHeight(); //innerHeight
		//alert(w +"\t"+ h);
		if(w==0 || h==0){
			var len = obj.children().length;
			if(len>0){
				w = obj.children(":first").innerWidth();
				h = obj.children(":first").innerHeight();
			}
		}
		h = (h>60) ? h : 60;
		var x = obj.position().left;
		var y = obj.position().top;
		//alert(x +"\t"+ y);
		obj.after('<div class="loading"></div>');
		obj.parent().children('.loading').width(w);
		obj.parent().children('.loading').height(h);
		obj.parent().children('.loading').css({left:x, top:y});
		obj.parent().children('.loading').fadeTo(500,0.5);
	}
	hideLoading = function(obj){
		obj.parent().children('.loading').remove();
	}
	//是否为数字
	isNum = function(N){
		if(typeof(N)!='string'){
			N = N+"";
		}
	    numtype="0123456789";
	    for(i=0;i<N.length;i++){
		    if(numtype.indexOf(N.substring(i,i+1))<0)
		    	return false; 
	  	}
	    return true;
	}
	//是否为定长的浮点数
	isUnsigned = function (strNum,strLen){
		if(typeof(strNum)!='string'){
			strNum = strNum+"";
		}
		if(strNum.search(/^\d+(\.\d+)?$/)!=-1){
			var s = strNum.split(".");
			if(s.length<2) return true;
			if(s[1].length>strLen) return false;
			else return true;
		}else{
			return false;
		}
	}
	//email校验
	isEmail = function (mail) {
	 	return(new RegExp(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/).test(mail));
	}
	
	$.send = function(url, data, callback, errCallback, type){
		if ( jQuery.isFunction( data ) ) {
			if( !jQuery.isFunction( callback ) ){
				type = callback;
				errCallback = function(){ };
			}else{
				type = errCallback;
				errCallback = callback;
			}
			callback = data;
			data = {};
		}else if( !jQuery.isFunction( errCallback ) ) {
			type = errCallback;
			errCallback = function(){ };
		}

		return jQuery.ajax({
			type: "POST",
			url: url,
			data: data,
			success: callback,
			error: errCallback,
			dataType: type
		});
	}

	systemMsg = function () {
		return '<table class="content"><tr><td class="textleft">网络繁忙，请重试</td></tr></table>';
	}
	
})(jQuery);