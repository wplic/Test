<%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.cssweb.common.util.PageUtil"%>
<%@ include file="/commons/turnPage.jsp"%>
<%@include file="/commons/taglibs.jsp"%>
<%@page import="java.util.List "%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${ctx }/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx }/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
  	<% int i=0; 
  	int x  = 0;
  		List list = (List)request.getAttribute("financialIndexList");
  		if(list!=null){
  			x= list.size();
  		}
  	%>
  	<c:forEach items="${financialIndexList }" var="bean">
  	<%i++; %>
  	<%if(x>4){ %>
  	<td style="height: 25px"  width="148" >
  	  <table width="148" class="lh24 center" border="1" cellspacing="1" cellpadding="1" bordercolor="#cccccc">
  	<%} else{%>
  		<td width="25%" >
  		 <table width="100%" border="1"  cellspacing="0" cellpadding="0" class="lh24 center">
  	<%} %>
    <tr>
       <td style="height: 24px" class="tab_th1 bold"><bean:write name="bean" property="startdate" format="yyyy-MM-dd"/></td>
      </tr>
      <tr>
        <td style="height: 24px">
        <c:if test="${bean.totalAsset!=0}">
        	<bean:write name="bean" property="totalAsset" format="###,##0.00"/> 
        </c:if>
        </td>
      </tr>
      <tr>
        <td style="height: 24px">&nbsp;
        <c:if test="${bean.totalNetAsset!=0}">	
        	<bean:write name="bean" property="totalNetAsset" format="###,##0.00"/>
        </c:if>	
        	
        </td>
      </tr>
      <tr>
        <td style="height: 24px">&nbsp;
        <c:if test="${bean.unitNV!=0}">	
        	<bean:write name="bean" property="unitNV" format="###,##0.00"/>
        </c:if>	</td>
      </tr>
      <tr>
        <td style="height: 24px">&nbsp;<c:if test="${bean.nvProfitRatio!=0}">	
        <bean:write name="bean" property="nvProfitRatio" format="###,##0.00"/> </c:if>	</td>
      </tr>
      <tr>
        <td style="height: 24px">&nbsp;<c:if test="${bean.nvGrowthRate!=0}">	
        <bean:write name="bean" property="nvGrowthRate" format="###,##0.00"/> </c:if>	</td>
      </tr>
      <tr>
        <td style="height: 24px">&nbsp;<c:if test="${bean.accumulatedNVGrowthRat!=0}">	
        <bean:write name="bean" property="accumulatedNVGrowthRat" format="###,##0.00"/> </c:if>	</td>
      </tr>
      <tr>
        <td style="height: 24px">&nbsp;<c:if test="${bean.profit!=0}">	
        <bean:write name="bean" property="profit" format="###,##0.00"/> </c:if>	</td>
      </tr>
      <tr>
        <td style="height: 24px">&nbsp;<c:if test="${bean.weightedAverage!=0}">	
        <bean:write name="bean" property="weightedAverage" format="###,##0.00"/> </c:if></td>
      </tr>
      <tr>
        <td style="height: 24px">&nbsp;<c:if test="${bean.weightedNetAssetValue!=0}">	
        <bean:write name="bean" property="weightedNetAssetValue" format="###,##0.00"/> </c:if>	</td>
      </tr>
      <tr>
        <td style="height: 24px">&nbsp;<c:if test="${bean.netGrowthRate!=0}">	
        <bean:write name="bean" property="netGrowthRate" format="###,##0.00"/> </c:if>	</td>
      </tr>
      <tr>
        <td style="height: 24px">&nbsp;<c:if test="${bean.comparingPerformance!=0}">	
        <bean:write name="bean" property="comparingPerformance" format="###,##0.00"/> </c:if>	</td>
      </tr>
      <tr>
        <td style="height: 24px">&nbsp;<c:if test="${bean.compPerStandDeviation!=0}">	
        <bean:write name="bean" property="compPerStandDeviation" format="###,##0.00"/> </c:if>	</td>
      </tr>
      
    </table></td>
  	</c:forEach>
   
    <% if(x<1){%>
   <td width="25%">
    <table width="100%" cellspacing="0" cellpadding="0" class="wisdom_tab">
    	<tr>
        <td style="height: 24px">&nbsp;</td>
      </tr>
      <tr>
        <td style="height: 24px">&nbsp;</td>
      </tr>
      <tr>
        <td style="height: 24px">&nbsp;</td>
      </tr>
      <tr>
        <td style="height: 24px">&nbsp;</td>
      </tr>
      <tr>
        <td style="height: 24px">&nbsp;</td>
      </tr>
      <tr>
        <td style="height: 24px">&nbsp;</td>
      </tr>
       <tr>
        <td style="height: 24px">&nbsp;</td>
      </tr>
      <tr>
        <td style="height: 24px">&nbsp;</td>
      </tr>
      <tr>
        <td style="height: 24px">&nbsp;</td>
      </tr>
      <tr>
        <td style="height: 24px">&nbsp;</td>
      </tr>
      <tr>
        <td style="height: 24px">&nbsp;</td>
      </tr>
       <tr>
        <td style="height: 24px">&nbsp;</td>
      </tr>
      <tr>
        <td style="height: 24px">&nbsp;</td>
      </tr>
    </table></td>
    
    <%} %>
  </tr>
</table>
