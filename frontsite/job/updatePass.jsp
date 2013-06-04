<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<head>
<%
	String username = "";
	if(null!=request.getAttribute("username"))
		username = (String)request.getAttribute("username");
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<link href="/css/investorEdu/investorEdu.css" rel="stylesheet" type="text/css" />
<link href="/css/job/job.css" rel="stylesheet" type="text/css" />
<c:if test="${message!=null }">
	<script>
		alert("${message}");
	</script>
</c:if>
</head>
<body>
<jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：首页 - 人才招聘</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft">
		<jsp:include page="/job/job_lmenu.jsp" />
    <div class="blank5"></div>
    <iframe target="_blank" id="leftlogin" name="leftlogin"  marginWidth="0" marginHeight="0" src="${contextPath }/job/job_login.jsp"
						frameBorder="0" noresize width="100%" scrolling="no" onload="this.height =document.frames['leftlogin'].document.body.scrollHeight"></iframe>
            <div class="blank5"></div>

  </div>
  <!--右侧sied开始--> 
  <div class="w706 fright">
		<div class="blank10"></div>
		<div class="blank10"></div>
		<div class="blank10"></div>
		<div class="blank10"></div>
 		<div class="wj_box">

  		<form action="${ctx }/hrUserAction.do?method=updatePass" method="post" name="hrForm">
		<table width="534" align="center" border=0>
			<tr height="30">
		    <td align="left" colspan="2" class="bold">回答问题找回密码<input type="hidden" name="username" maxlength="10" size="12" value="<%=username%>"/></td>
		  	</tr>
			<tr height="30">
		    <td align="right">新密码：</td>
		    <td align="left"><input type="password" name="password" maxlength="10" size="12"/></td>
		  	</tr>
			<tr height="30">
		    <td align="right">确认新密码：</td>
		    <td align="left"><input type="password" name="password2" maxlength="10" size="12"/></td>
		  	</tr>
			<tr height="30">
		    <td colspan="2" align="center"><input type="button" name="button" value="提交" onclick="gotosubmit()"/></td>
		  	</tr>
		</table>
		</form>
 		</div>
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<div class="blank5"></div>
<jsp:include page="/commons/msbottom.jsp" />


</body>
</html>
<script language="javascript">
function gotosubmit(){
	var password = document.hrForm.password.value;
	var password2 = document.hrForm.password2.value;
	if(''==password){
		alert("密码不能为空！");
		return;
	}
	if(''==password2){
		alert("确认密码不能为空！");
		return;
	}
	if(password!=password2){
		alert("两次输入的密码不一致！");
		return;
	}
	document.hrForm.submit();
}
</script>