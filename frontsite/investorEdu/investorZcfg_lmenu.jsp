<%@ page contentType="text/html; charset=utf-8" language="java" %>
<link href="${contextPath }/css/global.css" rel="stylesheet" type="text/css" />
<link href="${contextPath }/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
<%
 String nav2="zqf";
 if(request.getParameter("nav2")!=null&&!request.getParameter("nav2").equals(""))
 nav2=request.getParameter("nav2");

 %>
<table width="195" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#ffffff">

<tr>
    <td class="<%=nav2.equals("zcfg")?"lmenu_hov blue3 bold":"lmenu_a blue3"%>" id="zcfg"><a href="${contextPath }/investorEdu/investorZcfg.html">交易规则</a></td>
  </tr>
  <tr>
    <td class="<%=nav2.equals("zqf")?"lmenu_hov blue3 bold":"lmenu_a blue3"%>" id="zqf"><a href="${contextPath }/investorEdu/investorZqf.html">证券法</a></td>
  </tr>
  <tr>
    <td class="<%=nav2.equals("tzjjf")?"lmenu_hov blue3 bold":"lmenu_a blue3"%>" id="tzjjf"><a href="${contextPath }/investorEdu/investorTzjjf.html">投资基金法</a></td>
  </tr>
   <tr>
    <td class="<%=nav2.equals("fxqfg")?"lmenu_hov blue3 bold":"lmenu_a blue3"%>" id="fxqfg"><a href="${contextPath }/investorEdu/investorFxqfg.html">反洗钱法规和章程</a></td>
  </tr>

  <tr>
    <td class="<%=nav2.equals("fxqfjd")?"lmenu_hov blue3 bold":"lmenu_a blue3"%>" id="fxqfjd"><a href="${contextPath }/investorEdu/investorFxqfjd.html">反洗钱法解读</a></td>
  </tr>
  <tr>
    <td class="<%=nav2.equals("fxqzs")?"lmenu_hov blue3 bold":"lmenu_a blue3"%>" id="fxqzs"><a href="${contextPath }/investorEdu/investorFxqzs.html">反洗钱知识</a></td>
  </tr>	
  <tr>
    <td class="<%=nav2.equals("fxqxc")?"lmenu_hov blue3 bold":"lmenu_a blue3"%>" id="fxqxc"><a href="${contextPath }/investorEdu/investorFxqxc.jsp?nav2=fxqxc">反洗钱宣传</a></td>
  </tr>			
</table>
<script src="${contextPath }/js/stock_lmenu.js"></script>