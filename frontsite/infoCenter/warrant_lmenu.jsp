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
    <td class="lmenu_a blue3" id="qzxw"><a href="${ctx}/infoCenter/warrantIndex.html">权证新闻</a></td>
  </tr>
  <tr>
    <td class="lmenu_a blue3" id="qzgg"><a href="${ctx}/infoCenter/warrantqzgg.html">权证公告</a></td>
  </tr>
  <tr>
    <td class="lmenu_a blue3" id="qzyj"><a href="${ctx}/infoCenter/warrantqzyj.html">权证研究</a></td>
  </tr>
  <tr>
    <td class="lmenu_a blue3" id="qzhqlb"><a href="${ctx}/infoCenter/warrantQzhqList.html">权证行情表</a></td>
  </tr>
  <tr>
    <td class="lmenu_a blue3" id="qzdqtx"><a href="${ctx}/infoCenter/warrantQzdqtxList.html">权证到期提醒</a></td>
  </tr>
  <tr>
    <td class="lmenu_a blue3" id="qztj"><a href="${ctx}/infoCenter/warrantqztj.html">权证统计</a></td>
  </tr>
  <tr>
    <td class="lmenu_a blue3" id="qzzs"><a href="${ctx}/infoCenter/warrantqzzs.html">权证知识</a></td>
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

