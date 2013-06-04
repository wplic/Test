<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<link href="/css/job/job.css" rel="stylesheet" type="text/css" />
<c:if test="${message!=null }">
	<script>
		alert('${message }');
	</script>
</c:if>
<script>
	String.prototype.trim = function() {   
    	return this.replace(/^\s+/g,"").replace(/\s+$/g,"");   
	}
	
	function checkForm(){
		var regName = document.getElementById("regName").value.trim();
		var passWord = document.getElementById("passWord").value.trim();
		if(regName=="")
	    {
	     alert("账号不能为空！");
	     document.getElementById("regName").focus();
	     return false;
	   	}
	    if(passWord=="")
	   	{
	     alert("密码不能为空！");
	     document.getElementById("passWord").focus();
	     return false;
	   	}
	   	var verifyCode=document.getElementById("verifyCode").value.trim();
	   if(verifyCode=="")
	   {
	     alert("效验码不能为空！");
	     document.getElementById("verifyCode").focus();
	     return false;
	   }
	    if(verifyCode.length!=4)
	   {
	     alert("效验码应该是4位！");
	     document.getElementById("verifyCode").focus();
	     return false;
	   }
	   
	   return true;
	}
	function refreshCaptcha(){
		document.getElementById("captchaImage").src="${ctx}/share/verifyCodeImage.jsp?ran="+Math.random();
	}
	function gotoyljl(){
		parent.window.open('${ctx }/job/resumePreview.jsp','');
	}
</script>
</head>
<body>
<logic:notPresent name="hrUser" scope="session">
   <div class="joblogin"><p class="biaoqian">求职会员登录</p></div>
        <div class="joblogin_bg">
    <form action="${ctx }/hrUserAction.do?method=hrUserLogin" method="post" 
		name="hrForm" onsubmit="return checkForm();">   
        <table width="100%" border="0" class="lh30">
  <tr>
    <td>帐　号：</td>
    <td><input name="regName" type="text" id="regName" class="w123" autoComplete="Off"/></td>
  </tr>
  <tr>
    <td>密　码：</td>
    <td><input name="passWord" type="password" id="passWord" class="w123" /></td>
  </tr>
  <tr>
    <td>效验码：</td>
    <td><input type="text" name="verifyCode" maxlength="4" style=" width:40px" id="verifyCode" class="w66" />
      <img id="captchaImage" border=0 src="${ctx}/share/verifyCodeImage.jsp" width="68" height="28" align="absmiddle" border="0"/>
      </td>
  </tr>
  <tr>
    <td></td>
    <td align="right">
      <a href="javascript:refreshCaptcha();" >看不清？换一张</a>
      </td>
  </tr>

</table>

        <table width="100%" border="0" class="lh30">
          <tr>
            <td align="center"><input name="button" type="submit" class="but02 blue" id="button" value="登录" /></td>
            <td align="right" class="blue"><a href="${ctx }/job/register.jsp" target="_parent">注册</a> | <a href="${ctx }/job/findPassword.jsp" target="_parent">忘记密码</a></td>
          </tr>
        </table>
  </form>
    </div>
    </logic:notPresent>
    
    <logic:present scope="session" name="hrUser">
    	   <div class="joblogin"><p class="biaoqian">求职会员登录</p></div>
	        <div class="joblogin_bg">
	        <table width="100%" border="0" class="lh24">
			  <tr>
			    <td colspan="2">尊敬的${hrUser.regName }，欢迎您的登录</td>
			    </tr>
			  <tr>
			    <td colspan="2">
			    <c:if test="${hrUser.preLoginTime==null}">
			    	本次为首次登陆
			    </c:if>
			    <c:if test="${hrUser.preLoginTime!=null}">
			    	上次登录时间为<bean:write name="hrUser" property="preLoginTime" format="yyyy年MM月dd日"/> 
			    </c:if>
			    </td>
			    </tr>
			 <tr class="blue">
				    <td width="45%" height="24"><img src="/pic/job/dot-txjl.jpg" align="absmiddle" /><a href="${contextPath }/job/jobApp.jsp?nav=apply" target="_parent">填写简历</a></td>
				    <td><img src="/pic/job/dot-jlyl.jpg" align="absmiddle" /><a href="#" onclick="gotoyljl()">简历预览</a></td>
				  </tr>
				  <tr class="blue">
				    <td height="24"><img src="/pic/job/dot-xgjl.jpg" align="absmiddle" /><a href="${contextPath }/job/updatePassword.jsp?nav=myResume" target="_parent">修改密码</a></td>
				    <td>
				    	<img src="/pic/job/dot-tcdl.jpg" align="absmiddle" /><a href="${ctx }/hrUserAction.do?method=hrUserLoginOut" target="_self">退出登录</a>
				    	<!-- 2013-3-21 取消个性倾向评测 <img src="/pic/job/dot-grqx.jpg" align="absmiddle" /><a href="${contextPath }/job/gxcpUserInfo.jsp?nav=myResume" target="_blank">个性倾向测评</a> -->
				    </td>
				  </tr> 
				  <tr class="blue">
				    <td height="24"><img src="/pic/job/dot-ypxx.jpg" align="absmiddle" /><a href="${ctx }/job/jobInfo.jsp" target="_parent">应聘信息</a></td>
				    <td></td>
				  </tr>
		        </table>
		    </div>
    
    </logic:present>
</body>
</html>