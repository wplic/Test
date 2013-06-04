<%@ page contentType="text/html; charset=utf-8" language="java"  %>
<%
 String nav2="gpsrx";
 if(request.getParameter("nav2")!=null&&!request.getParameter("nav2").equals(""))
 nav2=request.getParameter("nav2");
 String nav3="";
 if(request.getParameter("nav3")!=null&&!request.getParameter("nav3").equals(""))
 nav3=request.getParameter("nav3");
 ///investorEdu/investorBaseStock.html
 %>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
<table width="195" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
  
  <tr>
    <td class="<%=nav2.equals("gpsrx")?"lmenu_hov bold":"lmenu_a"%> blue3"><a href="http://edu.sse.com.cn/sseportal/newedu/c05/c02/p1442/c200502_p1442.shtml" target="_blank">基股三人行</a></td>
  </tr>
  <tr>
    <td class="<%=nav2.equals("gfjysp")?"lmenu_hov bold":"lmenu_a"%> blue3" id="hor1" onclick="selectlMenu('hor1','board1')">
		<a href="#">广发教育视频</a></td>
  </tr>
  <tr>
    <td id="board1" style=" display:block">
		<ul class="menu4l">
        	<li class="<%=nav3.equals("fxsp")?"active red":"link"%>"><a href="${ctx}/investorEdu/investorVideofxsp.html">风险教育视频</a></li>
            <li class="<%=nav3.equals("zqsp")?"active red":"link"%>"><a href="${ctx}/investorEdu/investorVideozqsp.html">证券投资视频</a></li>
            <li class="<%=nav3.equals("lcsp")?"active red":"link"%>"><a href="${ctx}/investorEdu/investorVideolcsp.html">理财知识视频</a></li>          
        </ul>
    </td>
  </tr>
  <tr>
    <td class="<%=nav2.equals("rzrq")?"lmenu_hov bold":"lmenu_a"%> blue3" id="hor2" onclick="selectlMenu('hor2','board2')">
		<a href="${contextPath }/financing/basicKnowledge.html">融资融券</a></td>
  </tr>
  <tr>
    <td class="<%=nav2.equals("jyzzdjt")?"lmenu_hov bold":"lmenu_a"%> blue3"><a href="http://edu.sse.com.cn/sseportal/webapp/newedu/bseduinfo?TYPE=4" target="_blank">证券大讲堂</a></td>
  </tr>
  <tr>
    <td class="<%=nav2.equals("yjjczs")?"lmenu_hov bold":"lmenu_a"%> blue3"><a href="http://edu.sse.com.cn/sseportal/newedu/c04/c00/p1941/c200400_p1941.html" target="_blank">基础知识学习</a></td>
  </tr>
  <tr>
    <td class="<%=nav2.equals("jylczc")?"lmenu_hov bold":"lmenu_a"%> blue3"><a href="http://edu.sse.com.cn/sseportal/newedu/c04/c00/p1941/c200400_p1942.html" target="_blank">交易流程教学</a></td>
  </tr>
</table>
<script src="/js/stock_lmenu.js"></script>
