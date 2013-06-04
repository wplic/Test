<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="com.cssweb.runs.service.RunsLanternService" />
<jsp:directive.page import="com.cssweb.runs.pojo.RunsLantern" />
<jsp:directive.page import = "com.cssweb.common.toDbLob.service.LobService" />
<jsp:directive.page import = "com.cssweb.common.toDbLob.pojo.TextBlob" />
<%@ include file="/commons/taglibs.jsp"%>
<%request.setCharacterEncoding("UTF-8");%>
<%
		   ServletContext st = this.getServletConfig().getServletContext();
		   ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
		   RunsLanternService runsLanternService = (RunsLanternService)ctx.getBean("runsLanternService");
		   LobService lobService = (LobService)ctx.getBean("lobService");
		   String runsid =    (String)request.getParameter("runsid");
		   long id =  Long.parseLong(runsid);
		   RunsLantern runs = runsLanternService.getRunsLanternById(id);
		   long contentid =  runs.getContent();
		   TextBlob textblob =  lobService.getTextBlobById(contentid);
		  String context = new String (textblob.getSource(),"UTF-8"); 
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>广发证券</title>
<link href="${contextPath}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />

</head>

<body>
<jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz"></div>
  <div class="blank5"></div>
  <div class="bg_f5 p8">
	<div class="tlbg3">
        	<p class="textTitle1" align="center">广发公告</p>
  <p class="textTitle2" align="center"><%= runs.getTitle() %> </p>
   <div class="newstextArea">
   <p class="newstextAreatop"></p>
   <div class="lh24">
  <%= context %>

  </div>

			 
<p class="newstextAreabottom"></p>

</div>

</div>
<jsp:include page="/commons/msbottom.jsp" />
</body>
</html>
