<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ page contentType="text/html; charset=UTF-8" language="java"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${contextPath }/js/jsIfUtils.js"></script>
<link rel="stylesheet" type="text/css" 	href="${contextPath }/css/infoCenter/aip/jjdt.css" media="all" />
<script src="${ctx }/financing/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
<script type="text/javascript"	src="${ctx }/commons/js/commons.js"></script>
<script src="${ctx }/js/jquery.js" type="text/javascript"></script>
<script type="text/javascript">
	function getRadio(event){
		var e = event.srcElement ? event.srcElement : event.target; 
	
		if(e.type=="radio")
		{
			$("#a").removeAttr("readonly");
			$("#a").css('backgroundColor','#ffffff'); 
			$("#b").removeAttr("readonly");
			$("#b").css('backgroundColor','#ffffff'); 
			$("#i").removeAttr("readonly");
			$("#i").css('backgroundColor','#ffffff'); 
			$("#n").removeAttr("readonly");
			$("#n").css('backgroundColor','#ffffff'); 
			$("#m").removeAttr("readonly");
			$("#m").css('backgroundColor','#ffffff'); 
			var v = e.value;
			if(v == "a")
			{
				$("#a").val("");
				$("#a").attr("readonly","readonly");
				$("#a").css('backgroundColor','#D3D3D3'); 
			}
			if(v == "b")
			{
				$("#b").val("");
				$("#b").attr("readonly","readonly");
				$("#b").css('backgroundColor','#D3D3D3'); 
			}
			if(v == "i")
			{
				$("#i").val("");
				$("#i").attr("readonly","readonly");
				$("#i").css('backgroundColor','#D3D3D3'); 
			}
			if(v == "n")
			{
				$("#n").val("");
				$("#n").attr("readonly","readonly");
				$("#n").css('backgroundColor','#D3D3D3'); 
			}
			if(v == "m")
			{
				$("#m").val("");
				$("#m").attr("readonly","readonly");
				$("#m").css('backgroundColor','#D3D3D3'); 
			}
			
		}
		else
		{
			
		}
	}
	function test() {
		var m = 135999.24397096067, a = 1000, b = 10000, i = 0.08, n = 800;
		//alert(calcM(a,b,i,n));
		m = 148340.79227882315;
		alert(calcM(a, b, i, n));
	}
	function log(a, b) {
		return Math.log(b) / Math.log(a);
	}

	function calcM(a, b, i, n) {
		var k = 1 + i / 12;
		return b * Math.pow(k, n) + a * k * (Math.pow(k, n) - 1) / (k - 1);
	}

	function calcA(b, i, n, m) {
		var k = 1 + i / 12;
		return (m - b * Math.pow(k, n)) * (k - 1) / k / (Math.pow(k, n) - 1);
	}

	function calcB(a, i, n, m) {
		var k = 1 + i / 12;
		return (m - a * k * (Math.pow(k, n) - 1) / (k - 1)) / Math.pow(k, n);
	}

	function calcI(a, b, n, m) {
		var big = 100, small = -1, mid = 0;
		var id = 0;
		while (id++ < 100) {
			mid = (big + small) / 2;
			m_mid = calcM(a, b, mid, n);
			if (m_mid == m) {
				break;
			}
			if (m_mid > m) {
				big = mid;
			} else {
				small = mid;
			}
		}
		return mid;
	}

	function calcN(a, b, i, m) {
		var k = 1 + i / 12;
		var small = 1, big = 1000000, mid = 0;
		var m_mid = 0;
		var id = 0;
		while (id++ < 100) {
			mid = (big + small) / 2;
			m_mid = calcM(a, b, i, mid);
			if (m_mid == m) {
				break;
			}
			if (m_mid > m) {
				big = mid;
			} else {
				small = mid;
			}
		}
		return mid;
	}
	function showLayer1() {
		getElement('Layer1').style.display = 'none';
		getElement('ddldtr').style.display = '';
		getElement('ddlround').style.display = '';
	}

	function showColor() {
		if (!display_ceng1) {
			getElement('Layer1').style.display = 'none';
			getElement('ddldtr').style.display = '';
			getElement('ddlround').style.display = '';
		}
		if (this.value == '请输入基金代码、拼音或简称')
			this.style.color = '#acacac';
	}
	function calc()
	{
		var a = document.getElementById("a").value; //目标总额：
		var b = document.getElementById("b").value; //目标总额：
		var i = document.getElementById("i").value; //目标总额：
		var n = document.getElementById("n").value; //目标总额：
		var m = document.getElementById("m").value; //目标总额：
		var calc_type = $('input[name="calculator"]:checked').val();
		var strMsg = "";
		if(calc_type != "m")
		{
			strMsg += checkValid("m","目标总额","NotEmpty");
			strMsg += checkValid("m","目标总额","NumberFloat");
		}
		if(calc_type != "a")
		{
			strMsg += checkValid("a","每月定投金额","NotEmpty");
			strMsg += checkValid("a","每月定投金额","NumberFloat");
		}
		if(calc_type != "b")
		{
			strMsg += checkValid("b","初始投资额","NotEmpty");
			strMsg += checkValid("b","初始投资额","NumberFloat");
		}
		if(calc_type != "n")
		{
			strMsg += checkValid("n","定投期数","NotEmpty");
			strMsg += checkValid("n","定投期数","NumberFloat");
		}
		if(calc_type != "i")
		{
			strMsg += checkValid("i","投资产品年化收益率","NotEmpty");
			strMsg += checkValid("i","投资产品年化收益率","NumberFloat");
			i = i/100;
		}
		if (strMsg != "") {
			alert(strMsg);
			return;
		}
		//alert("a  " + a + "  b  "  + b + " i " + i + " m " + m + " n " + n);
		if(calc_type == "m")
		{
			$("#m").val(calcM(a,b,i,n).toFixed(2));
		}
		else if(calc_type == "a")
		{
			$("#a").val(calcA(b,i,n,m).toFixed(2));
		}
		else if(calc_type == "b")
		{
			$("#b").val(calcB(a,i,n,m).toFixed(2));
		}
		else if(calc_type == "i")
		{
			$("#i").val((calcI(a,b,n,m) * 100).toFixed(2));
		}
		else if(calc_type == "n")
		{
			$("#n").val(calcN(a,b,i,m).toFixed(2));
		}
		else
		{
			
		}
	}
</script>
<style type="text/css">
.button {
    background-color: #FF9900;
    color: #FFFFFF;
    height: 30px;
    width: 70px;
}
.reset {
    background-color: #F3F3F3;
    color: #666666;
    height: 30px;
    width: 70px;
}
</style>
</head>
<body class="">	
	<div class="body_bg">
		
		<div class="wrap_2left" style="background:none;">
			<!--左侧sied开始-->
			
			<!--左侧sied结束-->

			<!--右侧sied开始-->
			<div class="w706 fright">
				<div class="left_tit007">财富管理计算器</div>
				<div class="blank5"></div>
				<div class="schemebody calculator schemebody1">
					<div class="calculatorHead"></div>
					<div class="calculatorRadio">
					<div class="top-white"></div>
					
						<h1 style="color: rgb(204, 0, 0); font-weight: bold; margin-left: -59px;">希望计算什么</h1>
						<span onclick="getRadio(event)">  
						<input type="radio" value="m" id="calculator" name="calculator" checked/><label>计算到期的目标总额</label>			
						<input type="radio" value="a" id="calculator" name="calculator" /><label>计算月定投金额</label> <br/> 
						<input type="radio" value="i" id="calculator" name="calculator" /><label>计算达到目标的年回报率</label> 
						<input type="radio" value="b" id="calculator" name="calculator" /><label>计算目前需要的初始数额</label><br/> 
						<input type="radio" value="n" id="calculator" name="calculator" /><label>计算定投期数</label>
						</span>
					</div>					
					<div class="bottom1"></div>
					<div class="blank5"></div>
					<div class="top-white1"></div>
					<form>
					<div class="calculate calculate1">
						<ul>
							<li><label>目前拥有的初始额：</label> 
								<input id="b" name="b" type="text" style="height:20px;" />
								<div class="dis">初始额为0就是年金计算器</div>
							</li>
							<li><label>月定投金额 ：</label> 
								<input id="a" name="a"  type="text" style="height:20px;"  />
								<div class="dis">年投入额为0就是复利计算器</div>
							</li>
							<li><label>定投期数：</label>
								<input id="n" name="n"  type="text" style="height:20px;"  />
								<div class="dis"></div>
							</li>							
							<li><label>年投资回报率（%）：</label> 
								<input id="i" name="i"  type="text" style="height:20px;" />
								<div class="dis"></div></li>
							<li><label>目标总额：</label> 
								<input id="m" name="m"  type="text" style="background-color: rgb(211, 211, 211);height:20px;" readonly="readonly" />
								<div class="dis"></div>
							</li>
							<li style="border-bottom: medium none; margin-bottom: 0pt;"><label></label> 
							<input style="margin-right: 20px;" onclick="calc()" type="button" class="button" value="计算" />
								<div>
									<input type="reset" value="重置" class="reset" />
								</div></li>
						</ul>
					</div>
					</form>
					
					<div class="bottom1"></div>
				</div>
			</div>
			<!--右侧sied结束-->
			<div class="clearfloat"></div>
			<!--清除浮动-->
		</div>
		<script src="/js/setTab.js"></script>
		
	</div>
</body>
</html>














