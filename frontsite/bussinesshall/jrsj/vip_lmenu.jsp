<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<%@ include file="/commons/taglibs.jsp"%>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
<table align="center">
  <tr>
    <td align="center"><img src="/pic/infoCenter/left_mpic1.jpg" /></td>
  </tr>
  <tr>
    <td height="4"></td>
  </tr>
</table>
<%
String nav2="";
if(request.getParameter("nav2")!=null&&!request.getParameter("nav2").equals(""))
 nav2=request.getParameter("nav2").trim();
nav2="tdid"+nav2;  
 %>
<table width="195" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
  <tr>
    <td <%=nav2.equals("tdid1")?"class='lmenu_hov blue3 bold'":"class='lmenu_a blue3'" %>><a href="${contextPath }/vip.do?method=getGgtgpj&tdid=1">个股投资评级</a></td>
  </tr>
  <tr>
    <td <%=nav2.equals("tdid2")?"class='lmenu_hov blue3 bold'":"class='lmenu_a blue3'" %>><a href="${contextPath }/vip.do?method=getBbyjyc&tdid=2">个股盈利预测</a></td>
  </tr>
  <tr>
    <td <%=nav2.equals("tdid3")?"class='lmenu_hov blue3 bold'":"class='lmenu_a blue3'" %>><a href="${contextPath }/vip.do?method=getJgcg&tdid=3">机构持股</a></td>
  </tr>
  <tr>
    <td <%=nav2.equals("tdid4")?"class='lmenu_hov blue3 bold'":"class='lmenu_a blue3'" %>><a href="${contextPath }/vip.do?method=getHyzhpm&tdid=4">行业综合排名</a></td>
  </tr>
  <tr>
    <td <%=nav2.equals("tdid5")?"class='lmenu_hov blue3 bold'":"class='lmenu_a blue3'" %>><a href="${contextPath }/vip.do?method=getXgfxInfo&tdid=5">新股发行统计</a></td>
  </tr>
  <tr>
    <td <%=nav2.equals("tdid6")?"class='lmenu_hov blue3 bold'":"class='lmenu_a blue3'" %>><a href="${contextPath }/vip.do?method=getAbggj&tdid=6">AB股股价对照</a></td>
  </tr>
  
</table>


