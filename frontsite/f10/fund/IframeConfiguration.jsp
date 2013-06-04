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
  		List list = (List)request.getAttribute("assetAllocationList");
  		if(list!=null){
  			x= list.size();
  		}
%>
  	<c:forEach items="${assetAllocationList }" var="bean">
  	<%i++; %>
  	<%if(x>4){ %>
  	<td style="height: 25px"  width="148" >
  	  <table width="148" class="lh24 center" border="1" cellspacing="1" cellpadding="1" bordercolor="#cccccc">
  	<%} else{%>
  		<td width="25%" >
  		 <table width="100%" border="1"  cellspacing="0" cellpadding="0" class="lh24 center">
  	<%} %>
    <tr>
        <td style="height: 25px" class="tab_th1 bold"><bean:write name="bean" property="startdate" format="yyyy-MM-dd"/></td>
      </tr>
      <tr>
        <td style="height: 25px">
        <c:if test="${bean.fundNetAssetValue!=0}">
        	<bean:write name="bean" property="fundNetAssetValue" format="###,##0.00"/> 
        </c:if>
        </td>
      </tr>
      <tr>
        <td style="height: 25px">&nbsp;
        <c:if test="${bean.bondsValue!=0}">	
        	<bean:write name="bean" property="bondsValue" format="###,##0.00"/>
        </c:if>	
        	
        </td>
      </tr>
      <tr>
        <td style="height: 25px">&nbsp;
        <c:if test="${bean.bondsValueProportion!=0}">	
        	<bean:write name="bean" property="bondsValueProportion" format="###,##0.00"/>
        </c:if>	</td>
      </tr>
      <tr>
        <td style="height: 25px">&nbsp;<c:if test="${bean.stockValue!=0}">	
        <bean:write name="bean" property="stockValue" format="###,##0.00"/> </c:if>	</td>
      </tr>
      <tr>
        <td style="height: 25px">&nbsp;<c:if test="${bean.stockValueProportion!=0}">	
        <bean:write name="bean" property="stockValueProportion" format="###,##0.00"/> </c:if>	</td>
      </tr>
      <tr>
        <td style="height: 25px">&nbsp;<c:if test="${bean.moneyValue!=0}">	
        <bean:write name="bean" property="moneyValue" format="###,##0.00"/> </c:if>	</td>
      </tr>
      <tr>
        <td style="height: 25px">&nbsp;<c:if test="${bean.moneyValueProportion!=0}">	
        <bean:write name="bean" property="moneyValueProportion" format="###,##0.00"/> </c:if>	</td>
      </tr>
      <tr>
        <td style="height: 25px">&nbsp;<c:if test="${bean.indexOfInvestment!=0}">	
        <bean:write name="bean" property="indexOfInvestment" format="###,##0.00"/> </c:if></td>
      </tr>
      <tr>
        <td style="height: 25px">&nbsp;<c:if test="${bean.indexOfInvestmentProportion!=0}">	
        <bean:write name="bean" property="indexOfInvestmentProportion" format="###,##0.00"/> </c:if>	</td>
      </tr>
      <tr>
        <td style="height: 25px">&nbsp;<c:if test="${bean.activeInvestment!=0}">	
        <bean:write name="bean" property="activeInvestment" format="###,##0.00"/> </c:if>	</td>
      </tr>
      <tr>
        <td style="height: 25px">&nbsp;<c:if test="${bean.activeInvestmentPro!=0}">	
        <bean:write name="bean" property="activeInvestmentPro" format="###,##0.00"/> </c:if>	</td>
      </tr>
      <tr>
        <td style="height: 25px">&nbsp;<c:if test="${bean.cbondsValue!=0}">	
        <bean:write name="bean" property="cbondsValue" format="###,##0.00"/> </c:if>	</td>
      </tr>
      <tr>
        <td style="height: 25px">&nbsp;<c:if test="${bean.cbondsValuePro!=0}">	
        <bean:write name="bean" property="cbondsValuePro" format="###,##0.00"/> </c:if></td>
      </tr>
      <tr>
        <td style="height: 25px">&nbsp;<c:if test="${bean.ebondsValue!=0}">	
        <bean:write name="bean" property="ebondsValue" format="###,##0.00"/> </c:if>	</td>
      </tr>
      <tr>
        <td style="height: 25px">&nbsp;<c:if test="${bean.ebondsValuePro!=0}">	
        <bean:write name="bean" property="ebondsValuePro" format="###,##0.00"/> </c:if></td>
      </tr>
      <tr>
        <td style="height: 25px">&nbsp;<c:if test="${bean.fbondsValue!=0}">	
        <bean:write name="bean" property="fbondsValue" format="###,##0.00"/> </c:if>	</td>
      </tr>
      <tr>
        <td style="height: 25px">&nbsp;<c:if test="${bean.fbondsValuePro!=0}">	
        <bean:write name="bean" property="fbondsValuePro" format="###,##0.00"/> </c:if>	</td>
      </tr>
      
      
       <tr>
        <td style="height: 25px">&nbsp;<c:if test="${bean.convertibleBondsValue!=0}">	
        <bean:write name="bean" property="convertibleBondsValue" format="###,##0.00"/> </c:if>	</td>
      </tr>
       <tr>
        <td style="height: 25px">&nbsp;<c:if test="${bean.convertibleBondsValuePro!=0}">	
        <bean:write name="bean" property="convertibleBondsValuePro" format="###,##0.00"/> </c:if>	</td>
      </tr>
       <tr>
        <td style="height: 25px">&nbsp;<c:if test="${bean.otherBondsValue!=0}">	
        <bean:write name="bean" property="otherBondsValue" format="###,##0.00"/> </c:if>	</td>
      </tr>
       <tr>
        <td style="height: 25px">&nbsp;<c:if test="${bean.otherBondsValuePro!=0}">	
        <bean:write name="bean" property="otherBondsValuePro" format="###,##0.00"/> </c:if>	</td>
      </tr>
      
      
       <tr>
        <td style="height: 25px">&nbsp;<c:if test="${bean.otherAssetValue!=0}">	
        <bean:write name="bean" property="otherAssetValue" format="###,##0.00"/> </c:if>	</td>
      </tr>
       <tr>
        <td style="height: 25px">&nbsp;<c:if test="${bean.otherAssetValuePro!=0}">	
        <bean:write name="bean" property="otherAssetValuePro" format="###,##0.00"/> </c:if>	</td>
      </tr>
      
      
       <tr>
        <td style="height: 25px">&nbsp;<c:if test="${bean.backBondSale!=0}">	
        <bean:write name="bean" property="backBondSale" format="###,##0.00"/> </c:if>	</td>
      </tr>
       <tr>
        <td style="height: 25px">&nbsp;<c:if test="${bean.backBondSalePro!=0}">	
        <bean:write name="bean" property="backBondSalePro" format="###,##0.00"/> </c:if>	</td>
      </tr>
       <tr>
        <td style="height: 25px">&nbsp;<c:if test="${bean.warrant!=0}">	
        <bean:write name="bean" property="warrant" format="###,##0.00"/> </c:if>	</td>
      </tr>
       <tr>
        <td style="height: 25px">&nbsp;<c:if test="${bean.warrantPro!=0}">	
        <bean:write name="bean" property="warrantPro" format="###,##0.00"/> </c:if>	</td>
      </tr>
      
    </table></td>
  	</c:forEach>
   
   <% if(x<1){%>
  <td width="25%">
    <table width="100%" border="1"  cellspacing="0" cellpadding="0" class="lh24 center">
    <tr>
        <td style="height: 25px">&nbsp;</td>
      </tr>
      <tr>
        <td style="height: 25px">&nbsp;</td>
      </tr>
      <tr>
        <td style="height: 25px">&nbsp;</td>
      </tr>
      <tr>
        <td style="height: 25px">&nbsp;</td>
      </tr>
      <tr>
        <td style="height: 25px">&nbsp;</td>
      </tr>
      <tr>
        <td style="height: 25px">&nbsp;</td>
      </tr>
           <tr>
        <td style="height: 25px">&nbsp;</td>
      </tr>
      <tr>
        <td style="height: 25px">&nbsp;</td>
      </tr>
      <tr>
        <td style="height: 25px">&nbsp;</td>
      </tr>
      <tr>
        <td style="height: 25px">&nbsp;</td>
      </tr>
      <tr>
        <td style="height: 25px">&nbsp;</td>
      </tr>     <tr>
        <td style="height: 25px">&nbsp;</td>
      </tr>
      <tr>
        <td style="height: 25px">&nbsp;</td>
      </tr>
      <tr>
        <td style="height: 25px">&nbsp;</td>
      </tr>
      <tr>
        <td style="height: 25px">&nbsp;</td>
      </tr>
      <tr>
        <td style="height: 25px">&nbsp;</td>
      </tr>     <tr>
        <td style="height: 25px">&nbsp;</td>
      </tr>
      <tr>
        <td style="height: 25px">&nbsp;</td>
      </tr>
      <tr>
        <td style="height: 25px">&nbsp;</td>
      </tr>
      <tr>
        <td style="height: 25px">&nbsp;</td>
      </tr>
      <tr>
        <td style="height: 25px">&nbsp;</td>
      </tr>     <tr>
        <td style="height: 25px">&nbsp;</td>
      </tr>
      <tr>
        <td style="height: 25px">&nbsp;</td>
      </tr>
      <tr>
        <td style="height: 25px">&nbsp;</td>
      </tr>
      <tr>
        <td style="height: 25px">&nbsp;</td>
      </tr>
      <tr>
        <td style="height: 25px">&nbsp;</td>
      </tr>
      <tr>
        <td style="height: 25px">&nbsp;</td>
      </tr>
      <tr>
        <td style="height: 25px">&nbsp;</td>
      </tr>
    </table></td>
    
    <%} %>
  </tr>
</table>
