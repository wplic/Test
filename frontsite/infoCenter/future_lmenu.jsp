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
    <td <%=nav2.equals("cjzx_qh_gzqhxw")?"class='lmenu_hov blue3 bold'":"class='lmenu_a blue3'" %>><a href="${ctx }/infoCenter/futuregzqhxw.html">股指期货新闻</a></td>
  </tr>
  <tr>
    <td <%=nav2.equals("zxzx_qh_spqhxw")?"class='lmenu_hov blue3 bold'":"class='lmenu_a blue3'" %>><a href="${ctx }/infoCenter/futurespqhxw.html">商品期货新闻</a></td>
  </tr>
   <tr>
    <td <%=nav2.equals("zxzx_qh_gfqhgd")?"class='lmenu_hov blue3 bold'":"class='lmenu_a blue3'" %>><a href="http://www.gfqh.com.cn/Research/ResearchIndex.jsp?nav=Research" target="_blank">广发期货观点</a></td>
  </tr>
  <tr>
    <td <%=nav2.equals("zxzx_qh_qhgg")?"class='lmenu_hov blue3 bold'":"class='lmenu_a blue3'" %>><a href="${ctx }/infoCenter/futureqhgg.html">期货公告</a></td>
  </tr>
  <tr>
    <td <%=nav2.equals("zxzx_qh_qhpl")?"class='lmenu_hov blue3 bold'":"class='lmenu_a blue3'" %>><a href="${ctx }/infoCenter/futureqhpl.html">期货评论</a></td>
  </tr>
  <tr>
    <td <%=nav2.equals("zxzx_qh_qhyj")?"class='lmenu_hov blue3 bold'":"class='lmenu_a blue3'" %>><a href="${ctx }/infoCenter/futureqhyj.html">期货研究</a></td>
  </tr>
  <tr>
    <td <%=nav2.equals("zxzx_qh_qhhq")?"class='lmenu_hov blue3 bold'":"class='lmenu_a blue3'" %>><a href="${ctx }/infoCenter/futureqhhq.html">期货行情</a></td>
  </tr>
 
  <tr>
    <td <%=nav2.equals("zxzx_qh_qhsctj")?"class='lmenu_hov blue3 bold'":"class='lmenu_a blue3'" %>><a href="${ctx }/infoCenter/futureqhsctj.html">期货市场统计</a></td>
  </tr>
  <tr>
    <td <%=nav2.equals("zxzx_qh_qhzs")?"class='lmenu_hov blue3 bold'":"class='lmenu_a blue3'" %>><a href="${ctx }/infoCenter/futureqhzs.html">期货知识</a></td>
  </tr>
</table>


