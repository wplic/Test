<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ page import="com.cssweb.nxsy.service.Constants"%>
<%@ page import="com.cssweb.common.util.DataRow"%>
<%
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", -1);
%>
   

<%
	
	String client_id = (String)request.getSession().getAttribute(Constants.CLIENT_ID);
	String nick_name = "";	
	if(client_id == null || client_id.equalsIgnoreCase(""))
	{
		%>
		<script>
			alert("登陆超时,请重新登陆");
			window.location="${ctx }/match/nxsy/login.jsp";
		</script>
		<%
	}
	else
	{
		DataRow dt = (DataRow)request.getSession().getAttribute(Constants.USER_INFO);
		nick_name = dt.getString("nick_name");
	}
	
	
	
	
%>