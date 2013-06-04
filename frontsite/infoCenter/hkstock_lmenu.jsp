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
    <td <%=nav2.equals("zxzx_gg_ggxw")?"class='lmenu_hov blue3 bold'":"class='lmenu_a blue3'" %>><a href="${ctx }/infoCenter/hkstockgg.html">港股新闻</a></td>
  </tr>
  <tr>
    <td <%=nav2.equals("zxzx_gg_gggg")?"class='lmenu_hov blue3 bold'":"class='lmenu_a blue3'" %>><a href="${ctx }/infoCenter/hkstockgggg.html">港股公告</a></td>
  </tr>
  <tr>
    <td <%=nav2.equals("zxzx_gg_ggsc")?"class='lmenu_hov blue3 bold'":"class='lmenu_a blue3'" %>><a href="${ctx }/infoCenter/hkstockggsc.html">港股市场</a></td>
  </tr>
  <tr>
    <td <%=nav2.equals("zxzx_gg_ggpl")?"class='lmenu_hov blue3 bold'":"class='lmenu_a blue3'" %>><a href="${ctx }/infoCenter/hkstockggpl.html">港股评论</a></td>
  </tr>
  <tr>
    <td <%=nav2.equals("zxzx_gg_ggyj")?"class='lmenu_hov blue3 bold'":"class='lmenu_a blue3'" %>><a href="${ctx }/infoCenter/hkstockggyj.html">港股研究</a></td>
  </tr>
  <tr>
    <td <%=nav2.equals("zxzx_gg_zzgyj")?"class='lmenu_hov blue3 bold'":"class='lmenu_a blue3'" %>><a href="${ctx }/infoCenter/hkstockzzgyj.html">中资股研究</a></td>
  </tr>
  <tr>
    <td <%=nav2.equals("zxzx_gg_gghq")?"class='lmenu_hov blue3 bold'":"class='lmenu_a blue3'" %>><a href="${ctx }/infoCenter/hkstockgghq.html">港股行情</a></td>
  </tr>
  <tr>
    <td <%=nav2.equals("zxzx_gg_ahgbjb")?"class='lmenu_hov blue3 bold'":"class='lmenu_a blue3'" %>><a href="${ctx }/infoCenter/hkstockahgbjb.html">AH股比价表</a></td>
  </tr>
  <tr>
    <td <%=nav2.equals("zxzx_gg_ggzs")?"class='lmenu_hov blue3 bold'":"class='lmenu_a blue3'" %>><a href="${ctx }/infoCenter/hkstockggzs.html">港股知识</a></td>
  </tr>
</table>


