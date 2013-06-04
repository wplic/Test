<%@ page contentType="text/html; charset=utf-8" language="java"  %>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
<%@ include file="/commons/taglibs.jsp"%>
<table align="center">
  <tr>
    <td align="center"><img src="/pic/infoCenter/left_mpic1.jpg" /></td>
  </tr>
  <tr>
    <td height="4"></td>
  </tr>
</table>

<table width="195" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
  <tr>
    <td class="lmenu_a blue3" id="xgjz"><a href="${ctx}/infoCenter/newStockIndex.html">新股聚焦</a></td>
  </tr>
  <tr>
    <td class="lmenu_a blue3" id="xgssgg"><a href="${ctx}/infoCenter/newStockXgssgg.html">新股上市公告</a></td>
  </tr>
  <tr>
    <td class="lmenu_a blue3" id="zgsms"><a href="${ctx}/infoCenter/newStockZgsms.html">招股说明书</a></td>
  </tr>
  <tr>
    <td class="lmenu_a blue3" id="xgdwfx"><a href="${ctx}/infoCenter/newStockXgdjfx.html">新股定位分析</a></td>
  </tr>
  <tr>
    <td class="lmenu_a blue3" id="xgfx"><a href="${ctx}/infoCenter/newStockXgfx.html">新股发行</a></td>
  </tr>
  <tr>
    <td class="lmenu_a blue3" id="xgzq"><a href="${ctx}/infoCenter/newStockXgzq.html">新股中签</a></td>
  </tr>
  <tr>
    <td class="lmenu_a blue3" id="xgzs"><a href="${ctx}/infoCenter/newStockXgzs.html">新股知识</a></td>
  </tr>
  <tr>
    <td class="lmenu_a blue3" id="xgsjtj"><a href="${ctx}/infoCenter/newStockXgsjtj.html">新股数据统计</a></td>
  </tr>
</table>
<script src="/js/stock_lmenu.js"></script>

<%
	String nav2 = request.getParameter("nav2");
	if (nav2 != null && !"".equals(nav2))
	{
			%>
			
					<script type="text/javascript">
						//document.getElementById('index').className = "font14 white topmenu_a";
						document.getElementById('<%= nav2 %>').className = "lmenu_hov blue3 bold";
						//document.getElementById("wsyyt_con").style.display = "block";
					</script>
			<%
	}
%>

