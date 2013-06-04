<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<jsp:directive.page import="com.cssweb.hr.pojo.HrUser"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<bean:parameter name="nav" id="nav" value="apply"/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<link href="/css/job/job.css" rel="stylesheet" type="text/css" />

<c:if test="${message!=null }">
	<script>
		alert("${message}");
		window.close();
	</script>
</c:if>
 <script>
 
 	function subToPage(){
 		window.location="${ctx }/gxcpAction.do?method=updateBeginTime";
 	}
 </script>
</head>
<body>
</body>
</html>