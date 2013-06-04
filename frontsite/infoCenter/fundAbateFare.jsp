
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="com.cssweb.gazxfund.pojo.NewFundInfo"%>
<%@page import="com.cssweb.gazxfund.pojo.FundCutInfo"%>
<%@page import="com.cssweb.gazxfund.pojo.FundSplitInfo"%>
<%@page import="com.cssweb.gazxfund.pojo.FundStopDeal"%>
<%@page import="com.cssweb.gazxfund.pojo.FundInfo"%>
<%@page import="com.cssweb.gazxfund.pojo.FundAbateFare"%>
<%@page import="java.text.DecimalFormat"%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%request.setCharacterEncoding("UTF-8");%>
<%@ page contentType="text/html; charset=UTF-8" language="java"  %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@page import="java.text.SimpleDateFormat"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@page import="com.cssweb.common.util.PageUtil"%>
<%@ include file="/commons/turnPage.jsp"%>
<link href="${contextPath}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${contextPath}/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
<%
		DecimalFormat dmf = new DecimalFormat("#0.00");
		Integer curPage = (Integer)request.getAttribute("curPage");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		List list =	(List)request.getAttribute("list");
%>
<script type="text/javascript">
		function mySwitchNews(ids)
			{
				if (ids == 'tagtabs11')
				{
						document.getElementById('tagtabs12').className = 'active red bold';
						
						//document.getElementById('fundSort').src= '${contextPath}/fundValueAction.do?method=getOpenFundValueList&nav=zxzx&nav1=jj';
				}
				
			}
</script> 
<form action="${contextPath }/fundAbateFareAction.do?method=getFundAbateFareList" id="fundValueForm" name="fundValueForm" method="post">
    <div class="blank5"></div>
    <ul class="gsyw_box2">
            <li class=" white bold" id="tagtabs12" onmouseover="mySwitchNews('tagtabs12')">封闭式基金</li>
    </ul>
 <div class="blank5"></div>
 <div class="blank5"></div>
    <div class="query_bg1">
	<table width="450" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td width="66" align="center"><strong>选择日期：<input type="hidden" id="flagJjlx" name="flagJjlx" value="${flagJjlx }"/>	</strong></td>
          <td width="85" align="left"><input type="text" id="startDate" name="startDate" readonly="readonly" size="10" value="${startDate }" />
		            	<input type="hidden" id="EndDate" name="EndDate" value=""/></td>
          <td width="28"><a href="javascript:void(0)" onclick="gfPop.fStartPop(document.fundValueForm.startDate,document.fundValueForm.EndDate);return false;" HIDEFOCUS><img src="${ctx}/pic/share/selectTime.gif" name="popcal" width="19" height="18" border="0" align="absmiddle"></a></td>
          <td width="220"  align="left"><input type="submit" name="button2" id="button2" value="查询" class="but_01" /></td>
        </tr>
      </table>
      <div style="height:12px; overflow:hidden"></div> 
    </div>
    <div class="blank5"></div>
   <table border="1" class="lh24 center" bordercolor="#cccccc" width="100%" id="tabs11">
      <tr>
        <td class="tab_th1 bold">序号 </td>
        <td class="tab_th1 bold">基金代码 </td>
        <td class="tab_th1 bold">基金简称 </td>
        <td class="tab_th1 bold">基金净值 </td>
        <td class="tab_th1 bold" >累计净值</td>
        <td class="tab_th1 bold" >基金折价率</td>
       <td class="tab_th1 bold" >发生日期</td>
       
      </tr>
      <%
      			int tmp = 1;
	      		if (curPage > 1)
	      		{
	      		 tmp = curPage * 20;
	      		}
      			if (list != null && list.size() > 0)
      			{
      					for (int i = 0 ; i < list.size() ; i ++)
      					{
      							//FundStopDeal fundStopDeal = (FundStopDeal)list.get(i);
      							FundAbateFare fundAbateFare = (FundAbateFare)list.get(i);
      							
      							//FundInfo fundInfo= (FundInfo)list.get(i);
      							if ( (i % 2) != 0)
      							{
	      							%>
	      								<tr>
									        <td><%= tmp %></td>
									        <td><%= fundAbateFare.getJjdm() %></td>
									        <td><%= fundAbateFare.getJjjc() %></td>
									        <td><%=fundAbateFare.getDwjz() ==null?"": fundAbateFare.getDwjz() %> </td>
									        <td><%=fundAbateFare.getLjjz()==null?"":fundAbateFare.getLjjz()  %> </td>
									        <td><%= fundAbateFare.getFare()==null?"":dmf.format(fundAbateFare.getFare()) %></td>
									       <td><%= fundAbateFare.getFsrq()==null?"":sdf.format(fundAbateFare.getFsrq()) %></td>
									    </tr>	
	      							<%
      							}
      							else
      							{
      								%>
      									<tr class="bg_ec">
									         <td><%= tmp %></td>
									        <td><%= fundAbateFare.getJjdm() %></td>
									        <td><%= fundAbateFare.getJjjc() %></td>
									        <td><%=fundAbateFare.getDwjz() ==null?"": fundAbateFare.getDwjz() %> </td>
									        <td><%=fundAbateFare.getLjjz()==null?"":fundAbateFare.getLjjz()  %> </td>
									        <td><%= fundAbateFare.getFare()==null?"":dmf.format(fundAbateFare.getFare())  %></td>
									        <td><%= fundAbateFare.getFsrq()==null?"":sdf.format(fundAbateFare.getFsrq()) %></td>
									    </tr>	
      								<%
      							}
      							tmp++;
      					}
      					
      			}
      			
      %>
      
    </table>
    <div class="blank5"></div>
	<table width="95%" border="0" cellspacing="0" cellpadding="0" align="center">
      <tr>
        <td  align="right"><%=PageUtil.pagination("window.fundValueForm",totleCount, currentPage, pagesize)%></td>
      </tr>
    </table>
</form>

<table width="100%" border="0" cellpadding="5" cellspacing="5">
  <%
	  if (list != null && list.size() > 0)
	  {
	  		if (list.size() < 8)
	  		{
	  				for (int i = 0 ; i < 8; i++)
      				{
      									%>
      									<tr>
									        <td>&nbsp;</td>
									        <td>&nbsp;</td>
									        <td>&nbsp;</td>
									        <td>&nbsp;</td>
									        <td>&nbsp;</td>
									    </tr>	
      									
      									<%
      							}
	  		}
	  }else
      			{
      					for (int i = 0 ; i <8; i++)
      							{
      									%>
      									<tr>
									        <td>&nbsp;</td>
									        <td>&nbsp;</td>
									        <td>&nbsp;</td>
									        <td>&nbsp;</td>
									        <td>&nbsp;</td>
									    </tr>	
      									
      									<%
      							}
      			}

 %>
</table>
    
    <iframe width=174 height=189 name="gToday:normal:agenda.js" id="gToday:normal:agenda.js"
			src="${contextPath}/js/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; left:-500px; top:0px;"/> 
    