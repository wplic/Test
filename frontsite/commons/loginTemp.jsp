<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="/commons/taglibs.jsp"%>
<body>
</body>
<%
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
	if(loginErrorMessage!=null){
%>
	<script type="text/javascript">
		alert('<%=loginErrorMessage%>');
	</script>
<% 
	}
%>
<logic:present scope="session" name="assetUser">
	<script type="text/javascript">
	        var tempForm = document.createElement("form");   
		    tempForm.action="/commons/afterLogin.jsp";   
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
<logic:present scope="session" name="tsystemWebuser">
	<script type="text/javascript">
	        var tempForm = document.createElement("form");   
		    tempForm.action="/commons/afterLogin.jsp";   
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
<logic:notPresent name="assetUser" scope="session">
	<script type="text/javascript">
	        var tempForm = document.createElement("form");   
		    tempForm.action="/commons/beforeLogin.jsp";   
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
<logic:notPresent name="tsystemWebuser" scope="session">
	<script type="text/javascript">
	        var tempForm = document.createElement("form");   
		    tempForm.action="/commons/beforeLogin.jsp";   
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