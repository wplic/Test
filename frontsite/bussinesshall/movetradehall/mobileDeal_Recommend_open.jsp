<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/commons/taglibs.jsp"%>
<%@page import="com.cssweb.handset.pojo.TfinanceCommendHandset"%>
<%@page import="com.cssweb.handset.service.TfinanceCommendHandsetService"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page	import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%
     long id=0;
     if(request.getParameter("id")!=null&&!request.getParameter("id").equals("id"))
     {
      id=Long.parseLong(request.getParameter("id").trim());
     }
	 ServletContext st = this.getServletConfig().getServletContext();
	 ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
	 TfinanceCommendHandsetService tfinanceCommendHandsetService = (TfinanceCommendHandsetService)ctx.getBean("tfinanceCommendHandsetService");
	 TfinanceCommendHandset t=tfinanceCommendHandsetService.getTfinanceCommendHandsetById(id);

 %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${ctx}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="moblieCont">
<div class="info"><span>
<img src="${ctx}/share/showUploadImage.jsp?id=<%=t!=null?t.getPhotoId():0 %>" width="88" height="135" alt="无图片"/>
</span><div>
<h4><%=t!=null?t.getModel():"" %></h4>
<%=t!=null?t.getBriefIntro():"" %>
</div></div>

<div class="pagett1 clearboth"><b>功能介绍</b></div>
<table width="100%" class="moblietd">
  <tr>
    <td><%=t!=null?t.getFunctionIntro():"" %></td>
  </tr>
</table>



</div>
</body>
</html>