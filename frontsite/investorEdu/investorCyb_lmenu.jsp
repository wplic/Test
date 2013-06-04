<%@ page contentType="text/html; charset=utf-8" language="java"  %>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
<table width="195" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
  <tr>
    <td class="lmenu_hov blue3 bold" id="hor1"><a href="${contextPath }/investorEdu/investorCyb.html">创业板开户指引</a></td>
  </tr>
  <tr>
    <td class="lmenu_a blue3" id="cybxgjd"><a href="${contextPath }/investorEdu/investorCybZxDj.html">创业板相关解读</a></td>
  </tr>
  <tr>
    <td class="lmenu_a blue3" id="cybxgdt"><a href="${contextPath }/investorEdu/investorCybZxDt.html">创业板相关动态</a></td>
  </tr>
</table>
<script src="${contextPath }/js/stock_lmenu.js"></script>
<%
		String nav2 = 	request.getParameter("nav2");
		if (nav2 != null && !"".equals(nav2))
		{
		%>
				<script type="text/javascript">
					document.getElementById('hor1').className = "lmenu_a blue3";
					document.getElementById('<%=nav2%>').className = "lmenu_hov blue3 bold";
				</script>
		<%
			
		}
		
%>
