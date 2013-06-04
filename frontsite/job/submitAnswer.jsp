<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<head>
<%
	String username = "";
	String question = "";
	if(null==request.getAttribute("username") && null==request.getAttribute("question")){
	%>
		<script>
			alert("数据错误或无此用户！");
			window.location="${ctx }/job/findPassword.jsp";
		</script>
	<%
	}else{
		if(null!=request.getAttribute("username"))
			username = (String)request.getAttribute("username");
		if(null!=request.getAttribute("question"))
			question = (String)request.getAttribute("question");
	}
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

  		<form action="${ctx }/hrUserAction.do?method=confirmAnswer" method="post" name="hrForm">
		<table width="534" align="center" border=0>
			<tr height="25">
		    <td align="left" colspan="2" class="bold">回答问题找回密码</td>
		  	</tr>
			<tr height="25">
		    <td align="right">用户名：</td>
		    <td align="left"><input type="text" name="username" maxlength="50" size="20" value="<%=username%>" readonly/></td>
		  	</tr>
			<tr height="25">
		    <td align="right">密码问题：</td>
		    <td align="left"><input type="text" name="question" maxlength="50" size="20" value="<%=question%>" readonly/></td>
		  	</tr>
			<tr height="25">
		    <td align="right">密码答案：</td>
		    <td align="left"><input type="text" name="answer" maxlength="50" size="20"/></td>
		  	</tr>
			<tr height="25">
		    <td colspan="2" align="center"><input type="button" name="button" value="提 交" onclick="gotosubmit()"/></td>
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
	var answer = document.hrForm.answer.value;
	if(''==answer){
		alert("密码答案不能为空！");
		return;
	}
	document.hrForm.submit();
}
</script>