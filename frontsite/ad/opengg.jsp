<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="com.cssweb.runs.service.RunsLanternService" />
<jsp:directive.page import="com.cssweb.runs.pojo.RunsLantern" />
<jsp:directive.page import = "com.cssweb.common.toDbLob.service.LobService" />
<jsp:directive.page import = "com.cssweb.common.toDbLob.pojo.TextBlob" />
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
		  String context = new String (textblob.getSource());
	       
%>

<html>
 

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>广发证券</title>
</head>

<body>
<table width="500" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#EEEEEE">
  <tr>
    <td bgcolor="#FFFFFF" style="padding:10px 0px;"><table width="430" align="center" cellpadding="0" cellspacing="0" bgcolor="#F1F1F1">
      <tr>
        <td height="28" colspan="3" align="center">广发公告</td>
      </tr>
      <tr>
        <td height="2" bgcolor="#AD0002"></td>
        <td height="2" bgcolor="#CCCCCC" colspan="2"></td>
      </tr>

      <tr>
        <td width="16%" height="24" align="center" valign="middle" bgcolor="#FFFFFF" class="font_reds"> 标&nbsp;&nbsp;&nbsp;&nbsp;题：</td>
        <td width="52%" height="24" align="left" valign="middle" bgcolor="#FFFFFF" ><%= runs.getTitle() %> </td>
      </tr>
	 
      <tr>
        <td height="10" align="left" valign="middle" bgcolor="#FFFFFF"></td>
        <td align="left" valign="middle" bgcolor="#FFFFFF"></td>
      </tr>
    </table>
      <table width="430" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
        <tr>
          <td width="24%" align="center" valign="top" class="font_darkorange">内&nbsp;&nbsp;&nbsp;&nbsp;容 ：<BR></td>
          <td width="76%" align="left" class=" ">
            <%= context %>
            </td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
</html>
