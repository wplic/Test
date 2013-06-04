<%@page contentType="text/html;charset=UTF-8"%>
<%
	String params = request.getQueryString() ;
%>
<html>
<head>
<title>树型数据浏览器</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="/plugins/tree/skins/default/styles/style.css" rel="stylesheet" type="text/css">
</head>
<frameset rows="*, 35" cols="*" framespacing="4" frameborder="yes" border="2" bordercolor="#EEEEEE">
  <frame src="left.jsp?<%= params%>" name="mainFrame" frameborder="no" scrolling="auto">
  <frame src="right.jsp?<%= params%>" name="rightFrame"  frameborder="no" scrolling="no">
</frameset>
<noframes><body>
</body></noframes>
</html>