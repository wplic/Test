(function($){
	
	$.fn.FA_searchBar = function(o){
		var o = $.extend({
			txt: ".txt",
			btn: ".btn",
			val: null
		}, o);

		o.selector = $(this).selector;

		return this.each(function(){	
			var $t = $(this), $txt = $(o.txt, $t), $btn = $(o.btn, $t), $txt_val = o.val || $txt.val();	

			$txt.focus(function(){			
				if(/^[\s]*$/.test($txt.val()) || $txt.val() == $txt_val){
					$txt.val("");
				}
			}).blur(function(){
				if(/^[\s]*$/.test($txt.val()) || $txt.val() == $txt_val){
					$txt.val($txt_val);
				}
			});

			$t.submit(function(){
				if(/^[\s]*$/.test($txt.val()) || $txt.val() == $txt_val){
					$txt.focus();
					return false;
				}
			});
		});
	}
	
	$.fn.FA_select = function(opts){
		var o = $.extend({
			valWrap : ".FA_selVal",
			valTxt : ".FA_selVal .txt",
			optWrap : ".FA_selOpt",
			opt : ".FA_selOpt li",
			hoverClass : "hover",
			curClass : "cur",
			defIndex : false
		}, opts);
		return this.each(function(i){
			var $this = $(this), $valWrap = $(o.valWrap, $this), $valTxt = $(o.valTxt, $this), $optsWrap, $opts, $wrap, 
				className = $this.attr("class"), id, oNum = i;

			id = className.replace(" ", "_") + "_FA_sel_";
			while(true){
				if(!$("#" + id + oNum).size()){
					$wrap = $("<div id='" + id + oNum + "' style='position:absolute;z-index:99999;top:-9999px;left:-9999px;background:url(#);'></div>");
					break;
				}
				++oNum;
			}
			$optsWrap = $this.find(o.optWrap).appendTo($wrap);
			$("body").append($wrap);
			$opts = $wrap.find(o.opt);
			
			$wrap.click(function(){
				$wrap.css({top : "-9999px", left : "-9999px"});
			}).hover(
				function(){},
				function(){$wrap.css({top : "-9999px", left : "-9999px"});}
			);
			
			if(o.defIndex != false){
				$valTxt.text($opts.eq(o.defIndex).addClass(o.curClass).text())
			};
			$valWrap.click(function(){
				var $win = $(window), scrollTop = $win.scrollTop(), scrollLeft = $win.scrollLeft(), pos = $valWrap.offset(),
					w = $valWrap.outerWidth() ,h = $valWrap.outerHeight(), $optsWrap_h = $optsWrap.outerHeight();
				if($optsWrap_h + h + pos.top - scrollTop > $win.height() && $optsWrap_h < $win.height()){
					$wrap.css("padding", "0 0 " + h + "px").css({width : w, top : pos.top - $optsWrap_h, left : pos.left + scrollLeft});
				}else{
					$wrap.css("padding", h + "px 0 0").css({width : w, top : pos.top , left : pos.left + scrollLeft});
				}
			});

			$opts.click(function(){
				$opts.removeClass(o.curClass);
				$(this).addClass(o.curClass);
				$valTxt.text($(this).text());
				$wrap.css({top : "-9999px", left : "-9999px"});
			}).hover(
				function(){$(this).addClass(o.hoverClass);},
				function(){$(this).removeClass(o.hoverClass);}
			);
		});
	}
	
	//tab
	$.fn.tabs = function(o){
	var o = $.extend({meth:"hover"}, o||{})
	return this.each(function(){
		var $menu = $(this).find(".tab-menu").children("li"), $cont = $(this).find(".tab-cont").children(".cont");
		$menu.each(function(i){
			if(o.meth == "click"){
				$(this).click(function(){ toggle(i) });				
			}else if(o.meth == "hover"){
				$(this).hover(function(){ toggle(i) });
			}
		});
		function toggle(i){
			$menu.removeClass("hover");
			$menu.eq(i).addClass("hover");
			$cont.removeClass("hover");
			$cont.eq(i).addClass("hover");
		}
	});
	}//tabEND

	$.fn.pcont = function(o){
		var o = $.extend({
			snum:5,
			pause:5000,
			spd:300,
			fspd:500,
			auto:true,
			isH:true
		}, o||{});
		
		return this.each(function(){
			var $sprev = $(".sprev", this), $snext = $(".snext", this),
			$nav = $(".nav .nav-wrap", this),
			$cont = $(".cont a", this),
			woh = o.isH ? "width" : "height",
			$nava = $nav.children("a"), len = $nava.length, aSize = o.isH ? $nava.outerWidth(true) : $nava.outerHeight(true), navbS = o.snum*aSize;
			
			$nav.css(woh, len*aSize), $(".pc-nav .nav-box", this).css(woh, navbS);
			var index = 0, interval = null, cml, before = 0;
			$sprev.click(function(){
				if($nav.is(":animated")){return false;};
				cml = Math.abs(parseFloat($nav.css(o.isH ? "marginLeft" : "marginTop")));
				if(cml >= navbS){
					$nav.animate(o.isH ? {"marginLeft": "+="+navbS} : {"marginTop": "+="+navbS}, o.spd);
				}
				return false;
			});
			$snext.click(function(){
				if($nav.is(":animated")){return false;};
				cml = Math.abs(parseFloat($nav.css(o.isH ? "marginLeft" : "marginTop")));
				if(cml < len*aSize - navbS && len > o.snum){
					$nav.animate(o.isH ? {"marginLeft": "-="+navbS} : {"marginTop": "-="+navbS}, o.spd);					
				}
				return false;
			});
			$nava.each(function(i){
				$(this).click(function(){
					roll(i);
					return false;
				});
			});
			$(this).hover(
				function(){clearInterval(interval);},
				function(){auto();}
			);
			function auto(){
				interval = setInterval(function(){ roll(index==(len-1) ? 0 : (index+1))}, o.pause);
			}
			function roll(i){
				$nav.animate(o.isH ? {"marginLeft": "-"+ parseInt(i/o.snum) * navbS} : {"marginTop": "-"+ parseInt(i/o.snum) * navbS}, o.spd);
				$nava.eq(index).removeClass("now");
				$nava.eq(i).addClass("now");
				$cont.hide();
				$cont.eq(index).removeClass("now").show().children("img").removeAttr("style");
				$cont.eq(i).addClass("now").show().children("img").css("opacity", 0).fadeTo(o.fspd, 1);
				index = i;
			}
			/*init*/
			if(o.auto){ auto(); }
			$nava.eq(index).addClass("now");
			$cont.eq(index).addClass("now");
		});
	};
	
	$.fn.picshow = function(o){
		var o = $.extend({
			 pause:5000,
			 fspd:500,
			 auto:true
		}, o||{});
		return this.each(function(){
			var $cont = $(".ps-cont > a", this), $title = $(".ps-title > h3", this), $nav = $(".ps-nav > a", this),
			len = $cont.length;
			var interval = null, index = 0, isOver = true;
			if(o.auto){$cont.hover(function(){clearInterval(interval);}, auto);}
			if(o.auto){
				$nav.each(function(i){
					$(this).hover(function(){
						clearInterval(interval);
						roll(i);
					}, auto);
				});
			}else{
				$nav.each(function(i){
					$(this).hover(function(){roll(i);});
				});
			}
			
			function auto(){
				clearInterval(interval);
				interval = setInterval(function(){ roll(index==(len-1) ? 0 : index+1);}, o.pause);
			}
			function roll(i){
				if(isOver){
					isOver = false;
					$cont.hide();
					$cont.eq(i).fadeIn(o.fspd, function(){ isOver = true; });
					$nav.removeClass("hover");
					$nav.eq(i).addClass("hover");
					$title.hide();
					$title.eq(i).show()
					index = i;
				}
			}
			//init
			$cont.eq(index).show();
			$nav.eq(index).addClass("hover");
			if(o.auto){auto();}
		});
	}	
	
})(jQuery);

function setCurLoc(obj, extPath){
	var $obj = $(obj), $obj_li = $("li", $obj), extPath = extPath || "/";
	var href = window.location.href, http_hostname = "http://" + window.location.hostname, http_host = "http://" + window.location.host;
	if(href == http_hostname || href == http_hostname + extPath || href == http_host || href == http_host + extPath){
		$obj_li.each(function(){
			var a_href = $(this).children("a").attr("href");
			if(a_href == http_hostname || a_href == http_host || a_href == extPath){
	 			$(this).addClass("cur").children("a").addClass("cur");
				return false;
			}
		});
		return true;
	}
	$obj_li.each(function(){
		var a_href = $(this).children("a").attr("href");
		if(href.indexOf(a_href) > -1 && a_href != "/" && a_href != extPath){
	 		$(this).addClass("cur").children("a").addClass("cur");
			return false;
		}
	});
}


function adFix(obj, space){
	var $obj = $(obj), oh = $obj.height(), ow = $obj.width(), ot = parseInt($obj.css("top")), ww;
	function posX(){
		ww = $(window).width();
		if( ww < (space+2*ow)){
			$obj.eq(0).hide();
			$obj.eq(1).css({"left":(ww-ow)});
		}else{
			$obj.eq(0).hide();
			$obj.eq(1).css({"left":((ww-space)/2+space)});
		}
	}
	function posY(){
		var otop = ot + $(document).scrollTop();
		$obj.animate({top:otop},{duration:800,queue:false});
	}
	$obj.find('.close').click(function(){
		$obj.hide();
		return false;
	});
	$(window).resize(posX);
	$(window).scroll(posY);
	posX();
	posY();
}
adFix(".ad-double", 970);

function popBox(id, obj){
	var $box = $(id), $close = $(".close", $box);
	$box.show();
	var dw = $(document).width(), dh = $(document).height(), bw=$box.outerWidth(), bh=$box.outerHeight(),
	ttop=Math.round(($(window).height()-bh)/2 + document.documentElement.scrollTop), 
	tleft = Math.round((dw-bw)/2);
	var $bg = $("<div></div>").addClass("pop-bg").insertBefore(id).css({width:dw, height:dh});
	var $ifr = $(".pop-ifr").show().css({width:bw, height:bh, top:ttop, left:tleft});
	$box.css({top:ttop, left:tleft});
	$close.click(function(){
		$box.hide();
		$bg.remove();
		$ifr.hide();
		return false;
	});
	$(document).click(function(e){
		var e = e || window.event, t = obj;
		var targ = e.target || e.srcElement;
		if( !$(targ).parents().is(".mod-pop") && targ.nodeName != "A" ){
			$box.hide();
			$bg.remove();
			$ifr.hide();
		}
	});
}



$(function(){
	var $phdCurLi;
	setCurLoc("#pbdNav", "/");
	
	
	$("form.search").FA_searchBar({val:"请输入关键字"});
	$("div.xglink").FA_select();

	if($.browser.msie && $.browser.version <= 6){document.execCommand("BackgroundImageCache", false, true);}
	
	$("#phdNav > li").hover(function(){
		$(this).addClass("hover");
	}, function(){
		$(this).removeClass("hover");
	});	
	
});

