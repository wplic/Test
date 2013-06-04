/*
*提交分页请求
*/
function pagesChange(_this, _val) {
    if(_val=='') {
        alert('请输入正确的页码') ;
    } else {
    	//_this.style.cursor = "wait";
		var curPage = _this.parents("form").find("input[name='pages.curPage']");
		//设置当前页码
		curPage.val(_val);
        //_this.parents("form").submit();//改成ajax提交
		_this.parents("form").ajaxSubmit(function(msg) {
				//判断用户点击的是哪个栏目的分页
				var val_ = _this.parents("form").find("input[name='input_']").val();
				//刷新对应的div列表展示
				if(val_==1){
					//广发动态
					$("#div_gfdt").load("/sz/gfdt.jsp");
				} else if(val_==2){
					//国内财经
					$("#div_gncj").load("/sz/gncj.jsp");
				} else if(val_==3){
					//营业部动态
					$("#div_yingyedt").load("/sz/yingyedt.jsp");
				}
				//_this.style.cursor = "pointer";
      	 });
    }
}

/*
*栏目选项卡控制
*/
var pTID = 0;
function pdis(pID){
  if(pTID!=pID){
   document.getElementsByName("psKey")[pTID].style.display = "none";
   document.getElementsByName("ptit")[pTID].className = "mnl_unselone";
   document.getElementsByName("psKey")[pID].style.display = "";
   document.getElementsByName("ptit")[pID].className="mnl_selone"
   pTID = pID;
  }
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