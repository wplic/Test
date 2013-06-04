<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<jsp:directive.page import="com.cssweb.common.util.PageUtil"/>
<%@page import="com.cssweb.collect.pojo.BalFund"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.cssweb.assetManager.pojo.AssetUser"%>
<%@page import="java.util.List"%>
<%@page import="com.cssweb.collect.pojo.FundHistory"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ include file="/commons/turnPage.jsp"%>
<%@ include file="/commons/taglibs.jsp"%>
<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	AssetUser assetUser = null;
	if(null!=request.getSession().getAttribute("assetUser")){
		assetUser = (AssetUser)request.getSession().getAttribute("assetUser");
		String fundAccount = assetUser.getFundAccount();
	}else{%>
		<script language="javascript">
			window.location="/commons/loginms.jsp";
		</script>
	<%}
	//String fundAccount = assetUser.getFundAccount();
%>

<%
	List	fundHistoryList = (List)request.getAttribute("fundHistoryList");
	DecimalFormat dmf = new DecimalFormat("#0.00");
		String startDate = "";
		if (request.getAttribute("startDate") != null)
		{
				startDate = (String)request.getAttribute("startDate");
		}
		String endDate = "";
		if (request.getAttribute("endDate") != null)
		{
				endDate = (String)request.getAttribute("endDate");
		}
 %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${contextPath }/css/style.css" rel="stylesheet" type="text/css" />

</head>
<body>
<jsp:include page="${contextPath}/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="${contextPath }/default.html"> 首页 </a>-<a href="${contextPath }/assetManage/index.jsp">资产管理</a> - 客户服务</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft">
	 <jsp:include page="${contextPath}/assetManage/collectService_lmenu.jsp" />
  </div>
  <!--左侧sied结束-->
  <form name="qForm" action="${contextPath }/fundHistoryAction.do?method=getFundHistoryList&menu=zhhistory" method="post" >
  <!--中侧sied开始-->
  <div class="w706 fright">
  <div class="comtit1">
    <h4>历史份额信息</h4></div>
    <div class="blank10"></div>
  <div class="khfwcx">
    <a href="#"></a>
    <table width="90%" align="center" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="60">起始日期：</td>
        <td width="120"> <input name="StartDate"   class="input108" style="width:90px" onfocus="this.blur()" value="<%= startDate %>" size="10" readonly><a href="javascript:void(0)" onclick="gfPop.fStartPop(document.qForm.StartDate,document.qForm.EndDate);return false;" HIDEFOCUS><img src="${ctx}/pic/share/selectTime.gif" name="popcal" width="19" height="18" border="0" align="absmiddle"></a></td>
        <td width="60">终止日期：</td>
        <td width="120"><input name="EndDate" class="input108" style="width:90px" onfocus="this.blur()" value="<%=endDate %>" size="10" readonly><a href="javascript:void(0)" onClick="gfPop.fEndPop(document.qForm.StartDate,document.qForm.EndDate);return false;" HIDEFOCUS><img src="${ctx}/pic/share/selectTime.gif" name="popcal" width="19" height="18" border="0" align="absmiddle"></a></td>
        <td><a href="#"><img src="/pic/assetManage/butCx.jpg" onclick="document.qForm.submit();"/></a></td>
      </tr>
    </table>
  </div>
  <div class="blank10"></div>
  <div class="khfwtit1"><span class="font14">历史份额信息</span></div>

  <table border="1" bordercolor="#cccccc" width="98%" align="center" class="lh24 mt10">
    <tr class="rrtab_tt bold">
      <td><p align="center">理财账号</p></td>
      <td><p align="center">帐户姓名 </p></td>
      <td><p align="center">计划代码</p></td>
      <td><p align="center">持有份额</p></td>
      <td align="center">代销机购名称</td>
       <td align="center">分红方式</td>
      <td align="center">更新日期</td>
      <!-- <td align="center">昨日资金余额</td>
      <td align="center">昨日总资产</td>  -->
     </tr>
     <%
     		if (fundHistoryList != null && fundHistoryList.size()>0 )
     		{
     			for ( int i = 0 ; i < fundHistoryList.size() ; i ++ )
     			{
     				FundHistory fundHistory = (FundHistory)fundHistoryList.get(i);
     				%>
     					 <tr>
					      <td class="pl5">
					      	<%
					      			if (fundHistory != null && fundHistory.getTaaccountId() != null)
					      			{
					      				%><%=fundHistory.getTaaccountId() %><%
					      			}
					      			else
					      			{
					      					%>&nbsp;<%
					      			}
					      	 %>
					      </td>
					      <td align="center">
					      		<%
					      				if (fundHistory != null && fundHistory.getAccountabbr()!= null)
						      			{
						      				%><%=fundHistory.getAccountabbr() %><%
						      			}
						      			else
						      			{
						      				%>&nbsp;<%
						      			}
					      		 %>
					      </td>
					      <td align="center">
					      		<%
					      				if (fundHistory != null && fundHistory.getFundCode()!= null)
						      			{
						      				%><%=fundHistory.getFundCode() %><%
						      			}
						      			else
						      			{
						      				%>&nbsp;<%
						      			}
					      		
					      		 %>
						</td>
					      <td align="center">
								<%	
										if (fundHistory != null && fundHistory.getAvailableVol() != null)
										{
												%><%= dmf.format(fundHistory.getAvailableVol()) %><%
										}
										else
										{
												%>&nbsp;<%
										}
								 %>	
						  </td>
					     
					      <td align="center">
					      		<%	
										if (fundHistory != null && fundHistory.getDistributorName() != null)
										{
												
												%><%= fundHistory.getDistributorName()%><%
										}
										else
										{
												%>&nbsp;<%
										}
								 %>	
					      </td>
					      <td align="center">
					      		<%	
					      				String fhfs = "红利再投";
										if (fundHistory != null && fundHistory.getDefdividendmethod() != null && !"".equals(fundHistory.getDefdividendmethod() ))
										{
												if ("0".equals(fundHistory.getDefdividendmethod() )){
														fhfs = "红利再投";
												}
												if ("1".equals(fundHistory.getDefdividendmethod() )){
														fhfs = "现金分红";
												}
												if ("2".equals(fundHistory.getDefdividendmethod() )){
														fhfs = "红利再投";
												}
										}
										
								 %>
								 <%=fhfs %>	
					      </td>
					      <td align="center">
					      		<%	
										if (fundHistory != null && fundHistory.getUpLoadDate() != null)
										{
												
												%><%=sdf.format(fundHistory.getUpLoadDate()) %><%
										}
										else
										{
												%>&nbsp;<%
										}
								 %>	
					      </td>
					    </tr>
     				
     				<%
     				
     			}
     		}
     		
      %>
   <tr>
   			<td colspan="6" align="center">
         		<%=PageUtil.pagination("window.qForm",totleCount, currentPage, pagesize)%> 
      </td>
   </tr>
  </table>
  
  <div class="blank10"></div>
 </form>
  <!--中侧sied结束--> 
    <!--右侧sied开始-->
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
    <div class="blank5"></div>
<jsp:include page="${contextPath}/commons/msbottom.jsp" />
<iframe width=174 height=189 name="gToday:normal:agenda.js" id="gToday:normal:agenda.js"
			src="${ctx}/js/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; left:-500px; top:0px;"> 

</body>
</html>