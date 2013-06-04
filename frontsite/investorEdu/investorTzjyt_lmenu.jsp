<%@ page contentType="text/html; charset=utf-8" language="java" %>
<link href="${contextPath }/css/global.css" rel="stylesheet" type="text/css" />
<link href="${contextPath }/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
<table width="195" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
  <tr>
    <td class="lmenu_a blue3" id="jbfx"><a href="${contextPath }/investorEdu/investorJbfxJcfx.html">基本分析</a></td>
  </tr>
  <tr>
    <td class="lmenu_a blue3" id="jsfx"><a href="${contextPath }/investorEdu/investorJbfxJsfx.html">技术分析</a></td>
  </tr>
  <tr>
    <td class="lmenu_a blue3" id="gsfx"><a href="${contextPath }/investorEdu/investorJbfxGsfx.html">公司分析</a></td>
  </tr>
  <tr>
    <td class="lmenu_hov blue3 bold"  id="jbmfx"><a  href="${contextPath }/investorEdu/investorJbfxTzjq.html">投资技巧</a></td>
  </tr>

</table>
<script src="${contextPath }/js/stock_lmenu.js"></script>

<%
		String nav2 = 	request.getParameter("nav2");
		if (nav2 != null && !"".equals(nav2))
		{
		%>
				<script type="text/javascript">
					document.getElementById('jbmfx').className = "lmenu_a blue3";
					document.getElementById('<%=nav2%>').className = "lmenu_hov blue3 bold";
				</script>
		<%
			
		}
		
%>