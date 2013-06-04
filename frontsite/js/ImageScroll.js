/**
 * @fileOverview 文字滚动
 * @copyright (c) 2009 (jrj.com)
 * @author jianjun.wang@jrj.com.cn
 * @date  2010.04.27
 * @version 1.0
 * @depend jquery
 */
if(typeof JRJ=="undefined" || !JRJ){
	var JRJ = {};
}
if(typeof JRJ.ui=="undefined" || !JRJ.ui){
	JRJ.ui = {};
}

(function($){
	/**
	 * 图片滚动
	 * @class 图片滚动
	 * @link <a target="_blank" href="../../src-new/ui/ImageScroll/example.html">例子</a>
	 * @param {string} container 滚动容器id
	 * @param {object} config 配置参数
	    {<br/>
	      delay:(int)滚动间隔，默认为2，单位秒<br/>
				speed:(int)滚动速度，默认为20，单位毫秒,<br/>
				startDelay:(int)启动延时，默认为2，单位秒,<br/>
				autoStart:(boolean)自动滚动，默认为true,<br/>
				direction:(h/v)，h为水平，v为垂直,<br/>
				distance:(int)滚动距离，默认为“auto”，每次滚动一个li可以默认，默认为“auto”时li不要设margin,<br/>
				scrollItemCount:(int)一次滚动的li数量，默认为1,<br/>
				rightBtn:(string)左侧按钮id,<br/>
				leftBtn:(string)右侧按钮id,<br/>
				onScroll:(function)一次滚动完毕触发的函数,<br/>
	   }
	 */
	JRJ.ui.ImageScroll = function(container,config){
		this.config={
    	delay : 2 , /* 滚动间隔(s) */
    	speed : 20 , /* 滚动速度(ms)，频率 */
    	startDelay : 2 , 
    	direction : 'h',	/* 'horizontal(h)' or 'vertical(v)'. defaults to h . */	
    	autoPlay : true, 
    	distance : "auto",
    	scrollItemCount : 1 ,/* 一次滚动的li数量 */
    	rightBtn : null,
    	leftBtn : null
		}
		$.extend(this.config,config||{});
		
		this.init(container);
	}
	JRJ.ui.ImageScroll.prototype={
		/**
		 * @ignore		
		 */
		init:function(container){			
			this.container = $("#" + container)[0];
		  this.scroller = $(this.container).find("ul")[0];
			this.step = 2; /* px */
			var config = this.config;
			if (config.speed < 20) {
				this.step = 5;
			}
			
			this.scrollTimer = null , this.startTimer = null , this.startDelayTimer = null;
			this.isHorizontal = ( this.config.direction == "h" );
			
			this._distance = 0; /* 已滚动距离 */			
			this.scrollable = true; /* 是否还可以滚动 */			
			this.distance = config.distance; /* 本次预计滚动的距离 */
			this.suspend = false;  /* 鼠标移动上去时暂停 */
			this.paused = false; 
						
			$(this.container).bind("mouseover",{obj:this},function(event){
				event.data.obj.suspend = true;
			});

			$(this.container).bind("mouseout",{obj:this},function(event){
				event.data.obj.suspend = false;
			});
			
			if(config.leftBtn && config.rightBtn){
				var leftBtn = $("#"+config.leftBtn);
				var rightBtn = $("#"+config.rightBtn);
				leftBtn.bind("mouseover",{obj:this},function(event){
					event.data.obj.pause();
				});
				leftBtn.bind("mouseout",{obj:this},function(event){
					event.data.obj.play();
				});
				leftBtn.bind("click",{obj:this},function(event){
					event.data.obj.next();
				});
				rightBtn.bind("mouseover",{obj:this},function(event){
					event.data.obj.pause();
				});
				rightBtn.bind("mouseout",{obj:this},function(event){
					event.data.obj.play();
				});
				rightBtn.bind("click",{obj:this},function(event){
					event.data.obj.previous();
				});
			}
			
			this._isScrollable();//图片没加载完，第一张图片没有滚动效果
			if(config.autoPlay){
				var instance = this;	
				instance.startDelayTimer = setTimeout(function(){instance.play();},instance.config.startDelay*1000);
			}
		},
		/**
		 * 开始滚动		
		 */
    play : function(){
    	var instance = this;
    	if(!instance.config.autoPlay){ return ; }//解决autoPlay==false，点按钮后自动滚动问题。
    	instance.paused = false;	
	  	if(instance.startDelayTimer){ clearTimeout(instance.startDelayTimer); }
	  	//已经在执行scroll，直接返回即可
	  	if(instance.scrollTimer){ return ;}
	  	if(!instance.startTimer){		
	  		instance.startTimer = setTimeout(function(){instance.start();},instance.config.delay*1000);
	  	}
	  },
	  /**
		 * 暂停滚动	
		 */
	  pause : function(){
	  	this.paused = true;
	  },
	  /**
		 * @ignore		
		 */
	  start:function(){
	  	var instance = this;
	  	this.startTimer = null;
	  	if(instance.paused){ return ; }
	  	instance._distance=0;
	    instance.scrollTimer = setInterval(function(){instance.scroll();},instance.config.speed);
		},
		/**
		 * @ignore		
		 */
		_isScrollable : function(){
			var curLi = $(this.scroller).find("li")[0];
		  if(!curLi){this.scrollable = false; return;}
		  
      this.distance = this.config.distance == "auto" ? curLi[this.isHorizontal?"offsetWidth":"offsetHeight"] : this.config.distance;
		  with(this.scroller){
		  	//console.log(scrollWidth+","+scrollLeft+","+this.container.offsetWidth+","+this.distance);
		  	//console.log(scrollHeight+","+scrollTop+","+this.container.offsetHeight+","+this.distance);
		  	if(this.isHorizontal)
		  		this.scrollable = (scrollWidth-scrollLeft-this.container.offsetWidth)>=this.distance;
		  	else		  		
		  		this.scrollable = (scrollHeight-scrollTop-this.container.offsetHeight)>=this.distance;
		  }
		},
		/**
		 * @ignore		
		 */
		_onScroll : function(){			
			for (var i = 0; i < this.config.scrollItemCount; i++) {
				this.scroller.appendChild(this.scroller.getElementsByTagName('li')[0]);
			}
			this.container[this.isHorizontal?'scrollLeft':'scrollTop'] = 0;
			if(this.config.onScroll){
				this.config.onScroll(1);
			}
			this._isScrollable();
		},
		/**
		 * @ignore		
		 */
		scroll:function(){
			if(this.suspend){return ;}
			this._distance += this.step;
			
			var d;
			if( ( d = this._distance % this.distance ) < this.step ){
				this.container[this.isHorizontal?'scrollLeft':'scrollTop'] += (this.step - d);//校正滚动
				clearInterval(this.scrollTimer);
				this.scrollTimer = null;
				this._onScroll();
				if(this.scrollable && !this.paused) this.play();
			}else{				
				this.container[this.isHorizontal?'scrollLeft':'scrollTop'] += this.step;
			}
		},
	  /**
		 * @ignore		
		 */
		previous:function(){
			var $scroller = $(this.scroller);
	  	var scroller = $scroller[0];	  	
			for (var i = 0; i < this.config.scrollItemCount; i++) {
				var lis = $scroller.find("li");			
				scroller.insertBefore(lis[lis.length-1],lis[0]);				
			}
			this.container[this.isHorizontal?'scrollLeft':'scrollTop'] = 0;
			if(this.config.onScroll){
				this.config.onScroll(-1);
			}
		},
		/**
		 * @ignore		
		 */
		next:function(){
	  	this.container[this.isHorizontal?'scrollLeft':'scrollTop'] += this.distance;
	  	this._onScroll();
	  	//var instance = this;
	  	//instance.scrollTimer = setInterval(function(){instance.scroll();},instance.config.speed);
		}
	}		
})(jQuery);

