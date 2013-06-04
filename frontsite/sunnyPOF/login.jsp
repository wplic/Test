<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<jsp:directive.page import="com.cssweb.common.web.filter.SqlInjectValidate"/>
<%@ include file="/commons/taglibs.jsp"%>
<%
	SqlInjectValidate sqlInjectValidate = SqlInjectValidate.getSqlInjectValidate();
	String url="/bussinesshall/loginLc.jsp";
	if(request.getParameter("url")!=null&&!request.getParameter("url").equals(""))
	{
		url=(String)request.getParameter("url");
		if(sqlInjectValidate.validateSql(url))
			response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
	}
	if(request.getAttribute("url")!=null&&!request.getAttribute("url").equals(""))
	{
		url=(String)request.getAttribute("url");
		if(sqlInjectValidate.validateSql(url))
			response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
	}
	String urlError="/share/login.jsp";
	
	String loginErrorMessage = null;
	if(request.getAttribute("loginErrorMessage")!=null){
		loginErrorMessage =(String) request.getAttribute("loginErrorMessage");
	}
	if(loginErrorMessage!=null){
%>
	<script type="text/javascript">
		alert('<%=loginErrorMessage%>');
	</script>
<% 
	}
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${ctx}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/js/prototype.js"></script>
</head>
 <SCRIPT LANGUAGE="JavaScript">
     function checkLogin(){
      
	   var serviceName=document.getElementById("serviceName").value;
	   var password=document.getElementById("password").value;
	   var verifyCode= document.getElementById("verifyCode").value;  
	  
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
	   var select_name=document.getElementById("select_name").value;
	  
	   if(select_name=="2")
	   {
	   	   document.getElementById("loginForm").action="/webUser.do?method=loginTx";
	       document.getElementById("loginForm").submit();
	   } else if(select_name=="3"){
		   document.getElementById("loginForm").action="/webUser.do?method=loginTy";
	       document.getElementById("loginForm").submit();
	   } else if(select_name=="4"){
		   document.getElementById("loginForm").action="/sunnyCustAction.do?method=login";
	       document.getElementById("loginForm").submit();
	   } else {
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
     }
     
     function checkJy() {
         document.location.href="${contextPath }/share/accountLogin.jsp";
     }

	function refreshCaptcha(){
		document.getElementById("captchaImage").src="${ctx}/share/verifyCodeImage.jsp?ran="+Math.random();
	}
    
</SCRIPT> 
<body class="ggjs_bg">
<jsp:include page="/share/cssValidate.jsp" />
<div class="ggjs_box">
	<div class="ggjs_top">
    	<p><a href="/index.jsp"><img src="/pic/infoCenter/f10/ggjs_logo.jpg" /></a></p>
    </div>
    <div class="ggjs_line"></div>
    <div class="ggjs_tit"><span class=" mr10 ml10"><img src="/pic/infoCenter/f10/ggjs_01.gif"/></span>当前位置：
    <a href="${ctx}/index.jsp">首页</a> > 用户登录</div>
    <div class="p15">
      <div class="log_bg1"></div>
<div class="log_bg2">
<table width="77%" align="center">
  <tr>
    <td height="8"></td>
  </tr>
  <tr>
    <td class="red bold">用户登录</td>
  </tr>
</table>
<div style=" height:38px"></div> 
<form name="loginForm" id="loginForm" action="/sunnyCustAction.do?method=login" method="post">
<table width="30%" border="0" align="center" cellpadding="0" cellspacing="0" class="lh25">
  <tr>
   <td width="10" rowspan="5">&nbsp;</td>
   <td>用户类型：</td>
   <td>
           <select name="select_name" id="select_name" style="width:108px">
                    <option value="1" >交易客户</option>
                    <option value="2" >理财客户</option>
                    <option value="3">体验客户</option>
                    <option value="4" selected>阳光私募</option>
              </select>
   </td>
 </tr>
  <tr>
    <td>用 户 名：</td>
    <td><input type="text" id="serviceName" name="serviceName" type="text" class="input108" maxlength="20"/>
    <input type="hidden" name="callBack" id="callBack" value=""/>
    </td>
  </tr>
  <tr>
    <td>服务密码：</td>
    <td><input id="password" name="password" type="password"  maxlength="18" class="input108"/>
      </td>
  </tr>
  <tr>
    <td>校 验 码：</td>
    <td>
     <input size="11" id="verifyCode" type="text" class="input108" name="verifyCode" maxlength="4" style=" width:50px" />
     <img id="captchaImage" border=0 src="${ctx}/share/verifyCodeImage.jsp" width="70" height="28" align="absmiddle" border="0"/>
     </td>
  </tr>
  <tr>
	<td colspan="2">
		<table border="0">
			<tr>
				<td width="30%">首次登录：</td>
				<td width="25%"><label>
				  <input type="checkbox" name="checkbox" id="checkbox" onclick="checkJy();"/>
				</label></td>
				<td width="45%"><a href="javascript:refreshCaptcha();" >看不清？换一张</a></td>
			</tr>
		</table>
	</td>
  </tr>
</table>
<div style=" height:28px"></div>
<table width="30%" border="0" align="center" cellpadding="0" cellspacing="0" class="lh25">
  <tr>
    <td width="17%"><a href="#" class="font_9fu">帮助</a></td>
    <td width="19%"><a href="#"><img src="/pic/index/list_01.gif" /></a></td>
    <td width="28%"><a href="#">
    	<img border="0" src="/pic/index/but_dl.gif" align="absmiddle" onclick="checkLogin();" />
    </a></td>
    <td width="36%"><a href="${ctx }/share/userApplication.jsp" target="_blank" class="font_31u">体验申请</a></td>
  </tr>
</table>
</form>
</div>
    </div>
    <jsp:include page="/share/bottom2.jsp" />
</div>
</body>
</html>