<%@ page contentType="text/html; charset=utf-8" language="java"  %>
<link href="${contextPath }/css/global.css" rel="stylesheet" type="text/css" />
<link href="${contextPath }/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
<table width="195" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
  <tr>
    <td class="lmenu_hov blue3 bold" id="horbasic"><a  href="${contextPath }/investorEdu/investorBasic.html">证券基础知识</a></td>
  </tr>
  <tr>
    <td class="lmenu_a blue3" id="tzzydgpzs"><a href="${contextPath }/investorEdu/investorStockSchool.html">股票知识</a></td>
  </tr>
  <tr>
    <td class="lmenu_a blue3" id="tzzydqzzs"><a href="${contextPath }/investorEdu/investorQzzs.html">权证知识</a></td>
  </tr>
  <tr>
    <td class="lmenu_a blue3" id="tzzydjjzs"><a href="${contextPath }/investorEdu/investorJjzs.html">基金知识</a></td>
  </tr>
   <tr>
    <td class="lmenu_a blue3" id="tzzydzqzs"><a href="${contextPath }/investorEdu/investorZqzs.html">债券知识</a></td>
  </tr>
   <tr>
    <td class="lmenu_a blue3" id="tzzydqhzs"><a href="${contextPath }/investorEdu/investorQhzs.html">期货知识</a></td>
  </tr>
    <tr>
    <td class="lmenu_a blue3" id="gzqhzs"><a href="${contextPath }/investorEdu/investorGzqh.jsp">股指期货知识</a></td>
  </tr>
  <tr>
    <td class="lmenu_a blue3" id="tzzyddsfcg"><a href="${contextPath }/investorEdu/investorZsfcg.html">第三方存管</a></td>
  </tr>
  <tr>
    <td class="lmenu_a blue3" id="tzzydcjlt"><a href="${contextPath }/investorEdu/investorCjlt.html">常见问题</a></td>
  </tr>
</table>
<script src="${contextPath }/js/stock_lmenu.js"></script>

<%
		String nav2 = 	request.getParameter("nav2");
		if (nav2 != null && !"".equals(nav2))
		{
		%>
				<script type="text/javascript">
					document.getElementById('horbasic').className = "lmenu_a blue3";
					document.getElementById('<%=nav2%>').className = "lmenu_hov blue3 bold";
				</script>
		<%
			
		}
		
%>