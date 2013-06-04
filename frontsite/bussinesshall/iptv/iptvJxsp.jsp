<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/commons/taglibs.jsp"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page	import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page	import="com.cssweb.video.service.TvideoProgramService"%>
<%@page	import="com.cssweb.video.pojo.TvideoProgram"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%
     long id=0;
     if(request.getParameter("id")!=null&&request.getParameter("id")!=null)
     id=Long.parseLong(request.getParameter("id").trim());
	 ServletContext st = this.getServletConfig().getServletContext();
	 ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
	 TvideoProgramService tvideoProgramService = (TvideoProgramService)ctx.getBean("tvideoProgramService");
	 TvideoProgram tvideoProgram=null;
	 if(id>0)
	 {
	  tvideoProgram=tvideoProgramService.getTvideoProgramById(id);
	 }
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<jsp:directive.page import="com.cssweb.common.web.filter.SqlInjectValidate"/>
<%
 SqlInjectValidate sqlInjectValidate = SqlInjectValidate.getSqlInjectValidate();
	if(request.getParameter("nav1")!=null&&!request.getParameter("nav1").equals("")){
				if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("nav1"),10)){
					response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
				 }
			}
	if(request.getParameter("nav")!=null&&!request.getParameter("nav").equals("")){
				if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("nav"),10)){
					response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
				 }
			}
	if(request.getParameter("nav2")!=null&&!request.getParameter("nav2").equals("")){
		if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("nav2"),10)){
			response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
		 }
	}
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${ctx}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
</head>
<body>
  <!--中间内容开始-->
 
  
  <%	 if(tvideoProgram!=null){ 
         if( tvideoProgram.getPicId()>0){
  %>
  <a href="${ctx}/bussinesshall/iptv/tvPlayObject.jsp?id=<%=tvideoProgram.getId()%>" target="_blank">
	  <p align="center" class="mt5">
     <img src="${ctx}/share/showUploadImage.jsp?id=<%=tvideoProgram.getPicId()%>" width="422" height="202"/>
     </p></a>
     <%}else{ %>
       <img src="${ctx}/pic/wsyyt/iptv/banner1.jpg" width="422" height="202"/>
     <%} %>
      <p align="center" class="lh21 mt5">
       <a href="${ctx}/bussinesshall/iptv/tvPlayObject.jsp?id=<%=tvideoProgram.getId()%>" target="_blank">
      	<span class="bold"><%=tvideoProgram.getTitle().length()>30?tvideoProgram.getTitle().substring(0,30)+"...":tvideoProgram.getTitle() %> </span><br/>
      	<span class="font_73">
      	<%=tvideoProgram.getContent()!=null&&!tvideoProgram.getContent().equals("")&&tvideoProgram.getContent().length()>30?tvideoProgram.getContent().substring(0,30)+"...":tvideoProgram.getContent() %>
      	
      	</span>
      	</a>
      </p>
      <%} %>
</body>
</html>