<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*"    %>
<jsp:directive.page import="com.cssweb.client.pojo.TsystemWebuser"/>
<body>
</body>
  <%
	TsystemWebuser tsystemWebuser=null;
	if(request.getSession().getAttribute("tsystemWebuser")!=null)
	tsystemWebuser=(TsystemWebuser)request.getSession().getAttribute("tsystemWebuser");
	if(tsystemWebuser==null) {
		int ctxLength = request.getContextPath().length();
		String nextUrl = request.getRequestURI().substring(ctxLength);
		if(request.getQueryString()!=null&&!request.getQueryString().equals(""))
		nextUrl=nextUrl+"?"+request.getQueryString();
		String url=nextUrl;
%>
		<script type="text/javascript">	
		    var tempForm = document.createElement("form");   
		    tempForm.action="${contextPath}/share/login.jsp";   
		    tempForm.method="post";   
		    document.body.appendChild(tempForm); 
		    var parameter = document.createElement('input');
			parameter.type = "hidden";
			parameter.name = "url";
			parameter.value = "<%=url %>";
			tempForm.appendChild(parameter);
			alert("对不起，您还未登录，请登录！");
			tempForm.submit();
		</script>
<%}%>