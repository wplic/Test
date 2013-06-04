(function($) {
	$(document).ready( function(){
		var objs = null;
	    if($.browser.msie){
	    	objs = $(":input[tabindex!=0]");
	    }else{
	        objs = $(":input[tabindex]");
	    }
	    
	    objs.keypress(function(event){
	        if (event.keyCode== 13){
	            var obj = $(this);
	            var flag = false;
	            objs.each(function(){
	                if(flag && !$(this).is(":hidden")){
	                    $(this).focus(); flag = false;
	                };
	                if(obj.attr("tabindex")==$(this).attr("tabindex")){
	                    flag = true;
	                }
	            });
	            event.stopPropagation(); 
	        }
	    });
	});
})(jQuery);