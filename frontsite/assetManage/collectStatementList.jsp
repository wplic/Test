<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@page import="com.cssweb.assetManager.pojo.AssetUser"%>
<%@page import="com.cssweb.collect.pojo.FundHistory"%>
<%@page import="java.text.DecimalFormat"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@page import="java.util.List"%>
<%@page import="com.cssweb.collect.pojo.TradeLog"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@page import="com.cssweb.common.util.PageUtil"%>
<%@ include file="/commons/turnPage.jsp"%>
<%
	DecimalFormat df = new DecimalFormat("##0.00");
	AssetUser assetUser = null;
	if(null!=request.getSession().getAttribute("assetUser")){
		assetUser = (AssetUser)request.getSession().getAttribute("assetUser");
		String fundAccount = assetUser.getFundAccount();
	}else{
		//assetUser = new AssetUser();
		//assetUser.setFundAccount("871000133514");
		//request.getSession().setAttribute("assetUser",assetUser);
	%>
		<script language="javascript">
			window.location="/commons/loginms.jsp";
		</script>
	<%}
	//String fundAccount = assetUser.getFundAccount();
%>
<%
		List list =(List) request.getAttribute("loglist");
		String startdate = "";
		if (request.getAttribute("startdate") != null)
		{
				startdate = (String)request.getAttribute("startdate");
		}
		String enddate = "";
		if (request.getAttribute("enddate") != null)
		{
				enddate = (String)request.getAttribute("enddate");
		}
		List fundHistoryList =(List) request.getAttribute("fundHistoryList");
		
%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />

</head>
<body>
<jsp:include page="/commons/mstop.jsp" />
  <form action="${contextPath }/statementAction.do?method=getStatementList&menu=dzdcx" name="tradelogForm" method="post">
<div class="main">
  <div class="dqwz">当前位置：<a href="${contextPath }/default.html"> 首页 </a>-<a href="${contextPath }/assetManage/index.jsp">资产管理</a> - 客户服务</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft">
	 <jsp:include page="${contextPath}/assetManage/collectService_lmenu.jsp?menu=dzdcx" />
  </div>
  <!--左侧sied结束-->
   
  <!--中侧sied开始-->
  <div class="w706 fright">
  <div class="comtit1"><h4>对账单查询</h4></div>


  <div class="blank10"></div>
  <div class="khfwcx">
    <a href="#"></a>
    <table width="90%" align="center" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="60">起始日期：</td>
        <td width="120"> <input name="startdate"   class="input108" style="width:90px" onfocus="this.blur()" value="<%= startdate %>" size="10" readonly><a href="javascript:void(0)" onclick="gfPop.fStartPop(document.tradelogForm.startdate,document.tradelogForm.enddate);return false;" HIDEFOCUS><img src="${ctx}/pic/share/selectTime.gif" name="popcal" width="19" height="18" border="0" align="absmiddle"></a></td>
        <td width="60">终止日期：</td>
        <td width="120"><input name="enddate" class="input108" style="width:90px" onfocus="this.blur()" value="<%=enddate %>" size="10" readonly><a href="javascript:void(0)" onClick="gfPop.fEndPop(document.tradelogForm.startdate,document.tradelogForm.enddate);return false;" HIDEFOCUS><img src="${ctx}/pic/share/selectTime.gif" name="popcal" width="19" height="18" border="0" align="absmiddle"></a></td>
        <td><a href="#"><img src="/pic/assetManage/butCx.jpg" onclick="document.tradelogForm.submit();"/></a></td>
      </tr>
    </table>
  </div>
  <div class="blank10"></div>

	<table border="1" bordercolor="#cccccc" width="700" align="center" class="lh24">
	
	<%
		if(fundHistoryList!=null&&fundHistoryList.size()>0){
		%>
		<tr>
		<td colspan="9" align="left" valign="middle">
		<table>
		<%
		for(int i=0;i<fundHistoryList.size();i++){
			FundHistory fundHistory = (FundHistory)fundHistoryList.get(i);
			String availableVol="0.00";
			if(fundHistory.getAvailableVol()!=null&&fundHistory.getAvailableVol()!=0){
			availableVol=df.format(fundHistory.getAvailableVol().doubleValue());
			}
			%>
				<tr>
				<td align="right">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<strong style="color: blue"> <%=fundHistory.getFundName() %></strong>:</td>
				<td align="left">&nbsp;&nbsp;查询截止日余额:<strong style="color: blue"><%=availableVol %>元</strong></td>
				<td align="left">&nbsp;&nbsp;代销机构：<strong style="color: blue"><%=fundHistory.getDistributorName() %></strong></td>
      			</tr>
			<%
		}
		%>
		</table>
		</td>
		</tr>
		<%
		}
	 %>
	 
      <tr  class="rrtab_tt bold">
        <td align="center">委托人姓名</td>
        <td align="center">集合计划代码</td>
        <td align="center">集合计划名称</td>
        <td align="center">确认日期</td>
        <td align="center">业务类型</td>
        <td align="center">成交价格</td>
        <td align="center">确认份额</td>
        <td align="center">确认金额</td>
      </tr>
      <%
      			if (list != null )
      			{
      					for (int i = 0; i < list.size() ; i ++)
      					{
      							TradeLog tradelog = (TradeLog)list.get(i);
      							if (i % 2 ==0 )
      							{
      									%>
      											  <tr>
											        <td align="center"><%= tradelog.getAccountabbr() %></td>
											        <td align="center"><%= tradelog.getFundcode() %></td>
											        <td align="center"><%= tradelog.getFundname() %></td>
											        <td align="center"><%= tradelog.getTransactioncfmdate() %></td>
											        <td align="center"><%= tradelog.getBusinesstype() %></td>
											        <td class="pl5"><%= tradelog.getConfirmedprice().doubleValue()==0.0?" ":tradelog.getConfirmedprice().doubleValue() %></td>
											        <td align="center"><%= tradelog.getConfirmednumber().doubleValue()==0.0?" ":tradelog.getConfirmednumber().doubleValue() %></td>
											        <td align="center"><%= tradelog.getConfirmedamount().doubleValue()==0.0?" ":tradelog.getConfirmedamount().doubleValue() %></td>
											      </tr>
      									<%
      							}
      							else
      							{
      									%>
      											 <tr class="bg_ec">
											        <td align="center"><%= tradelog.getAccountabbr() %></td>
											        <td align="center"><%= tradelog.getFundcode() %></td>
											        <td align="center"><%= tradelog.getFundname() %></td>
											        <td align="center"><%= tradelog.getTransactioncfmdate() %></td>
											        <td align="center"><%= tradelog.getBusinesstype() %></td>
											        <td class="pl5"><%= tradelog.getConfirmedprice().doubleValue()==0.0?" ":tradelog.getConfirmedprice().doubleValue() %></td>
											        <td align="center"><%= tradelog.getConfirmednumber().doubleValue()==0.0?" ":tradelog.getConfirmednumber().doubleValue() %></td>
											        <td align="center"><%= tradelog.getConfirmedamount().doubleValue()==0.0?" ":tradelog.getConfirmedamount().doubleValue() %></td>
											      </tr>
      									
      									<%
      							}
      					}
      			}
       %>
      <tr>
      		<td colspan="9" align="right"><%=PageUtil.pagination("window.tradelogForm",totleCount, currentPage, pagesize)%></td>
      </tr>
    </table>

  </div>
  <!--中侧sied结束--> 
    <!--右侧sied开始-->
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
    <div class="blank5"></div>
</form>
<jsp:include page="/commons/msbottom.jsp" />
<iframe width=174 height=189 name="gToday:normal:agenda.js" id="gToday:normal:agenda.js"
			src="${ctx}/js/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; left:-500px; top:0px;"> 

</body>
</html>