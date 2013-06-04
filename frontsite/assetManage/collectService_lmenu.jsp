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
            <td class="active sideblue" id="zhyexx"><a href="${contextPath }/balFundFundAction.do?method=getBalFundList&menu=zhyexx">帐户余额信息</a></td>
          </tr>         
          <tr>
            <td class="link sideblue" id="zhfhxx"><a href="${contextPath }/rightsregAction.do?method=getRightsregList&menu=zhfhxx">帐户分红信息</a></td>
          </tr>
          <tr>
            <td class="link sideblue" id="ywbgxx"><a href="${contextPath }/tradelogAction.do?method=getTradeLog&menu=ywbgxx">历史交易查询</a></td>
          </tr>
            <tr>
            <td class="link sideblue" id="zhhistory"><a href="${contextPath }/fundHistoryAction.do?method=getFundHistoryList&menu=zhhistory">查询历史份额</a></td>
          </tr>
          <tr>
          <td class="link sideblue" id="dzdcx"><a href="${contextPath }/statementAction.do?method=getStatementList&menu=dzdcx">对账单查询</a></td>
          </tr><!--
          <tr>
            <td class="link sideblue" id="jhlcydbg"><a href="${contextPath }/assetManage/collestServiceYdbg.jsp?menu=jhlcydbg&whichCat=cpzx_jhlc_ydbg">月度报告</a></td>
          </tr>
          --><tr>
          	<td class="link sideblue" id="tzcl"><a href="${contextPath }/assetManage/clientServiceTzcl.jsp?menu=tzcl">投资策略报告</a></td>
		  </tr>
          <tr>
            <td class="link sideblue" id="khdzfw"><a href="${contextPath }/commissionAction.do?method=loginCommission&type=1&menu=khdzfw">客户服务订制</a></td>
          </tr>
          
          <tr>
           <!--  <td class="link sideblue" id="khjbxx"><a href="${contextPath }/acctCustAction.do?method=getAcctCustByDepositacct&menu=khjbxx">客户基本信息</a></td>--> 
             <td class="link sideblue" id="khjbxx"><a href="${contextPath }/collect/web/AcctCustSyncAction.go?function=AcctCustByCapAccount&menu=khjbxx">客户基本信息</a></td>
          </tr>
          <tr>
            <td class="link sideblue" id="mmxg"><a href="${contextPath }/assetManage/collectServiceMmxg.jsp?menu=mmxg">密码修改</a></td>
          </tr>
          <tr>
            <td class="link sideblue"><a href="${contextPath }/commons/loginms.jsp">重新登陆</a></td>
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
