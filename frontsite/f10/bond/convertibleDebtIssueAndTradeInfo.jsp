<%@ page contentType="text/html; charset=utf-8" language="java"  %>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.cssweb.F10.gazx.bond.pojo.ConvertibleDebtIssueAndTrade"%>
<%@page import="java.text.DecimalFormat"%>
<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	DecimalFormat dmf = new DecimalFormat("#.00");
	ConvertibleDebtIssueAndTrade convertibleDebtIssueAndTradeInfo =	(ConvertibleDebtIssueAndTrade)request.getAttribute("convertibleDebtIssueAndTradeInfo");
 %>
<%@ include file="init.jsp" %>
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
		    <th width="15%">发生日期：</th>
		    <td width="30%">
		    			<%
		    					if (convertibleDebtIssueAndTradeInfo != null)
		    					{
		    							%>
		    									<%= convertibleDebtIssueAndTradeInfo.getConvertibleDebtPulishDate() == null ?"":sdf.format(convertibleDebtIssueAndTradeInfo.getConvertibleDebtPulishDate()) %>
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
		    <th width="15%">发行主体：</th>
		    <td width="30%">
		    			<c:choose>
							<c:when test="${empty convertibleDebtIssueAndTradeInfo.companyName}">&nbsp;</c:when>
							<c:otherwise>
								&nbsp;&nbsp;${convertibleDebtIssueAndTradeInfo.companyName}
							</c:otherwise>
						</c:choose>		
					
			</td>
		    <th width="15%">可转债名称：</th>
		    <td width="30%">
		    			<c:choose>
							<c:when test="${empty convertibleDebtIssueAndTradeInfo.convertibleDebtName}">&nbsp;</c:when>
							<c:otherwise>
								&nbsp;&nbsp;${convertibleDebtIssueAndTradeInfo.convertibleDebtName}
							</c:otherwise>
						</c:choose>	
			</td>
		  </tr>
		  <tr>
		    <th width="15%">债券期限：</th>
		    <td width="30%">
		    			<c:choose>
							<c:when test="${empty convertibleDebtIssueAndTradeInfo.convertibleDebtMaturity}">&nbsp;</c:when>
							<c:otherwise>
								&nbsp;&nbsp;${convertibleDebtIssueAndTradeInfo.convertibleDebtMaturity}
							</c:otherwise>
						</c:choose>
			</td>
		    <th width="15%">票面金额(元)：</th>
		    <td width="30%">
		    			<%
		    					if (convertibleDebtIssueAndTradeInfo != null)
		    					{
		    							%>
		    									<%= convertibleDebtIssueAndTradeInfo.getConvertibleDebtParValue() == null ?"":dmf.format(convertibleDebtIssueAndTradeInfo.getConvertibleDebtParValue()) %>
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
							<c:when test="${empty convertibleDebtIssueAndTradeInfo.convertibleDebtMakeRateModel}">&nbsp;</c:when>
							<c:otherwise>
								&nbsp;&nbsp;${convertibleDebtIssueAndTradeInfo.convertibleDebtMakeRateModel}
							</c:otherwise>
						</c:choose>	
			</td>
		    <th width="15%">还本付息方式：</th>
		    <td width="30%">
		    			<c:choose>
							<c:when test="${empty convertibleDebtIssueAndTradeInfo.convertibleDebtPayModel}">&nbsp;</c:when>
							<c:otherwise>
								&nbsp;&nbsp;${convertibleDebtIssueAndTradeInfo.convertibleDebtPayModel}
							</c:otherwise>
						</c:choose>
		    		
			</td>
		  </tr>
		  
		  
		  <tr>
		    <th width="15%">开始发行期：</th>
		    <td width="30%">
		    			<%
		    					if (convertibleDebtIssueAndTradeInfo != null)
		    					{
		    							%>
		    									<%= convertibleDebtIssueAndTradeInfo.getConvertibleDebtListedDate()==null?"":sdf.format(convertibleDebtIssueAndTradeInfo.getConvertibleDebtListedDate())  %>
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
		    <th width="15%">结束发行期：</th>
		    <td width="30%">
		    			<%
		    					if (convertibleDebtIssueAndTradeInfo != null)
		    					{
		    							%>
		    									<%= convertibleDebtIssueAndTradeInfo.getConvertibleDebtEndDate()==null ?"":sdf.format(convertibleDebtIssueAndTradeInfo.getConvertibleDebtEndDate()) %>
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
		    <th width="15%">债券到期日：</th>
		    <td  colspan="3">
		    			<%
		    					if (convertibleDebtIssueAndTradeInfo != null)
		    					{
		    							%>
		    									<%= convertibleDebtIssueAndTradeInfo.getConvertibleDebtBackDate()==null?"":sdf.format(convertibleDebtIssueAndTradeInfo.getConvertibleDebtBackDate())  %>
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