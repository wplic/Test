<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@page import="java.util.List"%>
<jsp:directive.page import="com.cssweb.client.pojo.TsystemWebuser"/>
<%@ include file="/commons/taglibs.jsp"%>
<script type="text/javascript" src="${contextPath }/js/base64.js"></script>
<body>
</body>
 <%
 
 TsystemWebuser tsystemWebuser=null;
	if(request.getSession().getAttribute("tsystemWebuser")!=null)
	tsystemWebuser=(TsystemWebuser)request.getSession().getAttribute("tsystemWebuser");
	if(tsystemWebuser!=null) {
	     if(tsystemWebuser.getUserType()!=null&&tsystemWebuser.getUserType().equals("1"))
	     {
	     %>
	     <script type="text/javascript">
	        var custId = "<%=tsystemWebuser.getUserName() %>";
	        var url = "http://webcall.gf.com.cn/flashwebcall/web/et_home_khjl.jsp?from=webcallwz";
			url += "&custId=" + base64encode(custId);
		  	document.location.href=url;
	       </script>
	<%
    }
  }else{
  //mei you  session 
  %>
	     <script type="text/javascript">
	        alert("您尚未登录或已过期，请重新登录！");
	        var tempForm = document.createElement("form");   
		    tempForm.action="/share/login.jsp";   
		    tempForm.method="post";
		    document.body.appendChild(tempForm);
		    var parameter = document.createElement('input');
			parameter.type = "hidden";
			parameter.name = "url";
			parameter.value = "/webcall_home.jsp";
			tempForm.appendChild(parameter);
			tempForm.submit();
	     </script>
	<%
  
  }
%>
