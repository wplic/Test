<%@ page contentType="text/html; charset=utf-8" language="java"  %>
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
    <td <%=nav2.equals("zxzx_wh_whxw")?"class='lmenu_hov blue3 bold'":"class='lmenu_a blue3'" %>><a href="${ctx }/infoCenter/forexwh.html">外汇新闻</a></td>
  </tr>
  <tr>
    <td <%=nav2.equals("zxzx_wh_whpl")?"class='lmenu_hov blue3 bold'":"class='lmenu_a blue3'" %>><a href="${ctx }/infoCenter/forexwhpl.html">外汇评论</a></td>
  </tr>
  <tr>
    <td <%=nav2.equals("zxzx_wh_yhdt")?"class='lmenu_hov blue3 bold'":"class='lmenu_a blue3'" %>><a href="${ctx }/infoCenter/forexyhdt.html">央行动态</a></td>
  </tr>
  <tr>
    <td <%=nav2.equals("zxzx_wh_rmbdt")?"class='lmenu_hov blue3 bold'":"class='lmenu_a blue3'" %>><a href="${ctx }/infoCenter/forexrmbdt.html">人民币动态</a></td>
  </tr>
  <tr>
    <td <%=nav2.equals("zxzx_wh_wbzx")?"class='lmenu_hov blue3 bold'":"class='lmenu_a blue3'" %>><a href="${ctx }/infoCenter/forexwbzx.html">外币资讯</a></td>
  </tr>
  <tr>
    <td <%=nav2.equals("zxzx_wh_rmbwhpj")?"class='lmenu_hov blue3 bold'":"class='lmenu_a blue3'" %>><a href="${ctx }/infoCenter/forexrmbwhpj.html">人民币外汇牌价</a></td>
  </tr>
  <tr>
    <td <%=nav2.equals("zxzx_wh_whzs")?"class='lmenu_hov blue3 bold'":"class='lmenu_a blue3'" %>><a href="${ctx }/infoCenter/forexwhzs.html">外汇知识</a></td>
  </tr>
</table>


