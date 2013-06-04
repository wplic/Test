<%@ page contentType="text/html; charset=utf-8" language="java"  %>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.cssweb.F10.gazx.bond.pojo.ConvertibleDebtIssueAndTrade"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.cssweb.F10.gazx.bond.pojo.FinancialDebtIssue"%>
<%@page import="com.cssweb.F10.gazx.bond.pojo.ConvertibleDebtToStockInfo"%>
<%@page import="com.cssweb.F10.gazx.bond.pojo.ConveriteDebtOwnerInfo"%>
<%@ include file="init.jsp" %>
<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	DecimalFormat dmf = new DecimalFormat("#.00");
	DecimalFormat dmfs = new DecimalFormat("###,###");
	ConveriteDebtOwnerInfo converiteDebtOwnerInfo = (ConveriteDebtOwnerInfo)request.getAttribute("converiteDebtOwnerInfo");
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
		    					if (converiteDebtOwnerInfo != null)
		    					{
		    							%>
		    									<%=converiteDebtOwnerInfo.getPublishDate() == null ?"":sdf.format(converiteDebtOwnerInfo.getPublishDate()) %>
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
		    <th width="15%">持有人-公司：</th>
		    <td width="30%">
		    			<c:choose>
									<c:when test="${empty converiteDebtOwnerInfo.ownerCompany}">&nbsp;</c:when>
									<c:otherwise>
										&nbsp;&nbsp;${converiteDebtOwnerInfo.ownerCompany}
									</c:otherwise>
						</c:choose>		
		   </td>
		    <th width="15%">持有人-个人：</th>
		    <td width="30%">
		    			<c:choose>
									<c:when test="${empty converiteDebtOwnerInfo.ownerPersonal}">&nbsp;</c:when>
									<c:otherwise>
										&nbsp;&nbsp;${converiteDebtOwnerInfo.ownerPersonal}
									</c:otherwise>
						</c:choose>	
		    			
		   </td>
		  </tr>
		  
		  
		   <tr>
		    <th width="15%">持有人-基金：</th>
		    <td width="30%">
		    			<c:choose>
									<c:when test="${empty converiteDebtOwnerInfo.ownerFund}">&nbsp;</c:when>
									<c:otherwise>
										&nbsp;&nbsp;${converiteDebtOwnerInfo.ownerFund}
									</c:otherwise>
						</c:choose>			
		   </td>
		    <th width="15%">股东名称：</th>
		    <td width="30%">
		    			<c:choose>
									<c:when test="${empty converiteDebtOwnerInfo.shareholdersName}">&nbsp;</c:when>
									<c:otherwise>
										&nbsp;&nbsp;${converiteDebtOwnerInfo.shareholdersName}
									</c:otherwise>
						</c:choose>
		    			
		   </td>
		  </tr>
		  
		  
		  
		  <tr>
		    <th width="15%">持券张数(张)：</th>
		    <td width="30%">
		    			<%
		    					if (converiteDebtOwnerInfo != null )
		    					{
		    							%>
		    									<%= converiteDebtOwnerInfo.getOwnDebtNumber() == null ? "":dmfs.format(converiteDebtOwnerInfo.getOwnDebtNumber()) %>
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
		    <th width="15%">所占比例(%)：</th>
		    <td width="30%">
		    			<%
		    					if (converiteDebtOwnerInfo != null )
		    					{
		    							%>
		    									<%= converiteDebtOwnerInfo.getScale() == null ? "":dmfs.format(converiteDebtOwnerInfo.getScale()) %>
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
</table>		  