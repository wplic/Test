<%@ page contentType="text/html;charset=UTF-8" isErrorPage="true" %>
<%@ page import="org.apache.commons.logging.LogFactory" %>
<%@ page import="java.net.URLDecoder" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<%
	String message = request.getParameter("message");
	String errorinfo="";
	if(message==null || message.equals("")){
		errorinfo = "系统错误";
	}
	else{
		errorinfo = URLDecoder.decode(message);
	}

 %>
<head>
	<title>错误信息</title>
</head>
<body>

<div id="content">

	<h3><%=errorinfo %>
	</h3>
	<br>

	<button onclick="javascript:window.close();">关闭</button>
	<br>
	<div id="detail_error_msg" style="display:none">
		<pre><%=errorinfo %></pre>
	</div>
</div>
</body>
</html>