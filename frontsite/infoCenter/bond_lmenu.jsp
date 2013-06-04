<%@ page contentType="text/html; charset=utf-8" language="java"  %>
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
 %>
<table width="195" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
  <tr>
    <td <%=nav2.equals("zxzx_zq_zqxw")?"class='lmenu_hov blue3 bold'":"class='lmenu_a blue3'" %>><a href="${ctx }/infoCenter/bondzq.html">债券新闻</a></td>
  </tr>
  <tr>
    <td <%=nav2.equals("zxzx_zq_zqgg")?"class='lmenu_hov blue3 bold'":"class='lmenu_a blue3'" %>><a href="${ctx }/infoCenter/bondzqgg.html">债券公告</a></td>
  </tr>
  <tr>
    <td <%=nav2.equals("zxzx_zq_zqpl")?"class='lmenu_hov blue3 bold'":"class='lmenu_a blue3'" %>><a href="${ctx }/infoCenter/bondzqpl.html">债券评论</a></td>
  </tr>
  <tr>
    <td <%=nav2.equals("zxzx_zq_zqyj")?"class='lmenu_hov blue3 bold'":"class='lmenu_a blue3'" %>><a href="${ctx }/infoCenter/bondzqyj.html">债券研究</a></td>
  </tr>
  <tr>
    <td <%=nav2.equals("zxzx_zq_zqfg")?"class='lmenu_hov blue3 bold'":"class='lmenu_a blue3'" %>><a href="${ctx }/infoCenter/bondzqfg.html">债券法规</a></td>
  </tr>
  <tr>
    <td <%=nav2.equals("gzsyphb")?"class='lmenu_hov blue3 bold'":"class='lmenu_a blue3'" %>><a href="${ctx }/infoCenter/bondgzsyphb.html">国债收益排行榜</a></td>
  </tr>
  <tr>
    <td <%=nav2.equals("qzsyphb")?"class='lmenu_hov blue3 bold'":"class='lmenu_a blue3'" %>><a href="${ctx }/infoCenter/bondqzsyphb.html">企债收益排行榜</a></td>
  </tr>
  <tr>
    <td <%=nav2.equals("zxzx_zq_zqzs")?"class='lmenu_hov blue3 bold'":"class='lmenu_a blue3'" %>><a href="${ctx }/infoCenter/bondzqzs.html">债券知识</a></td>
  </tr>
</table>


