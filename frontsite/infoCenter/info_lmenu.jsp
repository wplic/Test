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
    <td <%=nav2.equals("zxzx_jryw")?"class='lmenu_hov blue3 bold'":"class='lmenu_a blue3'" %>><a href="${ctx }/infoCenter/news.html">今日要闻综述</a></td>
  </tr>
  <tr>
    <td <%=nav2.equals("zxzx_glcj")?"class='lmenu_hov blue3 bold'":"class='lmenu_a blue3'" %>><a href="${ctx }/infoCenter/domesticNewsGncj.html">国内财经</a></td>
  </tr>
  <tr>
    <td <%=nav2.equals("zxzx_gjcj")?"class='lmenu_hov blue3 bold'":"class='lmenu_a blue3'" %>><a href="${ctx }/infoCenter/domesticNewsGjcj.html">国际财经</a></td>
  </tr>
  <tr>
    <td <%=nav2.equals("zxzx_gatcj")?"class='lmenu_hov blue3 bold'":"class='lmenu_a blue3'" %>><a href="${ctx }/infoCenter/domesticNewsGatcj.html">港澳台财经</a></td>
  </tr>
  <tr>
    <td <%=nav2.equals("zxzx_dfcj")?"class='lmenu_hov blue3 bold'":"class='lmenu_a blue3'" %>><a href="${ctx }/infoCenter/domesticNewsDfcj.html">地方财经</a></td>
  </tr>
  <tr>
    <td <%=nav2.equals("zxzx_cjpl")?"class='lmenu_hov blue3 bold'":"class='lmenu_a blue3'" %>><a href="${ctx }/infoCenter/domesticNewsCjsp.html">财经时评</a></td>
  </tr>
  <tr>
    <td <%=nav2.equals("zxzx_hyxw")?"class='lmenu_hov blue3 bold'":"class='lmenu_a blue3'" %>><a href="${ctx }/infoCenter/domesticNewsHydt.html">行业动态</a></td>
  </tr>
  <tr>
    <td <%=nav2.equals("zxzx_hqsc")?"class='lmenu_hov blue3 bold'":"class='lmenu_a blue3'" %>><a href="${ctx }/infoCenter/domesticNewsHqsc.html">环球市场</a></td>
  </tr>
  <tr>
    <td <%=nav2.equals("zxzx_qsdt")?"class='lmenu_hov blue3 bold'":"class='lmenu_a blue3'" %>><a href="${ctx }/infoCenter/domesticNewsQsdt.html">券商动态</a></td>
  </tr>
  <tr>
    <td <%=nav2.equals("zxzx_ztqj")?"class='lmenu_hov blue3 bold'":"class='lmenu_a blue3'" %>><a href="${ctx }/infoCenter/newsTopic.html">专题聚焦</a></td>
  </tr>
</table>

