<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>My JSP 'gsMathLogin.jsp' starting page</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link href="${ctx }/css/global.css" rel="stylesheet" type="text/css" />
		<link href="${ctx }/css/wsyyt/wsyyt.css" rel="stylesheet"
			type="text/css" />
		<script type="text/javascript" src="${ctx}/js/prototype.js"></script>
		<script>
			var errorMsg="${msg2}";
		  	if(errorMsg!=""){
		  		alert(errorMsg);
				window.location="http://www.gf.com.cn";
		  	}			
		</script>
		<script>
			var errorMsg="${msg}";
		  	if(errorMsg!=""){
		  		alert(errorMsg);
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
	</head>

	<body>
		<form name="loginForm"
			action="${ctx }/gsMatch/web/GsMatchLogin.go?function=CheckLogin"
			method="post" id="loginForm">
			<input type="hidden" name="isActive" id="isActive" value="0" />
			<input type="hidden" name="mac" id="mac" />
			<input type="hidden" name="disknum" id="disknum" />
			<div class="winfixsms" id="msgview"
				style="height: 160px; border-bottom: 0px; border-top: 1px solid #C4C4C4; border-left: 1px solid #C4C4C4; border-right: 1px solid #C4C4C4;">
				<iframe src=""
					style="width: 345px; height: 0; top: 0px; left: 0px; position: absolute; visibility: inherit; z-index: -1;"
					frameborder=0></iframe>
				<div class="popTit" onmousedown="Effect.Mdrag('msgview',event)">
					验证信息
				</div>
				<div class="popCon2" style="height: 150px;">

					<table width="90%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td height="26" width="35%" align="right">
								客户注册名：
							</td>
							<td width="5%">
								&nbsp;
							</td>
							<td width="60%">
								<input type="text" name="reg_name" id="reg_name"
									style="width: 100px" maxlength="50" value="${reg_name }" readonly="readonly" />
							</td>
						</tr>
						<tr>
							<td height="26" width="35%" align="right">
								客户编号：
							</td>
							<td width="5%">
								&nbsp;
							</td>
							<td width="60%">
								<input type="text" name="client_id" id="client_id"
									style="width: 100px" maxlength="20" />
							</td>
						</tr>
						<tr>
							<td height="26" width="35%" align="right">
								交易密码：
							</td>
							<td width="5%">
								&nbsp;
							</td>
							<td width="60%">
								<span id="Spanpwd" style="display: none"> <input
										type="password" name="password" id="password" maxlength="6" />
								</span><span id="passwdId"></span>
							</td>
						</tr>
						<tr>
							<td height="26" width="35%" align="right">
								校 验 码：
							</td>
							<td width="5%">
								&nbsp;
							</td>
							<td width="60%">
								<input size="11" id="verifyCode" type="text" class="input108"
									name="verifyCode" maxlength="4" style="width: 50px" />
								<img id="captchaImage" border=0
									src="${ctx}/share/verifyCodeImage.jsp" width="70" height="28"
									align="absmiddle" border="0" />
								<a href="javascript:refreshCaptcha();">看不清？换一张</a>
							</td>
						</tr>
					</table>
				</div>
				<div class="popBot"
					style="border-bottom: 1px solid #C4C4C4; border-top: 0px; border-left: 1px solid #C4C4C4; border-right: 1px solid #C4C4C4;">
					<!-- <input name="" type="button" value="确认" onclick="checkLoginTo();" class="popBtn1" />&nbsp;&nbsp;<input name="" type="button" value="取消" onclick="Effect.openwin('msgview')" class="popBtn1" />-->
					<input type="button" value="确认" onclick="checkLogin()"
						class="popBtn1" />
					&nbsp;&nbsp;
					<!--<input name="" type="button" value="取消"
					onclick="Effect.openwin('msgview')" class="popBtn1" />
			-->
				</div>
				<script type="text/javascript" language="javascript">
					function checkLogin() {
						var verifyCode = document.getElementById("verifyCode").value;
						var client_id = document.getElementById("client_id").value;
						var reg_name = document.getElementById("reg_name").value;
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
						if (reg_name == "") {
							alert("请输入客户注册名！");
							document.getElementById("reg_name").value = "";
							document.getElementById("reg_name").focus();
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
						var url = '${ctx}/webUser.do';
						var paras = 'method=checkVerifyCode&verifyCode=' + verifyCode;
						new Ajax.Request(url, {
							method : 'post',
							postBody : paras,
							asynchronous : false,
							onSuccess : function(response) {
								if (response.responseText == 0) {
									alert('验证码输入错误！');
								} else if (response.responseText == 1) {
									getEncryptionTime();
								}
							},
							onFailure : function() {
								alert('验证码有误！');
							}
						});
						//判断是否已使用控件
						var isActive = document.getElementById("isActive").value;
						if (isActive == "1") {
							//对用户名进行加密
							//document.getElementById("user").value = user;
							//获取密码
							document.getElementById("password").value = document.getElementById(
									"Tiyun").GetPassword();
							//获取mac地址
							document.getElementById("mac").value = document.getElementById(
									"Tiyun").GetActiveNIC();
							//获取硬盘系列号
							document.getElementById("disknum").value = document.getElementById(
									"Tiyun").GetHardDiskNUM();
							
							document.getElementById("loginForm").submit();
						}
						else
						{
							document.loginForm.submit();	
						}
						
					}
				
					function refreshCaptcha() {
						document.getElementById("captchaImage").src = "${ctx}/share/verifyCodeImage.jsp?ran="
								+ Math.random();
					}
				</script>
				<script>
					onLoadLogin();
				</script>
			</div>
		</form>
	</body>
</html>
