<%@ page contentType="text/html; charset=utf-8" language="java"%>
<link href="${contextPath }/css/style.css" rel="stylesheet" type="text/css" />
<p><img src="${contextPath }/pic/about/siedban1.jpg" /></p>
<div class="sidemenu">
  		<table>
  		  
          <tr>
            <td class="link sideblue" id="jqdt"><a href="${contextPath }/assetManage/affiche.html">近期动态</a></td>
          </tr>         
          <tr>
            <td class="link sideblue" id="mtbd"><a href="${contextPath }/assetManage/mtbd.jsp">媒体报导</a></td>
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

