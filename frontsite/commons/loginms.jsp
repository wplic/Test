<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/commons/taglibs.jsp"%>
<jsp:directive.page import="com.css.system.Configuration" />
<jsp:directive.page import="com.cssweb.common.web.filter.SqlInjectValidate"/>
<script type="text/javascript" src="${ctx}/js/prototype.js"></script>
<%
  request.getSession().removeAttribute("assetUser");
 String mainLoginUrl = Configuration.getProperty("mainLoginUrl");
%>
<%
	String url="";
	SqlInjectValidate sqlInjectValidate = SqlInjectValidate.getSqlInjectValidate();
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
	String urlError="/commons/loginms.jsp";
	
	String loginErrorMessage = null;
	if(request.getAttribute("loginErrorMessage")!=null){
		loginErrorMessage =(String) request.getAttribute("loginErrorMessage");
	}	if(loginErrorMessage!=null){
%>
	<script type="text/javascript">
		alert('<%=loginErrorMessage%>');
	</script>
<% 
	}
	
	Object oldaccount = request.getAttribute("oldaccount");
	Object newaccount = request.getAttribute("newaccount");
	if(null!=newaccount&&null!=oldaccount){
%>
	<script type="text/javascript">
		alert('尊敬的广发理财3号持有人：您好！广发理财3号注册登记业务已于2009年7月24日移交至中登公司。您原有广发集合资产管理账户（'+<%=oldaccount.toString()%>+'）已变更为深圳开放式基金账户（'+<%=newaccount.toString()%>+'）；请您用深圳开放式基金账户进行登录及查询。');
		if(parent.window){
			parent.window.location.href="/commons/loginms.jsp?newaccount=<%=newaccount.toString()%>&oldaccount=<%=oldaccount.toString()%>";
		}
	</script>
<% 
	}else{
		oldaccount = request.getParameter("oldaccount");
		newaccount = request.getParameter("newaccount");
	}

%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${ctx}/css/style.css" rel="stylesheet" type="text/css" />
</head>
 <SCRIPT LANGUAGE="JavaScript">
  function changeLoginType(choose){
	  var loginType = choose.value;
	  if(loginType=="1"||loginType=="3")
	  {
	   document.getElementById("sjdl").style.display = "block";	
	   document.getElementById("default_yhm").style.display = "block";	
	   document.getElementById("default_khh").style.display = "none";
	  }else{
	   document.getElementById("default_yhm").style.display = "none";
	   document.getElementById("default_khh").style.display = "block";	
	   document.getElementById("sjdl").style.display = "none";
	  }
	}
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
	   	loginForm.action="${ctx}/webUser.do?method=loginTx";
	   	loginForm.submit();
	   }else if(select_name=="3")
	   {
	    loginForm.action="${ctx}/webUser.do?method=loginTy";
	    loginForm.submit();
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
     function checkJy()
    {
      document.location.href="<%=mainLoginUrl%>";
    }

	function refreshCaptcha(){
		document.getElementById("captchaImage").src="${ctx}/share/verifyCodeImage.jsp?ran="+Math.random();
	}
</SCRIPT> 
<jsp:include page="/share/cssValidate.jsp" />
<body class="ggjs_bg">
<div class="ggjs_box">
	<div class="ggjs_top">
    	<p><a href="/index.jsp"><img src="/pic/commons/login/ggjs_logo.jpg" /></a></p>
    </div>
    <div class="ggjs_line"></div>
    
    <div class="ggjs_tit"><span class=" mr10 ml10"><img src="/pic/commons/login/ggjs_01.gif"/></span>当前位置：
    <a href="${ctx}/default.jsp">首页</a> > 用户登录</div>
    <div class="p15">
      <div class="log_bg1"></div>
<div class="log_bg2">
<table width="77%" align="center">
  <tr>
    <td height="8"></td>
  </tr>
  <tr>
    <td class="blue bold">用户登录</td>
  </tr>
</table>
<div style=" height:38px"></div>
<form name="loginForm" action="${ctx}/webUser.do?method=login" method="post" onSubmit="return checkLogin();">
<table width="40%" border="0" align="center" cellpadding="0" cellspacing="0" class="lh25">
  <tr>
   <td width="10" rowspan="5">&nbsp;</td>
   <td>用户类型：</td>
   <td>
           <select name="select_name" id="select_name" style="width:108px" onchange="changeLoginType(this);">
                    <option value="2">理财客户</option>
              </select>
   </td>
 </tr>
  <tr>
    <td>
     <div id="default_yhm">
                客户号或<br/>身份证：
               </div>
               <div id="default_khh" style="display:none">
                客户号或<br/>身份证：
               </div>
  </td>
    <td><input type="text" id="serviceName" name="serviceName" class="input108" style=" width:158px" maxlength="18" value='<%=null==newaccount?"":newaccount.toString()%>'/>
        <input type="hidden" name="url" value="<%=url %>"/>
    	<input type="hidden" name="urlError" value="<%=urlError %>"/>
    	<input type="hidden" name="callBack" id="callBack" value=""/>
    </td>
  </tr>
  <tr>
    <td>查询密码：</td>
    <td><input id="password" name="password" type="password"  maxlength="18" class="input108" style=" width:158px" />
     </td>
  </tr>
  <tr>
    <td>校 验 码：</td>
    <td><input size="11" id="verifyCode" type="text" class="input108" style=" width:108px" name="verifyCode" maxlength="4"/>
    <img id="captchaImage" border=0 src="${ctx}/share/verifyCodeImage.jsp" width="70" height="28" align="absmiddle" border="0"/>
      </td>
  </tr>
  <tr id="sjdl">
	<td colspan="2">
		<table border="0">
			<tr>
				<td width="24%">首次登录：</td>
				<td width="43%"><label>
				  <input type="checkbox" name="checkbox" id="checkbox" onclick="checkJy();"/>
				</label></td>
				<td width="47%"><a href="javascript:refreshCaptcha();" >看不清？换一张</a></td>
			</tr>
		</table>
	</td>
  </tr>
</table>

<div style=" height:10px"></div>
<table width="30%" border="0" align="center" cellpadding="0" cellspacing="0" class="lh25">
  <tr>
    <td width="17%"><a href="#" class="font_9fu">帮助</a></td>
    <td width="19%"><a href="#"><img src="/pic/commons/login/list_01.gif" /></a></td>
    <td width="28%"><a href="#">
    <img border="0" src="/pic/index/but_dl.gif" align="absmiddle" onclick="checkLogin();" />
    </a></td>
    <td width="36%"><a href="${ctx }/share/userApplication.jsp" target="_blank"  class="font_31u">体验申请</a></td>
  </tr>
</table>
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="lh25">
  <tr>
    <td>提示：初始密码是身份证数字后六位，请登陆后到“账户资料修改－> 密码修改”处进行密码修改！ <br/>注：如果身份证最后一位为字母、如X，请输入身份证后六位数字！ 
    </td>
  </tr>
</table>
</form>
</div>
    </div>
    <jsp:include page="/commons/msbottom2.jsp" />
</div>

</body>
</html>