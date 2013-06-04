<%@ page contentType="text/html; charset=utf-8" language="java" %>
<link href="${contextPath }/css/global.css" rel="stylesheet" type="text/css" />
<link href="${contextPath }/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
<table width="195" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
  <tr>
    <td class="lmenu_a blue3" id="tzzjy_cfxy_hgjj"><a href="${contextPath }/investorEdu/investorHgjjHgjj.html">宏观经济</a></td>
  </tr>
  <tr>
    <td class="lmenu_a blue3" id="tzzjy_cfxy_llyj"><a href="${contextPath }/investorEdu/investorLlyj.html">理论研究</a></td>
  </tr>
  <tr>
    <td class="lmenu_a blue3" id="tzzjy_cfxy_gjjr"><a href="${contextPath }/investorEdu/investorGjjr.html">国际金融</a></td>
  </tr>
 <tr>
    <td class="lmenu_a blue3" id="tzzjy_cfxy_xsqy"><a href="${contextPath }/investorEdu/investorXxqy.html">学术前沿</a></td>
  </tr>
<tr>
    <td class="lmenu_a blue3" id="tzzjy_cfxy_cfgl"><a href="${contextPath }/investorEdu/investorCfgl.html">财富管理</a></td>
  </tr>
</table>
<script src="${contextPath }/js/stock_lmenu.js"></script>

<%
		String nav2 = 	request.getParameter("nav2");
		if (nav2 != null && !"".equals(nav2))
		{
		%>
				<script type="text/javascript">
					document.getElementById('tzzjy_cfxy_hgjj').className = "lmenu_a blue3";
					document.getElementById('<%=nav2%>').className = "lmenu_hov blue3 bold";
				</script>
		<%
			
		}
		
%>