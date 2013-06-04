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
    <td class="lmenu_a blue3" id="gsyw"><a href="${ctx}/infoCenter/stock.jsp?nav=zxzx&nav1=gp&nav2=gsyw&whichCat=zxzx_gp_gsyw">股市要闻</a></td>
  </tr>
  <tr>
    <td class="lmenu_a blue3" id="dpgz"><a href="${ctx}/infoCenter/stockDpzz.html">大盘追踪</a></td>
  </tr>
  <tr>
    <td class="lmenu_a blue3" id="ggps"><a href="${ctx}/infoCenter/stockDgps.html">个股评述</a></td>
  </tr>
  <tr>
    <td class="lmenu_a blue3" id="qlgtj"><a href="${ctx}/infoCenter/stockQlgtj.html">潜力股推荐</a></td>
  </tr>
  <tr>
    <td class="lmenu_a blue3" id="bkbd"><a href="${ctx}/infoCenter/stockBkbd.html">板块报道</a></td>
  </tr>
  <tr>
    <td class="lmenu_a blue3" id="rdqj"><a href="${ctx}/infoCenter/stockRdjj.html">热点聚焦</a></td>
  </tr>
  <tr>
    <td class="lmenu_a blue3" id="yddp"><a href="${ctx}/infoCenter/stockYddp.html">异动点评</a></td>
  </tr>
  <tr>
    <td class="lmenu_a blue3" id="hyfx"><a href="${ctx}/infoCenter/stockHYfx.html">行业分析</a></td>
  </tr>
  <tr>
    <td class="lmenu_a blue3" id="gsdt"><a href="${ctx}/infoCenter/stockTsdt.html">公司动态</a></td>
  </tr>
  <tr>
    <td class="lmenu_a blue3" id="yjbg"><a href="${ctx}/infoCenter/stockStudy.html">研究报告</a></td>
  </tr>
  <tr>
    <td class="lmenu_a blue3" id="gpsjtj"><a href="${ctx}/infoCenter/stockGpsjtj.html">股票数据统计</a></td>
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
	
	String nav3 = request.getParameter("nav3");
	if (nav3 != null && !"".equals(nav3))
	{
			%>
			
					<script type="text/javascript">
						selectlMenu('jysmrgg','board1');
						//document.getElementById('index').className = "font14 white topmenu_a";
						document.getElementById('<%= nav3 %>').className = "active red";
						//document.getElementById("wsyyt_con").style.display = "block";
					</script>
			<%
	}
%>
