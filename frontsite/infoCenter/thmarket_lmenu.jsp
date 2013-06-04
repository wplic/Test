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
 
  String nav3="";
 if(request.getParameter("nav3")!=null&&!request.getParameter("nav3").equals(""))
 nav3=request.getParameter("nav3");
 
 %>
<table width="195" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
  <tr>
    <td <%=nav2.equals("zxzx_sb_sbxw")?"class='lmenu_hov blue3 bold'":"class='lmenu_a blue3'" %>><a href="${ctx }/infoCenter/thmarketsb.html">三板新闻</a></td>
  </tr>
  <tr>
    <td <%=nav2.equals("zxzx_sb_sbhq")?"class='lmenu_hov blue3 bold'":"class='lmenu_a blue3'" %>><a href="${ctx }/infoCenter/thmarketsbhq.html">三板行情</a></td>
  </tr>
  
  
   <tr>
    <td <%=nav2.equals("zxzx_sb_sbgg")?"class='lmenu_hov blue3 bold'":"class='lmenu_a blue3'" %> id="hor1" onclick="selectlMenu('hor1','board1')">
		<a href="#">三板公告</a></td>
  </tr>
  <tr>
    <td id="board1" style=" display:none">
		<ul class="menu4l">
        	<li class="<%=nav3.equals("zxzx_sb_sbgg_gg")?"active red":"link"%>"><a href="${ctx}/infoCenter/thmarketsbgg.html">股份转让</a></li>
            <li class="<%=nav3.equals("zxzx_sb_gfbg")?"active red":"link"%>"><a href="${ctx}/infoCenter/thmarketgfbj.html">股份报价</a></li>         
        </ul>
    </td>
  </tr>
  
  
  <tr>
    <td <%=nav2.equals("zxzx_sb_sbsp")?"class='lmenu_hov blue3 bold'":"class='lmenu_a blue3'" %>><a href="${ctx }/infoCenter/thmarketsbsp.html">三板市评</a></td>
  </tr>
  <tr>
    <td <%=nav2.equals("zxzx_sb_sbgeg")?"class='lmenu_hov blue3 bold'":"class='lmenu_a blue3'" %>><a href="${ctx }/infoCenter/thmarketsbgeg.html">三板个股</a></td>
  </tr>
  <tr>
    <td <%=nav2.equals("rszn")?"class='lmenu_hov blue3 bold'":"class='lmenu_a blue3'" %>><a href="${ctx }/infoCenter/thmarketrszn.html">入市指南</a></td>
  </tr>
  <tr>
    <td <%=nav2.equals("zxzx_sb_sbzs")?"class='lmenu_hov blue3 bold'":"class='lmenu_a blue3'" %>><a href="${ctx }/infoCenter/thmarketsbzs.html">三板知识</a></td>
  </tr>
</table>
<script src="/js/stock_lmenu.js"></script>
<%
if(nav3!=null&&!nav3.equals("")&&(nav3.equals("zxzx_sb_sbgg_gg")||nav3.equals("zxzx_sb_gfbg")))
 {
  %>
  <script>
   document.getElementById("board1").style.display = "";
  </script>
  <%
 }
 %>
