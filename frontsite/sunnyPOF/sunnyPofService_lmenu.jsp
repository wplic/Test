<%@ page contentType="text/html; charset=utf-8" language="java" %>

<link href="${contextPath }/css/style.css" rel="stylesheet" type="text/css" />
<style>
<!--
.menu4l{ margin:3px 0px 8px 38px;}
.menu4l .active2{ background:url(/pic/infoCenter/menu4_hico.gif) no-repeat; height:28px; line-height:28px; text-indent:17px;display:block;}
.menu4l .link2{ background:url(/pic/infoCenter/menu4_lico.gif) no-repeat; height:28px; line-height:28px;text-indent:17px;display:block;}
-->
</style>
<%
 String type="";
 if(request.getParameter("type")!=null&&!request.getParameter("type").equals(""))
 type=request.getParameter("type");
 %>
<p><img src="${contextPath }/pic/assetManage/khfwleft.jpg" /></p>
<div class="sidemenu">
  		<table>
  		<tr>
            <td class="link sideblue" id="zhyexx"><a href="/sunnyCustAction.do?method=showHoldShare">帐户余额信息</a></td>
          </tr>
          <tr>
            <td class="link sideblue" id="zhfhxx"><a href="/sunnyCustAction.do?method=showDividends">帐户分红信息</a></td>
          </tr>
          <tr>
            <td class="link sideblue" id="ywbgxx"><a href="/sunnyCustAction.do?method=showExchangeByCust">历史交易查询</a></td>
          </tr>
            <tr>
            <td class="link sideblue" id="zhhistory"><a href="/sunnyCustAction.do?method=showCustshareHistory">查询历史份额</a></td>
          </tr>
          <tr>
            <td class="link sideblue" id="xxpls"><a href="/sunnyCustAction.do?method=showCpcgwdByCust">信息披露</a></td>
          </tr>
          <tr>
            <td class="link sideblue" id="khjbxx"><a href="/sunnyPOF/sunnyPofServiceKhxx.jsp">客户基本信息</a></td>
          </tr>
          <tr>
            <td class="link sideblue" id="mmxg"><a href="/sunnyPOF/sunnyPofServiceMmxg.jsp">密码修改</a></td>
          </tr>
          <tr>
            <td class="link sideblue"><a href="/sunnyCustAction.do?method=logout">重新登陆</a></td>
          </tr>
        </table>
</div>
<%
	String menu =	request.getParameter("menu");
	if (menu != null && !"".equals(menu))
	{
			%>
					<script type="text/javascript">
						document.getElementById('zhyexx').className = "link sideblue";
					 	document.getElementById('<%= menu%>').className = "active sideblue";
					</script>
			<%
	}
	if (menu != null && !"".equals(menu)&&(menu).equals("khdzfw"))
	{
			%>
					<script type="text/javascript">
						document.getElementById("board1").style.display= "";
					</script>
			<%
	}
%>
<script>
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
function selectlMenu2(obj1,obj2)
{
 alert("短信邮件订制功能即将推出");
}
</script>
