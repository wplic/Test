<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ page import="com.cssweb.nxsy.service.Constants"%>
<%@ page import="com.cssweb.common.util.DataRow"%>
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
<div class="alltitle">
	<ul class="titleR">
		<li><span class="orangelj" id="title">欢迎您，<%=nick_name%></span>
		</li>
		<li><a href="/nxsyLoginAction.do?method=logout">退 出</a></li>
	</ul>
</div>