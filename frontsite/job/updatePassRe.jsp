<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<%@ include file="/commons/taglibs.jsp"%>
<%
String message = "";
if(null!=request.getAttribute("message"))
	message = (String)request.getAttribute("message");
%>
<script language="javascript">
	alert('<%=message%>');
	window.location="${ctx }/job/index.jsp";
</script>