<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<jsp:directive.page import="com.cssweb.common.util.StringHelper"/>
<jsp:directive.page import="com.cssweb.invest.service.StockQuiteService"/>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/investorEdu/investorEdu.css" rel="stylesheet" type="text/css" />
<link href="/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />

<style type="text/css">
	.bottom{border:none;
	font-weight: bold;
	background:url(${ctx}/investorEdu/images/btn.jpg)  left top no-repeat;width:120px; height:25px; color:#FFFFFF;
	font-family: Arial, Helvetica, sans-serif
	 }
	#Loading {
	position: absolute;
	width: 360px;
	z-index: 107;
	height: 216px;
			}
	.input100 {
	border: 1px solid #C3C3C3;
	width:170; height:22px;
	}
	.input101 {
	border: 1px solid #C3C3C3;
	width:80px; height:22px;
	}

	.font1 {
		font-family: Arial, Helvetica, sans-serif;
		font-size: 14px;
	}
	.font2 {
		color: #FFFFFF;
		font-weight: bold;
		font-family: Arial, Helvetica, sans-serif;
	}
	.font3 {color: #FFFFFF; font-weight: bold; font-family: Arial, Helvetica, sans-serif; font-size: 12px; }
	.font4 {font-family: Arial, Helvetica, sans-serif; font-size: 14px; }
	.risytitgdk {
    background: url("${ctx}/investorEdu/images/logo_k.jpg") no-repeat scroll 0 0 transparent;
    border-bottom: 1px solid #CCCCCC;
    font-size: 14px;
    font-weight: bold;
    height: 29px;
    line-height: 29px;
    padding-left: 35px;
}
</style>
<%
	String fund_account = (String)request.getSession().getAttribute("fund_account");
	StockQuiteService qservice = new StockQuiteService();
	String accounts = "";
	if(StringHelper.isNotEmpty(fund_account))
	{
		accounts = qservice.getStockQuick(fund_account, "", "");
	}
	String password = (String)request.getSession().getAttribute("risk_password");
%>
<script>
  	var errorMsg="${errorMsg}";
  	if(errorMsg!=""){
  		alert(errorMsg);
  	}
</script>
<script language="javascript">
	var TiYunActiveX;
	//页面加载初始化加载函数
	function onLoadLogin() {
		var appBrowerName = window.navigator.appName;
		//IE内核浏览器
		if ((appBrowerName.indexOf("Microsoft Internet Explorer") > -1)
				|| (appBrowerName.indexOf("Maxthon") > -1)) {

			if (document.getElementById('passwdId') != 'undefined') {
				//document.getElementById('password').style.
				//alert(/tttt/);
				// 设置加密选项
				document.getElementById("isActive").value = "1";
				//屏蔽默认登陆框
				document.getElementById("Spanpwd").style.display = "none";
				//设置控件密码框
				//第一次控件加载，不加入版本信息
				try {
					document.getElementById("passwdId").innerHTML = "<OBJECT ID=\"Tiyun\" codeBase=\"update.CAB\" CLASSID=\"CLSID:64B153E8-7C79-43e2-B7B8-C571E18FE027\" width=140 height=30><PARAM name=\"Width\" value=\"3400\"><PARAM name=\"EditStyle\" value=\"Convex\"><PARAM name=\"PasswordMaxLen\" value=\"12\"><PARAM name=\"ProtectColor\" value=\"#FFFFFF\"><PARAM name=\"UnProtectColor\" value=\"#FFFFFF\"><PARAM name=\"EditBkgColor\" value=\"#ffffff\"><PARAM name=\"PasswordMaxLen\" value=\"12\"></OBJECT>";
				} catch (e) {

				}
				CheckActiveX("IE");

			}
			//火狐、opera浏览器
		} else if ((appBrowerName.indexOf("Netscape") > -1)
				|| (appBrowerName.indexOf("Opera") > -1)) {
			document.getElementById("isActive").value = "1";
			document.getElementById("Spanpwd").style.display = "none";
			document.getElementById("passwdId").innerHTML = "<embed id=\"Tiyun\" name=\"Tiyun\" type=\"application/mozilla-npGF-plugin\" width=\"140\" height=\"30\">";
			//
			//document.getElementById('Tiyun').SetPassMaxLen(6);
			var userAgent = navigator.userAgent.toLowerCase();
			//Chrome浏览器
			if (userAgent.indexOf("chrome") > -1) {
				CheckActiveX("Chrome");
			} else {
				try {
					document.getElementById('Tiyun').SetPassMaxLen(6);
					document.getElementById('authcode').SetPassMaxLen(6);
				} catch (e) {

				}
				//firefox、opera浏览器
				CheckActiveX("FIREFOX");
			}
			//关闭控件输入保护
			//document.getElementById("Tiyun").SetProtectType(0);
		}
	}

	//版本更新检测,type 1为IE内核浏览器，2为firefox、opera浏览器
	function CheckActiveX(type) {
		//当前控件版本，通过该版本数字，控制控件升级
		var curVersion = 1102;
		//IE检查
		if (type == "IE") {
			try {
				// 1.查找控件是否安装
				TiYunActiveX = new ActiveXObject("npGF.Tiyun.1");

				try {
					//检测版本号

					//2.控件是否已经显示（已经显示在页面）
					var pwdActiveX = document.getElementById("Tiyun");

					var dllVersion = pwdActiveX.GetDllVersion();

					dllVersion = dllVersion.replace(/, /ig, "");

					//比较当前版本号
					if (parseInt(dllVersion) < curVersion) {
						dlActiveX(1, curVersion);
						return false;
					}
				} catch (e) {
					//为1,0,0,1老版本，提示升级(没有获取版本号的方法，因此异常)
					dlActiveX(1, curVersion);
					return false;
				}
			} catch (e) {
				//1.去查找下载的控件(控件未安装或者被禁用)
				dlActiveX(3, curVersion);
				return false;
				//检测firefox、Opera浏览器
			}
		} else if (type == "FIREFOX") {
			try {
				//查看是否有FIREFOX插件
				var pluginType = window.navigator.mimeTypes["application/mozilla-npGF-plugin"];
				if (pluginType) {
					//查看该插件是否激活
					var plugin = pluginType.enabledPlugin;
					if (plugin) {
						try {
							var pwdActiveX = document.getElementById("Tiyun");
							var dllVersion = pwdActiveX.GetDllVersion();
							//alert(dllVersion);
							dllVersion = dllVersion.replace(/, /ig, "");
							//比较当前版本号
							if (parseInt(dllVersion) < curVersion) {
								dlActiveX(2, curVersion);
								return false;
							}

						} catch (e) {
							//老版本提示升级(没有获取版本号的方法，因此异常)
							// dlActiveX(2,curVersion);
							return false;
						}
					} else {
						//插件被禁用
						alert("插件已被禁用，请手动启用插件");
					}
				} else {
					//没有安装插件，需要下载安装包
					dlActiveX(4, curVersion);
				}
			} catch (e) {
				//没有安装插件，需要下载安装包
				dlActiveX(4, curVersion);
			}
			//Chrome浏览器
		} else if (type == "Chrome") {
			alert("目前不支持chrome浏览器，请使用ie或者firefox");
			return true;
			try {
				var pwdActiveX = document.getElementById("Tiyun");
				alert(pwdActiveX);
				var dllVersion = pwdActiveX.GetDllVersion();
				alert(dllVersion);
				dllVersion = dllVersion.replace(/, /ig, "");
				//比较当前版本号
				if (parseInt(dllVersion) < curVersion) {
					dlActiveX(2, curVersion);
					return false;
				}

			} catch (e) {
				//没有安装控件
				//dlActiveX(4, curVersion);
				return false;
			}
		}
		return true;
	}

	function dlActiveX(p, version) {
		//IE内核浏览器有两种方式更新、firefox只有下载EXE安装
		//1、通过 codeBase="update.CAB#version=1,1,0,5"控制版本信息，直接页面更新
		//2、通过下载exe下载更新，请确定使用哪种方式更新
		if (p == 1) {
			return;
			//IE内核
			if (confirm("您安装的安全控件版本有更新，请确定是否更新?")) {
				//document.getElementById("passwdId").innerHTML = "<a href=\"images/setup.exe\" target=\"_blank\">安全控件更新下载</a>";
				document.getElementById("passwdId").innerHTML = "<OBJECT ID=\"Tiyun\" codeBase=\"${ctx}/gsMatch/images/update.CAB#version="+version+"\" CLASSID=\"CLSID:64B153E8-7C79-43e2-B7B8-C571E18FE027\" width=98 height=24><PARAM name=\"Width\" value=\"1800\"><PARAM name=\"EditStyle\" value=\"Convex\"><PARAM name=\"ProtectColor\" value=\"#0000FF\"><PARAM name=\"UnProtectColor\" value=\"#00FF00\"><PARAM name=\"EditBkgColor\" value=\"#ffffff\"></OBJECT>";
			}

		} else if (p == 2) {
			return;
			//firefox 内核
			if (confirm("您安装的安全控件版本有更新，请确定是否更新?")) {
				document.getElementById("passwdId").innerHTML = "<a href=\"${ctx}/gsMatch/update.exe\" target=\"_blank\">安全控件更新下载</a>";
			}
			//IE内核安装
		} else if (p == 3) {
			document.getElementById("passwdId").innerHTML = "<a href=\"${ctx}/gsMatch/setup.exe\" target=\"_blank\">安全控件下载</a>";
		} else if (p == 4) {
			document.getElementById("passwdId").innerHTML = "<a href=\"${ctx}/gsMatch/setup.exe\" target=\"_blank\">安全控件下载</a>";
		} else {
		}

	}
</script>
<script language="javascript">
	var checkreurn=0;
	function reloadcode(){
		var verify=document.getElementById('captchaImage');
		verify.setAttribute('src','${ctx}/share/verifyCodeImage.jsp?'+Math.random());
	}
	function chkall()
	{
		var form = document.getElementById('loginForm');
		for (var i=0;i<form.elements.length;i++){
			var e = form.elements[i];
			if(e.type== 'checkbox')
			{
				e.checked = true;
			}
		}
	}
	function getStockAccount()
	{
		var form = document.getElementById('loginForm');
		var stock_account="";//获得股东卡
		for (var i=0;i<form.elements.length;i++){
			var e = form.elements[i];
			if (e.checked==true && e.type=='checkbox'){
				stock_account+=e.value+",";
			}
		}
		return stock_account;
	}
	function checkreurnf(msg,form){
		var stock_account="";//获得股东卡
		for (var i=0;i<form.elements.length;i++){
			var e = form.elements[i];
			if (e.checked==true && e.type=='checkbox'){
				stock_account+=e.value+",";
			}
		}
		stock_account=stock_account.substring(0,stock_account.length-1);
		if(msg==1){
			var login_type = "1";
			var btn_name = $d("btn_login").value;
			if(btn_name =="点击登录")
			{
				login_type = "2";
			}
			form.action="${ctx}/invest/web/StockQuiteAction.go?function=SignAgreement&type=quitRisk&stock_account="+stock_account+"&login_type="+login_type;
			form.submit();
		}else{
			window.alert("验证码输入有误！");
		}
	}
	//用于验证登陆
	function checkLogin(form){
		var verifyCode = document.getElementById("verifyCode").value;
		var client_id = document.getElementById("client_id").value;
		if (client_id == "") {
			alert("请输入客户编号！");
			document.getElementById("client_id").value = "";
			document.getElementById("client_id").focus();
			return false;
		}
		if (client_id.length != 12) {
			alert("请输入12位客户编号！");
			document.getElementById("client_id").value = "";
			document.getElementById("client_id").focus();
			return false;
		}

		//判断是否已使用控件
		var isActive = document.getElementById("isActive").value;
		if (isActive == "1") {
			//获取密码
			document.getElementById("password").value = document.getElementById("Tiyun").GetPassword();
				//获取mac地址
			document.getElementById("mac").value = document.getElementById(
					"Tiyun").GetActiveNIC();
		}
		var password = document.getElementById("password").value;
		if(password==""){
			alert("交易密码不能为空！");
			document.getElementById("password").value = "";
			document.getElementById("password").focus();
			return false;
		}
		if (verifyCode == "") {
			alert("验证码不能为空！");
			document.getElementById("verifyCode").value = "";
			document.getElementById("verifyCode").focus();
			return false;
		}
		if (verifyCode.length != 4) {
			alert("验证码应该是4位！");
			document.getElementById("verifyCode").value = "";
			document.getElementById("verifyCode").focus();
			return false;
		}
		var url = '${ctx}/invest/web/StockQuiteAction.go?function=CheckVerifyCode&verifyCode=' + verifyCode;
		$.ajax({
		type : "post",
		url : url,
		success : function(msg) {
			checkreurnf(msg,form);
		},
		error : function(msg) {
			checkreurnf(msg,form);
		}
	});
	}

</script>
<style>
	#Loading {
		position: absolute;
		width: 352px;
		z-index: 107;
		border: 1px solid #C6C7CB;
		background-color: #FFFFFF;
	}
</style>
<script language=JavaScript>
	function $d(id) {
		return document.getElementById(id);
	}
	function OpenDiv(form,status)
	{
		var btn_name = $d("btn_login").value;
		if(btn_name =="同意签署")
		{
			var stock_account = getStockAccount();
			if(stock_account == "")
			{
				alert("请选择需要签署协议的股东卡");
				return;
			}
		}
		//如果session中已经存有密码  不需要再次弹出密码框
		var chk_pwd ="";
		if(status=='submit'){
		 chk_pwd=$d("chk_pwd").value;
		if(chk_pwd == "1")
		{
			form.action="${ctx}/invest/web/StockQuiteAction.go?function=SignAgreement&type=quitRisk&stock_account="+stock_account+"&login_type=3";
			form.submit();
			return;
		}
		}
		var contdiv = document.getElementById("Loading");
		formatShadeDiv();
        showCont(contdiv);
        contdiv.focus();
	}
	function Lock_CheckForm() {
		$d("Loading").style.display = 'none';
		$d("divshade").style.display = 'none';
	}
	////

//规范出现位置
function showCont(cont)
{
    var sWidth, sHeight;
    sWidth = $(document).width();
    sHeight=$(document).height();
    cont.style.display = "";
    var divtop = $(document).scrollTop() + ($(window).height() - $(cont).height()) / 2;
    var divleft = $(document).scrollLeft() + ($(window).width() - $(cont).width()) / 2;
    cont.style.top=divtop+"px";
    cont.style.left=divleft+"px";
}
//绘制遮盖层
function formatShadeDiv()
{
    var dshade=document.getElementById("divshade");
    var sWidth,sHeight;
    sWidth = getBrowserWidth();
    sHeight = getBrowserHeight();
    dshade.style.display="block";
    dshade.style.top=0;
    dshade.style.left=0;
    $("#divshade").css({opacity:0.6});
    dshade.style.width=sWidth + "px";
    dshade.style.height=sHeight + "px";
}
//获取浏览器高
function getBrowserHeight()
{
    return $(document).height();
}
//获取浏览器宽
function getBrowserWidth()
{
    return $(document).width();
}


$(window).scroll(function ()
{
    var mylayer = document.getElementById("Loading");
    var toTop = $(document).scrollTop() + ($(window).height() - $(mylayer).height()) / 2;
    if (toTop <= ($(document).height() - $(mylayer).height()))
    {
        mylayer.style.top = toTop.toString() + "px";
    }
});

			</script>
</head>

<body class="" onload="onLoadLogin();">
<jsp:include page="${contextPath}/share/top.jsp?nav=tzzyd&nav1=school" />
<div class="body_bg">
<div class="main">
  <div class="dqwz">当前位置：<a href="${contextPath }/index.jsp?nav=index">首页</a> &gt;<a href="${contextPath }/investorEdu/investorSchool.html"> 投资者园地</a> &gt;退市整理股票交易风险揭示书</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">
  <div class="iptvside_top"></div>
  <div class="iptvside_mid">
	  <jsp:include page="investorRisk_lmenu.jsp" />
<table width="95%" style="border-collapse:collapse" border="1" bgcolor="#ffffff" bordercolor="#cfcfcf" class="lh21 mt5" align="center">
  <tr>
    <td width="94%" class="info_th01" style=" border-bottom:0">教育专栏检索</td>
  </tr>
  <tr>
    <td style="padding:5px"><table width="100%" class="font_43">
      <tr>
        <td>时间：</td>
        <td><input type="text" name="textfield" id="textfield" class="input108" /></td>
      </tr>
      <tr>
        <td>到：</td>
        <td><input type="text" name="textfield2" id="textfield2" class="input108" /></td>
      </tr>
      <tr>
        <td>栏目：</td>
        <td><label>
          <select name="select" id="select">
            <option>--所有栏目--</option>
          </select>
        </label></td>
      </tr>
      <tr>
        <td>关键字：</td>
        <td><input type="text" name="textfield8" id="textfield8" class="input108"/></td>
      </tr>
      <tr>
        <td height="28" colspan="2" align="center"><input type="submit" class="but_01" name="button3" id="button3" value="查询" /></td>
      </tr>
    </table></td>
  </tr>
</table>
  </div>
  <div class="iptvside_bot"></div>
  </div>
  <!--左侧sied结束-->
   <form name="loginForm" id="loginForm" method="post">
  <!--右侧sied开始-->
  <div class="w706 fright">
  <div class="left_tit2">退市整理股票交易风险揭示书</div>
    <div class="blank10"></div>
    <p align="center" class="font14 bold mtb16">退市整理股票交易风险揭示书</p>
    <div class="lh21 p10">
      <p>尊敬的投资者：</p>
      <p>　　为强化对参与退市整理股票交易投资者的风险警示，保护投资者的合法权益，保障上市公司退市制度的平稳实施，根据上海、深圳证券交易所《股票上市规则》、《会员管理规则》，以及上海证券交易所《关于做好风险警示板股票交易风险警示准备工作的通知》，深圳证券交易所《创业板股票上市规则》、《关于做好退市整理股票交易风险警示工作的通知》等相关规定，本公司特制定《退市整理股票交易风险揭示书》，向您充分揭示参与退市整理股票交易面临的风险如下：<br/>
	     	 　　一、退市整理期拟终止上市公司股票已被证券交易所作出终止上市决定，在一定期限届满后将被终止上市，风险相对较大，投资者须审慎参与投资此类股票。如投资者持有此类股票直至被终止上市，由此可能导致经济损失及一切后果将由投资者自行承担。<br/>
	     	 　　二、拟终止上市公司股票退市整理期的交易期限累计仅为三十个交易日，期限届满后的次日，该上市公司股票将被终止上市，证券交易所对其予以摘牌。投资者应当密切关注退市整理股票的剩余交易日和最后交易日，否则有可能错失卖出机会，造成不必要的损失。
				退市整理期间，退市整理股票的全天停牌不计入三十个交易日的期限内。<br/>
	     	 　　三、拟终止上市公司股票退市整理期的交易可能存在流动性风险，投资者买入后可能因无法在股票终止上市前及时卖出所持股票而导致损失。<br/>
	     	 　　四、投资者在参与拟终止上市公司股票退市整理期交易前，应充分了解退市制度、退市整理股票交易规定和进入退市整理期上市公司的基本面情况，并根据自身财务状况、实际需求及风险承受能力等，审慎考虑是否买入退市整理股票。<br/>
	     	 　　五、按照现行有关规定，虽然上市公司股票被终止上市后可以向证券交易所申请重新上市，但须达到交易所重新上市条件，能否重新上市存在较大的不确定性。<br/>
	     	 　　六、投资者应当特别关注拟终止上市公司退市整理期期间发布的风险提示性公告，及时从指定信息披露媒体、上市公司网站以及证券公司网站等渠道获取相关信息。<br/>
	     	 　　七、使用网上交易、手机证券等委托方式的投资者应注意，须在签署本风险揭示书后立即更新相关委托软件，以便获取最新的风险提示信息。投资者如有相关疑问，可向本公司客服中心（95575）或当地营业网点进行咨询。<br/>
	     	 　　八、上海证券交易所关于退市整理股票的特别规定包括：<br/>
	     	 　　1、投资者在参与退市整理股票交易前，应充分了解投资者买卖退市整理股票应当采用限价委托的方式。<br/>
	     	 　　2、上海证券交易所退市整理股票在风险警示板交易期间全天停牌的天数累计不超过5个交易日。
      </p>
    </div><br />
    <div class=" blank10"></div>
    <div class="risytit">特别提示</div>
    <p class="p15 lh21"> 　特别提醒：本《风险揭示书》的提示事项仅为列举性质，未能详尽列明退市整理股票交易的所有风险。本公司再次提醒您审慎参与退市整理股票交易。
投资有风险，入市需谨慎！</p>
 <div class="risytit">投资者声明及签字</div>
    <p class="p15 lh21"> 　投资者声明及签字：本人/机构已详细阅读并完全理解了本《退市整理股票交易风险揭示书》的各项内容，愿意承担退市整理股票交易的风险和损失。</p>


    <div>
    <%
		if(StringHelper.isEmpty(fund_account))
		{
			%>
			<div align="left">
			 <table style=" width:200px; height:13px; background-color:#FFFFFF; color:#FF0000"; width="200" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td width="43" height="21"><img src="${ctx}/investorEdu/images/adv.jpg" width="43" height="29" /></td>
              <td width="141" style=" font-size:14px;,font-family: Arial, Helvetica, sans-serif">您还未进行登录</td>
            </tr>
          </table>
          </div>
    		<div class=" blank10"></div>
   			<div align="center"><input id="btn_login" name="btn_login" type="button" style="cursor:pointer" onclick="OpenDiv(this.form,'sin')" class="bottom" value="点击登录"/></div>
			<%
		}

		else if(StringHelper.isEmpty(accounts))
		{
			%>
			<div align="left">
			 <table style=" width:100%; height:13px; background-color:#FFFFFF; color:#FF0000"; width="200" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td width="43" height="21"><img src="${ctx}/investorEdu/images/adv.jpg" width="43" height="29" /></td>
              <td  style=" font-size:14px;,font-family: Arial, Helvetica, sans-serif">您没有尚未签署的退市整理的股东账户</td>
            </tr>
          </table>
          </div>
			<%
		}
		else
		{
			if(!StringHelper.isEmpty(password))
			{
				%>
					<input type="hidden" id="chk_pwd" id="chk_pwd" value="1"/>
				<%
			}
			else
			{
				%>
					<input type="hidden" id="chk_pwd" id="chk_pwd" value="0"/>
				<%
			}
			String []account_list = accounts.split(",");%>
			<div class="risytitgdk">尚未签署退市整理的股东卡</div>
			<code style="margin-left:40px"></code>
			<%
			for(int i=0;i<account_list.length;i++)
			{
				String tmp_account = account_list[i];
				%>
				<input style="margin-right: 5px;" type="checkbox" value="<%=tmp_account %>"  /><%=tmp_account %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<%
			}
			%>
				<div class=" blank10"></div>
   				<div align="center"><input id="btn_login" class="bottom"  name="btn_login" type="button" onclick="OpenDiv(this.form,'submit')" value="同意签署"/></div>
			<%
		}
    %>
    </div>
  </div>
   <!--          浮层框架开始     -->
		<div id="Loading"  style="display: none; "  >
		  <table width="100%" border="0" cellpadding="0"
				cellspacing="0" id="subLoading"
				style="border: 0 solid #FF0000; border-collapse: collapse;">
				<tr>

					<td
						height="28" style=" background-image:url(${ctx}/investorEdu/images/log.jpg)">
						<div id="LoadingMovn1"  >
							<table width="100%"><tr>
							  <td width="86%" style="padding-left:40px;"><span class="font3">签署声明</span></td>
							  <td width="14%" align="right" onclick="Lock_CheckForm();" style="cursor:pointer">
							&nbsp;&nbsp;</td>
							</tr></table>

						</div>
				  </td>

				</tr>
				<tr>
					<td height="100%" >

					<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0"  >
					<tr>

					<td width="114" height="40" align="center">									</td>
					<td width="234" height="40" style="padding-left: 10px;">					  </td>

					</tr>

					<tr>
					<td width="114" height="32" align="center">
					  <span class="font4">客户编号:</span> </td>
					<td width="234" height="32" style="padding-left: 10px;">
					<input name="client_id" type="text" style="width: 170px;font-size: 18px;" class="input100" id="client_id" value="${client_id }"/>					</td>
					</tr>

					<tr>
					<td height="31" align="center" class="font4">
					交易密码:					</td>
					<td height="31" style="padding-left: 10px;">
					<input type="hidden" name="isActive" id="isActive" value="0" />
					<input type="hidden" name="mac" id="mac" />
					<span id="Spanpwd" style="display: none"> <input
									type="password" name="password" class="input100" id="password" maxlength="6" style="length:30px;" />
					  </span><span id="passwdId"></span>					</td>
					</tr>

					<tr>
					<td height="34" align="center" class="font4">
					验 证 码:					</td>
					<td height="34" style="padding-left: 10px;">
					<input name="verifyCode" type="text" class="input101" id="verifyCode" style="font-size: 18px;"/>
					<img id="captchaImage" onclick="reloadcode()" border=0 src="${ctx}/share/verifyCodeImage.jsp" width="70" height="28" align="absmiddle" border="0"/>
					<a href="javascript:reloadcode();"  ><u>看不清</u></a>					</td>
					</tr>

					<tr>
					<td height="50"  colspan="2" align="center">
					<input type="button"  class="bottom"  onclick="checkLogin(this.form)" value="确  定"/>
					</td></tr>
					</table>


					</td>
				</tr>
		  </table>
</div>
		<!--  浮层框架结束-->
  <!--右侧sied结束-->
  </form>
  <div class="clearfloat"></div><!--清除浮动-->
</div>
<div style=" margin: 0 auto; width: 920px;">
<jsp:include page="/commons/bottom.jsp" />
</div>
 <style>
.shade{filter:alpha(opacity=50);-moz-opacity:0.5;position:absolute; background-color:#777;display:none;z-index:100;}
  </style>
  <div id="divshade" class="shade"><!--这个是遮盖的div--></div>
</body>
<script>
	chkall();
</script>
</html>