<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=utf-8" language="java"  %>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
		function showStyle(id)
		{
			
			 for (var i = 1 ; i <= 6 ; i ++)
			 {
			 	
			 	if (id == ('zhtj' + i))
				{
						document.getElementById('zhtj' + i).className = "active red";
				}
				else
				{
						document.getElementById('zhtj' + i).className = "link";
				}
			 }
				
		}
</script>
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
    <td class="lmenu_hov blue3 bold" id="ggxl"><a href="${contextPath }/infoCenter/fund.html">基金新闻</a></td>
  </tr>
  <tr>
    <td class="lmenu_a blue3" id="jjgg"><a href="${contextPath }/infoCenter/fundgg.html">基金公告</a></td>
  </tr>
  <tr>
    <td class="lmenu_a blue3" id="fundyj"><a href="${contextPath }/infoCenter/fundyj.html">基金研究</a></td>
  </tr>
 <!--   <tr>
    <td class="lmenu_a blue3" id="mtool" onclick="selectlMenu('mtool','boardmt')"><a href="#">财富管理工具</a></td>
  </tr>
  <tr>
    <td id="boardmt" style=" display:none">
	<ul class="menu4l">
	 		<li class="link"><a id="moadv" href="${contextPath }/assetAllocation/web/AssetAllocationAction.go?function=ListAsstInfo">资产配置建议</a></li>
            <li class="link"><a id="aipcalc" href="${contextPath }/fundAIPAction.do?method=list">基金定投计算器</a></li>
            <li class="link"><a id="wealthcalc" href="${contextPath }/infoCenter/aip/calculator.jsp">财富管理计算器</a></li>
      </ul>
    </td>
  </tr>
  <tr>-->
    <td class="lmenu_a blue3" id="hor1" onclick="selectlMenu('hor1','board1')"><a href="#">基金超市</a></td>
  </tr>
  <tr>
    <td id="board1" style=" display:none">
	<ul class="menu4l">
        	<li class="link"><a id="jjgs" href="${contextPath }/infoCenter/fundCompany.html">基金公司列表</a></li>
        	<li class="link"><a id="dxjj" href="${contextPath }/tsystemFundSaleFrontAction.do?method=getFundSaleList&nav=zxzx&nav1=jj&nav2=hor1&menu1=hor1&menu2=board1&menu3=dxjj">代销基金</a></li>
            <li class="link"><a id="gfdxwd" href="${contextPath }/infoCenter/fundBranch.html">广发代销网点</a></li>
            <li class="link"><a id="jjjzph" href="${contextPath }/infoCenter/fundNet.html">基金净值排行</a></li>
            <li class="link"><a id="showrisk" href="${contextPath }/infoCenter/riskbook.jsp">基金风险揭示书</a></li>
            <li class="link"><a id="gfrgjjylb" href="${contextPath }/infoCenter/fundGfrgjjylb.html">广发认购基金一览</a></li>
        	<li class="link"><a id="gfsgjjylb" href="${contextPath }/infoCenter/fundGfsgjjylb.html">广发申购基金一览</a></li>
        	 <li class="link"><a id="aipcalc" href="${contextPath }/fundAIPAction.do?method=list">基金定投计算器</a></li>
            <li class="link"><a id="wealthcalc" href="${contextPath }/infoCenter/aip/calculator.jsp">财富管理计算器</a></li>
      </ul>
    </td>
  </tr>
  <tr>
    <td class="lmenu_a blue3" id="hor2" ><a href="${contextPath }/infoCenter/fundCount.html">基金综合统计</a></td>
  </tr>
  <tr>
    <td id="board2" style=" display:none">
	<ul class="menu4l">
        	<li class="link"><a id="zhtj1" onclick="showStyle('zhtj1');" href="${contextPath}/infoCenter/fundxfjj.html"  target="fundSort" >新发基金</a></li>
            <li class="link"><a id="zhtj2" onclick="showStyle('zhtj2');" href="${contextPath}/infoCenter/fundjjfh.html" target="fundSort">基金分红</a></li>
            <li class="link"><a id="zhtj3" onclick="showStyle('zhtj3');" href="${contextPath }/infoCenter/fundSplit.html" target="fundSort">基金拆分</a></li>
            <li class="link"><a id="zhtj4" onclick="showStyle('zhtj4');"  href="${contextPath }/infoCenter/fundStop.html" target="fundSort">暂停交易</a></li>
            <li class="link"><a id="zhtj5" onclick="showStyle('zhtj5');" href="${contextPath }/infoCenter/fundInfo.html" target="fundSort">基金信息</a></li>
            <li class="link"><a id="zhtj6" onclick="showStyle('zhtj6');" href="${contextPath }/infoCenter/fundAbateFare.html" target="fundSort">折价率</a></li>
      </ul>
    </td>
  </tr>
  <tr>
    <td class="lmenu_a blue3" id="jjzs"><a href="${contextPath }/infoCenter/fundjjzs.html">基金知识</a></td>
  </tr>
</table>
<script src="/js/stock_lmenu.js"></script>

				<%
						
						String menu1  = request.getParameter("menu1");
						String menu2 = request.getParameter("menu2");
						String menu3 = request.getParameter("menu3");
						String nav2 = 	request.getParameter("nav2");
						if (menu1 != null && !"".equals(menu1) && menu2 != null && !"".equals(menu2))
						{
							
							%>
								
								<script type="text/javascript">
									document.getElementById('ggxl').className = "lmenu_a blue3";
									var obj1 = document.getElementById('<%=menu1%>');
									var obj2 = document.getElementById('<%=menu2%>');
									var temp = obj2.style.display;
									if(temp == "none")
									{
										obj2.style.display = "";
										obj1.className = "lmenu_hov blue3 bold";
									}
									else
									{
										obj2.style.display = "none";
										obj1.className = "lmenu_a blue3";
									}
								</script>
							<%	
								
						}
						if (nav2 != null && !"".equals(nav2))
						{
						%>
								<script type="text/javascript">
									document.getElementById('ggxl').className = "lmenu_a blue3";
									document.getElementById('<%=nav2%>').className = "lmenu_hov blue3 bold";
								</script>
						<%
							
						}
						if (menu3 != null && !"".equals(menu3))
						{
							
							%>
									<script type="text/javascript">
									document.getElementById('<%=menu3 %>').className = "active red";
									</script>
							<%
						}
				%>
				
