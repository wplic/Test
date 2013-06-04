<%@ page contentType="text/html; charset=utf-8" language="java" %>
<link href="${contextPath }/css/style.css" rel="stylesheet" type="text/css" />
<p><img src="${contextPath }/pic/about/siedban1.jpg" /></p>
<div class="sidemenu">
  		<table>
  		  <tr>
            <td class="link sideblue" id="tzjljs"><a href="${contextPath }/assetManage/starManage.html">投资经理介绍</a></td>
          </tr>         
          <tr>
            <td class="link sideblue" id="tzjlsj"><a href="${contextPath }/assetManage/tzjlsj.jsp">投资经理手记</a></td>
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

