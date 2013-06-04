<%@ page contentType="text/html; charset=utf-8" language="java"%>
<link href="${contextPath }/css/style.css" rel="stylesheet" type="text/css" />
<p><img src="${contextPath }/pic/about/siedban1.jpg" /></p>
<div class="sidemenu">
  		<table>
          <tr>
            <td class="link sideblue" id="zgjj"><a href="${contextPath }/assetManage/assetInfo.html">资管简介</a></td>
          </tr>         
          <tr>
            <td class="link sideblue" id="tzgl"><a href="${contextPath }/assetManage/investManage.html">投资管理</a></td>
          </tr>
          <tr>
            <td class="link sideblue" id="fxgz"><a href="${contextPath }/assetManage/riskControl.html">风险控制</a></td>
          </tr>
          
        </table>

  </div>
<%
			String leftmenu =	request.getParameter("leftmenu");
			if (leftmenu != null && !"".equals(leftmenu))
			{
				%>
						<script type="text/javascript">
								document.getElementById('<%=leftmenu%>').className = "active sideblue";
						</script>
				<%			
			}
%>

