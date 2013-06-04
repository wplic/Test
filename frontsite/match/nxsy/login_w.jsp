
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.gf.gfclient.constants.*"%>
<%@ page import="com.gf.gfclient.process.*"%>
<%@ page import="com.gf.etrade.model.*"%>
<%@ page import="java.util.*"%>

<%

	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path;
	response.addHeader("__timeout", "true");
	response.setHeader( "Set-Cookie", "name=value; HttpOnly");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN">
<head>
<base/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="keywords" content="广发,广发证券,网上营业厅,金管家,交易,股票,交易大厅,WEB交易" />
<meta name="description" content="广发证券金管家网上交易大厅是广发证券全新设计的网上交易系统。" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />
<title><%=AppProperty.getInstance().getAPP_NAME() %></title>
<link REL="SHORTCUT ICON" HREF="images/favicon.ico"></link>
<script type="text/javascript" src="images/jquery-1.6.1.min.js"></script>
<script type="text/javascript" src="images/mask.js"></script>
<script>
String.prototype.trim = function() {
    return (this.replace(/^[\s\xA0]+/, "").replace(/[\s\xA0]+$/, ""));
};
	//var url=window.document.location.protocol+'//'+window.document.location.host;
try{
	if(self.frameElement.tagName=="IFRAME"){
		// 页面在iframe中时处理			
		var curr=self;
		try{
			while(curr.frameElement.tagName=="IFRAME"){
				curr=parent;				
			}
		}catch(e){
			
		}
		curr.window.location='<%=basePath%>/login.jsp';
		}
	} catch (e) {

}
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
				document.getElementById("passwdId").innerHTML = "<OBJECT ID=\"Tiyun\" codeBase=\"update.CAB\" CLASSID=\"CLSID:64B153E8-7C79-43e2-B7B8-C571E18FE027\" width=200 height=25><PARAM name=\"Width\" value=\"5400\"><PARAM name=\"EditStyle\" value=\"Convex\"><PARAM name=\"PasswordMaxLen\" value=\"6\"><PARAM name=\"ProtectColor\" value=\"#FFFFFF\"><PARAM name=\"UnProtectColor\" value=\"#FFFFFF\"><PARAM name=\"EditBkgColor\" value=\"#ffffff\"><PARAM name=\"PasswordMaxLen\" value=\"6\"></OBJECT>";
				document.getElementById("authcodeid").innerHTML = "<OBJECT ID=\"authcode\" codeBase=\"update.CAB\" CLASSID=\"CLSID:64B153E8-7C79-43e2-B7B8-C571E18FE027\" width=125 height=25><PARAM name=\"Width\" value=\"2500\"><PARAM name=\"EditStyle\" value=\"Convex\"><PARAM name=\"PasswordMaxLen\" value=\"6\"><PARAM name=\"ProtectColor\" value=\"#FFFFFF\"><PARAM name=\"UnProtectColor\" value=\"#FFFFFF\"><PARAM name=\"EditBkgColor\" value=\"#ffffff\"><PARAM name=\"PasswordMaxLen\" value=\"6\"></OBJECT>";
			} catch (e) {

			}
			CheckActiveX("IE");

		}
		//火狐、opera浏览器
	} else if ((appBrowerName.indexOf("Netscape") > -1)
			|| (appBrowerName.indexOf("Opera") > -1)) {
		document.getElementById("isActive").value = "1";
		document.getElementById("Spanpwd").style.display = "none";
		document.getElementById("passwdId").innerHTML = "<embed id=\"Tiyun\" name=\"Tiyun\" type=\"application/mozilla-npGF-plugin\" width=\"205\" height=\"25\">";
		document.getElementById("authcodeid").innerHTML = "<embed id=\"authcode\" name=\"Tiyun\" type=\"application/mozilla-npGF-plugin\" width=\"105\" height=\"25\">";
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
		try {
			var pwdActiveX = document.getElementById("Tiyun");
			var dllVersion = pwdActiveX.GetDllVersion();
			dllVersion = dllVersion.replace(/, /ig, "");
			//比较当前版本号
			if (parseInt(dllVersion) < curVersion) {
				dlActiveX(2, curVersion);
				return false;
			}

		} catch (e) {
			//没有安装控件
			dlActiveX(4, curVersion);
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
		//IE内核
		if (confirm("您安装的安全控件版本有更新，请确定是否更新?")) {
			//document.getElementById("passwdId").innerHTML = "<a href=\"images/setup.exe\" target=\"_blank\">安全控件更新下载</a>";
			document.getElementById("passwdId").innerHTML = "<OBJECT ID=\"Tiyun\" codeBase=\"images/update.CAB#version="+version+"\" CLASSID=\"CLSID:64B153E8-7C79-43e2-B7B8-C571E18FE027\" width=98 height=24><PARAM name=\"Width\" value=\"1800\"><PARAM name=\"EditStyle\" value=\"Convex\"><PARAM name=\"ProtectColor\" value=\"#0000FF\"><PARAM name=\"UnProtectColor\" value=\"#00FF00\"><PARAM name=\"EditBkgColor\" value=\"#ffffff\"></OBJECT>";
		}

	} else if (p == 2) {
		//firefox 内核
		if (confirm("您安装的安全控件版本有更新，请确定是否更新?")) {
			document.getElementById("passwdId").innerHTML = "<a href=\"images/update.exe\" target=\"_blank\">安全控件更新下载</a>";
		}
		//IE内核安装
	} else if (p == 3) {
		document.getElementById("passwdId").innerHTML = "<a href=\"images/setup.exe\" target=\"_blank\">安全控件下载</a>";
	} else if (p == 4) {
		document.getElementById("passwdId").innerHTML = "<a href=\"images/setup.exe\" target=\"_blank\">安全控件下载</a>";
	} else {
	}

}
//加载默认登陆框
function onLoadDefault() {
	// 设置加密选项
	//alert("xxx");
	if (document.getElementById("isActive").value == 1) {
		document.getElementById("isActive").value = "0";
		document.getElementById("Spanpwd").style.display = "block";
		document.getElementById("passwdId").style.display = "none";
		document.getElementById("OnloadDefault").value = "安全登陆";
	} else {
		document.getElementById("isActive").value = "1";
		document.getElementById("Spanpwd").style.display = "none";
		document.getElementById("passwdId").style.display = "block";
		document.getElementById("OnloadDefault").value = "普通登陆";
	}
}
function CheckLogin() {
	var ActiveNic;
	var user = document.getElementById("user").value;
	var password1;
	var yzm=document.getElementById("tmp_yzm").value;
	if(user.trim()==""){
		alert("用户名不能为空");
		return;
	}
	
	if(document.getElementById("Tiyun").GetPassword()==""){
		alert("密码不能为空");
		return;
	}
	if(yzm.trim()==""){
		alert("验证码不能为空");
		return;
	}
	if($('#authtype').val()==1){
		if(document.getElementById("authcode").GetPassword()==""){
			alert("动态口令不能为空");
			return;
		}
	}
	//判断是否已使用控件
	var isActive = document.getElementById("isActive").value;
	if (isActive == "1") {
		//对用户名进行加密
		var user = document.getElementById("Tiyun").EncodeData(document.getElementById("user").value);
		//document.getElementById("user").value = user;
		//获取密码
		document.getElementById("pwd").value = document.getElementById(
				"Tiyun").GetPassword();
		//获取mac地址
		document.getElementById("mac").value = document.getElementById(
				"Tiyun").GetActiveNIC();
		//获取硬盘系列号
		document.getElementById("disknum").value = document.getElementById(
				"Tiyun").GetHardDiskNUM();
		
		var authcode="";
		if($('#authtype').val()==1){
			authcode=document.getElementById("authcode").GetPassword();
		}
			
		//alert(document.getElementById("Tiyun").GetHardDiskNUM());
		//			alert(document.getElementById("pwd").value);
		//			alert(document.getElementById("mac").value);
		//			alert(document.getElementById("disknum").value);
		//document.getElementById('fplogin').reset();

		$('#infoBox').mask('系统登录中...');

		try{
			$.post('login', {
				username : user.trim(),
				password : $('#pwd').val().trim(),
				mac : $('#mac').val().trim(),
				disknum : $('#disknum').val().trim(),
				tmp_yzm : $('#tmp_yzm').val().trim(),
				authcode : authcode,
				authtype : $('#authtype').val().trim()
			}, function(data) //回传函数  
			{
				try{
						var myjson = '';
						eval("myjson=" + data + ";");
						if (myjson.success == false) {
							alert(myjson.error_info);
							//$("#info_msg").text(myjson.error_info).show().fadeOut(3000);
						} else {
							document.location.href = "workbench/index.jsp";
						}
						$('#infoBox').unmask();
					}catch(e){
						
						$('#infoBox').unmask();
					}
				
			});
		}catch(e){
			
			$(document).unmask();
		}
		document.getElementById("Tiyun").Clearpassword();
		if($('#authtype').val()==1){
			document.getElementById("authcode").Clearpassword();
		}
	}
	return false;
}

function ClearKeyBoard() {
	document.getElementById("Tiyun").Clearpassword();
	return true;
}
function ShowLoginDiv() {
	//document.getElementById('g2_blockID').style.display="block";
	onLoadLogin();
	//
}
function GetActiveNIC() {
	//数据: "活动网卡MAC,活动网卡IP"
	return document.getElementById("Tiyun").ActiveNIC;
}
//"升级测试"
function UpdateActive() {

	var appBrowerName = window.navigator.appName;
	//IE内核浏览器
	if ((appBrowerName.indexOf("Microsoft Internet Explorer") > -1)
			|| (appBrowerName.indexOf("Maxthon") > -1)) {
		if (document.getElementById('passwdId') != 'undefined') {
			//document.getElementById("passwdId").innerHTML = "<a href=\"images/setup.exe\" target=\"_blank\">安全控件更新下载</a>";
			document.getElementById("passwdId").innerHTML = "<OBJECT ID=\"Tiyun\" codeBase=\"update.CAB#version=1,1,0,1\" CLASSID=\"CLSID:64B153E8-7C79-43e2-B7B8-C571E18FE027\"><PARAM name=\"Width\" value=\"4100\"><PARAM name=\"EditStyle\" value=\"Convex\"><PARAM name=\"ProtectColor\" value=\"#FFFFFF\"><PARAM name=\"UnProtectColor\" value=\"#FFFFFF\"><PARAM name=\"EditBkgColor\" value=\"#ffffff\"></OBJECT>";
		}
		//火狐、opera浏览器
	} else if ((appBrowerName.indexOf("Netscape") > -1)
			|| (appBrowerName.indexOf("Opera") > -1)) {
		//document.getElementById("passwdId").innerHTML = "<a href=\"images/setup.exe\" target=\"_blank\">安全控件更新下载</a>";
		document.getElementById("passwdId").innerHTML = "<a href=\"images/update.exe\" target=\"_blank\">安全控件更新</a>";
	}
}

$(document).ready(function(){
	//Onload();
	onLoadLogin();
	$('#tmp_yzm').keydown(function(ev) {
		if(ev.keyCode==13) {
			CheckLogin();
	    	} 
		});
	$('#authtype').change(function(e){
		//$('#authcodeid').style.display="block";
		if($('#authtype').val()==1)
			document.getElementById("authcodeid").style.display ="block";
		else 
			document.getElementById("authcodeid").style.display ="none";
	});
	$('#id_yzmimg').click( 
	        function() {  
	        	//alert("ok");
	            //$('#yzmimg').hide().attr('src','yzm.jpg?' + Math.floor(Math.random() * 100)).fadeIn();
	            if(navigator.userAgent.toLowerCase().indexOf("safari")!=-1)//safari回退时，验证码不刷新问题
				VerifyimageFrame.location.href="yzm.jsp?appendRandom="+(new Date()).getTime();
				else
				VerifyimageFrame.location.reload();

	            //document.getElementById("id_yzm").innerHTML='<img id="yzmimg" height="25" width="60" src="yzm.jpg?'+Math.floor(Math.random() * 100)+'" title="验证码" />';
	});
	
	
	
	
});

</script>
<style>
body {
	padding: 0;
	margin: 0;
	font-size: 12px;
}

html,body {
	height: 100%;
}

#infoBox[id] {
	text-align: center;
	width: 100%;
	height: 100%;
	display: table;
}

#info[id] {
	display: table-cell;
	vertical-align: middle;
}

* html #infoBox {
	position: absolute;
	top: 50%;
	width: 100%;
	text-align: center;
	display: block;
	height: auto
}

* html #info {
	position: relative;
	top: -50%;
	text-align: center;
}

*+html #infoBox[id] {
	position: absolute;
	top: 50%;
	width: 100%;
	text-align: center;
	display: block;
	height: auto
}

*+html #info[id] {
	position: relative;
	top: -50%;
	text-align: center;
}

#tnnd {
	width: 300px;
	margin: 0 auto;
	font-size: 12px;
	line-height: 1.8;
}
.loadmask {
    z-index: 100;
    position: absolute;
    top:0;
    left:0;
    -moz-opacity: 0.5;
    opacity: .50;
    filter: alpha(opacity=50);
    background-color: #CCC;
    width: 100%;
    height: 100%;
    zoom: 1;
}
.loadmask-msg {
    z-index: 20001;
    position: absolute;
    top: 0;
    left: 0;
    border:1px solid #6593cf;
    background: #c3daf9;
    padding:2px;
}
.loadmask-msg div {
    padding:5px 10px 5px 25px;
    background: #fbfbfb url('images/loading.gif') no-repeat 5px 5px;
    line-height: 16px;
	border:1px solid #a3bad9;
    color:#222;
    font:normal 11px tahoma, arial, helvetica, sans-serif;
    cursor:wait;
}
.masked {
    overflow: hidden !important;
}
.masked-relative {
    position: relative !important;
}
.masked-hidden {
    visibility: hidden !important;
}
</style>

</head>

<body>
	<div id="infoBox">
		<div id="info">
			<div id="tnnd"
				style="position: relative; background-image: url('images/login-bg.jpg'); background-repeat: no-repeat; background-position: 0% 0%; width: 600px; height: 386px;">

				<span id='info_msg'
					style='position: absolute; font-size: 12px; text-align: left; font-weight: bold; top: 80px; left: 150px; color: red; height: 50px; width: 400px;'></span>
				<div style='position: absolute; top: 100px; left: 150px;'>
					<form id="fplogin" name="fplogin" method="post" action="" >
					  <input type="hidden" name="isActive" id="isActive" value="0" />
					  <input type="hidden" name="mac" id="mac" />
					  <input type="hidden" name="disknum" id="disknum" />
					  <table border=0 cellspacing=0 cellpadding=0>
							<tr>
								<td
									style='padding-top: 10px; font-family: "黑体"; font-size: 14px; text-align: right;'>客户账号</td>
								<td style='padding-left: 10px; padding-top: 10px;'><input
									type="text" id="user" name="user" value=""
									style="height: 18px; font-weight: bold; font-size: 12px; font-family: 'Tahoma'; width: 200px;" />
								</td>
							</tr>
							<tr>
								<td
									style='padding-top: 10px; font-family: "黑体"; font-size: 14px; text-align: right;'>交易密码</td>
								<td style='padding-left: 10px; padding-top: 10px;'>
								  <span id="Spanpwd" style="display:none;"><input type="password" name="pwd" id="pwd"  size="15"/></span>
								  <span id="passwdId"></span>
								</td>
							</tr>
							<tr>
								<td
									style='padding-top: 10px; font-family: "黑体"; font-size: 14px; text-align: right;'>认证方式</td>
								<td style='padding-left: 10px; padding-top: 10px;text-align:left;'>
								  <table border=0 cellspacing=0 cellpadding=0><tr><td>
								  <Select id="authtype" name="authtype">
								  <option value="0">普通</option>
								  <option value="1">动态口令</option>
								  </Select></td><td><span id="authcodeid" style="display:none;"></span></td></tr></table>
								  
								</td>
							</tr>
							
							<tr>
								<td style='padding-top: 10px; font-family: "黑体"; font-size: 14px; text-align: right;'>验证码</td>
									<td style='padding-left: 10px; '>
									<table border=0 cellspacing=0 cellpadding=0 height="25" width="200">
									<tr>
									<td  style="padding-top:10px;" align="left">
									<input type="text" maxlength="5" id="tmp_yzm" name="tmp_yzm" size="6"	style="height: 18px; width: 40px;" />
									</td>
									<td style="padding-left:5px;" valign="bottom">
										<IFRAME frameBorder="0" name="VerifyimageFrame" scrolling="no" src="yzm.jsp" marginHeight=0 marginWidth=0 height="25" width="80" onload="this.contentWindow.document.oncontextmenu =  function(){return false;};">
										</IFRAME>
									</td>
									<td valign="bottom"><a href='javascript:void(0);' id='id_yzmimg'>刷新验证码</a></td>
									</tr></table>
								</td>
							</tr>
							<tr>
								<td colspan=2 height="25" style='padding-top:5px;'>
									<a href="images/setup.html" target="_blank">控件安装说明</a>
								</td>
							</tr>
							<tr>
								<td colspan=2 style='padding-top: 5px;'><input
									id="btn_login" 
									type="button" name="submit" value=""
									style="border: 0px; width: 68px; letter-spacing: 4pt; background-color: transparent; height: 20px; background-image: url('images/button01.png');"
									onfocus="this.blur();"
									onmouseover="this.style.backgroundPositionY='bottom'"
									onmouseout="this.style.backgroundPositionY='top'"
									onclick="CheckLogin();"
									/>
									&nbsp;&nbsp;&nbsp;&nbsp; <input type="button" name="cancel"
									value=""
									style="border: 0px; width: 68px; letter-spacing: 4pt; background-color: transparent; height: 20px; background-image: url('images/button02.png');"
									onfocus="this.blur();"
									onmouseover="this.style.backgroundPositionY='bottom'"
									onmouseout="this.style.backgroundPositionY='top'" /></td>
							</tr>
						</table>
						
					    </form> 
				</div>

				<div style='position: absolute; bottom: 2px; left: 40px;'>
					<img id='gpjj' border=0 src="images/icon01.png" class="png-fix"
						style='position: relative; bottom: 2px; left: 20px; cursor: pointer; cursor: hand;'></img>
					<img id='cljy' border=0 src="images/icon02.png" class="png-fix"
						style='position: relative; bottom: 2px; left: 100px; cursor: pointer; cursor: hand;'></img>
					<img id='lccp' border=0 src="images/icon03.png" class="png-fix"
						style='position: relative; bottom: 2px; left: 180px; cursor: pointer; cursor: hand;'></img>
					<img id='khfw' border=0 src="images/icon04.png" class="png-fix"
						style='position: relative; bottom: 2px; left: 260px; cursor: pointer; cursor: hand;'></img>

				</div>

			</div>
		</div>
	</div>
<!--[if IE 6]>
<script src="images/png-fix.js"></script>
<script>
  DD_belatedPNG.fix('.png-fix');
</script>
<![endif]-->
</body>
</html>
