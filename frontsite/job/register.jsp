<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<link href="/css/job/job.css" rel="stylesheet" type="text/css" />
<c:if test="${message !=null }">
	<script>
		alert("${message}");
	</script>
</c:if>
<script>
	String.prototype.trim = function() {   
    return this.replace(/^\s+/g,"").replace(/\s+$/g,"");   
	}

	function ismail(mail)
	{
	 return(new RegExp(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/).test(mail));
	}
	
	function isSame(fir,sec){
		if(fir.trim()==sec.trim()){
			return true;
		}else{
			return false;
		}
	}
	
	function checkForm(){
		var regName = document.getElementById("regName").value.trim();
		var passWord = document.getElementById("passWord").value.trim();
		var rePassWord = document.getElementById("rePassWord").value.trim();
		var passQuestion = document.getElementById("passQuestion").value.trim();
		var passAnswer = document.getElementById("passAnswer").value.trim();
		if(regName==""){
			alert("注册账号不能为空");
			return false;
		}
		if(!ismail(regName)){
			alert("注册账号请使用常用邮箱格式");
			return false;
		}
		
		if(passWord==""){
			alert("登录密码不能为空");
			return false;
		}
		if(rePassWord==""){
			alert("重复登录密码不能为空");
			return false;
		}
		if(!isSame(passWord,rePassWord)){
			alert("重复输入密码必须一致");
			return false;
		}
		
		if(passQuestion==""){
			alert("密码问题不能为空");
			return false;
		}
		if(passAnswer==""){
			alert("问题答案不能为空");
			return false;
		}
		return true;
	}
	
	
</script>
</head>
<body>
<jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：首页 - 人才招聘 - 会员注册</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft">
		<jsp:include page="/job/job_lmenu.jsp" />
        <div class="blank5"></div>
<jsp:include page="faq.jsp" />
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w706 fright">
 <div class="bg_f5 p8">
<table width="100%" border="0" class="register_tt">
  <tr>
    <td class="register_top"><p class="indent42 font14">会员注册</p></td>
    <td>&nbsp;</td>
  </tr>
</table>
<div class="register_bg">
<div class="register_bg2">
<form action="${ctx }/hrUserAction.do?method=hrUserRegister" method="post" 
		name="hrForm" onsubmit="return checkForm();">

<table width="100%" border="0" class="lh30">
  <tr>
    <td width="13%" class="font14"><span class="red">*</span>注册帐号：</td>
    <td>
    	<input type="text" name="regName" id="regName" class="w198" autoComplete="Off"/>
    </td>
  </tr>
  <tr>
    <td colspan="2" class="font_73">请使用您的常用邮箱作为注册帐号，我们可能通过该邮箱与您联系，请不要使用qq邮箱或者学校内部邮箱</td>
  </tr>
  <tr>
    <td colspan="2" height="10"></td>
  </tr>
  <tr>
    <td class="font14"><span class="red">*</span>登录密码：</td>
    <td>
    	<input type="password" name="passWord" id="passWord" class="w198"/>
    </td>
  </tr>
  <tr>
    <td colspan="2" class="font_73">请输入密码，区分大小写</td>
  </tr>
  <tr>
    <td colspan="2" height="10"></td>
  </tr>
  <tr>
    <td class="font14"><span class="red">*</span>重复密码：</td>
    <td>
    	<input type="password" name="rePassWord" id="rePassWord" class="w198"/>
    </td>
  </tr>
  <tr>
    <td colspan="2" class="font_73">请再输一遍密码</td>
  </tr>
    <tr>
    <td colspan="2" height="10"></td>
  </tr>
  <tr>
    <td class="font14"><span class="red">*</span>密码问题：</td>
    <td>
    	<input type="text" name="passQuestion" id="passQuestion" class="w198"/>
    </td>
  </tr>
  <tr>
    <td colspan="2" class="font_73">忘记密码的提示问题</td>
  </tr>
    <tr>
    <td colspan="2" height="10"></td>
  </tr>
  <tr>
    <td class="font14"><span class="red">*</span>问题答案：</td>
    <td>
    	<input type="text" name="passAnswer" id="passAnswer" class="w198"/>
    </td>
  </tr>
  <tr>
    <td colspan="2" class="font_73">忘记密码的提示问题答案，用于取回密码</td>
  </tr>
    <tr>
    <td colspan="2" height="10"></td>
  </tr>
  <tr>
    <td colspan="2" align="center"><input name="button" type="submit" class="but02" id="button" value="注册" />
      &nbsp;&nbsp;&nbsp;&nbsp;<input name="button2" type="reset" class="but02" id="button2" value="重填" /></td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;</td>
  </tr>
  </table>
</form>
  
  </div>
</div>
 </div>
<div class="clearfloat"></div>
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<div class="blank5"></div>
<jsp:include page="/commons/msbottom.jsp" />
</body>
</html>