<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="${ctx }/match/nxsy/login_ok.jsp"></jsp:include>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<style>
.top-white {
	background:
		url("${ctx }/match/nxsy/mncg/skin/default/pic/box-top-white.png")
		no-repeat scroll center top transparent;
	height: 4px;
	margin-left: 10px;
	margin-right: 10px;
	overflow: hidden;
	width: 100%;
}

.bottom1 {
	background:
		url("${ctx }/match/nxsy/mncg/skin/default/pic/box-bottom.png")
		no-repeat scroll 0 0 transparent;
	height: 4px;
	margin-left: 10px;
	margin-right: 10px;
	overflow: hidden;
	width: 100%;
}


#Loading {
	position: absolute;
	z-index: 111;
	border: 1px solid #C6C7CB;
	background-color: #FFFFFF;
	height: 299px;
	width: 514px;
}
</style>
		<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
		<META HTTP-EQUIV="pragma" CONTENT="no-cache">
		<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
		<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">
		<link href="${ctx }/match/nxsy/mncg/skin/default/css/global.css"
			rel="stylesheet" type="text/css">
		<link rel="stylesheet" type="text/css"
			href="${ctx }/infoCenter/goldmoney/css/inner.css" media="all" />
		<link href="${ctx }/match/nxsy/mncg/skin/default/css/font.css"
			rel="stylesheet" type="text/css">

		<script src="${ctx }/match/nxsy/mncg/js/jquery-1.3.2.js"
			type="text/javascript"></script>
		<script type="text/javascript"
			src="${ctx }/match/nxsy/mncg/js/commons.js"></script>
		<script type="text/javascript"
			src="${ctx }/match/nxsy/mncg/js/fresh.js"></script>
		<script src="${ctx }/match/nxsy/mncg/js/page.js"
			type="text/javascript"></script>
		<script language="javascript">
	function dotest()
	{
		var div = document.getElementById('sell_1001');
		alert(div.scrollHeight);
		div.scrollTop = div.scrollHeight;
		
	}
	var JQ = jQuery.noConflict();
	function radio_click(stock_code, remain_amount, entrust_price,trade_dir) {		
		JQ("#stock_code").val(stock_code);
		var str = "";
		
		if(stock_code == 1001) {						
			str = JQ("#min_entrust_price_Rose").val() + "--" + JQ("#max_entrust_price_Rose").val();
			JQ("#price_scope").text(str);
		}
		if(stock_code == 1002) {
			str = JQ("#min_entrust_price_Drop").val() + "--" + JQ("#max_entrust_price_Drop").val();			
			JQ("#price_scope").text(str);
		}
		
		if(trade_dir == 1) {
			JQ("#trade_dir").val("trade_in");
		}		
		if(trade_dir == 2) {
			JQ("#trade_dir").val("trade_out");
		}		
		JQ("#entrust_price").val(entrust_price);
			
		//计算最大可买
		var canuse_balance = JQ("#canuse_balance").val();
		var max_amount = Math.floor(canuse_balance / entrust_price / 1000) * 1000;
		if(parseFloat(max_amount) < parseFloat(remain_amount))
		{
			JQ("#entrust_amount").val(max_amount);
		}	
		else
		{
			JQ("#entrust_amount").val(remain_amount);
		}	
		JQ("#max_amount").text(max_amount);
		change_dir();
	}
	
	
	//当下拉框的股票名称发生变化
	function change_stock() {		
		var stock_code = JQ("#stock_code").val();			
		if(stock_code == "")
		{
			return;
		}
		refreshT(stock_code,0);	
		change_dir();
	}	
	
	//当下拉框的交易方向发生变化
	function change_dir() {
		var trade_dir = JQ("#trade_dir").val();	
		var stock_code = JQ("#stock_code").val();
		var max_amount;
		//转入
		if(trade_dir == "trade_in")
		{
			JQ("#max_amount_title").html("最大可买：");
			JQ("#entrust_amount_title").html("买入数量：");
			checkPrice();
		}
		//转出
		else
		{
			JQ("#max_amount_title").html("最大可卖：");
			JQ("#entrust_amount_title").html("卖出数量：");
			var tmp_entrust_amount = JQ("#entrust_amount").val();
			if(stock_code == "1001")
			{
				max_amount = JQ("#canuse_balance_1001").val();
				JQ("#max_amount").text(max_amount);	
			}
			else if(stock_code = "1002")
			{
				max_amount = JQ("#canuse_balance_1002").val();
				JQ("#max_amount").text(max_amount);	
			}
			if(tmp_entrust_amount != "")
			{
				if(parseFloat(max_amount)< parseFloat(tmp_entrust_amount))
				{
					JQ("#entrust_amount").val(max_amount);
				}	
			}
		}
	}	
		
	//查看委托价格是否合法
	function checkPrice()
	{
		chgPrice();
		var entrust_price = JQ("#entrust_price").val();
		var trade_dir = JQ("#trade_dir").val();	
		if(entrust_price == "" && trade_dir == "trade_in")
		{
			JQ("#max_amount").text("----");	
			return;
		}
		var min_entrust_price = "";
		var max_entrust_price = "";
		if(JQ("#stock_code").val() == 1001) {			
			min_entrust_price = JQ("#min_entrust_price_Rose").val();
			max_entrust_price = JQ("#max_entrust_price_Rose").val();
		} 
		if(JQ("#stock_code").val() == 1002) {			
			min_entrust_price = JQ("#min_entrust_price_Drop").val();
			max_entrust_price = JQ("#max_entrust_price_Drop").val();
		} 
		if(isNaN(entrust_price))
		{
			alert("委托价格必须为数字！");
			JQ("#entrust_price").val(min_entrust_price);
			return false;
		}		
		entrust_price = parseFloat(entrust_price);
		max_entrust_price = parseFloat(max_entrust_price);
		min_entrust_price = parseFloat(min_entrust_price);
		if(entrust_price > max_entrust_price || entrust_price < min_entrust_price)
		{
			alert("委托价格不在允许范围内！");
			return false;
		}
		//转入
		if(trade_dir == "trade_in"){
			var canuse_balance = JQ("#canuse_balance").val();
			var max_amount = Math.floor(canuse_balance / entrust_price / 1000) * 1000;
			JQ("#max_amount").text(max_amount);
		}
		return true;
	}
	function toPage(page) {
		document.getElementById("pageNumber").value=page;		
		var stock_code = JQ("#stock_code").val();
		if(stock_code == "")
		{
			alert("请选择股票代码！");
			return;
		}
		refreshT(stock_code,'2',page);
	}
	function refresh_wt(type)
	{
		var stock_code = JQ("#stock_code").val();
		if(type =='0')
		{
			if(stock_code == "")
			{
				alert("请选择股票代码！");
				return;
			}
		}
		else
		{
			stock_code = '0';	
		}
		refreshT(stock_code,0);
	}
	function checkPage(totalPages)
	{
		//var totalPages = ${page.totalPages};
	    if(document.getElementById("jump").value > totalPages) {
	      	alert("您输入的页码超出范围，请重新输入！");
	        document.getElementById("jump").focus();
	        return false;
		} 
	    else if(document.getElementById("jump").value < 1) {
	     	alert("您输入的页码超出范围，请重新输入！");
	        document.getElementById("jump").focus();
	        return false;
	 	} 
	    else 
	    {
	    	toPage(document.getElementById("jump").value);
	    }
	}
	function doreset()
	{		
		JQ("#entrust_price").val("");
		JQ("#entrust_amount").val("");
		JQ("input:radio[name='sradio']").attr("checked",false);
	}
	//提交表单
	function dosubmit()
	{
		
		var strMsg = "";
		strMsg += checkValid("stock_code", "股票名称", "NotEmpty");
		strMsg += checkValid("entrust_price", "委托价格", "NotEmpty");
		strMsg += checkValid("entrust_amount", "委托数量", "NotEmpty");
		strMsg += checkValid("client_id", "客户编号", "NotEmpty");
		strMsg += checkValid("entrust_price", "委托价格", "NumberFloat");
		strMsg += checkValid("entrust_amount", "委托数量", "Numeric");
		if(strMsg != "")
		{
			alert(strMsg);
			return;
		}
		//查看委托价格是否合法
		var entrust_price = JQ("#entrust_price").val();
		var min_entrust_price = "";
		var max_entrust_price = "";
		var stock_name = "";
		if(JQ("#stock_code").val() == 1001) {			
			min_entrust_price = JQ("#min_entrust_price_Rose").val();
			max_entrust_price = JQ("#max_entrust_price_Rose").val();
			stock_name = "看涨股份";
		} 
		if(JQ("#stock_code").val() == 1002) {			
			min_entrust_price = JQ("#min_entrust_price_Drop").val();
			max_entrust_price = JQ("#max_entrust_price_Drop").val();
			stock_name = "看跌股份";
		}
		entrust_price = parseFloat(entrust_price);
		max_entrust_price = parseFloat(max_entrust_price);
		min_entrust_price = parseFloat(min_entrust_price);
		if(entrust_price > max_entrust_price || entrust_price < min_entrust_price)
		{
			alert("委托价格不在允许范围内！");
			return;
		}
		var valid_price = 0;
		var one_price = 0;
		if(JQ("#stock_code").val() == 1001 && JQ("#trade_dir").val() == "trade_in" ) {
			valid_price = parseFloat(JQ("#valid_entrust_1001_buy").val());
			one_price = parseFloat(JQ("#one_entrust_1001_sell").val());
			if(entrust_price  > valid_price && entrust_price > one_price)
			{
				alert("该委托价格可能会造成您资金账户的不必要损失，请重新检查委托价格!");
				return;
			}
		}
		
		if(JQ("#stock_code").val() == 1001 && JQ("#trade_dir").val() == "trade_out" ) {
			valid_price = parseFloat(JQ("#valid_entrust_1001_sell").val());
			one_price = parseFloat(JQ("#one_entrust_1001_buy").val());
			if(entrust_price  < valid_price && entrust_price < one_price)
			{
				alert("该委托价格可能会造成您资金账户的不必要损失，请重新检查委托价格!");	
				return;
			}
		}
		
		if(JQ("#stock_code").val() == 1002 && JQ("#trade_dir").val() == "trade_in" ) {
			valid_price = parseFloat(JQ("#valid_entrust_1002_buy").val());
			one_price = parseFloat(JQ("#one_entrust_1002_sell").val());
			if(entrust_price  > valid_price && entrust_price > one_price)
			{
				alert("该委托价格可能会造成您资金账户的不必要损失，请重新检查委托价格!");	
				return;
			}
		}
		
		if(JQ("#stock_code").val() == 1002 && JQ("#trade_dir").val() == "trade_out" ) {
			valid_price = parseFloat(JQ("#valid_entrust_1001_sell").val());
			one_price = parseFloat(JQ("#one_entrust_1002_buy").val());
			if(entrust_price  < valid_price && entrust_price < one_price)
			{
				alert("该委托价格可能会造成您资金账户的不必要损失，请重新检查委托价格!");	
				return;
			}
		}
		
		
		//查看委托数量是否合法
		var entrust_amount = JQ("#entrust_amount").val();
		if(entrust_amount  == 0)
		{
			alert("委托数量不得为0!");
			return;
		}
		if((entrust_amount % 1000) != 0)
		{
			alert("委托数量必须为1000的整数倍!");
			return;
		}
		entrust_amount =  parseFloat(entrust_amount);
		var canuse_balance = JQ("#canuse_balance").val();
		var max_amount = 0;
		if(JQ("#trade_dir").val() == "trade_in")
		{
			max_amount = Math.floor(canuse_balance / entrust_price / 1000) * 1000;
		}
		else
		{
			max_amount = JQ("#max_amount").text();
			max_amount = Math.floor(JQ("#max_amount").text());
		}	
		if(entrust_amount > max_amount)
		{
			alert("超过了最大允许委托数量!");
			return;
		}
		var msg = "";
		if(JQ("#trade_dir").val() == "trade_in")
		{
			msg = "买入" + stock_name + entrust_amount + "股，委托价格：" + entrust_price + "元\r\n\r\n";
		}
		else if(JQ("#trade_dir").val() == "trade_out")
		{
			msg = "卖出" + stock_name + entrust_amount + "股，委托价格：" + entrust_price + "元\r\n\r\n";
		}
		if(!confirm(msg + "            确定交易?")){
			 return;
		};
		JQ("#buyForm").submit();		
	}
	function chgPrice()
	{		
		var entrust_price = JQ("#entrust_price").val().trim();
		if(isNaN(entrust_price) || isEmpty(entrust_price))
		{
			return;
		}
		entrust_price = Math.round(entrust_price * 1000) / 1000;
		JQ("#entrust_price").val(entrust_price);		
	}
	
//可拖动的计算器
function drag(o,subo,s)  
{  
   if (typeof o == "string") o = document.getElementById(o);  
   if (typeof subo == "string") subo = document.getElementById(subo);  
   //o.orig_x = parseInt(o.style.left) - document.body.scrollLeft;  
   //o.orig_y = parseInt(o.style.top) - document.body.scrollTop;  
   //o.orig_index = o.style.zIndex;  
    subo.orig_x = parseInt(subo.style.left) - document.body.scrollLeft;  
   subo.orig_y = parseInt(subo.style.top) - document.body.scrollTop;  
   subo.orig_index = subo.style.zIndex;      
   o.onmousedown = function(a)  
   {  
      // o.style.cursor = "move";  
       subo.style.zIndex = 10000;  
       //this.style.zIndex = 10000;  
       var d=document;  
       if(!a)a=window.event;  
       //var x = a.clientX+d.body.scrollLeft-o.offsetLeft;  
       //var y = a.clientY+d.body.scrollTop-o.offsetTop;  
        var x = a.clientX+d.body.scrollLeft-subo.offsetLeft;  
       var y = a.clientY+d.body.scrollTop-subo.offsetTop; 
       //author: www.longbill.cn  
       d.ondragstart = "return false;"  
       d.onselectstart = "return false;"  
       d.onselect = "document.selection.empty();"  
                 
       if(o.setCapture)  
           o.setCapture();  
       else if(window.captureEvents)  
           window.captureEvents(Event.MOUSEMOVE|Event.MOUSEUP);  

       d.onmousemove = function(a)  
       {  
           if(!a)a=window.event;  
           subo.style.left = a.clientX+document.body.scrollLeft-x;  
           subo.style.top = a.clientY+document.body.scrollTop-y;  
           subo.orig_x = parseInt(subo.style.left) - document.body.scrollLeft;  
          subo.orig_y = parseInt(subo.style.top) - document.body.scrollTop;  
          
       }  

       d.onmouseup = function()  
       {  
           if(o.releaseCapture)  
               o.releaseCapture();  
           else if(window.captureEvents)  
               window.captureEvents(Event.MOUSEMOVE|Event.MOUSEUP);  
           d.onmousemove = null;  
           d.onmouseup = null;  
           d.ondragstart = null;  
           d.onselectstart = null;  
           d.onselect = null;  
           o.style.cursor = "normal";  
           subo.style.cursor = "normal";  
           subo.style.zIndex = o.orig_index;  
       }
         
   }  
   if (s)  
   {  
       var orig_scroll = window.onscroll?window.onscroll:function (){};  
       window.onscroll = function ()  
       {  
           orig_scroll();  
           subo.style.left = subo.orig_x + document.body.scrollLeft;  
           subo.style.top = subo.orig_y + document.body.scrollTop;  
       }  
   }  
} 	
//浮动计算机
	function $d(id) {
	return document.getElementById(id);
}
var OverH, OverW, Title, Context, ChangeH = 50, ChangeW = 50;

function OpenDiv(_Dw, _Dh, _Title, _Context) {
	$d("title").innerHTML = "";
	OverH = _Dh;
	OverW = _Dw;
	Title = _Title;
	Context = _Context;
	$d("Loading").style.display = '';
	if (_Dw > _Dh) {
		ChangeH = Math.ceil((_Dh - 10) / ((_Dw - 10) / 50))
	} else if (_Dw < _Dh) {
		ChangeW = Math.ceil((_Dw - 10) / ((_Dh - 10) / 50))
	}
	
	OpenNow();
	
}
var Nw = 10, Nh = 10;
function OpenNow() {
	
	if (Nw > OverW - ChangeW)
		ChangeW = 2;
	if (Nh > OverH - ChangeH)
		ChangeH = 2;
	Nw = Nw + ChangeW;
	Nh = Nh + ChangeH;

	if (OverW > Nw || OverH > Nh) {
		if (OverW > Nw) {
			$d("Loading").style.width = Nw + "px";
			$d("subLoading").style.width = Nw + "px";
			$d("subItemLoading").style.width = Nw + "px";
		}
		if (OverH > Nh) {
			$d("Loading").style.height = Nh + "px";
			$d("subItemLoading").style.height = (Nh - 28) + "px";
		}
		window.setTimeout("OpenNow()", 10)
	} else {
		Nw = 10;
		Nh = 10;
		ChangeH = 50;
		ChangeW = 50;
		$d("title").innerHTML = Title;
	}
	var divId=$d("Loading");   
	divId.style.left=(document.body.clientWidth-divId.clientWidth)/2;   
	divId.style.top=(document.body.clientHeight-divId.clientHeight)/2;  
	drag("LoadingMovn","Loading");
}
function Lock_CheckForm() {
	$d("Loading").style.display = 'none';
}

//用于改变所选值状态
function valuestatus(xz){

if(xz=="jz"){	

$d("jz").value=0;
$d("n").value="";
$d("jz").disabled=true;
$d("n").disabled=false;
$d("jz").style.backgroundColor="#D3D3D3";
$d("n").style.backgroundColor="#FFFFFF";
$d("n").focus();
}
if(xz=="hs"){

$d("n").value=0;
$d("jz").value="";
$d("jz").disabled=false;
$d("n").disabled=true;
$d("n").style.backgroundColor="#D3D3D3";
$d("jz").style.backgroundColor="#FFFFFF";
$d("jz").focus();
}
}
function valuematch(loadvalue){
	var temp = document.getElementsByName("calculator");
  	for(var i=0;i<temp.length;i++)
  	{
     	if(temp[i].checked)
           var intHot = temp[i].value;
  	}
	if(intHot=="x_jz"){
		if($d("n").value==""){
			alert("请输入沪深300的当期值!");
			return false;
		}
		if($d("stock_code_jis").value=="1001"){
			var valuecheck="";
		  	$d("jz").value=1 +($d("n").value/$d("h").value - 1 ) * 2
		 	valuecheck=$d("jz").value;
			var indexp=valuecheck.indexOf('.');
			if(indexp!=-1){
				//$d("jz").value=valuecheck.substring(0,indexp+5);
				$d("jz").value=Math.round(valuecheck * 10000) / 10000;
			}
		}
		if($d("stock_code_jis").value=="1002"){
		 	var valuecheck="";
		  	$d("jz").value=1 - ($d("n").value/$d("h").value - 1 ) * 2
		  	valuecheck=$d("jz").value;
			var indexp=valuecheck.indexOf('.');
			if(indexp!=-1){
				//$d("jz").value=valuecheck.substring(0,indexp+5);
				$d("jz").value=Math.round(valuecheck * 10000) / 10000;
			}
		}
	}
	if(intHot=="x_hs"){
		if($d("jz").value==""){
			alert("请输入净值!");
			return false;
		}
		if($d("stock_code_jis").value=="1001"){
    		var valuecheck="";
	 		$d("n").value=$d("h").value*(($d("jz").value-1)/2+1);
			valuecheck=$d("n").value;
			var indexp=valuecheck.indexOf('.');
			if(indexp!=-1){
				//$d("n").value=valuecheck.substring(0,indexp+3)
				$d("n").value=Math.round(valuecheck * 100) / 100;
			}
		}
		if($d("stock_code_jis").value=="1002"){
	 		var valuecheck="";
	  		$d("n").value=$d("h").value*((1-$d("jz").value)/2+1);
	  		valuecheck=$d("n").value;
			var indexp=valuecheck.indexOf('.');
			if(indexp!=-1){
				//$d("n").value=valuecheck.substring(0,indexp+3);
				$d("n").value = Math.round(valuecheck * 100) / 100;
			}
		}
	}
}
</script>
	</head>
	<body>
		<script>
	
	  	var errorMsg="${errorMsg}";
	  	if(errorMsg!=""){
	  		alert(errorMsg);
	  	}	  
	  //第一次载入页面时刷新数据
		refreshH();     
		refreshT();
	</script>
		<input type="hidden" id="hs300_price_init"
			value="${hs300_price_init }">
		<input type="hidden" name="canuse_balance" id="canuse_balance"
			value="${data.canuse_balance}" />

		<div align="center">
			<div class="wrap" style="width: 99%; margin: 0 auto;">
				<form name="buyForm" id="buyForm"
					action="/nxsyBSAction.do?method=buy" method="post">
					<div class="alignleft " style="width: 28%">
						<div class="tb_wrap">
							<div class="tb_header">
								<div>
									<table>
										<tr>
											<td>
												<table cellspacing="0" cellpadding="0" class="title line1">
													<tbody>
														<tr>
															<td class="b">
																委托交易
															</td>
														</tr>
													</tbody>
												</table>
											</td>
											<td>
												<div class="title line1"
													style="margin: 0001; width: 120; height: 27"
													onclick="OpenDiv(390,300, '估值换算器', 'msg');">

													<a href=JavaScript:;><img
															src="${ctx }/match/nxsy/mncg/skin/default/pic/jsq.png" />
														估值换算器</a>
												</div>
											</td>
										</tr>
									</table>
								</div>
							</div>
							<!-- end header -->
							<div class="tb_body">
								<div class="tb_content">

									<div class="alignleft " id="stockBox">
										<table class="bs">
											<tbody>
												<tr>
													<td class="lbg">
														客户编号：
													</td>
													<td>
														<div id="dclient_id">
															${data.client_id }
														</div>
													</td>
													<input type="hidden" name="client_id" id="client_id"
														value="${data.client_id }" />
												</tr>
												<tr>
													<td class="lbg">
														交易方式：
													</td>
													<td>
														<select id="stock_code" name="stock_code"
															onchange="change_stock();">
															<option value="1001" selected="selected">
																看涨股份
															</option>
															<option value="1002">
																看跌股份
															</option>
														</select>
													</td>
												</tr>

												<tr>
													<td class="lbg">
														交易方向：
													</td>
													<td>
														<select id="trade_dir" name="trade_dir"
															onchange="change_dir()">
															<option value="trade_in">
																买入
															</option>
															<option value="trade_out">
																卖出
															</option>
														</select>
													</td>

												</tr>
												<tr>
													<td class="lbg">
														委托价格：
													</td>
													<td>
														<span id="price_scope" name="price_scopt"
															style="color: #f00;" class="alignright textright"></span>
														<input type="text" tabindex="2" size="8"
															id="entrust_price" name="entrust_price"
															onblur="checkPrice();"">
														元

													</td>
												</tr>
												<tr>
													<td class="lbg">
														可用余额：
													</td>
													<td>
														<div id="fundavl">
															${data.canuse_balance}元
														</div>
													</td>
												</tr>
												<tr>
													<td class="lbg">
														<div id="max_amount_title">
															最大可买：
														</div>
													</td>
													<td>
														<div id="max_amount" class="alignleft textleft">
															----
														</div>
														<div class="alignleft textleft">
															&nbsp;&nbsp;股
														</div>
													</td>
												</tr>
												<tr>
													<td class="lbg">
														<div id="entrust_amount_title">
															买入数量：
														</div
													</td>
													<td>
														<input type="text" tabindex="3" size="11"
															id="entrust_amount" name="entrust_amount">
														<span id="unit2">股</span>
													</td>
												</tr>
												<tr>
													<td height="36" align="center" colspan="2">
														<input type="button" value="重&nbsp;&nbsp;置"
															class="button4" onClick="doreset()">
														&nbsp;&nbsp;&nbsp;&nbsp;
														<input type="button" value="确&nbsp;&nbsp;定"
															class="button4" onClick="dosubmit()">
													</td>

												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
							<!-- end tb_body -->
							<div class="tb_footer">
								<div></div>
							</div>
							<!-- end tb_footer -->
							<div class="clear"></div>
						</div>
					</div>
				</form>
				<div class="alignleft wtrade wtrade1">
					<div class="tableBar">
						<ul class="tab-menu" style="margin-top: 17px; display: block;">
							<li class="hover">
								<a href="###">存量委托单</a><a class="refresh"
									href="javascript:void(0)" onclick="refreshT()"></a><b></b>
							</li>
							<li>
								<a href="###">大盘行情</a><b></b>
							</li>
						</ul>
						<div class="tab-cont">
							<!-- 委托交易 -->
							<div class="cont hover" style="margin-top: -17px;">
								<div class="tb_wrap">

									<!-- end header -->
									<div class="tb_body">
										<div class="tb_content yichu" id="bsEntrust">
											<jsp:include page="stock/bsEntrust.jsp"></jsp:include>
										</div>
									</div>
									<!-- end tb_body -->
									<div class="tb_footer">
										<div></div>
									</div>
									<!-- end tb_footer -->
									<div class="clear"></div>
								</div>
							</div>
							<!-- 委托交易-->

							<!-- 行情 -->
							<div class="cont" style="margin-top: -10px;">
								<iframe style="height: 315px; margin-top: 13px;"
									src="http://flash.gf.com.cn/indexes/indexes.php?width=600&height=300"
									id="hqIframes" name="hqIframes" marginWidth="0"
									marginHeight="0" frameBorder="0" noresize width="100%"
									scrolling="no"></iframe>
							</div>
							<!-- 行情 -->

						</div>
						<!-- tab-cont -->
					</div>

				</div>
				<div class="alignleft w1 myHold">
					<div class="tb_wrap">
						<!-- 
						<div class="title line1" style="width: 114"
							onclick="OpenDiv(390,300, '股票市值计算器', 'msg');">
							<a href=JavaScript:;>计算器</a>
						</div>
						 -->
						<div class="tb_header">
							<div>
								<table cellspacing="0" cellpadding="0" class="title line1">
									<tbody>
										<tr>
											<td class="b">
												我的持仓
												<a class="refresh" href="javascript:void(0)"
													onclick="refreshH()"></a>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<!-- end header -->
						<div class="tb_body">
							<div class="tb_content yichu" id="contentBox">
								<jsp:include page="stock/stockHold.jsp"></jsp:include>
							</div>
						</div>
						<!-- end tb_body -->
						<div class="tb_footer">
							<div></div>
						</div>
						<!-- end tb_footer -->
						<div class="clear"></div>
					</div>
				</div>

			</div>
		</div>
		<!-- end center -->
		<script type="text/javascript"
			src="${contextPath }/js/jquery-1.3.2.min.js"></script>
		<script type="text/javascript" src="${contextPath }/js/common.js"></script>
		<script type="text/javascript">
$(".tableBar").tabs({meth:"click"});
	$("#stock_code option[value='${init_stock_code}']").attr("selected", true);
	$("#trade_dir option[value='${init_trade_dir}']").attr("selected", true);
	$("#entrust_price").val("${init_entrust_price}");
	chgPrice();
	change_dir();
	
	setTimeout(change_dir,500);
	setTimeout(change_dir,1000);
	setTimeout(change_dir,2000);
	setTimeout(change_dir,3000);
	setInterval(refreshH,5000);
	setInterval(refreshT,5000);
</script>
		<!--          浮层框架开始        -->
		<div id="Loading" style="display: none;">
			<table id="subLoading" width="100%" border="0" cellpadding="0"
				cellspacing="0"
				style="border: 0 solid #FF0000; border-collapse: collapse;">
				<tr>
					<td
						style="background-color: #C5E0F5; color: #fff; padding-left: 4px; padding-top: 2px; font-weight: bold; font-size: 12px;"
						height="24" valign="middle">
						<div id="LoadingMovn" align="right">
							<a href=JavaScript:; onClick="Lock_CheckForm();">[关闭]</a>
							&nbsp;&nbsp;&nbsp;&nbsp;
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div id="subItemLoading" style="width: 100%; height: 100%;">
							<table width="100%" height="100%">
								<tr>
									<td id="title" height="26" align="center">
									</td>
								</tr>
								<tr>
									<td>
										<div class="top-white"></div>
										<h1
											style="color: rgb(204, 0, 0); font-weight: bold; margin-left: 10px;">
											希望计算什么
										</h1>
										<input style="margin-left: 10px;" type="radio"
											name="calculator" value="x_hs" onclick="valuestatus('hs')">
										<label>
											沪深300的当期值
										</label>
										<input type="radio" checked="true" name="calculator"
											value="x_jz" onclick="valuestatus('jz')">
										<label>
											净值
										</label>
										<div class="bottom1"></div>
									</td>
								</tr>
								<tr>
									<td id="context" align="center">


										<table width="100%" height="100%" align="center" border="0">
											<tr>
												<td colspan="2">
													<div class="top-white"></div>
												</td>
											</tr>
											<tr>												
												<td align="right" width="50%">
													股票代码：
												</td>
												<td>
													<label>
														<select style="width: 100;" id="stock_code_jis"
															name="stock_code_jis">
															<option value="1001" selected="selected">
																看涨股份
															</option>
															<option value="1002">
																看跌股份
															</option>
														</select>
													</label>
												</td>
											</tr>
											<tr>
												<td align="right">
													沪深300的初始值：
												</td>
												<td>
													<input id="h" type="text" name="textfield2" style="width: 100; background-color: #D3D3D3"
														readonly="readonly" value="${hs300_price_init}" />
												</td>
												
											</tr>
											<tr>
												<td align="right">
													沪深300的当期值：
												</td>

												<td>
													
													<input id="n"
														onKeyUp="this.value=this.value.replace(/[^\-\.\d]/g,'');if(this.value.split('.').length>2){this.value=this.value.split('.')[0]+'.'+this.value.split('.')[1]}
  if(this.value.split('-').length==2){if(this.value.indexOf('-')!=0){this.value=this.value.replace('-','')}} 
  if(this.value.split('-').length>2){this.value=this.value.split('-')[0]+'-'+this.value.split('-')[1]}"
														type="text" name="n" style="width: 100;" />
												</td>
												
											</tr>
											<tr>
											
												<td align="right">
													净值：
												</td>
												<td>
													<input id="jz"
														onKeyUp="this.value=this.value.replace(/[^\-\.\d]/g,'');if(this.value.split('.').length>2){this.value=this.value.split('.')[0]+'.'+this.value.split('.')[1]}
  if(this.value.split('-').length==2){if(this.value.indexOf('-')!=0){this.value=this.value.replace('-','')}} 
  if(this.value.split('-').length>2){this.value=this.value.split('-')[0]+'-'+this.value.split('-')[1]}"
														type="text" name="textfield4"
														style="width: 100; background-color: #D3D3D3"
														disabled=true />
												</td>
												
											</tr>
											<tr>
												<td align="right">
													<label>
														<input stype="background-color=#FE9900" type="submit"
															name="Submit" value="计算" onclick="valuematch(1)" />
														&nbsp;
													</label>
												</td>
												<td align="left">
													&nbsp;
												</td>
											</tr>
											<tr>
												<td colspan="2">
													<div class="bottom1"></div>
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>

						</div>

					</td>
				</tr>
			</table>
		</div>
		<!--  浮层框架结束-->
	</body>
</html>