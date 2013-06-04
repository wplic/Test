<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"    %>
<%@ include file="/commons/taglibs.jsp"%>
<body>
</body>
<jsp:directive.page import="com.cssweb.common.web.filter.SqlInjectValidate"/>
<%
	SqlInjectValidate sqlInjectValidate = SqlInjectValidate.getSqlInjectValidate();
	
	String url="";
	if(request.getAttribute("url")!=null&&!request.getAttribute("url").equals(""))
	{
	  url=(String)request.getAttribute("url");
	  request.setAttribute("url",url);
	}
	if(request.getParameter("temp")!=null&&request.getParameter("temp").equals("temp"))
	{
	 url=request.getParameter("url");
	}
	String loginErrorMessage = null;
	if(request.getAttribute("loginErrorMessage")!=null){
		loginErrorMessage =(String) request.getAttribute("loginErrorMessage");
	}
	if(request.getParameter("url")!=null&&!request.getParameter("url").equals(""))
	{
		url=(String)request.getParameter("url");
		if(sqlInjectValidate.vakidateSqlIfByUrl(url))
			response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
	}
	if(loginErrorMessage!=null){
%>
	<script type="text/javascript">
		alert('<%=loginErrorMessage%>');
	</script>
<% 
	}
%>
<logic:present scope="session" name="tsystemWebuser">
	<script type="text/javascript">
	        var tempForm = document.createElement("form");   
		    tempForm.action="/share/afterLogin.jsp";   
		    tempForm.method="post";   
		    document.body.appendChild(tempForm); 
		    var parameter = document.createElement('input');
			parameter.type = "hidden";
			parameter.name = "url";
			parameter.value = "<%=url %>";
			tempForm.appendChild(parameter);
			tempForm.submit();
	</script>
</logic:present>
<logic:notPresent name="tsystemWebuser" scope="session">
	<script type="text/javascript">
	        var tempForm = document.createElement("form");   
		    tempForm.action="/share/beforeLogin.jsp";   
		    tempForm.method="post";
		    document.body.appendChild(tempForm); 
		    var parameter = document.createElement('input');
			parameter.type = "hidden";
			parameter.name = "url";
			parameter.value = "<%=url %>";
			tempForm.appendChild(parameter);
			tempForm.submit();
	</script>
</logic:notPresent>
