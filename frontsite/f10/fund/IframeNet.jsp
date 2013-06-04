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

<table bordercolor="#cccccc" width="100%" id="tabs11">
  <tr>
  	<% int i=0; 
  	int x  = 0;
  		List list = (List)request.getAttribute("netValueChangeList");
  		if(list!=null){
  			x= list.size();
  		}
  	
  	%>
  	<c:forEach items="${netValueChangeList }" var="bean">
  	<%i++; %>
  	<%if(x>4){ %>
  	<td style="height: 24px"  width="148" >
  	  <table width="148" class="lh24 center" border="1" cellspacing="1" cellpadding="1" bordercolor="#cccccc">
  	<%} else{%>
  		<td style="height: 24px" width="25%" class="tab_th1 bold">
  		 <table width="100%" border="1" cellspacing="0" cellpadding="0" class="lh24 center">
  	<%} %>
    <tr>
        <td style="height: 24px" class="tab_th1 bold"><bean:write name="bean" property="startdate" format="yyyy-MM-dd"/></td>
      </tr>
      <tr>
        <td style="height: 24px">
        <c:if test="${bean.beginFundNetValue!=0}">
        	<bean:write name="bean" property="beginFundNetValue" format="###,##0.00"/> 
        </c:if>
        </td>
      </tr>
      <tr>
        <td style="height: 24px">&nbsp;
        <c:if test="${bean.endFundNetValue!=0}">	
        	<bean:write name="bean" property="endFundNetValue" format="###,##0.00"/>
        </c:if>	
        	
        </td>
      </tr>
      <tr>
        <td style="height: 24px">&nbsp;</td>
      </tr>
      <tr>
        <td style="height: 24px">&nbsp;<c:if test="${bean.currentProfits!=0}">	
        <bean:write name="bean" property="currentProfits" format="###,##0.00"/> </c:if>	</td>
      </tr>
      <tr>
        <td style="height: 24px">&nbsp;<c:if test="${bean.unrealizedProfits!=0}">	
        <bean:write name="bean" property="unrealizedProfits" format="###,##0.00"/> </c:if>	</td>
      </tr>
      <tr>
        <td style="height: 24px">&nbsp;<c:if test="${bean.NVChangeDueToOperating!=0}">	
        <bean:write name="bean" property="NVChangeDueToOperating" format="###,##0.00"/> </c:if>	</td>
      </tr>
      <tr>
        <td style="height: 24px">&nbsp;<c:if test="${bean.preAdjustedProfit!=0}">	
        <bean:write name="bean" property="preAdjustedProfit" format="###,##0.00"/> </c:if>	</td>
      </tr>
      <tr>
        <td style="height: 24px">&nbsp;</td>
      </tr>
      <tr>
        <td style="height: 24px">&nbsp;<c:if test="${bean.fundShallPurchase!=0}">	
        <bean:write name="bean" property="fundShallPurchase" format="###,##0.00"/> </c:if>	</td>
      </tr>
      <tr>
        <td style="height: 24px">&nbsp;<c:if test="${bean.dividendReInvestment!=0}">	
        <bean:write name="bean" property="dividendReInvestment" format="###,##0.00"/> </c:if>	</td>
      </tr>
      <tr>
        <td style="height: 24px">&nbsp;<c:if test="${bean.redemptionFundShall!=0}">	
        <bean:write name="bean" property="redemptionFundShall" format="###,##0.00"/> </c:if>	</td>
      </tr>
      <tr>
        <td style="height: 24px">&nbsp;<c:if test="${bean.fundChangeAmount!=0}">	
        <bean:write name="bean" property="fundChangeAmount" format="###,##0.00"/> </c:if>	</td>
      </tr>
      <tr>
        <td style="height: 24px">&nbsp;</td>
      </tr>
      <tr>
        <td style="height: 24px">&nbsp;<c:if test="${bean.holderNetValueChangeAmount!=0}">	
        <bean:write name="bean" property="holderNetValueChangeAmount" format="###,##0.00"/> </c:if>	</td>
      </tr>
      <tr>
        <td style="height: 24px">&nbsp;</td>
      </tr>
    
      <tr>
        <td style="height: 24px">&nbsp;<c:if test="${bean.adjNetValueChange!=0}">	
        <bean:write name="bean" property="adjNetValueChange" format="###,##0.00"/> </c:if>	</td>
      </tr>
      <tr>
        <td style="height: 24px">&nbsp;<c:if test="${bean.lastNetValue!=0}">	
        <bean:write name="bean" property="lastNetValue" format="###,##0.00"/> </c:if>	</td>
      </tr>
    </table></td>
  	</c:forEach>
   
     <% if(x<1){%>
    <td style="height: 24px">
    <table width="100%" border="1" cellspacing="0" cellpadding="0" class="lh24 center">
    <tr class="tab_th1 bold">
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
