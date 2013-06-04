<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/commons/taglibs.jsp"%>
<%@page import="java.util.List"%>
<%@page import="com.cssweb.assetManager.pojo.StockZcgl"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page	import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="com.cssweb.quote.service.MyquoteService"%>
<%@page import="com.cssweb.quote.pojo.Myquote"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%
	ServletContext st = this.getServletConfig().getServletContext();
    ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
    MyquoteService myquoteService=(MyquoteService)ctx.getBean("myquoteService");
  List list= null;
  if(request.getAttribute("list")!=null)
  {
    list = (List)request.getAttribute("list");
  }
  
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${ctx}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
</head>
<body class="body_bg">

              <table width="100%" border="0" cellspacing="0" cellpadding="0" class="lh28">
              <%
              if(list!=null&&list.size()>0)
              {
                for(int i=0;i<list.size();i++)
                {
                  StockZcgl stockZcgl=(StockZcgl)list.get(i);
                  String bg="";
                  if(i%2==0)
                  bg="";
                  else
                  bg="bgcolor='#eceff4'";
                  
                  Myquote myquote=myquoteService.getQuoteZjcj(stockZcgl.getGpdm());
                  %>
                 <tr>
                  <td width="30%" align="center" <%=bg %>><%=stockZcgl.getGpmc() %> </td>
                  <td width="30%" align="center" <%=bg %>>
                  <a href="${ctx}/f10.do?method=check&gpdm=<%=myquote.getGpdm() %>" target="_blank">
                  <%=stockZcgl.getGpdm() %> </a></td>
                  <td width="20%" align="center" <%=bg %>><%=myquote!=null&&myquote.getZjcj()==null?"":myquote.getZjcj() %></td>
                  <td width="20%" align="center" <%=bg %>><%=myquote!=null&&myquote.getZf()==null?"":myquote.getZf()%> </td>
                </tr>
                  <%
                }
              }
              %>
          </table>
</body>
</html>