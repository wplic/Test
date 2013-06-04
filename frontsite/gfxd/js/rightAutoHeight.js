// JavaScript Document
$(function(){
		   
	var conHeight=$('#mainCon>.hd').height();
	removeOvh();
	if(conHeight<=582){
		$('#mainCon>.hd').height(582);
	}else{
		$('#mainCon>.hd').height('1%');
	}
	
	function removeOvh(){
		if($('#mainCon>.hd .con').hasClass('ovh_')){
			$('#mainCon>.hd .con').removeClass('ovh_');
		}
	}//end_removeOvh
	
});