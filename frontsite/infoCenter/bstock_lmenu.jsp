<%@ page contentType="text/html; charset=utf-8" language="java" %>
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
    <td <%=nav2.equals("zxzx_bg_bgxw")?"class='lmenu_hov blue3 bold'":"class='lmenu_a blue3'" %>><a href="${ctx }/infoCenter/bstockbg.html">B股新闻</a></td>
  </tr>
  <tr>
    <td <%=nav2.equals("zxzx_bg_bggg")?"class='lmenu_hov blue3 bold'":"class='lmenu_a blue3'" %>><a href="${ctx }/infoCenter/bstockbggg.html">B股公告</a></td>
  </tr>
  <tr>
    <td <%=nav2.equals("zxzx_bg_bgsp")?"class='lmenu_hov blue3 bold'":"class='lmenu_a blue3'" %>><a href="${ctx }/infoCenter/bstockbgsp.html">B股市评</a></td>
  </tr>
  <tr>
    <td <%=nav2.equals("zxzx_bg_ggggu")?"class='lmenu_hov blue3 bold'":"class='lmenu_a blue3'" %>><a href="${ctx }/infoCenter/bstockggggu.html">B股个股</a></td>
  </tr>
  <tr>
    <td <%=nav2.equals("zxzx_bg_bgyj")?"class='lmenu_hov blue3 bold'":"class='lmenu_a blue3'" %>><a href="${ctx }/infoCenter/bstockbgyj.html">B股研究</a></td>
  </tr>
  <tr>
    <td <%=nav2.equals("zxzx_bg_bgzs")?"class='lmenu_hov blue3 bold'":"class='lmenu_a blue3'" %>><a href="${ctx }/infoCenter/bstockbgzs.html">B股知识</a></td>
  </tr>
</table>


