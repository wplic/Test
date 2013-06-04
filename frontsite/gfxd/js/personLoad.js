// JavaScript Document
$(function(){
	//ajax加载人物数据信息
	$('#manList a').each(function(){
		var $this=$(this);
		$this.click(function(){
			var thisHtml=this.href;
			$('#manView').load(thisHtml);
			return false;
		});
	});
	
	//每个右侧高度最小一致，大于左侧时自动扩张
	//alert($('#mainCon .hd').height())
	
});