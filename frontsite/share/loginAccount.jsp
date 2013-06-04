<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"    %>
<body>
</body>
<%
String loginErrorMessage="";
if(request.getAttribute("loginErrorMessage")!=null&&!request.getAttribute("loginErrorMessage").equals(""))
{
loginErrorMessage=(String)request.getAttribute("loginErrorMessage");
}
String clientId="";
if(request.getAttribute("clientId")!=null&&!request.getAttribute("clientId").equals(""))
{
	clientId=(String)request.getAttribute("clientId");
}
if(request.getParameter("clientId")!=null&&!request.getParameter("clientId").equals(""))
{
	clientId=(String)request.getParameter("clientId");
}
if(!loginErrorMessage.equals("")){
%>
	<script type="text/javascript">
		alert('<%=loginErrorMessage%>');
	</script>
<% 
	}
	
	if(clientId.equals(""))
	{
	%>
	  <script type="text/javascript">
	  if(window.parent==null)
       {
		window.parent.location.href="${contextPath }/share/accountLogin.jsp";
		
	   }else{
		 window.parent.document.location.href="${contextPath }/share/accountLogin.jsp";
	   }
	  </script>
	<%
	}else{
	 %>
	  <script type="text/javascript">
	  var retValue;
	  if(window.parent==null)
       {
		retValue = window.showModalDialog("${contextPath }/bussinesshall/editNameAndPass.jsp?clientId=<%=clientId%>",window,"dialogWidth:495px;help:no;resize:no;status:no;dialogHeight:270px");
		window.parent.location.href="${contextPath }/bussinesshall/financingCzh.jsp?nav=wsyyt&nav1=wdlczx";
	   }else{
	    retValue = window.showModalDialog("${contextPath }/bussinesshall/editNameAndPass.jsp?clientId=<%=clientId%>",window,"dialogWidth:495px;help:no;resize:no;status:no;dialogHeight:270px");
		window.parent.document.location.href="${contextPath }/bussinesshall/financingCzh.jsp?nav=wsyyt&nav1=wdlczx";
	   }
	  </script>
	<%
	}
%>
