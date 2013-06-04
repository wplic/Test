//ajax 刷新单向模式页面
function refreshT(stock_code,pageNumber)  //刷新委托交易
{
	var url="/nxsyBSAction.do?method=listBSEntrust&fresh_type=1";
	url = url + "&stock_code=" + stock_code;
	//url = url + "&entrust_bs=" + entrust_bs;
	url = url + "&pageNumber=" + pageNumber;
	url = url + "&rdnum=" + Math.random();  //添加随机数，避免ie缓存
	var xmlhttp;
	if (window.XMLHttpRequest)
	{// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp=new XMLHttpRequest();
	}
	else
	{// code for IE6, IE5
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  	}
	xmlhttp.onreadystatechange=function()
	{
		if(xmlhttp.readyState==4 && xmlhttp.status==200)
		{
			document.getElementById("bsEntrust").innerHTML=xmlhttp.responseText;
			var str = "";			
			var stock_code = JQ("#stock_code").val();		
			if(stock_code == 1001) {						
				str = JQ("#min_entrust_price_Rose").val() + "--" + JQ("#max_entrust_price_Rose").val();
				JQ("#price_scope").text(str);
			}
			if(stock_code == 1002) {
				str = JQ("#min_entrust_price_Drop").val() + "--" + JQ("#max_entrust_price_Drop").val();			
				JQ("#price_scope").text(str);
			}
			str = JQ("#canuse_balance2").val();
			JQ("#max_amount").text(str);
			var div1001 = document.getElementById('sell_1001');
			div1001.scrollTop = div1001.scrollHeight;
			var div1002 = document.getElementById('sell_1002');
			div1002.scrollTop = div1002.scrollHeight;
		}
	}
	xmlhttp.open("GET",url,true);
	xmlhttp.send();
		
	
	//alert("dfsdf");
}

//ajax 刷新套利模式页面
function refreshDT(stock_code,pageNumber)  //刷新委托交易
{
	var url="/nxsyBSAction.do?method=listDoublebsEntrust&fresh_type=1";
	url = url + "&stock_code=" + stock_code;
	//url = url + "&entrust_bs=" + entrust_bs;
	url = url + "&pageNumber=" + pageNumber;
	url = url + "&rdnum=" + Math.random();  //添加随机数，避免ie缓存
	var xmlhttp;
	if (window.XMLHttpRequest)
	{// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp=new XMLHttpRequest();
	}
	else
	{// code for IE6, IE5
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  	}
	xmlhttp.onreadystatechange=function()
	{
		if(xmlhttp.readyState==4 && xmlhttp.status==200)
		{
			document.getElementById("DoublebsEntrust").innerHTML=xmlhttp.responseText;
			var str = "";
			var strRose = "";		
			var strDrop = "";						
			strRose = JQ("#min_entrust_price_Rose").val() + "--" + JQ("#max_entrust_price_Rose").val();
			JQ("#price_scope_rose").text(strRose);				
			strDrop = JQ("#min_entrust_price_Drop").val() + "--" + JQ("#max_entrust_price_Drop").val();			
			JQ("#price_scope_drop").text(strDrop);
			
			str = JQ("#canuse_balance2").val();
			JQ("#max_amount").text(str);
			
			var div1001 = document.getElementById('sell_1001');
			div1001.scrollTop = div1001.scrollHeight;
			var div1002 = document.getElementById('sell_1002');
			div1002.scrollTop = div1002.scrollHeight;
		}
	}
	xmlhttp.open("GET",url,true);
	xmlhttp.send();
	//alert("dfsdf");
}

function refreshH() //刷新我的持仓
{
	var url="/nxsyQueryAction.do?method=listStockHold&fresh_type=1&rdnum=" + Math.random();
	var xmlhttp;
	if (window.XMLHttpRequest)
	{// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp=new XMLHttpRequest();
	}
	else
	{// code for IE6, IE5
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange=function()
	{
		if (xmlhttp.readyState==4 && xmlhttp.status==200)
		{
			document.getElementById("contentBox").innerHTML=xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET",url,true);
	xmlhttp.send();
}
	