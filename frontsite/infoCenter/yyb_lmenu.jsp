<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=utf-8" language="java"  %>
<link href="${contextPath}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${contextPath}/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
<%
String nav2="";
if(request.getParameter("nav2")!=null&&!request.getParameter("nav2").equals(""))
 nav2=request.getParameter("nav2").trim();
 %>
<table width="195" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
  <tr>
    <td <%=nav2.equals("gfrgjjylb")?"class='lmenu_hov blue3 bold'":"class='lmenu_a blue3'" %>><a href="${contextPath }/infoCenter/fundGfrgjjylb.html">广发认购基金一览</a></td>
  </tr>
  <tr>
    <td <%=nav2.equals("gfsgjjylb")?"class='lmenu_hov blue3 bold'":"class='lmenu_a blue3'" %>><a href="${contextPath }/infoCenter/fundGfsgjjylb.html">广发申购基金一览</a></td>
  </tr>
</table>
