<%@ page contentType="text/html; charset=utf-8" language="java"  %>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.cssweb.F10.gazx.bond.pojo.ConvertibleDebtIssueAndTrade"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.cssweb.F10.gazx.bond.pojo.FinancialDebtIssue"%>
<%@ include file="init.jsp" %>
<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	DecimalFormat dmf = new DecimalFormat("#.00");
	DecimalFormat dmfs = new DecimalFormat("###,###");
	FinancialDebtIssue financialDebtIssue =	(FinancialDebtIssue)request.getAttribute("financialDebtIssueInfo");
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
		    <th width="15%">债券代码</th>
		    <td width="30%">
		    			<c:choose>
									<c:when test="<%=bondCode.equals("") %>">&nbsp;</c:when>
									<c:otherwise>
										&nbsp;&nbsp;<%=bondCode %>
									</c:otherwise>
						</c:choose>	
					
			</td>
		    <th width="15%">债券交易地点：</th>
		    <td width="30%">
		    			<c:choose>
									<c:when test="${empty financialDebtIssueInfo.financeDebtMakePlace}">&nbsp;</c:when>
									<c:otherwise>
										&nbsp;&nbsp;${financialDebtIssueInfo.financeDebtMakePlace}
									</c:otherwise>
						</c:choose>			
		   </td>
		  </tr>
		  <tr>
		    <th width="15%">债券：</th>
		    <td width="30%">
		    			<c:choose>
									<c:when test="${empty financialDebtIssueInfo.debt}">&nbsp;</c:when>
									<c:otherwise>
										&nbsp;&nbsp;${financialDebtIssueInfo.debt}
									</c:otherwise>
						</c:choose>
					
			</td>
		    <th width="15%">发行主体：</th>
		    <td width="30%">
		    			<c:choose>
							<c:when test="${empty financialDebtIssueInfo.companyName}">&nbsp;</c:when>
							<c:otherwise>
								&nbsp;&nbsp;${financialDebtIssueInfo.companyName}
							</c:otherwise>
						</c:choose>		
		   </td>
		  </tr>
		  <tr>
		    <th width="15%">金融债名称：</th>
		    <td width="30%">
		    			<c:choose>
									<c:when test="${empty financialDebtIssueInfo.financeDebtName}">&nbsp;</c:when>
									<c:otherwise>
										&nbsp;&nbsp;${financialDebtIssueInfo.financeDebtName}
									</c:otherwise>
						</c:choose>
					
			</td>
		    <th width="15%">金融债类型：</th>
		    <td width="30%">
		    			<c:choose>
							<c:when test="${empty financialDebtIssueInfo.financeDebtType}">&nbsp;</c:when>
							<c:otherwise>
								&nbsp;&nbsp;${financialDebtIssueInfo.financeDebtType}
							</c:otherwise>
						</c:choose>		
		   </td>
		  </tr>
		  
		  <tr>
		    <th width="15%">预计发行规模(元)：</th>
		    <td width="30%">
		    			<%
		    					if (financialDebtIssue != null )
		    					{
		    							%>
		    								<%= financialDebtIssue.getFinanceDebtIssueSize() == null ?"":dmfs.format(financialDebtIssue.getFinanceDebtIssueSize()) %>
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
		    <th width="15%">实际发行规模(元)：</th>
		    <td width="30%">
		    			<%
		    					if (financialDebtIssue != null )
		    					{
		    							%>
		    								<%= financialDebtIssue.getFinanceDebtActualIssueModel() == null ?"":dmfs.format(financialDebtIssue.getFinanceDebtActualIssueModel()) %>
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
		    <th width="15%">票面利率(%)：</th>
		    <td width="30%">
		    			<%
		    					if (financialDebtIssue != null )
		    					{
		    							%>
		    								<%= financialDebtIssue.getFinanceDebtCouponRate() == null ?"":dmf.format(financialDebtIssue.getFinanceDebtCouponRate()) %>
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
		    <th width="15%">票面金额(元)：</th>
		    <td width="30%">
		    			<%
		    					if (financialDebtIssue != null )
		    					{
		    							%>
		    								<%= financialDebtIssue.getFinanceDebtCouponNum() == null ?"":dmf.format(financialDebtIssue.getFinanceDebtCouponNum()) %>
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
		    <th width="15%">计息方式：</th>
		    <td width="30%">
		    			<c:choose>
									<c:when test="${empty financialDebtIssueInfo.financeDebtRecordRateModel}">&nbsp;</c:when>
									<c:otherwise>
										&nbsp;&nbsp;${financialDebtIssueInfo.financeDebtRecordRateModel}
									</c:otherwise>
						</c:choose>
		   </td>
		    <th width="15%">年付息次数：</th>
		    <td width="30%">
		    			<c:choose>
									<c:when test="${empty financialDebtIssueInfo.financeDebtPayRateTimes}">&nbsp;</c:when>
									<c:otherwise>
										&nbsp;&nbsp;${financialDebtIssueInfo.financeDebtPayRateTimes}
									</c:otherwise>
						</c:choose>	
		    	
		   </td>
		  </tr>
		  
		  
		  
		 <tr>
		    <th width="15%">兑付期：</th>
		    <td  colspan="3">
		    			<c:choose>
							<c:when test="${empty financialDebtIssueInfo.financeDebtPaymentPeriod}">&nbsp;</c:when>
							<c:otherwise>
								&nbsp;&nbsp;${financialDebtIssueInfo.financeDebtPaymentPeriod}
							</c:otherwise>
						</c:choose>
		   </td>
		  </tr>
		  
		  
		   <tr>
		    <th width="15%">债券期限(年)：</th>
		    <td width="30%">
		    			<c:choose>
							<c:when test="${empty financialDebtIssueInfo.financeDebtMaturity}">&nbsp;</c:when>
							<c:otherwise>
								&nbsp;&nbsp;${financialDebtIssueInfo.financeDebtMaturity}
							</c:otherwise>
						</c:choose>
		   </td>
		    <th width="15%">参考收益率(%)：</th>
		    <td width="30%">
		    			<%
		    					if (financialDebtIssue != null)
		    					{
		    							%>
		    									<%=financialDebtIssue.getFinanceDebtCompareSyRate() == null ? "":dmf.format(financialDebtIssue.getFinanceDebtCompareSyRate()) %>
		    							<%
		    					}
		    					else
		    					{
		    							%>
		    									&nbsp;
		    							<%
		    					}
		    			 %>
		    		
		   </td>
		  </tr>
		  
		  
		  
		 <tr>
		    <th width="15%">发行日：</th>
		    <td width="30%">
		    			<%
		    					if (financialDebtIssue != null)
		    					{
		    							%>
		    									<%= financialDebtIssue.getFinanceDebtIssueDate() == null ?"":sdf.format(financialDebtIssue.getFinanceDebtIssueDate()) %>
		    							<%
		    					}
		    					else
		    					{
		    							%>
		    									&nbsp;
		    							<%
		    					}
		    			 %>
		    		
		   </td>
		    <th width="15%">起息日：</th>
		    <td width="30%">
		    			<%
		    					if (financialDebtIssue != null)
		    					{
		    							%>
		    									<%= financialDebtIssue.getFinanceDebtValueDate() == null?"":sdf.format(financialDebtIssue.getFinanceDebtValueDate()) %>
		    							<%
		    					}
		    			 %>
		    		
		   </td>
		  </tr>
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		   <tr>
		    <th width="15%">债权债务登记日：</th>
		    <td width="30%">
		    			<%
		    					if (financialDebtIssue != null)
		    					{
		    							%>
		    									<%= financialDebtIssue.getFinanceDebtRegistrationDate() == null ?"":sdf.format(financialDebtIssue.getFinanceDebtRegistrationDate()) %>
		    							<%
		    					}
		    					else
		    					{
		    							%>
		    									&nbsp;
		    							<%
		    					}
		    			 %>
		    		
		   </td>
		    <th width="15%">缴款日：</th>
		    <td width="30%">
		    			<%
		    					if (financialDebtIssue != null)
		    					{
		    							%>
		    									<%= financialDebtIssue.getFinanceDebtDueDate() == null?"":sdf.format(financialDebtIssue.getFinanceDebtDueDate()) %>
		    							<%
		    					}
		    			 %>
		    		
		   </td>
		  </tr>
		  
		  
		   <tr>
		    <th width="15%">到期日：</th>
		    <td width="30%">
		    			<%
		    					if (financialDebtIssue != null)
		    					{
		    							%>
		    									<%= financialDebtIssue.getFinanceDebtMaturityDate() == null ?"":sdf.format(financialDebtIssue.getFinanceDebtMaturityDate()) %>
		    							<%
		    					}
		    					else
		    					{
		    							%>
		    									&nbsp;
		    							<%
		    					}
		    			 %>
		    		
		   </td>
		    <th width="15%">缴款日：</th>
		    <td width="30%">
		    			<%
		    					if (financialDebtIssue != null)
		    					{
		    							%>
		    									<%= financialDebtIssue.getFinanceDebtTradeDate() == null?"":sdf.format(financialDebtIssue.getFinanceDebtTradeDate()) %>
		    							<%
		    					}
		    			 %>
		    		
		   </td>
		  </tr>
		  
		  
		  
		  
		  
		  
		  
		  
		  <tr>
		    <th width="15%">退市日：</th>
		    <td width="30%">
		    			<%
		    					if (financialDebtIssue != null)
		    					{
		    							%>
		    									<%= financialDebtIssue.getFinanceDebtLeftDate() == null ?"":sdf.format(financialDebtIssue.getFinanceDebtLeftDate()) %>
		    							<%
		    					}
		    					else
		    					{
		    							%>
		    									&nbsp;
		    							<%
		    					}
		    			 %>
		    		
		   </td>
		    <th width="15%">发行价格(元)：</th>
		    <td width="30%">
		    			<%
		    					if (financialDebtIssue != null)
		    					{
		    							%>
		    									<%= financialDebtIssue.getFinanceDebtIssuePrice() == null?"":dmf.format(financialDebtIssue.getFinanceDebtIssuePrice()) %>
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