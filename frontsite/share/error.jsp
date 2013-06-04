<%@ page contentType="text/html;charset=UTF-8" isErrorPage="true" %>
<%@ page import="org.apache.commons.logging.LogFactory" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>错误页面</title>
</head>
<body>

<div id="content">

	<h3>对不起!您请求的页面出现错误了.请联系网站管理人员;
	</h3>
	<br>

	<button onclick="javascript:window.close();">关闭</button>
	<br>
	<div id="detail_error_msg" style="display:none">
		<pre>用户操作出现错误.</pre>
	</div>
</div>
</body>
</html>