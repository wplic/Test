<%@ page contentType="text/html;charset=UTF-8" isErrorPage="true" %>
<%@ page import="org.apache.commons.logging.LogFactory" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>非法操作</title>
</head>
<body>

<div id="content">

	<h3>对不起!非法操作!
	</h3>
	<br>

	<button onclick="javascript:window.close();">关闭</button>
	<br>
	<div id="detail_error_msg" style="display:none">
		<pre>用户非法操作.</pre>
	</div>
</div>
</body>
</html>