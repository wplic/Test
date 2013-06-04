<%@ page contentType="text/html; charset=utf-8" language="java"  %>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.cssweb.F10.gazx.bond.pojo.ConvertibleDebtIssueAndTrade"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.cssweb.F10.gazx.bond.pojo.FinancialDebtIssue"%>
<%@page import="com.cssweb.F10.gazx.bond.pojo.ConvertibleDebtToStockInfo"%>
<%@page import="com.cssweb.F10.gazx.bond.pojo.ConveriteDebtOwnerInfo"%>
<%@page import="com.cssweb.F10.gazx.bond.pojo.ConvertibleDebtToStockPriceChange"%>
<%@ include file="init.jsp" %>
<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	DecimalFormat dmf = new DecimalFormat("#.00");
	DecimalFormat dmfs = new DecimalFormat("###,###");
	ConvertibleDebtToStockPriceChange convertibleDebtToStockPriceChangeInfo = (ConvertibleDebtToStockPriceChange)request.getAttribute("convertibleDebtToStockPriceChangeInfo");
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
		    <th width="15%">债券代码：</th>
		    <td width="30%">
		    			<c:choose>
									<c:when test="<%=bondCode.equals("") %>">&nbsp;</c:when>
									<c:otherwise>
										&nbsp;&nbsp;<%=bondCode %>
									</c:otherwise>
						</c:choose>		
		   </td>
		    <th width="15%">转股价格(元)：</th>
		    <td width="30%">
		    			<%
		    					if (convertibleDebtToStockPriceChangeInfo != null)
		    					{
		    							%>
		    									<%=convertibleDebtToStockPriceChangeInfo.getCoveriteDebtPrice() == null ?"":dmf.format(convertibleDebtToStockPriceChangeInfo.getCoveriteDebtPrice()) %>
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
		    <th width="15%">调整实施日：</th>
		    <td width="30%">
		    			<%
		    					if (convertibleDebtToStockPriceChangeInfo != null)
		    					{
		    							%>
		    									<%=convertibleDebtToStockPriceChangeInfo.getCoveriteChangeMakeDate() == null ?"":sdf.format(convertibleDebtToStockPriceChangeInfo.getCoveriteChangeMakeDate()) %>
		    							<%
		    					}
		    					else
		    					{
		    							%>&nbsp;<%
		    					}
		    			 %>	
		   </td>
		    <th width="15%">调整原因：</th>
		    <td width="30%">
		    			<c:choose>
									<c:when test="${empty convertibleDebtToStockPriceChangeInfo.coveriteChangeReasons}">&nbsp;</c:when>
									<c:otherwise>
										&nbsp;&nbsp;${convertibleDebtToStockPriceChangeInfo.coveriteChangeReasons}
									</c:otherwise>
						</c:choose>
		   </td>
		  </tr>
</table>		  