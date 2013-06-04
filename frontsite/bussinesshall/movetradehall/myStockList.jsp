<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/commons/taglibs.jsp"%>
<%@page import="java.util.List"%>
<%@page import="com.cssweb.quote.pojo.Myquote"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%
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
                  Myquote myquote=(Myquote)list.get(i);
                  String bg="";
                  if(i%2==0)
                  bg="";
                  else
                  bg="bgcolor='#eceff4'";
                  %>
                 <tr>
                  <td width="12%" align="center" <%=bg %>><a href="${ctx}/myquote.do?method=delById&id=<%=myquote.getId() %>">删除</a></td>
                  <td width="26%" align="center" <%=bg %>><a href="${ctx}/f10.do?method=check&gpdm=<%=myquote.getGpdm() %>" target="_blank"><%=myquote.getGpdm() %></a>  </td>
                  <td width="23%" align="center" <%=bg %>><%=myquote.getGpmc() %> </td>
                  <td width="20%" align="center" <%=bg %>><%=myquote.getZjcj()==null?"":myquote.getZjcj() %> </td>
                  <td width="19%" align="center" <%=bg %>><%=myquote.getZf()==null?"":myquote.getZf()%> </td>
                </tr>
                  <%
                }
              }
              %>
          </table>
</body>
</html>