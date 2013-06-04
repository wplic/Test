<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.cssweb.F10.gazx.bond.pojo.ConvertibleDebtIssueAndTrade"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.cssweb.F10.gazx.bond.pojo.FinancialDebtIssue"%>
<%@page import="com.cssweb.F10.gazx.bond.pojo.ConvertibleDebtToStockInfo"%>
<%@page import="com.cssweb.F10.gazx.bond.pojo.ConveriteDebtOwnerInfo"%>
<%@page import="com.cssweb.F10.gazx.bond.pojo.ConvertibleDebtToStockPriceChange"%>
<%@page import="com.cssweb.F10.gazx.bond.pojo.DebtActualPayRateInfo"%>
<%@page import="com.cssweb.F10.gazx.bond.pojo.BondRedemptionCase"%>
<%@ include file="init.jsp" %>
<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	DecimalFormat dmf = new DecimalFormat("#.00");
	DecimalFormat dmfs = new DecimalFormat("###,###");
	BondRedemptionCase bondRedemptionCase = (BondRedemptionCase)request.getAttribute("bondRedemptionCaseInfo");
	
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
		    					if (bondRedemptionCase != null)
		    					{
		    							%>
		    									<%= bondRedemptionCase.getPublishDate() == null?"":sdf.format(bondRedemptionCase.getPublishDate()) %>
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
		    <th width="15%">可转债代码：</th>
		    <td width="30%">
		    		<c:choose>
						<c:when test="${empty bondRedemptionCaseInfo.coveriteDebtCode}">&nbsp;</c:when>
						<c:otherwise>
							&nbsp;&nbsp;${bondRedemptionCaseInfo.coveriteDebtCode}
						</c:otherwise>
					</c:choose>
		   </td>
		    <th width="15%">赎回数量：</th>
		    <td width="30%">
		    <% 
		    			if (bondRedemptionCase != null)
		    			{
		    					%>
		    							<%= bondRedemptionCase.getArriveNum()==null ?"":dmfs.format(bondRedemptionCase.getArriveNum()) %>
		    					<%
		    			}
		    %>			
		    	
		   </td>
		  </tr>
		  
		  
		  <tr>
		    <th width="15%">赎回价格(税前)(元)：</th>
		    <td width="30%">
		    		<%
		    				if (bondRedemptionCase != null)
		    				{
		    						%>
		    							<%= bondRedemptionCase.getRedemptionBeforePrice() == null ?"" : dmf.format(bondRedemptionCase.getRedemptionBeforePrice()) %>
		    						<%
		    				}
		    		 %>
		    	
		   </td>
		    <th width="15%">赎回价格(税后)(元)：</th>
		    <td width="30%">
		    			<%
		    					if (bondRedemptionCase != null)
		    					{
		    							%>
		    									<%=bondRedemptionCase.getRedemptionBackPrice() == null ?"": dmf.format(bondRedemptionCase.getRedemptionBackPrice()) %>
		    							<%
		    					}
		    			 %>
		    		
		   </td>
		  </tr>
		  
		  
		  
		  <tr>
		    <th width="15%">回赎回日：</th>
		    <td width="30%">
		    		<%
		    				if (bondRedemptionCase != null)
		    				{
		    						%>
		    								<%= bondRedemptionCase.getRedemptionDate() == null ?"":sdf.format(bondRedemptionCase.getRedemptionDate())%>
		    						<%
		    				}
		    				else
		    				{
		    						%>&nbsp;<%
		    				}
		    		 %>
		    		
		   </td>
		    <th width="15%">付款日：</th>
		    <td width="30%">
		    			<%
		    					if (bondRedemptionCase != null)
		    					{
		    							%>
		    									<%=bondRedemptionCase.getPayForDate() == null ?"": sdf.format(bondRedemptionCase.getPayForDate()) %>
		    							<%
		    					}
		    			 %>
		    			
		   </td>
		  </tr>
		  
		  
		  <tr>
		    <th width="15%">资金到帐日：</th>
		    <td width="30%">
		    			<%
		    					if (bondRedemptionCase != null)
		    					{
		    							%>
		    									<%=bondRedemptionCase.getArriveDate() == null ?"": sdf.format(bondRedemptionCase.getArriveDate()) %>
		    							<%
		    					}
		    			 %>
		    	
		   </td>
		    <th width="15%">备注：</th>
		    <td width="30%">
		    			<%
		    					if (bondRedemptionCase != null)
		    					{
		    							%>
		    									<%=bondRedemptionCase.getDescrition() == null ?"": bondRedemptionCase.getDescrition() %>
		    							<%
		    					}
		    			 %>
		    		
		   </td>
		  </tr>
		  
		  <tr>
		    <th width="15%">赎回条件：</th>
		    <td colspan="3">
		    			<%
		    					if (bondRedemptionCase != null)
		    					{
		    							%>
		    									<%=bondRedemptionCase.getRedemptionCondition() == null ?"": sdf.format(bondRedemptionCase.getRedemptionCondition()) %>
		    							<%
		    					}
		    			 %>
		    	
		   </td>
		   
		  </tr>
</table> 