<%@ page contentType="text/html; charset=utf-8" language="java"  %>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.cssweb.F10.gazx.bond.pojo.ConvertibleDebtIssueAndTrade"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.cssweb.F10.gazx.bond.pojo.FinancialDebtIssue"%>
<%@page import="com.cssweb.F10.gazx.bond.pojo.ConvertibleDebtToStockInfo"%>
<%@ include file="init.jsp" %>
<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	DecimalFormat dmf = new DecimalFormat("#.00");
	DecimalFormat dmfs = new DecimalFormat("###,###");
	ConvertibleDebtToStockInfo convertibleDebtToStockInfo = (ConvertibleDebtToStockInfo)request.getAttribute("convertibleDebtToStockInfo");
 %>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
<div class="left_tit2">
	<jsp:include flush="true" page="bondCodeSearch.jsp"></jsp:include>
</div> 
<div class="blank5"></div>
	<div class="f10_tab03 textcenter">
		<span class="red font14 bold ml32"><%=bondShortName %></span>
	    <span class="font14 ml10">
	    	<%
	    			if (bondCode != null && !"".equals(bondCode))
	    			{
	    					%>
	    						(<%=bondCode %>)
	    					<%
	    			}
	    	 %>
	    </span>
</div>
<div class="blank5"></div>
<table border="1" class="lh30 tab_pl5 f10_tab01" bordercolor="#cccccc" width="100%">
		  <tr>
		    <th width="15%">最新转股价格(元)：</th>
		    <td width="30%">
		    			<%
		    					if (convertibleDebtToStockInfo != null)
		    					{
		    							%>
		    									<%=convertibleDebtToStockInfo.getNewestDebtToStockPrice() == null ?"":dmf.format(convertibleDebtToStockInfo.getNewestDebtToStockPrice()) %>
		    							<%
		    					}
		    					else
		    					{
		    							%>&nbsp;<%
		    					}
		    			 %>
		    		
					
			</td>
		    <th width="15%">转股比例(%)：</th>
		    <td width="30%">
		    			<%
		    					if (convertibleDebtToStockInfo != null)
		    					{
		    							%>
		    									<%=convertibleDebtToStockInfo.getDeteToStockRate() == null ?"":dmf.format(convertibleDebtToStockInfo.getDeteToStockRate()) %>
		    							<%
		    					}
		    					else
		    					{
		    							%>&nbsp;<%
		    					}
		    			 %>
		    			
		   </td>
		  </tr>
		  
		  
		  <tr>
		    <th width="15%">期间转股的债券数额(元)：</th>
		    <td width="30%">
		    			<%
		    					if (convertibleDebtToStockInfo != null)
		    					{
		    							%>
		    									<%=convertibleDebtToStockInfo.getDebtToStockSize() == null ?"":dmfs.format(convertibleDebtToStockInfo.getDebtToStockSize()) %>
		    							<%
		    					}
		    					else
		    					{
		    							%>&nbsp;<%
		    					}
		    			 %>
		    		
					
			</td>
		    <th width="15%">期间转股数(股)：</th>
		    <td width="30%">
		    			<%
		    					if (convertibleDebtToStockInfo != null)
		    					{
		    							%>
		    									<%=convertibleDebtToStockInfo.getDebtToStockSize() == null ?"":dmfs.format(convertibleDebtToStockInfo.getDebtToStockSize()) %>
		    							<%
		    					}
		    					else
		    					{
		    							%>&nbsp;<%
		    					}
		    			 %>
		    			
		   </td>
		  </tr>
		  
		  
		  <tr>
		    <th width="15%">累计转股数(股)：</th>
		    <td width="30%">
		    			<%
		    					if (convertibleDebtToStockInfo != null)
		    					{
		    							%>
		    									<%=convertibleDebtToStockInfo.getDebtToStockTotalNumber() == null ?"":dmfs.format(convertibleDebtToStockInfo.getDebtToStockTotalNumber()) %>
		    							<%
		    					}
		    					else
		    					{
		    							%>&nbsp;<%
		    					}
		    			 %>
		    		
					
			</td>
		    <th width="15%">剩余债券数额(元)：</th>
		    <td width="30%">
		    			<%
		    					if (convertibleDebtToStockInfo != null)
		    					{
		    							%>
		    									<%=convertibleDebtToStockInfo.getDebtToStockLeftNumbers() == null ?"":dmfs.format(convertibleDebtToStockInfo.getDebtToStockLeftNumbers()) %>
		    							<%
		    					}
		    					else
		    					{
		    							%>&nbsp;<%
		    					}
		    			 %>
		    			
		   </td>
		  </tr>
		  
		  
		  
		  
		  <tr>
		    <th width="15%">截止日：</th>
		    <td width="30%">
		    			<%
		    					if (convertibleDebtToStockInfo != null)
		    					{
		    							%>
		    									<%=convertibleDebtToStockInfo.getDebtToStockEndDate() == null ?"":sdf.format(convertibleDebtToStockInfo.getDebtToStockEndDate()) %>
		    							<%
		    					}
		    					else
		    					{
		    							%>&nbsp;<%
		    					}
		    			 %>
		    		
					
			</td>
		    <th width="15%">发生日期：</th>
		    <td width="30%">
		    			<%
		    					if (convertibleDebtToStockInfo != null)
		    					{
		    							%>
		    									<%=convertibleDebtToStockInfo.getDebtToStockPublishDate() == null ?"":sdf.format(convertibleDebtToStockInfo.getDebtToStockPublishDate()) %>
		    							<%
		    					}
		    					else
		    					{
		    							%>&nbsp;<%
		    					}
		    			 %>
		    			
		   </td>
		  </tr>
		  
		  
		    <tr>
		    <th width="15%">转股数占公司股本比率(%)：</th>
		    <td colspan="3">
		    			<%
		    					if (convertibleDebtToStockInfo != null)
		    					{
		    							%>
		    									<%=convertibleDebtToStockInfo.getDebtToStockByCompanyRate() == null ?"":dmf.format(convertibleDebtToStockInfo.getDebtToStockByCompanyRate()) %>
		    							<%
		    					}
		    					else
		    					{
		    							%>&nbsp;<%
		    					}
		    			 %>
		    		
					
			</td>
		    
		  </tr>
		  
</table>
<table width="100%" border="0" cellpadding="4" cellspacing="4">
  <tr>
    <td>&nbsp;</td>
   <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
   <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
   <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
   <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
   <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
   <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
   <td>&nbsp;</td>
  </tr>
   <tr>
    <td>&nbsp;</td>
   <td>&nbsp;</td>
  </tr>
   <tr>
    <td>&nbsp;</td>
   <td>&nbsp;</td>
  </tr>
   <tr>
    <td>&nbsp;</td>
   <td>&nbsp;</td>
  </tr>
   <tr>
    <td>&nbsp;</td>
   <td>&nbsp;</td>
  </tr>
   <tr>
    <td>&nbsp;</td>
   <td>&nbsp;</td>
  </tr>
   <tr>
    <td>&nbsp;</td>
   <td>&nbsp;</td>
  </tr>
  </table>		
		  
		  