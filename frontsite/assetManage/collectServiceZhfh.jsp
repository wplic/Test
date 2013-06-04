<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@page import="com.cssweb.assetManager.pojo.AssetUser"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@page import="java.util.List"%>
<%@page import="com.cssweb.collect.pojo.Rightsreg"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@page import="com.cssweb.common.util.PageUtil"%>
<%@ include file="/commons/turnPage.jsp"%>
<%
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
		List list =(List) request.getAttribute("list");
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
<link href="/css/style.css" rel="stylesheet" type="text/css" />

</head>
<body>
<jsp:include page="/commons/mstop.jsp" />
  <form action="${contextPath }/rightsregAction.do?method=getRightsregList&menu=zhfhxx" name="rightsregForm" method="post">
<div class="main">
  <div class="dqwz">当前位置：<a href="${contextPath }/default.html"> 首页 </a>-<a href="${contextPath }/assetManage/index.jsp">资产管理</a> - 客户服务 - 交易记录及资金明细</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft">
	 <jsp:include page="${contextPath}/assetManage/collectService_lmenu.jsp" />
  </div>
  <!--左侧sied结束-->
   
  <!--中侧sied开始-->
  <div class="w706 fright">
  <div class="comtit1"><h4>分红明细</h4></div>


  <div class="blank10"></div>
  <div class="khfwcx">
    <a href="#"></a>
    <table width="90%" align="center" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="60">起始日期：</td>
        <td width="120"> <input name="StartDate"   class="input108" style="width:90px" onfocus="this.blur()" value="<%= startDate %>" size="10" readonly><a href="javascript:void(0)" onclick="gfPop.fStartPop(document.rightsregForm.StartDate,document.rightsregForm.EndDate);return false;" HIDEFOCUS><img src="${ctx}/pic/share/selectTime.gif" name="popcal" width="19" height="18" border="0" align="absmiddle"></a></td>
        <td width="60">终止日期：</td>
        <td width="120"><input name="EndDate" class="input108" style="width:90px" onfocus="this.blur()" value="<%=endDate %>" size="10" readonly><a href="javascript:void(0)" onClick="gfPop.fEndPop(document.rightsregForm.StartDate,document.rightsregForm.EndDate);return false;" HIDEFOCUS><img src="${ctx}/pic/share/selectTime.gif" name="popcal" width="19" height="18" border="0" align="absmiddle"></a></td>
        <td><a href="#"><img src="/pic/assetManage/butCx.jpg" onclick="document.rightsregForm.submit();"/></a></td>
      </tr>
    </table>
  </div>
  <div class="blank10"></div>

	<table border="1" bordercolor="#cccccc" width="700" align="center" class="lh24">
      <tr class="rrtab_tt bold">
        <td align="center">计划代码</td>
        <td align="center">计划份额</td>
        <td align="center">机构名称</td>
        <td align="center">分红方式</td>
        <td align="center">分红时间</td>
        <td align="center">转投确认时间</td>
        <td align="center">转投成交价格</td>
        <td align="center">转投份额</td>
        <td align="center">分红比例</td>
        <td align="center">分红金额</td>
      </tr>
      <%
      			if (list != null )
      			{
      					for (int i = 0; i < list.size() ; i ++)
      					{
      							Rightsreg rightsreg = (Rightsreg)list.get(i);
      							String navStr = "";
      							String cfmDate = "";
      							String volofreinvestStr = "";
      							//System.out.println(rightsreg.getDefdividEndMethod());
      							if (rightsreg.getDefdividEndMethod() != null && !"现金分红".equals(rightsreg.getDefdividEndMethod()))
      							{
      								cfmDate = rightsreg.getTransactioncfmDate() ;
      							    navStr =  (rightsreg.getNav() == null ?"":String.valueOf(rightsreg.getNav()));
      							    volofreinvestStr =rightsreg.getVolofreinvest()== null ?"":String.valueOf(rightsreg.getVolofreinvest());
      							}
      							
      							if (i % 2 ==0 )
      							{
      									%>
      											  <tr>
											        <td align="center"><%= rightsreg.getFundCode() %></td>
											        <td align="center"><%= rightsreg.getTotalfundvol() %></td>
											        <td align="center"><%= rightsreg.getDistributorname() %></td>
											        <td align="center"><%= rightsreg.getDefdividEndMethod() %></td>
											        <td align="center"><%= rightsreg.getRegistrationDate() %></td>
											        <td align="center"><%= cfmDate %></td>
											        <td class="pl5"><%= navStr %></td>
											        <td align="center"><%=volofreinvestStr %></td>
											        <td align="center"><%= rightsreg.getDividendperunit() %></td>
											        <td align="center"><%= rightsreg.getDividendRatio() %></td>
											      </tr>
      									<%
      							}
      							else
      							{
      									%>
      											 <tr class="bg_ec">
											        <td align="center"><%= rightsreg.getFundCode() %></td>
											        <td align="center"><%= rightsreg.getTotalfundvol() %></td>
											         <td align="center"><%= rightsreg.getDistributorname() %></td>
											        <td align="center"><%= rightsreg.getDefdividEndMethod() %></td>
											        <td align="center"><%= rightsreg.getRegistrationDate() %></td>
											        <td align="center"><%= cfmDate %></td>
											        <td class="pl5"><%= navStr %></td>
											        <td align="center"><%=volofreinvestStr %></td>
											        <td align="center"><%= rightsreg.getDividendperunit() %></td>
											        <td align="center"><%= rightsreg.getDividendRatio() %></td>
											      </tr>
      									
      									<%
      							}
      					}
      			}
       %>
      <tr>
      		<td colspan="9" align="right"><%=PageUtil.pagination("window.rightsregForm",totleCount, currentPage, pagesize)%></td>
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