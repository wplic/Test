<%@ page contentType="text/html; charset=utf-8" language="java"  %>
<%@page import="com.cssweb.F10.gazx.bond.pojo.EnterpriseDebtIssueAndTrade"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@ include file="init.jsp" %>

<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
<%
		EnterpriseDebtIssueAndTrade 	enterpriseDebtIssueAndTrade = (EnterpriseDebtIssueAndTrade)request.getAttribute("enterpriseDebtIssueAndTrade");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		DecimalFormat dmf = new DecimalFormat("###,###");
		DecimalFormat dmfs = new DecimalFormat("#.00");
 %>
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
		    			<%
				    			if (bondCode != null && !"".equals(bondCode))
				    			{
				    					%>
				    						&nbsp;&nbsp;<%=bondCode %>
				    					<%
				    			}
				    	 %>
					
			</td>
		    <th width="15%">企业债名称：</th>
		    <td width="30%">
		    			<%
		    					if (enterpriseDebtIssueAndTrade != null )
		    					{
		    							%>
		    									&nbsp;&nbsp;<%=enterpriseDebtIssueAndTrade.getEnterpriseDebtName() == null ? "":enterpriseDebtIssueAndTrade.getEnterpriseDebtName() %>
		    							<%
		    					}
		    			 %>
					
			</td>
		  </tr>
		  <tr>
		    <th>发行期_开始日期：</th>
		    <td>
		    	<%
    					if (enterpriseDebtIssueAndTrade != null )
    					{
    							%>
    									&nbsp;&nbsp;<%=enterpriseDebtIssueAndTrade.getEnterpriseDelistDate() == null ? "":sdf.format(enterpriseDebtIssueAndTrade.getEnterpriseDelistDate()) %>
    							<%
    					}
    			 %>
		    	
			</td>
		    <th>发行期_结束日期：</th>
		    <td>
		    	<%
    					if (enterpriseDebtIssueAndTrade != null )
    					{
    							%>
    									&nbsp;&nbsp;<%=enterpriseDebtIssueAndTrade.getEnterpriseDebtListedDate()== null ? "":sdf.format(enterpriseDebtIssueAndTrade.getEnterpriseDebtListedDate()) %>
    							<%
    					}
    			 %>
				
			</td>
		  </tr>
		  <tr>
		    <th>预计发行规模(元)：</th>
		    <td>
		    	<%
    					if (enterpriseDebtIssueAndTrade != null )
    					{
    							%>
    									&nbsp;&nbsp;<%=enterpriseDebtIssueAndTrade.getEnterprisDebtIissueScale()== null ? "":dmf.format(enterpriseDebtIssueAndTrade.getEnterprisDebtIissueScale()) %>
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
		    <th>实际发行规模(元)：</th>
		    <td>
		    		<%
    					if (enterpriseDebtIssueAndTrade != null )
    					{
    							%>
    									&nbsp;&nbsp;<%=enterpriseDebtIssueAndTrade.getEnterprisDebtActualIissueScale()== null ? "":dmf.format(enterpriseDebtIssueAndTrade.getEnterprisDebtActualIissueScale()) %>
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
		    <th>债券期限：</th>
		    <td>
		    	<%
    					if (enterpriseDebtIssueAndTrade != null )
    					{
    							%>
    									&nbsp;&nbsp;<%=enterpriseDebtIssueAndTrade.getEnterpriseDebtPeriod()== null ? "":enterpriseDebtIssueAndTrade.getEnterpriseDebtPeriod() %>
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
		    <th>票面金额(元)：</th>
		    <td>
		    		<%
    					if (enterpriseDebtIssueAndTrade != null )
    					{
    							%>
    									&nbsp;&nbsp;<%=enterpriseDebtIssueAndTrade.getEnterpriseDebtCouponNum()== null ? "": dmfs.format(enterpriseDebtIssueAndTrade.getEnterpriseDebtCouponNum()) %>
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
		    <th>计息方式：</th>
		    <td>
		    	<%
    					if (enterpriseDebtIssueAndTrade != null )
    					{
    							%>
    									&nbsp;&nbsp;<%=enterpriseDebtIssueAndTrade.getEnterpriseDebtCalModel()== null ? "": enterpriseDebtIssueAndTrade.getEnterpriseDebtCalModel() %>
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
		    <th>债券利率(%)：</th>
		    <td>
		    		<%
    					if (enterpriseDebtIssueAndTrade != null )
    					{
    							%>
    									&nbsp;&nbsp;<%=enterpriseDebtIssueAndTrade.getEnterpriseDebtRate()== null ? "":dmfs.format(enterpriseDebtIssueAndTrade.getEnterpriseDebtRate())  %>
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
		    <th>债券到期日：</th>
		    <td>
		    	<%
    					if (enterpriseDebtIssueAndTrade != null )
    					{
    							%>
    									&nbsp;&nbsp;<%=enterpriseDebtIssueAndTrade.getEnterpriseDebtEndDate()== null ? "":sdf.format(enterpriseDebtIssueAndTrade.getEnterpriseDebtEndDate())  %>
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
		    <th>付息日：</th>
		    <td>
		    		<%
    					if (enterpriseDebtIssueAndTrade != null )
    					{
    							%>
    									&nbsp;&nbsp;<%=enterpriseDebtIssueAndTrade.getEnterpriseDebtIntPaymentDate()== null ? "":enterpriseDebtIssueAndTrade.getEnterpriseDebtIntPaymentDate()  %>
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
		    <th>发行对象：</th>
		    <td colspan="3" >
				<c:choose>
					<c:when test="${!empty enterpriseDebtIssueAndTrade.enterpriseDebtIssueObj}">${enterpriseDebtIssueAndTrade.enterpriseDebtIssueObj}</c:when>
					<c:otherwise>
						&nbsp;&nbsp;
					</c:otherwise>
				</c:choose>	
			</td>
		   
		  </tr>
		  
		  
		  <tr>
		    <th>兑付方式：</th>
		    <td>
				<c:choose>
					<c:when test="${!empty enterpriseDebtIssueAndTrade.enterpriseDebtChangeModel}">${enterpriseDebtIssueAndTrade.enterpriseDebtChangeModel}</c:when>
					<c:otherwise>
						&nbsp;&nbsp;
					</c:otherwise>
				</c:choose>
			</td>
		    <th>发行方式：</th>
		    <td>
		    		<c:choose>
						<c:when test="${!empty enterpriseDebtIssueAndTrade.enterpriseDebtIssueMode}">${enterpriseDebtIssueAndTrade.enterpriseDebtIssueMode}</c:when>
						<c:otherwise>
							&nbsp;&nbsp;
						</c:otherwise>
					</c:choose>	
		    </td>
		  </tr>
		  
		  
		  <tr>
		    <th>进展说明：</th>
		    <td>
				<c:choose>
					<c:when test="${!empty enterpriseDebtIssueAndTrade.enterpriseDebtProcessDes}">${enterpriseDebtIssueAndTrade.enterpriseDebtProcessDes}</c:when>
					<c:otherwise>
						&nbsp;&nbsp;
					</c:otherwise>
				</c:choose>
			</td>
		    <th>发行价格(元)：</th>
		    <td>
		    		<%
    					if (enterpriseDebtIssueAndTrade != null )
    					{
    							%>
    									&nbsp;&nbsp;<%=enterpriseDebtIssueAndTrade.getEnterpriseDebtIssurePrice()== null ? "": dmfs.format(enterpriseDebtIssueAndTrade.getEnterpriseDebtIssurePrice())  %>
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
		    <th>上市开始日：</th>
		    <td>
				<c:choose>
					<c:when test="${!empty enterpriseDebtIssueAndTrade.enterpriseDebtBeginDate}"><fmt:formatDate pattern="yyyy-MM-dd" value="${enterpriseDebtIssueAndTrade.enterpriseDebtBeginDate}"/></c:when>
					<c:otherwise>
						&nbsp;&nbsp;
					</c:otherwise>
				</c:choose>
			</td>
		    <th>上市截止日：</th>
		    <td>
		    		<c:choose>
						<c:when test="${!empty enterpriseDebtIssueAndTrade.enterpriseDebtTradeEndDate}"><fmt:formatDate pattern="yyyy-MM-dd" value="${enterpriseDebtIssueAndTrade.enterpriseDebtTradeEndDate}"/></c:when>
						<c:otherwise>
							&nbsp;&nbsp;
						</c:otherwise>
					</c:choose>	
		    </td>
		  </tr>
		  
		   <tr>
		    <th>承销方式：</th>
		    <td>
				<c:choose>
					<c:when test="${!empty enterpriseDebtIssueAndTrade.enterpriseDebtUnderwritingMode}">${enterpriseDebtIssueAndTrade.enterpriseDebtUnderwritingMode}</c:when>
					<c:otherwise>
						&nbsp;&nbsp;
					</c:otherwise>
				</c:choose>
			</td>
		    <th>上市地点：</th>
		    <td>
		    		<c:choose>
		    			
						<c:when test="${!empty enterpriseDebtIssueAndTrade.enterpriseDebtTradePlace}">${enterpriseDebtIssueAndTrade.enterpriseDebtTradePlace} </c:when>
						<c:otherwise>
							&nbsp;&nbsp;
						</c:otherwise>
					</c:choose>	
		    </td>
		  </tr>
		  
		  
		  <tr>
		    <th>起息日期：</th>
		    <td>
				<c:choose>
					<c:when test="${empty enterpriseDebtIssueAndTrade.enterpriseDebtValueDate}">&nbsp;</c:when>
					<c:otherwise>
						&nbsp;&nbsp;<fmt:formatDate pattern="yyyy-MM-dd" value="${enterpriseDebtIssueAndTrade.enterpriseDebtValueDate}"/> 
					</c:otherwise>
				</c:choose>
			</td>
		    <th>发生日期：</th>
		    <td>
		    		<c:choose>
						<c:when test="${empty enterpriseDebtIssueAndTrade.enterpriseDebtPulishDate}">&nbsp;</c:when>
						<c:otherwise>
							&nbsp;&nbsp;<fmt:formatDate pattern="yyyy-MM-dd" value="${enterpriseDebtIssueAndTrade.enterpriseDebtPulishDate}"/> 
						</c:otherwise>
					</c:choose>	
		    </td>
		  </tr>
		  
		  
		   <tr>
		    <th>债券形式：</th>
		    <td>
				<c:choose>
					<c:when test="${empty enterpriseDebtIssueAndTrade.enterpriseDebtFormat}">&nbsp;</c:when>
					<c:otherwise>
						&nbsp;&nbsp;${enterpriseDebtIssueAndTrade.enterpriseDebtFormat}
					</c:otherwise>
				</c:choose>
			</td>
		    <th>利息递进方式：</th>
		    <td>
		    		<c:choose>
						<c:when test="${empty enterpriseDebtIssueAndTrade.enterpriseDebtCompoundMethod}">&nbsp;</c:when>
						<c:otherwise>
							&nbsp;&nbsp;${enterpriseDebtIssueAndTrade.enterpriseDebtCompoundMethod}
						</c:otherwise>
					</c:choose>
		    </td>
		  </tr>
		  
		</table>