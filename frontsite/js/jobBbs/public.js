/*
*提交分页请求
*/
function pagesChange(_this, _val) {
    if(_val=='') {
        alert('请输入正确的页码') ;
        return;
    } else {
    	var totalPage = _this.parents("form").find("input[name='totalPage']");
    	if(parseInt(_val) > parseInt(totalPage.val())){
    		alert('超过了最大页码');
    		totalPage.focus();
    		return;
    	}
		var curPage = _this.parents("form").find("input[name='pages.curPage']");
		//设置当前页码
		curPage.val(_val);
        _this.parents("form").submit();//改成ajax提交
		//_this.parents("form").ajaxSubmit(function(msg) {});
    }
}
/*
*控制跳转文本框只能输入数字
*/
function noNumbers(e)  
{  
	var keynum;
	var keychar;  
	var numcheck;  
	  
	if(window.event) // IE  
	{  
		keynum = e.keyCode;  
	}  
	else if(e.which) // Netscape/Firefox/Opera  
	{  
		keynum = e.which;  
	}  
	keychar = String.fromCharCode(keynum);  
	numcheck = /[^\d]/;
	return !numcheck.test(keychar);  
} 
//ajax请求访问    
//    var urlVc = "/init_sz.do?method=initInfoGncj";  	
//			   $.ajax({
//				   type:"post",
//				   url:urlVc,
//				   success:function(msg){
//					   if (msg==0) {
//						      alert('ajax请求成功！');
//						    }  
//				   },
//				   error:function(msg){
//					   alert('验证码有误！');
//				   }
//			   });

//function setScoll(){
//	var h =document.body.clientHeight;  //页面高度
//	var c = scollPostion().top;  //滚动条top
//	var wh = $(window).height(); //页面可视区域高度
//	var s = h - (c + wh);
//	alert('页面高度：'+h+' 滚动条top：'+c+' 页面可视区域高度：'+wh+'  s：'+s);
//}