<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<jsp:directive.page import="com.cssweb.common.web.filter.SqlInjectValidate"/>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${ctx}/css/global.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/js/prototype.js"></script>
<jsp:directive.page import="com.css.system.Configuration" />
<%
	String ourl = Configuration.getProperty("OAUTH2_SERVER_DOMAIN") +  Configuration.getProperty("AUTHORIZATION_ENDPOINT") + "?client_id=" +
		Configuration.getProperty("OAUTH2_CLIENT_ID") + "&redirect_uri=" + Configuration.getProperty("OAUTH2_CLIENT_LOCAL") + 
		Configuration.getProperty("CALL_BACK");
	SqlInjectValidate sqlInjectValidate = SqlInjectValidate.getSqlInjectValidate();
	String url="/bussinesshall/loginLc.jsp";
	if(request.getParameter("url")!=null&&!request.getParameter("url").equals(""))
	{
		url=(String)request.getParameter("url");
		if(sqlInjectValidate.validateSql(url))
			response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
	}
	String urlError="/share/loginTemp.jsp";	
 	String beforeLoginUrl = Configuration.getProperty("beforeLoginUrl");
 	String verifyCodeUrl =  Configuration.getProperty("OAUTH2_SERVER_DOMAIN") + "Kaptcha.jpg?ran=";
%>

<SCRIPT LANGUAGE="JavaScript">
	var ourl = "<%= ourl%>";
	function checkLogin(){
		var serviceName=document.getElementById("serviceName").value;
	   	var password=document.getElementById("password").value;
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
	   	var verifyCode=document.getElementById("verifyCode").value;  
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
	   	if(select_name=="4")
	   	{
		   	loginForm.action="/sunnyCustAction.do?method=login";
		    loginForm.submit();
	   	}
	   	else {
	   	 	//交易客户和体验客户通过oauth2服务器验证
		 	document.getElementById("ticket").value = verifyCode;
		 	document.getElementById("user_id").value = serviceName;
	   	 	loginForm.action=ourl;
		  	loginForm.submit();
		 }
     }
	function checkJy()
	{
		window.parent.location.href = "http://store.gf.com.cn/#/home?login_type=trade";
	}
</SCRIPT> 
<body class="body_bg" bottommargin="0" leftmargin="0" marginheight="0" marginwidth="0" rightmargin="0" topmargin="0">
        <div class="letagt1">用户登录</div>
        <div class="letagm1">
         <form name="loginForm" id="loginForm" action="" method="post"  target="_top">
         <input type="hidden" name="ticket" id="ticket" />
         <input type="hidden" name="user_id" id="user_id" />
         <input type="hidden" name="login_type" id="login_type" value="portal" />
          <table width="98%" align="center" class="lh21 font12">
             <tr>
              <td width="10" rowspan="5">&nbsp;</td>
              <td>用户类型：</td>
              <td>
               <select name="select_name" id="select_name" onchange="refreshCaptcha();" style="width:100px">
                    <option value="1" selected>交易客户</option>
                    <option value="4">阳光私募</option>
                    <option value="3">体验客户</option>
              </select>
              </td>
            </tr>
            <tr>              
              <td>用户名：</td>
              <td>
               <input class="input100" id="serviceName" name="serviceName" type="text" maxlength="12" />
		       <input type="hidden" name="url" value="<%=url %>"/>
		       <input type="hidden" name="urlError" value="<%=urlError %>"/>
		       <input type="hidden" name="callBack" id="callBack" value=""/>
           </td>
            </tr>
            <tr>
              <td>密　码：</td>
              <td>
              <input class="input100" id="password" name="password" type="password"  maxlength="18" style="width:98px"/>
              </td>
            </tr>
            <tr>
              <td>验证码：</td>
              <td>
	               <input class="input100" size="11" id="verifyCode" type="text" name="verifyCode" maxlength="4" style=" width:40px">
		           <img id="captchaImage" border=0 src="<%=verifyCodeUrl %>" width="60" height="28" align="absmiddle" border="0"> 
              </td>
            </tr>
            <tr>
              <td>首次登录：</td>
              <td><input type="checkbox" name="checkbox" id="checkbox" onclick="checkJy();"/>
				<a href="javascript:refreshCaptcha();" >看不清？换一张</a></td>
            </tr>
            <tr>
              <td colspan="3" align="center">
                  <table width="95%" align="center" class="mt5">
                      <tr>
                        <td align="left"><a href="#" onclick="openHple();" class="font_9fu">帮助</a></td>
                        <td><img src="/pic/index/list_01.gif" /></td>
                        <td><input type="button" name="button" id="button" value="登录" class="but01" onclick="checkLogin();"/></td>
                        <td align="left">* <a href="http://store.gf.com.cn/#/register" target="_blank" class="font_9fu">体验申请</a></td>
                      </tr>
                </table>
              </td>
            </tr>
          </table>
          </form>
        </div>
        <div class="letagb1"></div>
<%@ include file="/commons/taglibs.jsp"%>
<%@ include file="/share/cssValidate.jsp"%>
<jsp:include page="/share/cssValidate.jsp" />
</body>   </html>     
    <!-- 以下为iframe高度自适应代码 -->
  <SCRIPT LANGUAGE="JavaScript">
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


	function refreshCaptcha(){
		var selVal=document.getElementById("select_name").value;
	 	if(selVal=="4"){
	 		document.getElementById("captchaImage").src = "${ctx}/share/verifyCodeImage.jsp?ran="+Math.random();
	 	}else{
	 		document.getElementById("captchaImage").src = "<%=Configuration.getProperty("OAUTH2_SERVER_DOMAIN") %>Kaptcha.jpg?ran="+Math.random();
	 	}
	}
	
	function openHple()
	{
		var ah = 280;
		var aw = 500;
		window.open('${contextPath }/share/beforeHple.jsp', 'newwindow', 'height='+ah +', width='+aw+', top=100, left=260, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no');
    }
</SCRIPT>