<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
     <jsp:include page="${ctx }/match/nxsy/commons/head.jsp"></jsp:include>
     <link href="${ctx}/css/global.css" rel="stylesheet" type="text/css" /> 
     <div class="ggjs_box1" style="display:block; background:url('../../pic/infoCenter/f10/ggjs_bg.jpg') repeat-x scroll center top #E8E6E7;">  
    	 <div class="p15" style="width:780px; margin:auto; ">
      <div class="log_bg1"></div>
<script language = javascript>
if (window.top !== window.self) {
	var errorMsg="${errorMsg}";
  	if(errorMsg!=""){
  		alert(errorMsg);
  	}
	window.open('${ctx }/match/nxsy/login.jsp','_top');
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
				document.getElementById("passwdId").innerHTML = "<OBJECT ID=\"Tiyun\" codeBase=\"update.CAB\" CLASSID=\"CLSID:64B153E8-7C79-43e2-B7B8-C571E18FE027\" width=100 height=20><PARAM name=\"Width\" value=\"3400\"><PARAM name=\"EditStyle\" value=\"Convex\"><PARAM name=\"PasswordMaxLen\" value=\"6\"><PARAM name=\"ProtectColor\" value=\"#FFFFFF\"><PARAM name=\"UnProtectColor\" value=\"#FFFFFF\"><PARAM name=\"EditBkgColor\" value=\"#ffffff\"><PARAM name=\"PasswordMaxLen\" value=\"6\"></OBJECT>";
			} catch (e) {

			}
			CheckActiveX("IE");

		}
		//火狐、opera浏览器
	} else if ((appBrowerName.indexOf("Netscape") > -1)
			|| (appBrowerName.indexOf("Opera") > -1)) {
		document.getElementById("isActive").value = "1";
		document.getElementById("Spanpwd").style.display = "none";
		document.getElementById("passwdId").innerHTML = "<embed id=\"Tiyun\" name=\"Tiyun\" type=\"application/mozilla-npGF-plugin\" width=\"100\" height=\"20\">";
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
			document.getElementById("passwdId").innerHTML = "<a href=\"update.exe\" target=\"_blank\">安全控件更新下载</a>";
		}
		//IE内核安装
	} else if (p == 3) {
		document.getElementById("passwdId").innerHTML = "<a href=\"setup.exe\" target=\"_blank\">安全控件下载</a>";
	} else if (p == 4) {
		document.getElementById("passwdId").innerHTML = "<a href=\"setup.exe\" target=\"_blank\">安全控件下载</a>";
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


</script>
<script language="javascript">
	function checkForm()
	{
		var strMsg = "";
		strMsg += checkValid("login_name", "登录名", "NotEmpty");
		strMsg += checkValid("pwd", "登录密码", "NotEmpty");
		strMsg += checkValid("verifyCode", "验证码", "NotEmpty");
		var login_type = document.getElementById("login_type").value;
		if(login_type == "client_id")
		{
			strMsg += checkValid("login_name", "登录名", "Numeric");	
		}
		if(!isEmpty(strMsg))
		{
			alert(strMsg);
			document.getElementById("login_name").focus();
            return false;
		}
		//判断是否已使用控件
		var isActive = document.getElementById("isActive").value;
		if (isActive == "1") {
			//对用户名进行加密
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
			
			document.getElementById("loginForm").submit();
		}
	}
	/**
	 * 按回车实现Tab功能
	 *
	 */
	function EnterTab(e,id)
	{
		var ev   = window.event|| e;
		if (ev.keyCode == 13)
		{
			if(id == "smt")
			{
				checkForm();
			} else {
				document.getElementById(id).focus();
			}
		}
	}
</script>
<div class="log_bg2">
<table width="77%" align="center" style="margin:0 auto;">
  <tr>
    <td height="8"></td>
  </tr>
  <tr>
    <td class="red bold">用户登录</td>
  </tr>
</table>
<div style=" height:38px"></div> 
<form name="loginForm" id="loginForm" action="/nxsyLoginAction.do?method=login" method="post">
 <input type="hidden" name="isActive" id="isActive" value="0" />
					  <input type="hidden" name="mac" id="mac" />
					  <input type="hidden" name="disknum" id="disknum" />
	<script>
	  	var errorMsg="${errorMsg}";
	  	if(errorMsg!=""){
	  		alert(errorMsg);
	  	}
	</script>
<table width="30%" border="0" align="center" cellpadding="0" cellspacing="0" class="lh25">
  <tr>
   <td width="10" rowspan="5">&nbsp;</td>
   <td>登陆方式：</td>
   <td>
           <select name="login_type" id="login_type" style="width:108px">
                   <option value="nick_name">用户昵称</option>
    			<option value="id_no">身份证号码</option> 	
              </select>
   </td>
 </tr>
  <tr>
    <td>用 户 名：</td>
    <td><input type="text" id="login_name" name="login_name" type="text" onKeyDown="EnterTab(event,'pwd');" class="input108"/>
    <input type="hidden" name="url" value=""/>
    <input type="hidden" name="urlError" value=""/>
    <input type="hidden" name="callBack" id="callBack" value=""/>
    </td>
  </tr>
  <tr>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;密     码：</td>
    <td>
    <span id="Spanpwd" style="display:none;"><input type="password" name="pwd" id="pwd"  size="15"/></span>
	<span id="passwdId"></span>
								  
      </td>
  </tr>
  <tr>
    <td>校 验 码：</td>
    <td>
     <input size="11" id="verifyCode" type="text" class="input108" name="verifyCode" maxlength="4" style=" width:50px" onKeyDown="EnterTab(event,'smt');"/>
     <img id="captchaImage" border=0 src="${ctx}/share/verifyCodeImage.jsp" width="70" height="28" align="absmiddle" border="0"/>
     </td>
  </tr>
  <tr>
	<td colspan="2">
		<table border="0" style="float:right;">
			<tr>
				<td><a href="${ctx }/match/nxsy/forgetpwd.jsp"><u><font color="red">忘记密码?</font></u></a>&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="javascript:refreshCaptcha();" ><u>看不清？换一张</u></a></td>
			</tr>
		</table>
	</td>
  </tr>
</table>
<div style=" height:15px"></div>
<table width="30%" border="0" align="center" cellpadding="0" cellspacing="0" class="lh25">
  <tr> 
  <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>   
    <td width="30%">
    	<input type="button" value="登&nbsp;&nbsp;陆" onclick="checkForm();" />
    </td>
    <td><input type="reset" value="重&nbsp;&nbsp;置"/></td>  
     <td><a href="${ctx }/match/nxsy/register.jsp"><u><font color="red">新用户注册</font></u></a>&nbsp;&nbsp;&nbsp;&nbsp;
     	</td> 
  </tr>
</table>
</form>
</div>
    </div>
      </div>
	<jsp:include page="${ctx }/match/nxsy/commons/bottom.jsp"></jsp:include>
	
	<script>

	onLoadLogin();
	</script>