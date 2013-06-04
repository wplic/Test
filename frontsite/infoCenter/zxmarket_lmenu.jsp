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
    <td class="lmenu_a blue3" id="zxbxw"><a href="${ctx}/infoCenter/zxmarketzxbxw.html">中小板新闻</a></td>
  </tr>
  <tr>
    <td class="lmenu_a blue3" id="zxbgg"><a href="${ctx}/infoCenter/zxmarketzxbgg.html">中小板公告</a></td>
  </tr>
  <tr>
    <td class="lmenu_a blue3" id="zxbsp"><a href="${ctx}/infoCenter/zxmarketzxbsp.html">中小板市评</a></td>
  </tr>
  <tr>
    <td class="lmenu_a blue3" id="zxbgeg"><a href="${ctx}/infoCenter/zxmarketzxbgeg.html">中小板个股</a></td>
  </tr>
  <tr>
    <td class="lmenu_a blue3" id="zxbzs"><a href="${ctx}/infoCenter/zxmarketzxbzs.html">中小板知识</a></td>
  </tr>
</table>
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


