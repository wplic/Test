<%@ page contentType="text/html; charset=utf-8" language="java" %>
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
    <td class="lmenu_a blue3" id="jysmrgg" onclick="selectlMenu('<%= request.getParameter("nav2") %>','board1')"><a href="#">交易所每日公告</a></td>
  </tr>
  <tr>
    <td id="board1" style=" display:none">
	<ul class="menu4l">
        	<li class="link" id="hstbts"><a href="${ctx}/infoCenter/stockjyggHstbts.html">沪市特别提示</a></li>
        	<li class="link" id="sstbts"><a href="${ctx}/infoCenter/stockjyggSstbts.html">深市特别提示</a></li>
        	<li class="link" id="jrxgts"><a href="${ctx}/infoCenter/stockjyggJrxgts.html">今日新股提示</a></li>
        	<li class="link" id="jjts"><a href="${ctx}/infoCenter/stockjyggJjfxzmts.html">基金发行扩募提示</a></li>
        	<li class="link" id="zfpgts"><a href="${ctx}/infoCenter/stockjyggZfpgts.html">增发配股提示</a></li>
        	<li class="link" id="zqts"><a href="${ctx}/infoCenter/stockjyggZqfxssts.html">债券发行上市提示</a></li>
        	<li class="link" id="hsgg"><a href="${ctx}/infoCenter/stockjyggSjsgg.html">沪市公告</a></li>
        	<li class="link" id="ssgg"><a href="${ctx}/infoCenter/stockjyggSzjsgg.html">深市公告</a></li>
        	<li class="link" id="hslhb"><a href="${ctx}/infoCenter/stockjyggHslhb.html">沪深龙虎榜</a></li>
        	<li class="link" id="xsjj"><a href="${ctx}/infoCenter/stockjyggXsjj.html">限售解禁</a></li>
        	<li class="link" id="yjygts"><a href="${ctx}/infoCenter/stockjyggYjyg.html">业绩预告</a></li>
    </ul>
    </td>
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
