<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
	Long picid = null;
	if(null!=request.getAttribute("picid"))
		picid = (Long)request.getAttribute("picid");
	if(null!=request.getParameter("picid")&&!"".equals(request.getParameter("picid")))
		picid = Long.parseLong(request.getParameter("picid"));
	Long userid = null;
	if(null!=request.getAttribute("userid"))
		userid = (Long)request.getAttribute("userid");
	if(null!=request.getParameter("userid")&&!"".equals(request.getParameter("userid")))
		userid = Long.parseLong(request.getParameter("userid"));
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<head>
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
<%if(null!=picid){%>
	<script>
		parent.window.document.hrForm.picId.value='<%=picid%>';
	</script>
<%}%>
</head>
<body>
<%if(null!=picid){%>
<form action="${ctx }/hrUserAction.do?method=uploadPhoto" class="required-validate" method="post" name="hrForm" enctype="multipart/form-data">
<table align="center" width="100%">
	<tr>
		<td align="center" colspan="2">
			<img width="87" height="113" src="${ctx }/share/showUploadImage.jsp?id=<%=picid%>"  />
		</td>
	</tr>
	<tr>
		<td>
			<input type="hidden" name="userId" id="userId" value="<%=userid%>"/>
			<input type="file" name="picFile" id="picFile" class="w198"/>
		</td>
		<td align="right"><input type="submit" name="imgSubmit" value="上 传" style="height:18px;"/></td>
	</tr>
</table>
</form>
<%}else{%>
<form action="${ctx }/hrUserAction.do?method=uploadPhoto" class="required-validate" method="post" name="hrForm" enctype="multipart/form-data">
<table align="center">
	<tr>
		<td align="center">
			<img src="${ctx }/pic/job/photo.jpg"  />
		</td>
	</tr>
	<tr>
		<td>
			<input type="file" name="picFile" id="picFile" class="w198"/>
			<input type="submit" name="imgSubmit" value="上 传" style="height:18px;"/>
		</td>
	</tr>
</table>
</form>
<%}%>
</body>
</html>
<script language="javascript">
function gotosubmit(){
	var username = document.hrForm.username.value;
	if(''==username){
		alert("用户名不能为空！");
		return;
	}
	document.hrForm.submit();
}
</script>