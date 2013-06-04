<%@ page contentType="text/html; charset=utf-8" language="java" %>
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<jsp:directive.page import="com.cssweb.clientService.service.FundHoldService"/>
<jsp:directive.page import="com.cssweb.clientService.pojo.FundHold"/>
<jsp:directive.page import="com.cssweb.assetManager.pojo.AssetUser"/>
<jsp:directive.page import="com.cssweb.clientService.service.AssetInfoService"/>
<jsp:directive.page import="java.util.*"/>
<%
    String dateStringmd="昨日";
    String dssm="";
	String fundAccount = null;
	if(null!=request.getSession().getAttribute("assetUser")){
		AssetUser assetUser = (AssetUser)request.getSession().getAttribute("assetUser");
		fundAccount = assetUser.getFundAccount();
	}else{%>	
		<script language="javascript">
			window.location="/commons/loginms.jsp";
		</script>
	<%}

	ServletContext st = this.getServletConfig().getServletContext();
	ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
	FundHoldService fundHoldService = (FundHoldService) ctx.getBean("fundHoldService");
	AssetInfoService assetInfoService = (AssetInfoService) ctx.getBean("assetInfoService");
	List list =	fundHoldService.getInfoByCode(fundAccount);
	//if(null!=fundAccount){
	//List list2=assetInfoService.getAssetInfoByClientId(fundAccount);
	//	if(list2!=null&&list2.size()>0){
	//	dateStringmd="月末";
	//	dssm="注：仅显示至上月最后一个工作日账户信息";
	//	}
	//}
	%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />

</head>
<body>
<jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="${contextPath }/default.html"> 首页 </a>-<a href="${contextPath }/assetManage/index.jsp">资产管理</a> - 客户服务 - 证券持仓信息</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft">
	 <jsp:include page="clientService_lmenu.jsp?nav=zhxx&nav1=3" />
  </div>
  <!--左侧sied结束-->
   
  <!--中侧sied开始-->
  <div class="w706 fright">
  <div class="comtit1"><h4>证券持仓信息</h4></div>
  <div class="blank10"></div>
  <div class="khfwtit1"><span class="font14">证券持仓信息</span> <%=dssm %></div>
  <div class="blank10"></div>
  <div style="width:706px;overflow:auto; padding:0px 0px 10px 0">
    <table border="1" bordercolor="#cccccc" width="703" align="center" class="lh24">
      <tr class="rrtab_tt bold">
        <td rowspan="2" align="center">证券代码</td>
        <td rowspan="2" align="center">证券名称</td>
        <td rowspan="2" align="center">单位</td>
        <td align="center">可用数</td>
        <td colspan="2" align="center">实时</td>
        <td rowspan="2" align="center">比例</td>
        <td colspan="2" align="center">成本</td>
        <td rowspan="2" align="center">浮动盈亏</td>
        <td rowspan="2" align="center">日期</td>
      </tr>
      <tr class="rrtab_tt bold">
        <td align="center">当前数</td>
        <td align="center"><%=dateStringmd %>收盘价</td>
        <td align="center"><%=dateStringmd %>市值</td>
        <td align="center">金额</td>
        <td align="center">均价</td>
        </tr>
		<%if(null!=list){
			for(int i=0;i<list.size();i++){
				FundHold fundHold = (FundHold)list.get(i);
				String percent = fundHold.getPercent()+"";
				String _percent = percent;
				if((percent.length()-percent.indexOf("."))>3)
					_percent = percent.substring(0,percent.indexOf(".")+3);%>
			  <tr>
				<td align="center"><%=fundHold.getFundCode()%></td>
				<td align="center"><%=null==fundHold.getFundName()?"":fundHold.getFundName()%></td>
				<td align="center">股</td>
				<td align="center"><%=fundHold.getCurrentNumber()%></td>
				<td align="center"><%=fundHold.getYesterdayPrice()%></td>
				<td align="center"><%=fundHold.getYesterdayValue()%></td>
				<td align="center"><%=_percent%>%</td>
				<td align="center"><%=fundHold.getCostMoney()%></td>
				<td class="pl5"><%=fundHold.getCostPrice()%></td>
				<td align="center"><%=fundHold.getProfitAndLoss()+""%></td>
				<td align="center"><%=fundHold.getBusinessDate() +""%></td>
			  </tr>
	  <%	}
		}%>
    </table>
  </div>
  </div>
  <!--中侧sied结束--> 
    <!--右侧sied开始-->
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
    <div class="blank5"></div>
<jsp:include page="/commons/msbottom.jsp" />
</body>
</html>