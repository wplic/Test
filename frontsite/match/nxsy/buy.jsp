<%
request.setCharacterEncoding("UTF-8");
%>
<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="${ctx }/match/nxsy/login_ok.jsp"></jsp:include>
<html>
	<head>
		<title>广发证券</title>
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
			
		<link rel="stylesheet" type="text/css" href="${contextPath }/match/nxsy/mncg/extBase/resources/css/ext-all.css" />
		<script type="text/javascript" src="${contextPath }/match/nxsy/mncg/extBase/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="${contextPath }/match/nxsy/mncg/extBase/ext-all.js"></script>
		
		<style type="text/css">
		body{
		background-color: #DEEAFA;
		}
		.top-white{
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
		.tablebtl{
		border-left:solid #8DB2E3 1px;
		border-top:solid #8DB2E3 1px;
		}
		.tablebbr{
		background-color:#DEECFD;
		border-right:solid #8DB2E3 1px;
		border-bottom:solid #8DB2E3 1px;
		font-size:12px;
		}
		.red_bold{
		font-weight: bold;
		color: red;
		}
		.onover {
			cursor:pointer;
			border:solid 1px #CC6600;
		}
		#Loading {
		position: absolute;
		z-index: 111;
		border: 1px solid #C6C7CB;
		background-color: #FFFFFF;
		height: 299px;
		width: 514px;
		}
		.content{width:100%; font-size:13px; vertical-align:middle; line-height:19px;text-align:center; } /**min-width:700px;*/
		.content th{background:url(${ctx }/match/nxsy/mncg/skin/default/pic/th_line.jpg) repeat-x; text-align:center; line-height:21px;border:1px solid #BEC8D4;}
		.content td{border:1px solid #BEC8D4;padding:0 2px;}
		.content .odd{ background-color:#FFFFFF; }
		.content .even{ background-color:#F1F1F1;}
		.content .selected{ background-color:#FBFFDA; }
		.content .hover{ background-color:#D3DAE2;}
		</style>

	</head>
	<script language="javascript">
	function $d(id) {
		return document.getElementById(id);
	}
	var JQ = jQuery.noConflict();//根据id获取对象
	//用于用户转换比的设置
	var exchanagerate=0;
	function radio_click(stock_code, remain_amount, entrust_price,trade_dir) {	
		//解散用户输入转换比的作用域
		exchanagerate=0;
		if(stock_code==1001){
		$d("stock_code").selectedIndex=0;
		}
		if(stock_code==1002){
		$d("stock_code").selectedIndex=1;
		}
		if(trade_dir == 1) {
			$d("trade_dir").selectedIndex=0;
		}		
		if(trade_dir == 2) {
			$d("trade_dir").selectedIndex=1;
		}		
		JQ("#entrust_price").val(entrust_price);
			
		//计算最大可转
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
		JQ("#max_amount").html(max_amount);
		change_dir();
	}
	
	
	//当下拉框的股票名称发生变化
	function change_stock() {	
		exchanagerate=0;	
		var stock_code = $d("stock_code").value;		
		if(stock_code == "")
		{
			return;
		}
		refreshT(stock_code,0);	
		change_dir('yes');
	}
	
	
	//当下拉框的交易方向发生变化
	function change_dir(org_type) {
		
		var trade_dir = $d("trade_dir").value;
		var stock_code = $d("stock_code").value;
		
		var max_amount;
		
		if(stock_code == "1001")
		{
			if(org_type=="yes"){
			var new_entrust_deliver_price_Rose=JQ("#inp_entrust_deliver_price_Rose").val();
			JQ("#entrust_price").val(new_entrust_deliver_price_Rose);
			}
			JQ("#puc_name").html("看涨份额");
		}
		else if(stock_code = "1002")
		{
			if(org_type=="yes"){
			var new_entrust_deliver_price_drop=JQ("#inp_entrust_deliver_price_Drop").val();
			JQ("#entrust_price").val(new_entrust_deliver_price_drop);
			}
			JQ("#puc_name").html("看跌份额");
		}
		//转入
		if(trade_dir == "trade_in")
		{
			JQ("#entrust_amount_title").html("转入数量:");
			checkPrice();
		}
		//转出
		else
		{
			JQ("#entrust_amount_title").html("转出数量:");
			var tmp_entrust_amount = JQ("#entrust_amount").val();
			if(stock_code == "1001")
			{
				
				max_amount = JQ("#canuse_balance_1001").val();
				JQ("#max_amount").html(max_amount);	
				
			}
			else if(stock_code = "1002")
			{
				max_amount = JQ("#canuse_balance_1002").val();
				JQ("#max_amount").html(max_amount);
				
			}
			if(tmp_entrust_amount != "")
			{
				if(parseFloat(max_amount)< parseFloat(tmp_entrust_amount))
				{
					JQ("#entrust_amount").val(max_amount);
				}	
			}
		}
		if(exchanagerate!=0){
		JQ("#entrust_price").val(exchanagerate);
		return;
		}
	}	
		
	//查看转换比例是否合法
	function checkPrice(active_type)
	{
		chgPrice();
		var entrust_price = JQ("#entrust_price").val();
		var trade_dir =  $d("trade_dir").value;
		if(entrust_price == "" && trade_dir == "trade_in")
		{
			JQ("#max_amount").text("----");	
			return;
		}
		var min_entrust_price = "";
		var max_entrust_price = "";
		if($d("stock_code").value == 1001) {			
			min_entrust_price = JQ("#min_entrust_price_Rose").val();
			max_entrust_price = JQ("#max_entrust_price_Rose").val();
		} 
		if($d("stock_code").value == 1002) {			
			min_entrust_price = JQ("#min_entrust_price_Drop").val();
			max_entrust_price = JQ("#max_entrust_price_Drop").val();
		} 
		if(isNaN(entrust_price))
		{
			alert("转换比例必须为数字！");
			JQ("#entrust_price").val(min_entrust_price);
			return false;
		}
		entrust_price = parseFloat(entrust_price);
		max_entrust_price = parseFloat(max_entrust_price);
		min_entrust_price = parseFloat(min_entrust_price);
		if(entrust_price > max_entrust_price || entrust_price < min_entrust_price)
		{
			alert("申报转换比例非法,必须在："+min_entrust_price+"与"+max_entrust_price+"之间");
			return false;
		}
		//转入
		if(trade_dir == "trade_in"){
			var canuse_balance = JQ("#canuse_balance").val();
			var max_amount = Math.floor(canuse_balance / entrust_price / 1000) * 1000;
			JQ("#max_amount").html(max_amount);
		}
		if(active_type==1){
		exchanagerate=JQ("#entrust_price").val();
		}
		return true;
	}
	function doreset()
	{		
		JQ("#entrust_price").val("");
		JQ("#entrust_amount").val("");
	}
	//提交表单
	function dosubmit()
	{
		
		var strMsg = "";
		strMsg += checkValid("stock_code", "股票名称", "NotEmpty");
		strMsg += checkValid("entrust_price", "转换比例", "NotEmpty");
		strMsg += checkValid("entrust_amount", "转换数量", "NotEmpty");
		strMsg += checkValid("client_id", "客户编号", "NotEmpty");
		strMsg += checkValid("entrust_price", "转换比例", "NumberFloat");
		strMsg += checkValid("entrust_amount", "转换数量", "Numeric");
		if(strMsg != "")
		{
			alert(strMsg);
			return;
		}
		//查看转换比例是否合法
		var entrust_price = JQ("#entrust_price").val();
		var min_entrust_price = "";
		var max_entrust_price = "";
		var stock_name = "";
		if($d("stock_code").value == 1001) {			
			min_entrust_price = JQ("#min_entrust_price_Rose").val();
			max_entrust_price = JQ("#max_entrust_price_Rose").val();
			stock_name = "看涨份额";
		} 
		if($d("stock_code").value == 1002) {			
			min_entrust_price = JQ("#min_entrust_price_Drop").val();
			max_entrust_price = JQ("#max_entrust_price_Drop").val();
			stock_name = "看跌份额";
		}
		entrust_price = parseFloat(entrust_price);
		max_entrust_price = parseFloat(max_entrust_price);
		min_entrust_price = parseFloat(min_entrust_price);
		if(entrust_price > max_entrust_price || entrust_price < min_entrust_price)
		{
			alert("转换比例不在允许范围内！");
			return;
		}
		var valid_price = 0;
		var one_price = 0;
		if($d("stock_code").value == 1001 && $d("trade_dir").value == "trade_in" ) {
			valid_price = parseFloat(JQ("#valid_entrust_1001_buy").val());
			one_price = parseFloat(JQ("#one_entrust_1001_sell").val());
			
			if(entrust_price  > valid_price && entrust_price > one_price)
			{
				alert("该转换比例可能会造成您资金账户的不必要损失，请重新检查转换比例!");
				return;
			}
		}
		
		if($d("stock_code").value == 1001 && $d("trade_dir").value == "trade_out" ) {
			valid_price = parseFloat(JQ("#valid_entrust_1001_sell").val());
			one_price = parseFloat(JQ("#one_entrust_1001_buy").val());
			if(entrust_price  < valid_price && entrust_price < one_price)
			{
				alert("该转换比例可能会造成您资金账户的不必要损失，请重新检查转换比例!");	
				return;
			}
		}
		
		if($d("stock_code").value == 1002 && $d("trade_dir").value == "trade_in" ) {
			valid_price = parseFloat(JQ("#valid_entrust_1002_buy").val());
			one_price = parseFloat(JQ("#one_entrust_1002_sell").val());
			if(entrust_price  > valid_price && entrust_price > one_price)
			{
				alert("该转换比例可能会造成您资金账户的不必要损失，请重新检查转换比例!");	
				return;
			}
		}
		
		if($d("stock_code").value == 1002 && $d("trade_dir").value == "trade_out" ) {
			valid_price = parseFloat(JQ("#valid_entrust_1001_sell").val());
			one_price = parseFloat(JQ("#one_entrust_1002_buy").val());
			if(entrust_price  < valid_price && entrust_price < one_price)
			{
				alert("该转换比例可能会造成您资金账户的不必要损失，请重新检查转换比例!");	
				return;
			}
		}
		
		
		//查看转换数量是否合法
		var entrust_amount = JQ("#entrust_amount").val();
		if(entrust_amount  == 0)
		{
			alert("转换数量不得为0!");
			return;
		}
		if((entrust_amount % 1000) != 0)
		{
			alert("转换数量必须为1000的整数倍!");
			return;
		}
		entrust_amount =  parseFloat(entrust_amount);
		var canuse_balance = JQ("#canuse_balance").val();
		var max_amount = 0;
		if($d("trade_dir").value == "trade_in")
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
			alert("超过了最大允许转换数量!");
			return;
		}
		var msg = "";
		if($d("trade_dir").value == "trade_in")
		{
			msg = "转入" + stock_name + entrust_amount + "份，转换比例：" + entrust_price + "元\r\n\r\n";
		}
		else if($d("trade_dir").value == "trade_out")
		{
			msg = "转出" + stock_name + entrust_amount + "份，转换比例：" + entrust_price + "元\r\n\r\n";
		}
		if(!confirm(msg + "            确定交易?")){
			 return;
		};
		var strparam= "";
		strparam +="&stock_code="+$d("stock_code").value;
		strparam +="&trade_dir="+$d("trade_dir").value;
		strparam +="&entrust_price="+JQ("#entrust_price").val().trim();
		strparam +="&entrust_amount="+JQ("#entrust_amount").val().trim();
		strparam +="&client_id="+JQ("#client_id").val();
		$d("buyForm").action="${contextPath }/nxsyBSAction.do?method=buy"+strparam;
		$d("buyForm").submit();	
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
	
	</script>
	<script language="javascript">
	//用于展现数据的主面板
	var mianpanel;
	
	Ext.onReady(function() {
	Ext.QuickTips.init();
//Ext.util.CSS.swapStyleSheet('window', '${contextPath }/match/nxsy/mncg/extBase/resources/css/xtheme-gray.css');
			//用于提示错
		Ext.form.Field.prototype.msgTarget = 'side';//统一指定错误信息提示方式
	/*--------------------------------用于下拉列表--------------*/
 
	var tabs = new Ext.TabPanel({
			width:Ext.get("info").getWidth(),
			height:Ext.get("info").getHeight(),
   			 renderTo:'info',
   			 autoTabs: true,
   			 deferredRender: false,
   			 activeTab: 0,
   			 
    		items: [{
				xtype:"panel",
				style : " margin:1px;",
				title:"单向申报",
				frame:true,
				layout : "table",
				layoutConfig : {
					columns : 2
				},
				width : Ext.get("info").getWidth(),
				items:[
					{
					xtype : "panel",
					width : 260,
					style : " margin:1px; float:left;",
					height : 260,
					layout : "table",
					layoutConfig : {
						columns : 1
					},
					items : [
							{
								xtype:'panel',
								bodyBorder:true,
								border:false,
								style : "margin-top:9px; font-size:12px;",
								html:'<div id="divstockId" align="left" style="width:230px;	 border-width:0px 0px 1px 0px;background:transparent;font-size:12px;" ><code  style="width:70px; margin-left:15px; margin-right:10px; ">客户编号:</code><code style="width:120px;">${data.client_id }</code><input type="hidden" name="client_id" id="client_id" value="${data.client_id }" /></div>'
							}
							,
							{
								xtype:'panel',
								bodyBorder:true,
								border:false,
								style : "margin-top:9px; font-size:12px;",
								contentEl:'ep_stock_code_div'
								//html:'<div id="divstockId" align="left" style="width:230px;	 border-width:0px 0px 1px 0px;background:transparent;font-size:12px;" ><code  style="width:70px; margin-left:15px; margin-right:10px; ">转换代码:</code><select style="width:120px;	 id="stock_code" name="stock_code" onchange="change_stock();"><option value="1001" <c:if test="${init_stock_code==1001}"> selected="selected"</c:if>>看涨份额</option><option value="1002" <c:if test="${init_stock_code==1002}"> selected="selected"</c:if>>看跌份额</option></select></div>'
							}
							,
							
							{
							xtype:'panel',
							bodyBorder:true,
							style : "margin-top:9px; font-size:12px;",
							border:false,
							html:'<div  align="left" style="width:230px; border-width:0px 0px 1px 0px;background:transparent;font-size:12px;" ><code style="width:70px; margin-left:15px; margin-right:10px; ">产品名称:</code><code id="puc_name" style="font-weight: bold; color:blue;">看涨份额</code></div>'
							},
						
							{
							xtype:'panel',
							bodyBorder:true,
							style : "margin-top:9px; font-size:12px;",
							border:false,
							//<div  align="left" style="width:230px;	 border-width:0px 0px 1px 0px;background:transparent;font-size:12px;" ><code style="width:70px; margin-left:15px; margin-right:10px; ">转换方向:</code><select style="width:120px; id="trade_dir" name="trade_dir" onchange="change_dir()"><option value="trade_in" >转入</option><option value="trade_out">转出</option></select></div>
							contentEl:'epdiv'
							//html:'<div  align="left" style="width:230px;	 border-width:0px 0px 1px 0px;background:transparent;font-size:12px;" ><code style="width:70px; margin-left:15px; margin-right:10px; ">转换方向:</code><select style="width:120px; id="trade_dir" name="trade_dir" onchange="change_dir()"><option value="trade_in" >转入</option><option value="trade_out">转出</option></select></div>'
							//html:'<code style="width:70px; margin-left:15px; margin-right:10px; ">转换方向:</code><select style="width:120px;" id="trade_dir12" name="trade_dir12"><option value="trade_in" >转入</option><option value="trade_out">转出</option></select>'
							},
							{
							xtype:'panel',
							bodyBorder:true,
							style : "margin-top:9px; font-size:12px;",
							border:false,
							contentEl:'ep_price_div'
							//html:'<div align="left" style="width:230px;	 border-width:0px 0px 1px 0px;background:transparent;font-size:12px;" ><code style="width:70px; margin-left:15px; margin-right:10px;">转换比例:</code><input type="text" style="width:120px; tabindex="2" value="${init_entrust_price}" size="8" id="entrust_price" name="entrust_price" onblur="checkPrice();"/> </div>'
							
							}
							,
							{
							xtype:'panel',
							bodyBorder:true,
							style : "margin-top:9px; font-size:12px;",
							border:false,
							html:'<div  align="left" style="width:230px;border-width:0px 0px 1px 0px;background:transparent;font-size:12px;" ><code id="max_amount_title"  style="width:70px; margin-left:3px; margin-right:20px;">可用母份额:</code><code  style="width:120px;">${data.canuse_balance}元</code></div>'
							},
							
							{
							xtype:'panel',
							bodyBorder:true,
							style : "margin-top:9px; font-size:12px;",
							border:false,
							html:'<div  align="left" style="width:230px;border-width:0px 0px 1px 0px;background:transparent;font-size:12px;" ><code id="max_amount_title" style="width:70px; margin-left:13px; margin-right:10px;">可转(份):</code><code  id="max_amount" style="width:120px;">---</code></div>'
							},
							//第六行
							{
							xtype:'panel',
							bodyBorder:true,
							style : "margin-top:9px; font-size:12px;",
							border:false,
							html:'<div align="left" style="width:230px;	 border-width:0px 0px 1px 0px;background:transparent;font-size:12px;" ><code style="width:70px; margin-left:15px; margin-right:10px; " id="entrust_amount_title">转入数量:</code><input style="width:120px; type="text" tabindex="3" size="11" id="entrust_amount" name="entrust_amount"/></div>'
							},
							{
							xtype : "panel",
							width : 230,
							layout : "table",
							layoutConfig : {
								columns : 3
							},
							items : [
								{
								xtype:'panel',
								bodyBorder:true,
								style : "margin-top:9px; font-size:12px;",
								border:false,
								html:'<input type="button" style="margin-top:10px; margin-left:30px;  font-size:12px;" value="重&nbsp;&nbsp;置" class="button4" onClick="doreset()">'
								},
								{
								xtype:'panel',
								bodyBorder:true,
								style : "margin-top:9px; font-size:12px;",
								border:false,
								html:'<input type="button" style="margin-top:10px; margin-left:10px;  font-size:12px;"  value="确&nbsp;&nbsp;定" class="button4" onClick="dosubmit()">'
								},
								{
								xtype:'panel',
								bodyBorder:true,
								style : "margin-top:13px; font-size:12px;",
								border:false,
								html:'<a href=JavaScript:;><img style="margin-left:10px; margin-top:3px;  " src="${ctx }/match/nxsy/mncg/skin/default/pic/jsq.png" alt="估值换算器" onclick="OpenDiv(390,300)" /></a>'
								}
								]}
					]
				  	
				}, {
				xtype:"tabpanel",
				activeTab:0,
				width:730,
				bodyBorder:true,
				deferredRender : true,
				border:false,
				height:260,
				items:[
					{
						autoScroll:true,
						title:"转换申报信息",
						style:"background-color:#DFE8F6;",
						 contentEl:'bsEntrust'
					},
					{
						xtype:"panel",
						style:"background-color:#DFE8F6;",
						title:"大盘行情",
						//autoLoad:{ 
								  //  url:'http://flash.gf.com.cn/indexes/indexes.php?width=720&height=250', 
								   // scripts:true 
								//}
						contentEl:"hqIframes"
					}
				]
				}, 
				{
				xtype:"tabpanel",
				activeTab:1,
				bodyBorder:true,
				deferredRender : true,
				border:false,
				colspan:2,
				width:Ext.get("info").getWidth()-20,
				height : 95,
				style : " margin-top:5px; margin-left:3px;  margin-bottom:3px; margin-right:13px; float:left;",
				items:[
					{
						xtype:"panel",
						contentEl:'contentBox1',
						title:"当日申报"
					},
					{
						xtype:"panel",
						autoScroll:true,
						title:"产品持仓",
						contentEl:'contentBox2'
					},
					{
						xtype:"panel",
						contentEl:'contentBox3',
						title:"当日转换"
					}
				]
				}
				
				
					]}
				]
		});
		
	});
	
	</script>
	<script language="javascript">  
	//可拖动的计算器
	function drag(o,subo)  
	{  
	   if (typeof o == "string") o = document.getElementById(o);  
	   if (typeof subo == "string") subo = document.getElementById(subo);  
	    subo.orig_x = parseInt(subo.style.left) - document.body.scrollLeft;  
	   subo.orig_y = parseInt(subo.style.top) - document.body.scrollTop;  
	   subo.orig_index = subo.style.zIndex;      
	   o.onmousedown = function(a)  
	   {  
	       subo.style.zIndex = 10000;  
	       var d=document;  
	       if(!a)a=window.event;  
	        var x = a.clientX+d.body.scrollLeft-subo.offsetLeft;  
	       var y = a.clientY+d.body.scrollTop-subo.offsetTop; 
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
	           subo.style.index = o.orig_index;  
	       }
	         
	   }  
	} 	
//浮动计算机
	var OverH, OverW, Title, Context, ChangeH = 50, ChangeW = 50;
	
	function OpenDiv(_Dw, _Dh, _Title, _Context) {
		$d("title").innerHTML = "";
		_Title="估值换算器";
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
	<body style="background-color: white; margin-left:3px; margin-top:4px;">
	<script>
	  	var errorMsg="${errorMsg}";
	  	if(errorMsg!=""){
	  		alert(errorMsg);
	  	}	  
	</script>
			<input type="hidden" id="hs300_price_init"
			value="${hs300_price_init }"/>
			<input type="hidden" name="canuse_balance" id="canuse_balance"
			value="${data.canuse_balance}" />
			<div id="info" style="width:816; height:453;">
			<div  class="x-hide-display" id="bsEntrust" style="margin-top:5px;">
			<jsp:include page="stock/bsEntrust.jsp"></jsp:include>
			</div>
			<div  class="x-hide-display"   id="contentBox2" style="height: 90px;">
			<div id="search_bar" style="height14px; width:100%;margin-top: -2px;"  >	
				<ul class="x-toolbar">
							<li>
							<a class="refresh" href="javascript:void(0)"
													onclick="refreshH()"></a>
							<a  href="javascript:void(0)"
													onclick="refreshH()" style="font-size: 12px;">刷新</a>
							</li>
							
						</ul>	
				</div>
			
			<div id="contentBox" style="margin-top:2px;">
				
			<jsp:include page="stock/stockHold.jsp"></jsp:include>
			</div>
			</div>
			<!-- 大盘行情 -->
			<iframe class="x-hide-display" style="height: 250px; margin-top: 3px;"
									src="http://flash.gf.com.cn/indexes/indexes.php?width=720&height=250"
									id="hqIframes" name="hqIframes" marginWidth="0"
									marginHeight="0" frameBorder="0" noresize width="100%"
									scrolling="no"></iframe>
									
			<iframe id="contentBox1" class="x-hide-display" style="margin-bottom: 10px;margin-top: -15px;margin-left: -3px;"
								src="${ctx }/nxsyQueryAction.do?method=listEntrust&numPerPage=2&chooseSuburl='yes'"
								marginWidth="0" marginHeight="0"
								frameBorder="0" width="100%" scrolling="no"></iframe>
								
			<iframe id="contentBox3" class="x-hide-display" style="margin-bottom: 10px;margin-top: -15px;margin-left: -3px;"
								src="${ctx }/nxsyQueryAction.do?method=listDeliver&numPerPage=2&chooseSuburl='yes'"
								 marginWidth="0" marginHeight="0"
								frameBorder="0" width="100%" scrolling="no"></iframe>
				
		
			<div  class="x-hide-display" id="ep_stock_code_div" align="left" style="width:230px; border-width:0px 0px 1px 0px;background:transparent;font-size:12px;" ><code  style="width:70px; margin-left:15px; margin-right:10px; ">转换代码:</code><select style="width:120px;"	 id="stock_code" name="stock_code" onchange="change_stock();"><option value="1001" <c:if test="${init_stock_code==1001}"> selected="selected"</c:if>>1001 看涨份额</option><option value="1002" <c:if test="${init_stock_code==1002}"> selected="selected"</c:if>>1002 看跌份额</option></select></div>
			<div  class="x-hide-display" id="epdiv" align="left" style="width:230px; border-width:0px 0px 1px 0px;background:transparent;font-size:12px;" ><code style="width:70px; margin-left:15px; margin-right:10px; ">转换方向:</code><select style="width:120px;" id="trade_dir" name="trade_dir" onchange="change_dir('yes')"><option value="trade_in" <c:if test="${init_trade_dir=='trade_in'}"> selected="selected"</c:if> >转入</option><option value="trade_out" <c:if test="${init_trade_dir=='trade_out'}"> selected="selected"</c:if>>转出</option></select></div>
			<div  class="x-hide-display" id="ep_price_div" align="left" style="width:230px;	 border-width:0px 0px 1px 0px;background:transparent;font-size:12px;" ><code style="width:70px; margin-left:15px; margin-right:10px;">转换比例:</code><input  type="text" style="width:120px; tabindex="2" value="${init_entrust_price}" size="8" id="entrust_price" name="entrust_price" onblur="checkPrice(1);"/> </div>
			<form name="buyForm" action="#"  id="buyForm" method="post">
			</form>
			</div> 	 
			<!--          浮层框架开始        -->
		<div id="Loading" style="display: none;">
			<table id="subLoading" width="100%" border="0" cellpadding="0"
				cellspacing="0"
				style="border: 0 solid #FF0000; border-collapse: collapse;">
				<tr>
					<td
						style="background-color:#DFE8F6; color: #fff; padding-left: 4px; padding-top: 2px; font-weight: bold; font-size: 12px;"
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
									<br></td>
								</tr>
								<tr>
									<td>
										
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
										
									<br></td>
								</tr>
								<tr>
									<td id="context" align="center">


										<table width="100%" height="100%" align="center" border="0">
											<tr>
												<td colspan="2">
													
												<br></td>
											</tr>
											<tr>												
												<td align="right" width="50%">
													股票代码：
												<br></td>
												<td>
													<label>
														<select style="width: 100;" id="stock_code_jis"
															name="stock_code_jis">
															<option value="1001" selected="selected">
																1001 看涨份额
															</option>
															<option value="1002">
																1002 看跌份额
															</option>
														</select>
													</label>
												<br></td>
											</tr>
											<tr>
												<td align="right">
													沪深300的初始值：
												<br></td>
												<td>
													<input id="h" type="text" name="textfield2" style="width: 100; background-color: #D3D3D3"
														readonly="readonly" value="${hs300_price_init}" />
												<br></td>
												
											</tr>
											<tr>
												<td align="right">
													沪深300的当期值：
												<br></td>

												<td>
													
													<input id="n"
														onKeyUp="this.value=this.value.replace(/[^\-\.\d]/g,'');if(this.value.split('.').length>2){this.value=this.value.split('.')[0]+'.'+this.value.split('.')[1]}
  if(this.value.split('-').length==2){if(this.value.indexOf('-')!=0){this.value=this.value.replace('-','')}} 
  if(this.value.split('-').length>2){this.value=this.value.split('-')[0]+'-'+this.value.split('-')[1]}"
														type="text" name="n" style="width: 100;" />
												<br></td>
												
											</tr>
											<tr>
											
												<td align="right">
													净值：
												<br></td>
												<td>
													<input id="jz"
														onKeyUp="this.value=this.value.replace(/[^\-\.\d]/g,'');if(this.value.split('.').length>2){this.value=this.value.split('.')[0]+'.'+this.value.split('.')[1]}
  if(this.value.split('-').length==2){if(this.value.indexOf('-')!=0){this.value=this.value.replace('-','')}} 
  if(this.value.split('-').length>2){this.value=this.value.split('-')[0]+'-'+this.value.split('-')[1]}"
														type="text" name="textfield4"
														style="width: 100; background-color: #D3D3D3"
														disabled=true />
												<br></td>
												
											</tr>
											<tr>
												<td align="right">
													<label>
														<input stype="background-color=#FE9900" type="submit"
															name="Submit" value="计算" onclick="valuematch(1)" />
														&nbsp;
													</label>
												<br></td>
												<td align="left">
													&nbsp;
												<br></td>
											</tr>
											<tr>
												<td colspan="2">
													
												<br></td>
											</tr>
										</table>
									<br></td>
								</tr>
							</table>

						</div>

					<br></td>
				</tr>
			</table>
		</div>
		<!--  浮层框架结束-->
	</body>
<script type="text/javascript">
 	//第一次载入页面时刷新数 据
		refreshH();     
		refreshT();
	setTimeout(change_dir,500);
	setTimeout(change_dir,1000);
	setTimeout(change_dir,2000);
	setTimeout(change_dir,3000);
	setInterval(refreshH,5000);
	setInterval(refreshT,5000);
	</script>
</html>

