<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />	
<table width="195" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
  <tr>
    <td class="lmenu_hov blue3 bold" id="jlcpfw"><a href="${contextPath }/branches/productsServices.html">金融产品零售业务</a></td>
  </tr>
  <tr>
    <td class="lmenu_a blue3" id="ydzqyw"><a href="${contextPath }/branches/moblieStock.html">移动证券</a></td>
  </tr>
  <tr>
    <td class="lmenu_a blue3" id="jgjfw"><a href="${contextPath }/branches/goldManager.html">金管家服务业务</a></td>
  </tr>
  <tr>
    <td class="lmenu_a blue3" id="ggptfw"><a href="${contextPath }/branches/ggptServices.html">股改配套服务</a></td>
  </tr>
  <tr>
    <td class="lmenu_a blue3" id="ededxdzfw"><a href="${contextPath }/branches/ggpteOne.html">E对壹服务</a></td>
  </tr>
  <tr>
    <td class="lmenu_a blue3" id="rzh6h"><a href="${contextPath }/branches/rzh6h.jsp?nav=grgf&nav1=cpyfw&nav2=rzh6h">E对壹彩信时报财富资讯</a></td>
  </tr>
  <tr>
    <td class="lmenu_a blue3" id="hxzx"><a href="${contextPath }/branches/hxzx.jsp?nav=grgf&nav1=cpyfw&nav2=hxzx">广发研发核心资讯</a></td>
  </tr>
  <tr>
    <td class="lmenu_a blue3" id="rzh1h"><a href="${contextPath }/branches/rzh1h.jsp?nav=grgf&nav1=cpyfw&nav2=rzh1h">睿组合1号</a></td>
  </tr>
  <tr>
    <td class="lmenu_a blue3" id="rzh2h"><a href="${contextPath }/branches/rzh2h.jsp?nav=grgf&nav1=cpyfw&nav2=rzh2h">睿组合2号</a></td>
  </tr>
  <!-- 2012-10-26取消蓝筹 -->
   <!-- <tr>
    <td class="lmenu_a blue3" id="rzh3h"><a href="${contextPath }/branches/rzh3h.jsp?nav=grgf&nav1=cpyfw&nav2=rzh3h">睿组合蓝筹优选</a></td>
  </tr> -->
  <!-- 2013-1-14 关闭
  <tr>
    <td class="lmenu_a blue3" id="newGrow"><a href="${contextPath }/branches/newGrow.jsp?nav=grgf&nav1=cpyfw&nav2=newGrow">睿组合新兴成长</a></td>
  </tr>
   -->
   <tr>
    <td class="lmenu_a blue3" id="rzh4h"><a href="${contextPath }/branches/rzh4h.jsp?nav=grgf&nav1=cpyfw&nav2=rzh4h">睿组合双向策略</a></td>
  </tr>
  <!-- 2013年3月8日 取消定制
  <tr>
    <td class="lmenu_a blue3" id="rzh5h"><a href="${contextPath }/branches/rzh5h.jsp?nav=grgf&nav1=cpyfw&nav2=rzh5h">睿组合多空趋势</a></td>
  </tr>  -->
    <tr>
    <td class="lmenu_a blue3" id="rzh7h"><a href="${contextPath }/branches/rzh7h.jsp?nav=grgf&nav1=cpyfw&nav2=rzh7h">睿组合趋势避险</a></td>
  </tr>
    <tr>
    <td class="lmenu_a blue3" id="rzh8h"><a href="${contextPath }/branches/rzh8h.jsp?nav=grgf&nav1=cpyfw&nav2=rzh8h">睿组合价值优选</a></td>
  </tr>
</table>

<%
		String nav2 = request.getParameter("nav2");
		if (nav2 != null && !"".equals(nav2))
		{
				%>
						<script type="text/javascript">
								document.getElementById("jlcpfw").className = "lmenu_a blue3";
								document.getElementById('<%=nav2 %>').className = "lmenu_hov blue3 bold";
						</script>
				<%
		}
%>