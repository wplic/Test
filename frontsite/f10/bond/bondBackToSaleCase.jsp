<%@ page contentType="text/html; charset=utf-8" language="java"   %>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.cssweb.F10.gazx.bond.pojo.ConvertibleDebtIssueAndTrade"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.cssweb.F10.gazx.bond.pojo.FinancialDebtIssue"%>
<%@page import="com.cssweb.F10.gazx.bond.pojo.ConvertibleDebtToStockInfo"%>
<%@page import="com.cssweb.F10.gazx.bond.pojo.ConveriteDebtOwnerInfo"%>
<%@page import="com.cssweb.F10.gazx.bond.pojo.ConvertibleDebtToStockPriceChange"%>
<%@page import="com.cssweb.F10.gazx.bond.pojo.DebtActualPayRateInfo"%>
<%@page import="com.cssweb.F10.gazx.bond.pojo.BondBackToSaleCase"%>
<%@ include file="init.jsp" %>
<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	DecimalFormat dmf = new DecimalFormat("#.00");
	DecimalFormat dmfs = new DecimalFormat("###,###");
	BondBackToSaleCase bondBackToSaleInfo = (BondBackToSaleCase)request.getAttribute("bondBackToSaleInfo");
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
		    <th width="15%">发生日期：</th>
		    <td width="30%">
		    			<%
		    					if (bondBackToSaleInfo != null)
		    					{
		    							%>
		    									<%= bondBackToSaleInfo.getDebtBackToSalePublishDate() == null?"":sdf.format(bondBackToSaleInfo.getDebtBackToSalePublishDate()) %>
		    							<%
		    					}
		    					else
		    					{
		    						  	%>
		    						  			&nbsp;&nbsp;
		    						  	<%
		    					}
		    			 %>
		    		
		   </td>
		  </tr>
		  
		  
		   <tr>
		    <th width="15%">资金到账日：</th>
		    <td width="30%">
		    		<%
		    					if (bondBackToSaleInfo != null)
		    					{
		    							%>
		    									<%= bondBackToSaleInfo.getDebtBackToSaleArriveDate() == null?"":sdf.format(bondBackToSaleInfo.getDebtBackToSaleArriveDate()) %>
		    							<%
		    					}
		    					else
		    					{
		    						  	%>
		    						  			&nbsp;&nbsp;
		    						  	<%
		    					}
		    		%>	
		   </td>
		    <th width="15%">回售代码：</th>
		    <td width="30%">
		    			<c:choose>
									<c:when test="${empty bondBackToSaleInfo.debtBackToSaleCode}">&nbsp;</c:when>
									<c:otherwise>
										&nbsp;&nbsp;${bondBackToSaleInfo.debtBackToSaleCode}
									</c:otherwise>
						</c:choose>	
		    		
		   </td>
		  </tr>
		  
		  
		  <tr>
		    <th width="15%">回售简称：</th>
		    <td width="30%">
		    		<c:choose>
						<c:when test="${empty bondBackToSaleInfo.debtBackToSaleShortName}">&nbsp;</c:when>
						<c:otherwise>
							&nbsp;&nbsp;${bondBackToSaleInfo.debtBackToSaleShortName}
						</c:otherwise>
					</c:choose>
		   </td>
		    <th width="15%">回售价格：</th>
		    <td width="30%">
		    			<%
		    					if (bondBackToSaleInfo != null)
		    					{
		    							%>
		    									<%=bondBackToSaleInfo.getDebtBackToSalePrice() == null ?"": dmf.format(bondBackToSaleInfo.getDebtBackToSalePrice()) %>
		    							<%
		    					}
		    			 %>
		    			
		   </td>
		  </tr>
		  
		  
		  
		  <tr>
		    <th width="15%">回售起始日：</th>
		    <td width="30%">
		    		<%
		    				if (bondBackToSaleInfo != null)
		    				{
		    						%>
		    								<%= bondBackToSaleInfo.getDebtBackToSaleStartDate() == null ?"":sdf.format(bondBackToSaleInfo.getDebtBackToSaleStartDate())%>
		    						<%
		    				}
		    				else
		    				{
		    						%>&nbsp;<%
		    				}
		    		 %>
		    		
		   </td>
		    <th width="15%">回售截止日：</th>
		    <td width="30%">
		    			<%
		    					if (bondBackToSaleInfo != null)
		    					{
		    							%>
		    									<%=bondBackToSaleInfo.getDebtBackToSaleEndDate() == null ?"": sdf.format(bondBackToSaleInfo.getDebtBackToSaleEndDate()) %>
		    							<%
		    					}
		    			 %>
		    			
		   </td>
		  </tr>
		  
		  
		  <tr>
		    <th width="15%">回售条件：</th>
		    <td width="30%">
		    		<c:choose>
						<c:when test="${empty bondBackToSaleInfo.debtBackToSaleCondition}">&nbsp;</c:when>
						<c:otherwise>
							&nbsp;&nbsp;${bondBackToSaleInfo.debtBackToSaleCondition}
						</c:otherwise>
					</c:choose>		
		   </td>
		    <th width="15%">备注：</th>
		    <td width="30%">
		    			<c:choose>
							<c:when test="${empty bondBackToSaleInfo.debtBackToSaleDesc}">&nbsp;</c:when>
							<c:otherwise>
								&nbsp;&nbsp;${bondBackToSaleInfo.debtBackToSaleDesc}
							</c:otherwise>
						</c:choose>
		   </td>
		  </tr>
</table> 