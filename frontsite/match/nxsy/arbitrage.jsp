<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="${ctx }/match/nxsy/login_ok.jsp"></jsp:include>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<style type="text/css">
		body {
		background-color: #DEEAFA;
		}
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
		</style>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<META HTTP-EQUIV="pragma" CONTENT="no-cache">   
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">   
<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT"> 
<link href="${ctx }/match/nxsy/mncg/skin/default/css/global.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" type="text/css" href="${ctx }/infoCenter/goldmoney/css/inner.css" media="all" />
<link href="${ctx }/match/nxsy/mncg/skin/default/css/font.css"	rel="stylesheet" type="text/css">

<script src="${ctx }/match/nxsy/mncg/js/jquery-1.3.2.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="${ctx }/match/nxsy/mncg/js/commons.js"></script>
<script type="text/javascript"
	src="${ctx }/match/nxsy/mncg/js/fresh.js"></script>

<link rel="stylesheet" type="text/css" href="${contextPath }/match/nxsy/mncg/extBase/resources/css/ext-all.css" />
<script type="text/javascript" src="${contextPath }/match/nxsy/mncg/extBase/adapter/ext/ext-base.js"></script>
<script type="text/javascript" src="${contextPath }/match/nxsy/mncg/extBase/ext-all.js"></script>
<style>
.content{width:100%; font-size:13px; vertical-align:middle; line-height:19px;text-align:center; } /**min-width:700px;*/
.content th{background:url(${ctx }/match/nxsy/mncg/skin/default/pic/th_line.jpg) repeat-x; text-align:center; line-height:21px;border:1px solid #BEC8D4;}
.content td{border:1px solid #BEC8D4;padding:0 2px;}
.content .odd{ background-color:#FFFFFF; }
.content .even{ background-color:#F1F1F1;}
.content .selected{ background-color:#FBFFDA; }
.content .hover{ background-color:#D3DAE2;}
</style>

<script language="javascript">
	function $d(id) {
		return document.getElementById(id);
	}
	var JQ = jQuery.noConflict();
	function clearPrice()
	{
		JQ("#entrust_price_rose").val("");
		JQ("#entrust_amount_rose").val("");
		JQ("#entrust_price_drop").val("");
		JQ("#entrust_amount_drop").val("");
	}
	function radio_click(stock_code, remain_amount, entrust_price,trade_dir) {
		var tmp_dir2 = JQ("#trade_dir").val();
		var tmp_dir = "trade_" + trade_dir;
		var max_amount_1001 = JQ("#canuse_balance_1001").val();
		var max_amount_1002 = JQ("#canuse_balance_1002").val();
		if(tmp_dir != tmp_dir2)
		{
			clearPrice();
		}	
		if(trade_dir == "in") {
			JQ("#trade_dir").val("trade_in");				
		}
		if(trade_dir == "out") {
			JQ("#trade_dir").val("trade_out");			
		}
		var amount_select = 0;
		if(stock_code == 1001) {
			JQ("#entrust_price_rose").val(entrust_price);
			JQ("#entrust_amount_rose").val(remain_amount);
			amount_select =JQ("#entrust_amount_rose").val(); 
			JQ("#rose").val(trade_dir);	
		}
		if(stock_code == 1002) {
			JQ("#entrust_price_drop").val(entrust_price);
			JQ("#entrust_amount_drop").val(remain_amount);
			amount_select = JQ("#entrust_amount_drop").val(); 
			JQ("#drop").val(trade_dir);
		}
		change_dir();
		
		//转出时
		if(JQ("#trade_dir").val() == "trade_out")
		{	if(stock_code == 1001){
			if(max_amount_1001<remain_amount){
			JQ("#entrust_amount_rose").val(max_amount_1001);
			}}
			if(stock_code == 1002){
			if(max_amount_1002<remain_amount){
			JQ("#entrust_amount_drop").val(max_amount_1002);
			}}
		}
		//计算最大可买
		if(JQ("#trade_dir").val() == "trade_in")
		{
			if(stock_code == 1002) {
				var canuse_balance = JQ("#canuse_balance").val();
				var max_amount_drop = Math.floor(canuse_balance / JQ("#entrust_price_drop").val() / 1000) * 1000;
				JQ("#max_amount_drop").text(max_amount_drop);
				if(max_amount_drop<remain_amount){
				JQ("#entrust_amount_drop").val(max_amount_drop);
				}
			}
			if(stock_code == 1001) {
				var canuse_balance = JQ("#canuse_balance").val();
				var max_amount_rose = Math.floor(canuse_balance / JQ("#entrust_price_rose").val() / 1000) * 1000;
				JQ("#max_amount_rose").text(max_amount_rose);
				if(max_amount_rose<remain_amount){
				JQ("#entrust_amount_rose").val(max_amount_rose);
				}
			}
		}
		//获取最小委托的数量
		var amount_max_rose = parseInt(JQ("#max_amount_rose").text());
		var amount_max_drop = parseInt(JQ("#max_amount_drop").text());
		var amount_rose = parseInt(JQ("#entrust_amount_rose").val());
		var amount_drop = parseInt(JQ("#entrust_amount_drop").val());
		var real_amount = 0;
		if(isNaN(amount_max_rose) || isNaN(amount_max_drop) || isNaN(amount_rose) || isNaN(amount_drop))
		{
				
		}
		else
		{
			real_amount = Math.min(amount_max_rose,amount_max_drop,amount_rose,amount_drop);
			JQ("#entrust_amount_drop").val(real_amount);
			JQ("#entrust_amount_rose").val(real_amount);
		}
		
	}
	
	//当下拉框的交易方向发生变化
	var checkdir=true;
	function change_dir(org_type) {		
		if(checkdir){
		JQ("#trade_dir option[index='0']").remove(); 
		checkdir=false;
		}
		var trade_dir = JQ("#trade_dir").val();		
		var max_amount_1001;
		var max_amount_1002;
		
		var frist_out_entrust_price_rose=JQ("#frist_out_entrust_price_rose").val();
		var frist_out_remain_amount_rose=JQ("#frist_out_remain_amount_rose").val();
		var frist_in_entrust_price_rose=JQ("#frist_in_entrust_price_rose").val();
		var frist_in_remain_amount_rose=JQ("#frist_in_remain_amount_rose").val();
		
		var frist_out_entrust_price_drop=JQ("#frist_out_entrust_price_drop").val();
		var frist_out_remain_amount_drop=JQ("#frist_out_remain_amount_drop").val();
		var frist_in_entrust_price_drop=JQ("#frist_in_entrust_price_drop").val();
		var frist_in_remain_amount_drop=JQ("#frist_in_remain_amount_drop").val();
		
		if(isNaN(frist_out_entrust_price_rose)){frist_out_entrust_price_rose=0;}
		if(isNaN(frist_out_remain_amount_rose)){frist_out_remain_amount_rose=0;}
		if(isNaN(frist_in_entrust_price_rose)){frist_in_entrust_price_rose=0;}
		if(isNaN(frist_in_remain_amount_rose)){frist_in_remain_amount_rose=0;}
		
		if(isNaN(frist_out_entrust_price_drop)){frist_out_entrust_price_drop=0;}
		if(isNaN(frist_out_remain_amount_drop)){frist_out_remain_amount_drop=0;}
		if(isNaN(frist_in_entrust_price_drop)){frist_in_entrust_price_drop=0;}
		if(isNaN(frist_in_remain_amount_drop)){frist_in_remain_amount_drop=0;}
		var h_max_amount_rose_drop=0;
		//转入
		if(trade_dir == "trade_in")
		{
			
			JQ("#max_amount_rose_title").html("看涨约可转数:");
			JQ("#max_amount_drop_title").html("看跌约可转数:");
			JQ("#entrust_amount_drop_title").html("看跌转入数量(份):");
			JQ("#entrust_amount_rose_title").html("看涨转入数量(份):");
			
			if(org_type=="yes"){
			JQ("#entrust_price_rose").val(frist_out_entrust_price_rose);
			JQ("#entrust_price_drop").val(frist_out_entrust_price_drop);
			
			var canuse_balance = JQ("#canuse_balance").val();
			
			var entrust_price_rose_com=JQ("#entrust_price_rose").val();
			var entrust_price_drop_com=JQ("#entrust_price_drop").val();
			if(entrust_price_rose_com!="" && entrust_price_drop_com!="" && !isNaN(entrust_price_rose_com) && !isNaN(entrust_price_drop_com)){
			
			h_max_amount_rose_drop = Math.floor(canuse_balance/(new Number(entrust_price_rose_com)+new Number(entrust_price_drop_com))/ 1000) * 1000;
			var real_amount= Math.min(h_max_amount_rose_drop,frist_out_remain_amount_rose,frist_out_remain_amount_drop);
			JQ("#entrust_amount_drop").val(real_amount);
			JQ("#entrust_amount_rose").val(real_amount);
			}
			}
			
			
			checkRosePrice();
			checkDropPrice();
			
		}
		//转出
		else
		{
			max_amount_1001 = JQ("#canuse_balance_1001").val();
			max_amount_1002 = JQ("#canuse_balance_1002").val();
			if(org_type=="yes"){
			JQ("#entrust_price_rose").val(frist_in_entrust_price_rose);
			JQ("#entrust_price_drop").val(frist_in_entrust_price_drop);
			
			var real_amount= Math.min(max_amount_1001,max_amount_1002,frist_in_remain_amount_rose,frist_in_remain_amount_drop);
			JQ("#entrust_amount_rose").val(real_amount);
			JQ("#entrust_amount_drop").val(real_amount);
			
			}
			
			JQ("#max_amount_rose_title").html("看涨约可转数:");
			JQ("#max_amount_drop_title").html("看跌约可转数:");
			JQ("#entrust_amount_drop_title").html("看跌转出数量(份):");
			JQ("#entrust_amount_rose_title").html("看涨转出数量(份):");
			
			
			JQ("#max_amount_rose").text(max_amount_1001);
			JQ("#max_amount_drop").text(max_amount_1002);
		}		
	}	
		
	//查看看张委托价格是否合法
	function checkRosePrice()
	{
		chgPrice();
		var entrust_price_rose = JQ("#entrust_price_rose").val();	
		var trade_dir = JQ("#trade_dir").val();	
		if(entrust_price_rose == "" && trade_dir == "trade_in")
		{
			JQ("#max_amount_rose").text("----");
			return false;
		}
		if(entrust_price_rose == 0 && trade_dir == "trade_in")
		{
			JQ("#max_amount_rose").text("----");
			return false;
		}		
		if(isNaN(entrust_price_rose))
		{
			alert("转换比例必须为数字！");
			JQ("#entrust_price_rose").val(JQ("#min_entrust_price_Rose").val());
			return false;
		}
		entrust_price_rose = parseFloat(entrust_price_rose);
		var tmp_max = JQ("#max_entrust_price_Rose").val();
		var tmp_min = JQ("#min_entrust_price_Rose").val();
		var max_entrust_price_Rose = parseFloat(tmp_max);
		var min_entrust_price_Rose = parseFloat(tmp_min);
		var min_price_scope_rose=JQ("#min_entrust_price_Rose").val();
		var max_price_scope_rose=JQ("#max_entrust_price_Rose").val();
		if(entrust_price_rose > max_entrust_price_Rose|| entrust_price_rose < min_entrust_price_Rose)
		{
			alert("申报转换比例非法,必须在："+min_price_scope_rose+"与"+max_price_scope_rose+"之间");
			return false;
		}
		
		var valid_price = 0;
		var one_price = 0;
		if(JQ("#trade_dir").val() == "trade_in" ) {
			valid_price = parseFloat(JQ("#valid_entrust_1001_buy").val());
			one_price = parseFloat(JQ("#one_entrust_1001_sell").val());
			if(entrust_price_rose  > valid_price && entrust_price_rose > one_price)
			{
				alert("该转换比例可能会造成您资金账户的不必要损失，请重新检查转换比例!");
				return false;
			}
		}		
		if(JQ("#trade_dir").val() == "trade_out" ) {
			valid_price = parseFloat(JQ("#valid_entrust_1001_sell").val());
			one_price = parseFloat(JQ("#one_entrust_1001_buy").val());
			if(entrust_price_rose  < valid_price && entrust_price_rose < one_price)
			{
				alert("转换比例可能会造成您资金账户的不必要损失，请重新检查转换比例!");	
				return false;
			}
		}		
		if(trade_dir == "trade_in")
		{
			var canuse_balance = JQ("#canuse_balance").val();
			var max_amount_rose = Math.floor(canuse_balance / entrust_price_rose / 1000) * 1000;
			JQ("#max_amount_rose").text(max_amount_rose);
			//sj添加
			var canuse_balance = JQ("#canuse_balance").val();
			var entrust_price_rose_com=JQ("#entrust_price_rose").val();
			var entrust_price_drop_com=JQ("#entrust_price_drop").val();
			if(entrust_price_rose_com!="" && entrust_price_drop_com!="" && !isNaN(entrust_price_rose_com) && !isNaN(entrust_price_drop_com)){
			var h_max_amount_rose_drop = Math.floor(canuse_balance/(new Number(entrust_price_rose_com)+new Number(entrust_price_drop_com))/ 1000) * 1000;
			JQ("#max_amount_rose").text(h_max_amount_rose_drop);
			JQ("#max_amount_drop").text(h_max_amount_rose_drop);
			}
			//sj添加结束		
			
		}
		return true;
	}
	
	//查看看跌委托价格是否合法
	function checkDropPrice()
	{		
		chgPrice();
		var entrust_price_drop = JQ("#entrust_price_drop").val();
		var trade_dir = JQ("#trade_dir").val();	
		if(entrust_price_drop == "" && trade_dir == "trade_in")
		{
			JQ("#max_amount_drop").text("----");
			return false;
		}
		//sj添加
		if(entrust_price_drop ==0 && trade_dir == "trade_in")
		{
			JQ("#max_amount_drop").text("----");
			return false;
		}
		//sj添加结束		
		if(isNaN(entrust_price_drop))
		{
			alert("转换比例必须为数字！");
			JQ("#entrust_price_drop").val(JQ("#min_entrust_price_drop").val());
			return false;
		}
		entrust_price_drop = parseFloat(entrust_price_drop);
		var tmp_max = JQ("#max_entrust_price_Drop").val();
		var tmp_min = JQ("#min_entrust_price_Drop").val();
		var max_entrust_price_Drop = parseFloat(tmp_max);
		var min_entrust_price_Drop = parseFloat(tmp_min);
		var min_price_scope_Drop=JQ("#min_entrust_price_Drop").val();
		var max_price_scope_Drop=JQ("#max_entrust_price_Drop").val();
		if(entrust_price_drop > max_entrust_price_Drop || entrust_price_drop < min_entrust_price_Drop)
		{
			alert("申报转换比例非法,必须在："+min_price_scope_Drop+"与"+max_price_scope_Drop+"之间");
			return false;
		}
		
		var valid_price = 0;
		var one_price = 0;
		if(JQ("#trade_dir").val() == "trade_in" ) {
			valid_price = parseFloat(JQ("#valid_entrust_1002_buy").val());
			one_price = parseFloat(JQ("#one_entrust_1002_sell").val());
			if(entrust_price_drop  > valid_price && entrust_price_drop  > one_price)
			{
				alert("该转换比例可能会造成您资金账户的不必要损失，请重新检查转换比例!");
				return false;
			}
		}		
		if(JQ("#trade_dir").val() == "trade_out" ) {
			valid_price = parseFloat(JQ("#valid_entrust_1002_sell").val());
			one_price = parseFloat(JQ("#one_entrust_1002_buy").val());
			if(entrust_price_drop  < valid_price && entrust_price_drop  < one_price)
			{
				alert("该转换比例可能会造成您资金账户的不必要损失，请重新检查转换比例!");	
				return false;
			}
		}
		if(trade_dir == "trade_in")
		{
			var canuse_balance = JQ("#canuse_balance").val();
			var max_amount_drop = Math.floor(canuse_balance / entrust_price_drop / 1000) * 1000;
			JQ("#max_amount_drop").text(max_amount_drop);
			//sj添加
			var canuse_balance = JQ("#canuse_balance").val();
			var entrust_price_rose_com=JQ("#entrust_price_rose").val();
			var entrust_price_drop_com=JQ("#entrust_price_drop").val();
			if(entrust_price_rose_com!="" && entrust_price_drop_com!="" && !isNaN(entrust_price_rose_com) && !isNaN(entrust_price_drop_com)){
			var h_max_amount_rose_drop = Math.floor(canuse_balance/(new Number(entrust_price_rose_com)+new Number(entrust_price_drop_com))/ 1000) * 1000;
			JQ("#max_amount_drop").text(h_max_amount_rose_drop);
			JQ("#max_amount_rose").text(h_max_amount_rose_drop);
			}
			//sj添加结束	
		}
		
		return true;
	}
	function doreset()
	{		
		JQ("#entrust_price_rose").val("");
		JQ("#entrust_amount_rose").val("");
		JQ("#entrust_price_drop").val("");
		JQ("#entrust_amount_drop").val("");
	}
	
	//提交表单
	function dosubmit()
	{
		if(JQ("#trade_dir").val()=="def")
		{
		alert("【转换方向】未选择！");
		return;
		}
		var strMsg = "";
		strMsg += checkValid("entrust_price_rose", "看涨转换比例", "NotEmpty");
		strMsg += checkValid("entrust_amount_rose", "看涨转换数量", "NotEmpty");
		strMsg += checkValid("entrust_price_drop", "看跌转换比例", "NotEmpty");
		strMsg += checkValid("entrust_amount_drop", "看跌转换数量", "NotEmpty");		
		strMsg += checkValid("entrust_price_rose", "看涨转换比例", "NumberFloat");
		strMsg += checkValid("entrust_amount_rose", "看涨转换数量", "Numeric");
		strMsg += checkValid("entrust_price_drop", "看跌转换比例", "NumberFloat");
		strMsg += checkValid("entrust_amount_rose", "看跌转换数量", "Numeric");
		strMsg += checkValid("client_id", "客户编号", "NotEmpty");
		if(strMsg != "")
		{
			alert(strMsg);
			return;
		}		
		//查看委托价格是否合法
		var entrust_price_rose = JQ("#entrust_price_rose").val();
		var entrust_price_drop = JQ("#entrust_price_drop").val();
		var min_entrust_price = "";
		var max_entrust_price = "";
		
		//查看委托数量是否合法
		var entrust_amount_rose = JQ("#entrust_amount_rose").val();
		var entrust_amount_drop = JQ("#entrust_amount_drop").val();
		if((entrust_amount_rose == 0) || (entrust_amount_drop == 0))
		{
			alert("转换数量不得为0!");
			return;
		}	
		if(((entrust_amount_rose % 1000) != 0) || ((entrust_amount_drop % 1000) != 0))
		{
			alert("转换数量必须为1000的整数倍!");
			return;
		}		
		
         //判断是否为看涨看跌同时转入或者看涨看跌同时转出  用于套利模式
		var rose = JQ("#rose").val();
		var drop = JQ("#drop").val();		
		/*if(rose != drop)
		{
			alert("只能同时购买转入份额或者转出份额");	
			return false;  
		}*/
		var msg = "";
		var total = 0;
		
		if(JQ("#trade_dir").val() == "trade_in")
		{
			msg = "转入看涨份额"  + entrust_amount_rose + "份，转换比例：" + entrust_price_rose + "元\r\n";
			msg += "转入看跌份额"  + entrust_amount_drop + "份，转换比例：" + entrust_price_drop + "元\r\n\r\n";
			total = entrust_amount_rose * entrust_price_rose + entrust_amount_drop * entrust_price_drop;
			var canuse_balance = Number(${data.canuse_balance});
			if(total > canuse_balance)
			{
				alert("可用现金余额不足！")
				return;
			}
			
		}
		else if(JQ("#trade_dir").val() == "trade_out")
		{
			msg = "转出看涨份额"  + entrust_amount_rose + "份，转换比例：" + entrust_price_rose + "元\r\n";
			msg += "转出看跌份额"  + entrust_amount_drop + "份，转换比例：" + entrust_price_drop + "元\r\n\r\n";
			var max_amount_rose = Number(JQ("#canuse_balance_1001").val());
			var max_amount_drop = Number(JQ("#canuse_balance_1002").val())
			if( (max_amount_rose < entrust_amount_rose) || (max_amount_drop < entrust_amount_drop))
			{
				alert("超过最大可转数量！");
				return;
			}
		}
		if(checkDropPrice() && checkRosePrice())
		{
			if(!confirm(msg + "            确定交易?")){
				 return;
			};
			JQ("#buyForm").submit();
		}
	}
	//将转换比例变成小数点后三位
	function chgPrice()
	{
		var strMsg = "";
		strMsg += checkValid("entrust_price_rose", "看涨转换比例", "NotEmpty");
		if(strMsg != "")
		{
			return;
		}
		var entrust_price_rose = JQ("#entrust_price_rose").val().trim();
		if(isNaN(entrust_price_rose))
		{
			return;
		}
		entrust_price_rose = Math.round(entrust_price_rose * 1000) / 1000;
		JQ("#entrust_price_rose").val(entrust_price_rose);
		
		strMsg = "";
		strMsg += checkValid("entrust_price_drop", "看跌转换比例", "NotEmpty");
		if(strMsg != "")
		{
			return;
		}
		var entrust_price_drop = JQ("#entrust_price_drop").val().trim();
		if(isNaN(entrust_price_drop))
		{
			return;
		}
		entrust_price_drop = Math.round(entrust_price_drop * 1000) / 1000;
		JQ("#entrust_price_drop").val(entrust_price_drop);		
	}
</script>

<script language="javascript">
Ext.onReady(function() {
	Ext.QuickTips.init();
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
				title:"双向申报",
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
								bodyBorder:true,
								border:false,
								contentEl:'stockBox'
						}
						,
						{
						xtype:"tabpanel",
						activeTab:0,
						deferredRender : true,
						width:730,
						bodyBorder:true,
						border:false,
						height:260,
						items:[
							{
								title:"转换申报信息",
								style:"background-color:#DFE8F6;",
								contentEl:'DoublebsEntrust'
							},
							{
								xtype:"panel",
								style:"background-color:#DFE8F6;",
								title:"大盘行情",
								//autoLoad:{ 
								  //  url:'http://flash.gf.com.cn/indexes/indexes.php?width=720&height=250', 
								  //  scripts:true 
								//}
								contentEl:"hqIframes"
							}
						]
						}, 
						{
						xtype:"tabpanel",
						activeTab:1,
						bodyBorder:true,
						border:false,
						deferredRender : true,
						colspan:2,
						width:Ext.get("info").getWidth()-20,
						height : 95,
						style : " margin-top:5px; margin-left:3px;  margin-bottom:3px; margin-right:13px; float:left;",
						items:[
							{
								xtype:"panel",
								contentEl:'contentBox1',
								title:"当日申报",
								bodyBorder:true,
								border:false
								
							},
							{
								xtype:"panel",
								title:"产品持仓",
								autoScroll:true,
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
				]});
		
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
</head>
<body style="background-color: white; margin-left:3px; margin-top:4px;" >
	<script>
	  	var errorMsg="${errorMsg2}";
	  	if(errorMsg!=""){
	  		alert(errorMsg);
	  	}
	</script>
	<input type="hidden" id="hs300_price_init" value="${hs300_price_init }"/>
	<input type="hidden" name="canuse_balance" id="canuse_balance"
		value="${data.canuse_balance}" />
	<div id="info" style="width:816; height:453;">
			<div  class="x-hide-display"  id="stockBox" style="width: 100%;height: 100%;">
					<form name="buyForm" id="buyForm"	action="/nxsyBSAction.do?method=Doublebuy" method="post">
					    <input type="hidden" value="" id="rose">
					    <input type="hidden" value="" id="drop">
					<table   cellspacing="6" style="font-size: 12px; width: 100%; height: 100%;">
						<tbody>
							<tr>
								<td style="width:100px;" align="right" >客户编号:</td>
								<td >
									<div id="dclient_id">${data.client_id }</div></td>
									<input type="hidden" name="client_id" id="client_id" value="${data.client_id }"/>
							</tr>
							<tr>
								<td align="right">转换方向:</td>
								<td>
                                            <select  style="width:100px;" id="trade_dir" name="trade_dir"
									onchange="change_dir('yes')" >
									<option value="def" style="color: gray;">选择</option>
										<option value="trade_in">转入</option>
										<option value="trade_out">转出</option>
								</select>
                                            </td>
								
							</tr>											
							<tr>
								<td align="right">看涨转换比例:</td>
								<td>
								<input style="width:100px;" type="text" tabindex="2" size="8"
									id="entrust_price_rose" name="entrust_price_rose"
									onblur="checkRosePrice()"> 
								</td>
							</tr>
							
							<tr>
								<td ><div id="max_amount_rose_title" align="right">看涨约可转数:</div></td>
								<td>
									<div id="max_amount_rose" >----</div>
									</td>
							</tr>
							<tr>
								<td ><div id="entrust_amount_rose_title" align="right">看涨转入数量(份):</div></td>
								<td><input style="width:100px;" type="text" tabindex="3" size="11"
									id="entrust_amount_rose" name="entrust_amount_rose"></td>
							</tr>
							<tr>
								<td align="right">看跌转换比例:</td>
								<td>
								<input style="width:100px;" type="text" tabindex="2" size="8"
									id="entrust_price_drop" name="entrust_price_drop"
									onblur="checkDropPrice()">  
								</td>
							</tr>
							<tr>
								<td ><div id="max_amount_drop_title" align="right">看跌约可转数:</div></td>
								<td>
									<div id="max_amount_drop" >----</div>
									</td>
							</tr>
							<tr>
								<td ><div id="entrust_amount_drop_title" align="right">看跌转入数量(份):</div></td>
								<td><input style="width:100px;" type="text" tabindex="3" size="11"
									id="entrust_amount_drop" name="entrust_amount_drop"></td>
							</tr>	
							<tr>
								<td align="right">可用母份额:</td>
								<td><div id="fundav">${data.canuse_balance}元</div>
								</td>
							</tr>
																	
							<tr>
								<td align="center" height="25px;" colspan="2"><input
									type="button" value="重&nbsp;&nbsp;置" class="button4"
									onClick="doreset()">&nbsp;&nbsp;&nbsp;&nbsp; <input
									type="button" value="确&nbsp;&nbsp;认" class="button4"
									onClick="dosubmit()">
									<a href=JavaScript:;><img style="margin-left:10px; margin-top:3px;  " src="${ctx }/match/nxsy/mncg/skin/default/pic/jsq.png" alt="估值换算器" onclick="OpenDiv(390,300)" /></a>
								</td>

							</tr>
						</tbody>
					</table>
					</form>
			</div>
			<div  class="x-hide-display"  id="DoublebsEntrust" style="margin-top: 5px;">
							<jsp:include page="stock/DoublebsEntrust.jsp"></jsp:include>
			</div>	
			<!-- 大盘行情 -->
			<iframe id="hqIframes" name="hqIframes"  class="x-hide-display" style="height: 250px; margin-top: 3px;"
									src="http://flash.gf.com.cn/indexes/indexes.php?width=720&height=250"
									 marginWidth="0"
									marginHeight="0" frameBorder="0" noresize width="100%"
									scrolling="no"></iframe>
			<!-- 产品持仓 -->	
			<div  class="x-hide-display" id="contentBox2" style="height: 90px;">
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
			<!-- 当日申报 -->
			
			<iframe class="x-hide-display"  id="contentBox1"  style="margin-bottom: 10px;margin-top: -15px;margin-left: -3px;"
								src="${ctx }/nxsyQueryAction.do?method=listEntrust&numPerPage=2&chooseSuburl='yes'"
								 marginWidth="0" marginHeight="0"
								frameBorder="0"  width="100%" scrolling="no"></iframe>
			<!-- 当日转换 -->					
			<iframe id="contentBox3" class="x-hide-display" style="margin-bottom: 10px;margin-top: -15px;margin-left: -3px;"
								src="${ctx }/nxsyQueryAction.do?method=listDeliver&numPerPage=2&chooseSuburl='yes'"
								 marginWidth="0" marginHeight="0"
								frameBorder="0"  width="100%" scrolling="no"></iframe>
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
 //第一次载入页面时刷新数据
	refreshH();     
	refreshDT(1001);
	setInterval(refreshH,5000);
	setInterval(refreshDT,5000);
	</script>
</html>