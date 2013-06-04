<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<jsp:directive.page import="com.cssweb.common.web.filter.SqlInjectValidate"/>
<%@page import="java.util.Date"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券webcall</title>
<link href="${ctx}/css/webcall/login.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/js/prototype.js"></script>
</head>
<jsp:directive.page import="com.css.system.Configuration" />
<%
	SqlInjectValidate sqlInjectValidate = SqlInjectValidate.getSqlInjectValidate();
	String url="/commons/error2.jsp";
	
	if(request.getParameter("newPath")!=null&&!request.getParameter("newPath").equals(""))
	{
		url=(String)request.getParameter("newPath");
		//if(sqlInjectValidate.validateSql(url))
			//response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
	}
	String urlError="/share/webcallLogin.jsp";
	
 String beforeLoginUrl = Configuration.getProperty("beforeLoginUrl");


%>

<SCRIPT LANGUAGE="JavaScript">
     function checkLogin(){
	   var serviceName=document.getElementById("serviceName").value;
	   var password=document.getElementById("password").value;
	   var verifyCode=document.getElementById("verifyCode").value;  

	   var loginForm=document.getElementById("loginForm");
	   if(serviceName=="")
	   {
	     alert("用户名不能为空！");
	     document.getElementById("serviceName").value="";
	     document.getElementById("serviceName").focus();
	     return false;
	   }
	   if(password=="")
	   {
	     alert("密码不能为空！");
	     document.getElementById("password").value="";
	     document.getElementById("password").focus();
	     return false;
	   }
	   if(verifyCode=="")
	   {
	     alert("验证码不能为空！");
	     document.getElementById("verifyCode").value="";
	     document.getElementById("verifyCode").focus();
	     return false;
	   }
	    if(verifyCode.length!=4)
	   {
	     alert("验证码应该是4位！");
	     document.getElementById("verifyCode").value="";
	     document.getElementById("verifyCode").focus();
	     return false;
	   }
	       //先验证验证码
		   var url  = '${ctx}/webUser.do';  	
	       var paras = 'method=checkVerifyCode&verifyCode='+verifyCode;  		
	       new Ajax.Request(url, {method:'post',postBody: paras,asynchronous: false,				 
				onSuccess: function(response) {  
				    if (response.responseText==0) {
				      alert('验证码输入错误！');
				    } else if (response.responseText==1) { 
				      getEncryptionTime();
				    }  
				}, 
				onFailure: function() {
				    alert('验证码有误！');
				}    
		   });
     }
    function checkJy()
    {
      document.location.href="<%=beforeLoginUrl%>";
    }
</SCRIPT>
<body>
<div class="loginbox">
<h3>交易用户登录</h3>
<form name="loginForm" id="loginForm" action="" method="post">
<input type="hidden" name="url" value="<%=url %>"/>
<input type="hidden" name="urlError" value="<%=urlError %>"/>
<input type="hidden" name="callBack" id="callBack" value=""/>
<input type="hidden" name="loginType" id="loginType" value="webcall"/>
<p><em>用户名：</em><input name="serviceName" id="serviceName" class="input_180" value="" maxlength="12" type="text"></p>
<p><em>密  码：</em><input name="password" id="password" class="input_180" value="" maxlength="18"  type="password"></p>
<p><em>验证码：</em><input name="verifyCode" id="verifyCode" class="input_100" value="" maxlength="4"  type="text">
<img id="captchaImage" border=0 src="${ctx}/share/verifyCodeImage.jsp" width="60" height="28" align="absmiddle" border="0">
<cite><a href="#" onclick="javascript:refreshCaptcha();">看不清，换一张</a></cite></p>
<p class="loginbutbox">

<a href="#" onclick="openHple();">帮助</a>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
<input id="button" name="button" onclick="checkLogin();" value="登录" class="loginbut" tabindex="5" type="button">

</p>
</form>
</div>
<%@ include file="/commons/taglibs.jsp"%>
<%@ include file="/share/cssValidate.jsp"%>
<jsp:include page="/share/cssValidate.jsp" />
</body>

</html>
  <SCRIPT LANGUAGE="JavaScript">
function refreshCaptcha(){
	document.getElementById("captchaImage").src="${ctx}/share/verifyCodeImage.jsp?ran="+Math.random();
}
function frameFitSelfHeight1(frameId,countNum){
	myFrameId=frameId;
	myCountNum=countNum;
	
	if(myCountNum==null || myCountNum==undefined || myCountNum<0){
		myCountNum=0;
	}
	
	myCountNum++;
	if(myCountNum<=20){
		window.parent.window.document.getElementById(myFrameId).height = window.parent.window.document.getElementById(myFrameId).contentWindow.document.body.scrollHeight;
		setTimeout('frameFitSelfHeight1(myFrameId,myCountNum)',100);
	}
}
frameFitSelfHeight1('leftlogin',null);

function openHple()
	{
	var ah = 150;
	var aw = 450;
	window.open('${contextPath }/share/webcallLoginHple.jsp', 'newwindow', 'height='+ah +', width='+aw+', top=100, left=260, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no');
    }

refreshCaptcha();
</SCRIPT>

