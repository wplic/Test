	var delta=0.08
	var collection;
	function floaters() {
		this.items	= [];
		this.addItem	= function(id,x,y,content)
				  {
					document.write('<DIV id='+id+' style="Z-INDEX: 10; POSITION: absolute;  width:80px; height:60px;left:'+(typeof(x)=='string'?eval(x):x)+';top:'+(typeof(y)=='string'?eval(y):y)+'">'+content+'</DIV>');
					
					var newItem				= {};
					newItem.object			= document.getElementById(id);
					newItem.x				= x;
					newItem.y				= y;

					this.items[this.items.length]		= newItem;
				  }
		this.play	= function()
				  {
					collection				= this.items
					setInterval('play()',10);
				  }
		}
		function play()
		{

			for(var i=0;i<collection.length;i++)
			{
				var followObj		= collection[i].object;
				var followObj_x		= (typeof(collection[i].x)=='string'?eval(collection[i].x):collection[i].x);
				var followObj_y		= (typeof(collection[i].y)=='string'?eval(collection[i].y):collection[i].y);

				if(followObj.offsetLeft!=(document.body.scrollLeft+followObj_x)) {
					var dx=(document.body.scrollLeft+followObj_x-followObj.offsetLeft)*delta;
					dx=(dx>0?1:-1)*Math.ceil(Math.abs(dx));
					followObj.style.left=followObj.offsetLeft+dx;
					}

				if(followObj.offsetTop!=(document.body.scrollTop+followObj_y)) {
					var dy=(document.body.scrollTop+followObj_y-followObj.offsetTop)*delta;
					dy=(dy>0?1:-1)*Math.ceil(Math.abs(dy));
					followObj.style.top=followObj.offsetTop+dy;
					}
				followObj.style.display	= '';
			}
		}	
		
	var theFloaters		= new floaters();
	//
	if(null!=url1 && url1.length>0 && null!=pic1 && pic1.length>0){
	    url1 = "http://"+url1;
		theFloaters.addItem('followDiv1',6,0,'<a href='+url1+' target="_blank"><img src='+pic1+' border="0" width="100" height="180"></a>');
	    theFloaters.play();
	}
	//
	if(null!=url2 && url2.length>0 && null!=pic2 && pic2.length>0){
	    url2 = "http://"+url2;
		theFloaters.addItem('followDiv2','document.body.clientWidth-110',0,'<a href='+url2+' target="_blank"><img src='+pic2+' border="0" width="100" height="180"></a>');
		theFloaters.play();
	}
	//
	if(null!=url3 && url3.length>0 && null!=pic3 && pic3.length>0){
	    url3 = "http://"+url3;
		theFloaters.addItem('followDiv3',6,200,'<a href='+url3+' target="_blank"><img src='+pic3+' border="0" width="100" height="180"></a>');
	    theFloaters.play();
	}
	//
	if(null!=url4 && url4.length>0 && null!=pic4 && pic4.length>0){
	    url4 = "http://"+url4;
		theFloaters.addItem('followDiv4','document.body.clientWidth-110',200,'<a href='+url4+' target="_blank"><img src='+pic4+' border="0" width="100" height="180"></a>');
		theFloaters.play();
	}
	//
	if(null!=url5 && url5.length>0 && null!=pic5 && pic5.length>0){
	    url5 = "http://"+url5;
		theFloaters.addItem('followDiv5',6,400,'<a href='+url5+' target="_blank"><img src='+pic5+' border="0" width="100" height="180"></a>');
	    theFloaters.play();
	}
	//
	if(null!=url6 && url6.length>0 && null!=pic6 && pic6.length>0){
	    url6 = "http://"+url6;
		theFloaters.addItem('followDiv6','document.body.clientWidth-110',400,'<a href='+url6+' target="_blank"><img src='+pic6+' border="0" width="100" height="180"></a>');
		theFloaters.play();
	}
	
//图片用法
//<a href=http://www.makewing.com/lanren/ target=_blank><img src=images/ad_100x300.jpg border=0></a>
//flash用法
//<EMBED src=images/duilian.swf quality=high  WIDTH=100 HEIGHT=300 TYPE=application/x-shockwave-flash id=ad wmode=opaque></EMBED>
	