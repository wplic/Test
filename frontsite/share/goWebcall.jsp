<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"    %>
<%@page import="com.cssweb.client.pojo.TsystemWebuser"%>
<%@page import="com.css.system.Configuration"%>
<%@ include file="/commons/taglibs.jsp"%>
<%  
	TsystemWebuser tsystemWebuser = (TsystemWebuser)request.getSession().getAttribute("tsystemWebuser");
	String webcallUrl = Configuration.getProperty("webcall.url");
	System.out.println(webcallUrl);
	if(tsystemWebuser==null||!"1".equals(tsystemWebuser.getUserType())){
%>
	<script>
		var url = '<%=webcallUrl %>?formenu=khjl';
		location.href=url;
	</script>
<%	
	}else{
%>
	<script>
	   var url = '<%=webcallUrl %>';
       url += "?realName="　+　encodeURIComponent('<%=tsystemWebuser.getRealName() %>');
       url += "&branchId=<%=tsystemWebuser.getBranchCode() %>";
       url += "&from=webcallwz";
       url += "&userClass=<%=tsystemWebuser.getLevel() %>";
       url += "&formenu=tzzx";
       url += "&customer_code=<%=tsystemWebuser.getUserName() %>";
       location.href=url;
	</script>
<%	
	}
%>
