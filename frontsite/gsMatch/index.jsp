<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<%@ page language="java" pageEncoding="utf-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>2012搜狐中国股市-寻牛汇</title>
<link href="${ctx}/gsMatch/css/common.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="${ctx}/gsMatch/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${ctx}/js/prototype.js"></script>
<style type="text/css">
.indexpage {
    background: url("${ctx}/gsMatch/images/indexbgx.jpg") repeat-x scroll 0 0 #F15C0C;
}
.butn{
width:58px;
height:25px;
cursor:pointer;
}
</style>
<script>
	var errorMsg="${msg2}";
  	if(errorMsg!=""){
  		alert(errorMsg);
		window.location="http://q.stock.sohu.com/cgds/index.jsp";
  	}
	var errorMsg="${msg}";
  	if(errorMsg!=""){
  		alert(errorMsg);
  	}
  	var reg_name ="${reg_name}";
  	var md5_url="${md5_url}";
  	var branch_no="${branch_no}";
  	if(md5_url!="")
  	{
  		var url = "http://q.stock.sohu.com/cgds/firmcheck.jsp?reg_name=" + reg_name+"&v_code=" + md5_url + "&success=1&branch_no=" + branch_no;
  		window.location=url;
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
					document.getElementById("passwdId").innerHTML = "<OBJECT ID=\"Tiyun\" codeBase=\"update.CAB\" CLASSID=\"CLSID:64B153E8-7C79-43e2-B7B8-C571E18FE027\" width=140 height=30><PARAM name=\"Width\" value=\"3400\"><PARAM name=\"EditStyle\" value=\"Convex\"><PARAM name=\"PasswordMaxLen\" value=\"6\"><PARAM name=\"ProtectColor\" value=\"#FFFFFF\"><PARAM name=\"UnProtectColor\" value=\"#FFFFFF\"><PARAM name=\"EditBkgColor\" value=\"#ffffff\"><PARAM name=\"PasswordMaxLen\" value=\"6\"></OBJECT>";
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
				document.getElementById("passwdId").innerHTML = "<OBJECT ID=\"Tiyun\" codeBase=\"${ctx}/gsMatch/update.CAB#version=1,1,0,1\" CLASSID=\"CLSID:64B153E8-7C79-43e2-B7B8-C571E18FE027\"><PARAM name=\"Width\" value=\"4100\"><PARAM name=\"EditStyle\" value=\"Convex\"><PARAM name=\"ProtectColor\" value=\"#FFFFFF\"><PARAM name=\"UnProtectColor\" value=\"#FFFFFF\"><PARAM name=\"EditBkgColor\" value=\"#ffffff\"></OBJECT>";
			}
			//火狐、opera浏览器
		} else if ((appBrowerName.indexOf("Netscape") > -1)
				|| (appBrowerName.indexOf("Opera") > -1)) {
			//document.getElementById("passwdId").innerHTML = "<a href=\"images/setup.exe\" target=\"_blank\">安全控件更新下载</a>";
			document.getElementById("passwdId").innerHTML = "<a href=\"${ctx}/gsMatch/update.exe\" target=\"_blank\">安全控件更新</a>";
		}
	}
	//登录验证
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
					return;
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

	//验证码刷新
	function refreshCaptcha() {
		document.getElementById("captchaImage").src = "${ctx}/share/verifyCodeImage.jsp?ran="
				+ Math.random();
	}

	//复选框验证
	function comboxCheck(){
		var checkbox1=document.getElementById("checkbox1");
		var checkbox2=document.getElementById("checkbox2");
		if(!checkbox1.checked){
			alert("请勾选“我已看过并同意《实盘参赛承诺书》”!");
			return;
		}
		if(!checkbox2.checked){
			alert("请勾选“我已看过并同意《实盘交易规则》”!");
			return;
		}
		var reg_name = document.getElementById("reg_name").value;
		if(reg_name == "")
		{
			alert("请进入寻牛汇官方网站注册用户");
			window.location="http://q.stock.sohu.com/cgds/index.jsp";
			return;
		}
		show();
	}
</script>
<script type="text/javascript">
function gourl(url){
window.open (url)
}
</script>
</head>

<body class="indexpage" onload="onLoadLogin();">

<div style="margin-left: -120px; margin-top: -20px;">
<div style="width:1196px;height: 319px; background-image:url('${ctx}/gsMatch/images/ban.jpg');">
		  <div  style="margin-left:230px; margin-top:20px;">
			  <table width="28%" border="0" cellpadding="0" cellspacing="0">
			    <tr><td width="50" height="24" style="cursor:pointer" onclick="gourl('http://stock.sohu.com')"></td>
			    <td width="126"></td>
			    <td width="76" style="cursor:pointer" onclick="gourl('http://www.gf.com.cn/')"></td>
			    </tr></table>
  </div>

    <div id="xlgz1" class="butn" style=" float:left;margin-left:235px; margin-top:260px;" onclick="gourl('http://xunniuhui.t.sohu.com/')"></div>
	<div id="xlgz2" class="butn" style="float:left; margin-left:4px; margin-top:260px;" onclick="gourl('http://weibo.com/xunniuhui')"></div>
	<div id="gfgz1" class="butn" style="float:left; margin-left:143px; margin-top:260px;" onclick="gourl('http://guangfazhengjuan.t.sohu.com')"></div>
	<div id="gfgz2" class="butn" style="float:left; margin-left:4px; margin-top:260px;" onclick="gourl('http://weibo.com/gfsecurities')"></div>
	<div id="st" class="butn" style="float:left; margin-left:4px; margin-top:260px;" onclick="gourl('http://t.qq.com/gfsecurities')"></div>
	<div   style="cursor:pointer;width:152px; height:45px;float:left; margin-left:240px; margin-top:230px;" onclick="gourl('http://q.stock.sohu.com/cgds/')"></div>
</div>
</div>
<div class="main">
  <div class="gf_listitle">
    <script language="javascript">
  		var TID = 0;
      function dis(ID){
      if(TID!=ID){
       document.getElementsByName("sKey")[TID].style.display = "none";
       document.getElementsByName("tit")[TID].className = "gf_tab2";
       document.getElementsByName("sKey")[ID].style.display = "";
       document.getElementsByName("tit")[ID].className="gf_tab";
       TID = ID;
      }
      }
      </script>
    <div class="gf_tab" onclick="dis(0)" id=tit name=tit>实盘参赛承诺书</div>
    <div class="gf_tab2" onclick="dis(1)" id=tit name=tit>实盘交易规则</div>
    <div style="margin-left: 540px; margin-top: 10px;">
    <a href="https://119.145.72.232/ECMMS/www/comjsp/ecmms/custorder/onlineorder/OnlineCustOrder.do"><img src="${ctx}/gsMatch/images/yy.jpg"/>
    </a>
    <a href="http://q.stock.sohu.com/cgds/index.jsp"><img src="${ctx}/gsMatch/images/icon_01.gif"/>
    </a>
    <a href="http://q.stock.sohu.com/cgds/index.jsp"><img src="${ctx}/gsMatch/images/icon_02.gif"/>
    </a>

    </div>
  </div>
  <div class="gf_con" id=sKey name=sKey style="display:;">
    <h2>实盘参赛承诺书</h2>
    <p> 本人自愿参加广发证券与搜狐联合举办的第一届搜狐中国股市寻牛汇活动（“活动”）。本人已经充分、仔细地阅读、理解并完全接受本次活动规则以及本确认书内容，在此谨向广发证券承诺并确认如下：</p>
    <p> 1)  规则及其更改 <br>
      　　1.1 本人已阅读、理解并自愿遵守在广发证券指定官网公布的本次活动的规则（“活动规则” ）。 <br>
      　　1.2 本人同意并自愿在广发证券开立账户（“交易账户”），已知悉并承诺遵守搜狐的相关交易规则和有关国家法律法规。 <br>
      　　1.3 广发证券有权对活动规则进行解释、更改、增加或删除；更改或增加的规则将作为活动规则不可分割的一部分。该更改、增加或删除包括但不限于：暂停或延长活动日程，变更晋级标准，更改活动开始、中止、终结日期等。本人（1）已知悉广发证券在本条的权利并会不时地在广发证券官方网站查询活动规则的解释、更改、增加或删除；（2）已同意并理解广发证券将通过广发证券官方网站或其他公开方式，而非直接向本人发送通知的形式，公布相关规则的更改、增加或删除。 <br>
      　　1.4 广发证券有权基于不可抗力、情势变更或政府部门之相关规定、通知、命令随时终止活动，并不得因此向广发证券和搜狐主张任何法律或经济上的权利。 “不可抗力”是指广发证券与参赛选手任何一方无法控制、不可预见的，或即使可以预见但无法避免的，且阻碍该方全部或部分履行本次活动义务的所有事件。该等事件包括但不限于任何罢工、工厂关闭、爆炸、自然灾害或公敌行为、火灾、洪水、破坏活动、意外事故、战争、暴动、叛乱以及任何其他类似事件。</p>
    <p> 2)  参赛资金及税费的承担<br>
      　　本人自行支付活动所需的交易资金、交易手续费、上网费、因参加活动产生的其他费用以及其它根据法律法规、搜狐的相关交易规则应由本人支付的税费。 </p>
    <p> 3)  交易信息 <br>
      　　1. 本人保证向广发证券及搜狐提供的资料及交易信息是真实、合法、有效的。任何本人提供的资料或交易信息导致侵犯第三人权利的任何责任均由本人承担。 <br>
      　　2. 本人同意，为评定活动晋级人员以及为使得本次活动顺利进行并完成，本人同意广发证券向搜狐提供本人在本次活动交易账户的相关信息及交易信息（实时公布账户证券代码、证券简称、前一交易日持股、交易明细、资金明细，不公布客户个人资料），并同意广发证券与搜狐以合法方式公布本人上述信息。 </p>
    <p> 4)  自负盈亏并自行承担后果 <br>
      　　1、本人参与活动的所有结果均由本人承担，与广发证券及其关联方、搜狐无关。结果包括但不限于：1）本人在活动中获得的利润或导致的亏损；2）因参加活动而获得的活动之外的盈利或导致的活动之外的费用或损失，如交通费、误工费；3）与本次活动有关的或者因参加活动而产生的其他后果。<br>
      　　2、本人同意，因系统故障、网络故障或延迟、数据库故障、相关硬件设施固有缺陷及其他非广发证券或搜狐原因对本人参加此次活动造成的任何后果和影响自行承担，并不得因此向广发证券和搜狐主张任何法律或经济上的权利。  <br>
      　　3、 本人自行妥善保管交易账户的信息及账户内资金。本人了解广发证券及其相关联方、搜狐不会基于任何原因索要本人交易相关密码。本人应自行负责密码的安全，并承担因密码丢失或被破解所导致的账户被窃的全部责任及相关损失。 <br>
      　　4、选手本人应妥善保管个人身份信息。他人通过窃取、伪造、变造选手本人身份证信息等方式冒用本人名义报名参加活动的，本人应对所有交易行为承担法律责任，广发证券依据本确认书采取的行为视为获得本人合法授权。本人追究侵权人法律责任的，广发证券有义务提供相关证据。 </p>
    <p> 5)   放弃索赔权利及责任承担 <br>
      　　1、 本人同意放弃其现在所知或将来可能知道的，由于参加活动所产生或与活动相关的针对广发证券或搜狐的任何和所有索赔权利（以上合称“索赔权利”） <br>
      　　2、 如果本人，或代表本人的任何人基于本确认书项下已经被放弃的索赔权利对广发证券、搜狐提起诉讼、要求仲裁、调解，参加诉讼、仲裁、调解或以其他方式通过诉讼、仲裁、调解寻求救济，或者通过其他任何方式向广发证券、搜狐提出本确认书项下已经被放弃的索赔权利，本人应承担并直接向广发证券、搜狐支付由于广发证券、搜狐参加诉讼、仲裁、调解或以其他救济方式进行抗辩而发生的律师费以及基于上述索赔所产生的直接经济损失。 <br>
      　　3、 如由于本人参与本次活动而导致广发证券、搜狐面临任何第三方的索赔、诉讼或仲裁等要求，或使广发证券、搜狐因此而遭受任何名誉或经济上的、直接或间接的损失，广发证券、搜狐均有权要求本人采取足够而适当的措施，以保证广发证券、搜狐免受上述索赔、诉讼或仲裁等要求的任何影响。广发证券、搜狐因此而遭受的任何名誉、声誉或经济上的、直接或间接的损失应由本人承担。<br>
    <p>本人已仔细阅读并理解活动规则以及本确认书内容，并同意在此签定本电子协议书并受其约束。本确认书自本人签订提交之日起生效。</p>
  </div>

  <div class="gf_con" id=sKey name=sKey style="display:none;">
  <h2>实盘交易规则</h2>
    <p> 本人自愿参加搜狐证券( “主办方” )主办的搜狐第一届中国股市寻牛汇活动（“活动” ）。本人已经充分、仔细地阅读、理解并完全接受本次活动规则以及本确认书内容，在此谨向主办方承诺并确认如下：</p>
    <p> 1、参赛者应以本人名义开立的证券账户进行参赛，本次大赛为实盘竞赛，参加实盘组比赛的选手使用自有账户自有资金参赛，自负盈亏，盈利与亏损均与主办方及其他第三方无关。</p>
    <p> 2、海选晋级赛按照各赛季选手的收益率排名进行晋级，退赛用户不参加排名。 </p>
    <p> 3、参加实盘组比赛的选手必须在广发证券开户并签署<font style="font-weight: bold;">中国股市寻牛汇实盘参赛承诺书</font>，参赛选手股票账户日终清算后人民币总资产（资金及股票、权证、基金、国债等所有证券的总市值）≥2万元。初始人民币总资产不足2万元的选手可允许报名，但不会被计入排名，只要通过操作使得账户日终清算后人民币总资产≥2万元（或者报名后累计转入资金≥2万元），系统将自动默认为当日正式参赛。</p>
    <p> 4、比赛开始后报名的选手，成绩从符合参赛资格确认后的<font style="font-weight: bold;">下一个交易日开始统计</font>。 </p>
    <p> 5、参加实盘组比赛的选手比赛期间允许转出资金，但如果转出资金后股票账户总资产小于2 万元则相当于自动退赛。因误操作转出资金的选手，如想重新比赛可转入资金或通过操作使得账户总资产≥2 万元后并通过广发证券书面致函主办方说明原因后方可重新获得参赛资格，<font style="font-weight: bold;">重新参赛后所有成绩归零</font>。出金原因导致退赛的次数大于2次以上的用户不可以再复赛。</p>
    <p> 6、由选手本人自行承担和支付比赛所需的交易资金、交易手续费、上网费、因参加比赛产生的其他费用及其它根据法律法规、指定交易商的相关交易规则应由本人承担的费用。</p>
    <p> 7、参赛帐户在参赛期间的A股交易佣金费率（简称“佣金”）按广发证券的规定执行，本条款的解释权归客户所在广发证券营业网点所有。</p>
    <p> 8、实盘组比赛账户可正常操作，不设置仓位限制，但比赛成绩只计算选手账户内的A股（含中小板和创业板）、封闭式基金的资产，融资融券信用账户内资产不参与比赛。IPO申购、增发及新股上市首日的收益都不计入成绩。</p>
    <p> 9、每比赛日次日9:30之前在官方网站上公布所有实盘组参赛选手排位赛及联赛收益率、排名、每日持仓、每日操作等相关信息，参赛者也可通过主办方提供的用户名和大赛ID查询自己的排名情况。</p>
    <p> 10、参赛者可通过指定交易商进行网上交易、手机证券、自助委托、电话委托下单交易，此四种亦为本竞赛之指定下单途径。</p>
    <p> 11、参赛者必须遵守交易所和指定交易商的风险控制规定，比赛期间没有交易记录的比赛成绩无效。</p>
    <p> 12、为保证比赛成绩的公正，参赛选手须允许主办方以分段资金账号或参赛编号的方式将参赛交易成绩数据在网上或相关媒体公布，并同意主办方对参赛选手的交易情况在相关媒体上进行点评。比赛结果在活动官网上公布，组委会将通过电话或电子邮件的方式通知获奖者。通过上述两种方式未能通知到的获奖者，请在大赛结束后的一周内与大赛主办单位联系确认，过期作弃权处理。</p>
    <p> 13、<font style="font-weight: bold;">所有现金奖由主办方搜狐证券网站代扣代缴所得税（20%）后</font>，发放于参赛选手实名开立的银行卡账户中。</p>
    <p> 14、主办方发现或有人举报，经核实后确有舞弊行为或操纵市场等嫌疑，立即取消选手参赛资格；由此产生的一切后果由选手承担。</p>
    <p> 15、免责条款：本次大赛主办方将本着勤勉尽职的态度竭力保证大赛的顺利进行，但对于不可抗力的因素或非主办方所能控制的情况所导致的风险、系统故障或由于网络问题导致的系统故障等原因对参赛选手收益率及排名产生的影响不做担保。参赛选手必须保护好自己的相关密码，如因为密码丢失或被破解所导致的账户被窃而造成损失的，大赛主办方和指定交易商不负任何责任。</p>
    <p> 16、主办方有权根据实际情况对大赛流程、规则、奖项、说明等进行修改或取消，并尽可能提前通知选手。</p>
  </div>
   <div>
		<table width="40%" border="0" cellspacing="0" cellpadding="0" >
			<tr>
				<td width="20%"></td>
				<td valign="middle">
					<input type="checkbox" id="checkbox1" />
				</td>
				<td valign="middle">
					我已看过并同意《实盘参赛承诺书》
				</td>
			</tr>
			<tr>
				<td width="20%"></td>
				<td valign="middle">
					<input type="checkbox" id="checkbox2" />
				</td>
				<td valign="middle">
					我已看过并同意《实盘交易规则》
				</td>
			</tr>
		</table>
		<div align="center" style="padding-bottom: 50px;">
			<p>
				<a href="#" onclick="javascript:comboxCheck();"><img
						src="${ctx}/gsMatch/images/submit.gif" />
				</a>
			</p>
		</div>
	</div>
 </div>
 <!--弹窗-->
  <div id="tc" class="tc" style="display:none;">
  <div id="close"><a onclick="javascript:hide();return false;"><img src="${ctx}/gsMatch/images/close.gif"/></a></div>
			<form name="loginForm"
				action="${ctx }/gsMatch/web/GsMatchLogin.go?function=CheckLogin"
				method="post" id="loginForm">
				<input type="hidden" name="isActive" id="isActive" value="0" />
				<input type="hidden" name="mac" id="mac" />
				<input type="hidden" name="disknum" id="disknum" />
				<table>
					<tr>
						<td>
							注 册 名：
						</td>
						<td>
							<input type="text" name="reg_name" id="reg_name" maxlength="50"
								value="${reg_name }" readonly="readonly" />
						</td>
					</tr>
					<tr>
						<td>
							客户编号：
						</td>
						<td>
							<input type="text" name="client_id" id="client_id" maxlength="20" />
						</td>
					</tr>
					<tr>
						<td>
							交易密码：
						</td>
						<td>
							<span id="Spanpwd" style="display: none"> <input
									type="password" name="password" id="password" maxlength="6" style="length:30px;" />
							</span><span id="passwdId"></span>
						</td>
					</tr>
					<tr>
						<td>
							验 证 码：
						</td>
						<td>
							<input size="11" id="verifyCode" type="text" class="input108"
								name="verifyCode" maxlength="4" style="width: 50px" />
							<img id="captchaImage" border=0
								src="${ctx}/share/verifyCodeImage.jsp" width="70" height="28"
								align="absmiddle" border="0" />
							<a href="javascript:refreshCaptcha();">看不清？换一张</a>
						</td>
					</tr>
					<tr>
						<td class="tc_submit" colspan="2">
							<a href="#" onclick="checkLogin();">提交报名</a>
						</td>
					</tr>
				</table>
			</form>
		</div>
  <style>
.shade{filter:alpha(opacity=50);-moz-opacity:0.5;position:absolute; background-color:#777;display:none;z-index:100;}
  </style>
  <div id="divshade" class="shade"><!--这个是遮盖的div--></div>
</body>
</html>
<script language="javascript">
    function show()
    {
        var contdiv=document.getElementById("tc");
        formatShadeDiv();
        showCont(contdiv);
        contdiv.focus();
    }
    function hide()
    {
        var dshade = document.getElementById("divshade");
        var contdiv = document.getElementById("tc");
        dshade.style.display = "none";
        contdiv.style.display = "none";
    }

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
    //dshade.style.filter="progid:DXImageTransform.Microsoft.Alpha(style=3,opacity=25,finishOpacity=75)";
    //dshade.style.opacity="0.6";
    //dshade.style.left="0";
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
    var mylayer = document.getElementById("tc");
    var toTop = $(document).scrollTop() + ($(window).height() - $(mylayer).height()) / 2;
    if (toTop <= ($(document).height() - $(mylayer).height()))
    {
        mylayer.style.top = toTop.toString() + "px";
    }
});

</script>