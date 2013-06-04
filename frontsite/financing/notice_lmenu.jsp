<%@ page contentType="text/html; charset=utf-8" language="java"  %>
<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
<style>
.leftNav_s{height:28px; line-height:28px; text-indent:17px;display:block;}
.leftNav{height:28px; line-height:28px;text-indent:17px;display:block;}
</style>
<script type="text/javascript">
	function selectlMenu(obj1,obj2)
	{
		var obj1 = document.getElementById(obj1);
		var obj2 = document.getElementById(obj2);
		
		var temp = obj2.style.display;
		if(temp == "none")
		{
			obj2.style.display = "";
			obj1.className = "active sideblue";
		}
		else
		{
			obj2.style.display = "none";
			obj1.className = "link sideblue";
		}
	}
</script>
<p><img src="${contextPath}/pic/about/siedban1.jpg" /></p>
<% 
  String nav3="";
  if(request.getParameter("nav3")!=null&&!request.getParameter("nav3").equals(""))
  nav3=request.getParameter("nav3").trim();
   %>
<div class="sidemenu">
  		<table>
          <tr>
            <td class="link sideblue" id="rateNotic"><a href="${contextPath }/financing/rateNoticeLl.html">利率和费率</a></td>
          </tr>
          <tr>
            <td class="link sideblue" id="dbp"><a href="${contextPath }/assureAction.do?method=getAssureFrontList">担保证券</a></td>
          </tr>
          <tr>
            <td class="link sideblue" id="subject"><a href="${contextPath }/financing/subjectNotice.html">标的证券</a></td>
          </tr>
          <tr>
            <td class="link sideblue" id="margin" onclick="selectlMenu('margin','board1')">保证金与维持担保</td>
          </tr>
          <tr>
		    <td id="board1" style=" display:none">
			 <ul class="menu4l">
			        <li class="<%=nav3.equals("wcdbpbl")?"leftNav_s red":"leftNav"  %>"><a href="${contextPath }/pledgeAndKeepAction.do?method=getPledgeAndKeepFrontList&nav3=wcdbpbl">维持担保比例</a></li>
		        	<li class="<%=nav3.equals("rzbzjbl")?"leftNav_s red":"leftNav"  %>"><a href="${contextPath }/pledgeAndKeepAction.do?method=getPledgeAndKeepFrontList&nav3=rzbzjbl">标的证券融资保证金比例</a></li>
		            <li class="<%=nav3.equals("rqbzjbl")?"leftNav_s red":"leftNav"  %>"><a href="${contextPath }/pledgeAndKeepAction.do?method=getPledgeAndKeepFrontList&nav3=rqbzjbl">标的证券融券保证金比例</a></li>
		     </ul>
		    </td>
           </tr>
          <tr>
            <td class="link sideblue" id="mainywwd"><a href="${contextPath }/financing/businessNetwork.html">业务网点</a></td>
          </tr>
          <tr>
            <td class="link sideblue" id="mainqtgg"><a href="${contextPath }/financing/otherNotice.html">历次公告</a></td>
          </tr> 
          <tr>
            <td class="link sideblue" id="maingddh"><a href="${contextPath }/financing/shareholders.jsp">股东大会信息</a></td>
          </tr> 
        </table>

</div>

<%
		if (request.getParameter("menu") != null)
		{
				String menu = request.getParameter("menu");
				%>
						<script type="text/javascript">
								document.getElementById('<%= menu%>').className = "active sideblue";
						</script>
				<%
				if(menu!=null&&!menu.equals("")&&menu.equals("margin")){
				%>
				<script type="text/javascript">
				selectlMenu('margin','board1');
				</script>
				<%
				}
		}
 %>


