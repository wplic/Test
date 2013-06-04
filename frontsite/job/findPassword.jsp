<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<link href="/css/investorEdu/investorEdu.css" rel="stylesheet" type="text/css" />
<link href="/css/job/job.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${contextPath }/js/jsIfUtils.js"></script>
<script type="text/javascript" src="${contextPath }/js/jquery-1.7.2.min.js"></script>
<c:if test="${message!=null }">
	<script>
		alert("${message}");
	</script>
</c:if>
<c:if test="${eer!=null }">
	<script>
		alert("${eer}");
	</script>
</c:if>
<script language="javascript">
function gotosubmit(){
	var username = document.hrForm.username.value;
	if(''==username){
		alert("用户名不能为空！");
		return;
	}
	document.hrForm.submit();
}
function gotosubmits(){
	var idcard = document.hrFormcard.idcard.value;
	if(''==idcard){
		alert("身份证账号不能为空！");
		return false;
	}
	var valuetext=document.getElementById("idcard").value;
	
	return true;
}

</script>
<style type="text/css">
.button {
    background-color: #FF9900;
    color: #FFFFFF;
    height: 30px;
   
}
</style>
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
						frameBorder="0" noresize width="100%" scrolling="no" onload="iframeFitHeight(this)"></iframe>
            <div class="blank5"></div>

  </div>
  <!--右侧sied开始--> 
  <div class="w706 fright">
  		
		<div class="blank10"></div>
		<div class="blank10"></div>
		<div class="blank10"></div>
		<div class="blank10"></div>
 		<div class="wj_box">
 		
  		<form action="${ctx }/hrUserAction.do?method=getUserQestion" method="post" name="hrForm">
		<table width="534" align="center" border=0>
			<tr height="30">
		    <td align="left" colspan="2" class="bold" style="font-size: 14px">回答问题找回密码</td>
		  	</tr>
			<tr height="30">
		    <td align="right" style="font-size: 14px">请输入要找回密码的用户名：</td>
		    <td align="left"><input type="text" name="username" maxlength="50" size="20"/></td>
		  	</tr>
			<tr height="30">
		    <td colspan="2" align="center"><input style="font-size: 14px" class="button" type="button" name="button" value=" 提 交 " onclick="gotosubmit()"/></td>
		  	</tr>
		</table>
		</form>
 		</div>
 		
 		<div class="wj_box">
 		<c:if test="${dataBean==null}">
  		<form action="${ctx }/hrUserAction.do?method=getUserIdcard" method="post" name="hrFormcard" onsubmit="return gotosubmits()">
		<table width="534" align="center" border=0>
			<tr height="30">
		    <td align="left" colspan="2" class="bold" style="font-size: 14px">忘记用户名</td>
		  	</tr>
			<tr height="30">
		    <td align="right" style="font-size: 14px">请输入对应的身份证号：</td>
		    <td align="left"><input type="text" id="idcard" name="idcard" maxlength="50" size="20"/></td>
		    </tr>
		    <tr height="30">
		    <td colspan="2" align="center"><input class="button" type="submit" style="font-size: 14px" name="button" value=" 提 交 " /></td>
		  	</tr>
		</table>
		</form>
		 </c:if>
		 
		<c:if test="${dataBean!=null}">
		<form action="${ctx }/hrUserAction.do?method=sendMaill" method="post" name="hrFormMail">
		<table width="534" align="center" border=0>
			<tr height="30">
		    <td align="left" colspan="2" class="bold" style="font-size: 14px">用户名查询</td>
		  	</tr>
		    <tr height="30">
		     <td align="center" style="font-size: 14px">您的用户名是:${dataBean.regName}
		     <br/>
		     <c:if test="${messages!=null}">
		    ${messages}
		     </c:if>
		     </td>
		     </tr>
		     <tr height="30">
		    <td colspan="2" align="right">
		     <input name="to" type="hidden" value="${dataBean.regName }"/>
		    <input type="submit" class="button" name="button" style="font-size: 14px" value=" 向这个邮箱发送密码找回答案 "/>
		    </td>
		  	</tr>
		</table>
		</form>
		</c:if>
 		</div>
 		
 		
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<div class="blank5"></div>
<jsp:include page="/commons/msbottom.jsp" />


</body>
</html>
