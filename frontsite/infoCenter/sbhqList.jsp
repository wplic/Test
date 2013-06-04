<%request.setCharacterEncoding("UTF-8");%>
<jsp:directive.page import="java.text.DecimalFormat"/>
<jsp:directive.page import="com.cssweb.hq.pojo.ThirdStockHQ"/>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.cssweb.common.util.PageUtil"%>
<%@ include file="/commons/turnPage.jsp"%>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="java.util.List"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<TITLE></TITLE>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
</HEAD>
<body>  
<%
List sbhqList=(List)request.getAttribute("thirdStockList");
DecimalFormat df2=new DecimalFormat("#0.00");
%>
<form action="/sbhq.do?method=getThirdStockList" method="post" id="corpForm"  name="corpForm">
 <table border="1" class="lh24 center" bordercolor="#cccccc" width="100%" id="tabs12">
      <tr class="wisdom_tab_title">
                <td width="10%" class="tab_th1 bold">代码</td>
                <td width="20%" class="tab_th1 bold">名称</td>
                <td width="15%" class="tab_th1 bold">成交量(元)</td>
                <td width="15%" class="tab_th1 bold">开盘价(元)</td>
                <td width="20%" class="tab_th1 bold">最高价(元)</td>
                <td width="10%" class="tab_th1 bold">收盘价(元)</td>
                <td width="10%" class="tab_th1 bold">涨跌幅(%)</td>
              </tr>
              <%
              if(sbhqList!=null&&sbhqList.size()>0){
                 for(int i=0;i<sbhqList.size();i++){
                     ThirdStockHQ stockHQ=(ThirdStockHQ)sbhqList.get(i);
               %>
              <tr <%=i%2==0?"":"class='bg_ec'" %>>
                <td><%=stockHQ.getStockCode() %></td>
                <td><%=stockHQ.getStockName()%></td>
                <td><%=stockHQ.getExchangeVolume()%></td>
                <td><%=stockHQ.getOpenPrice()%></td>
                <td><%=stockHQ.getMaxPrice()%></td>
                <td><%=stockHQ.getClosePrice()%></td>
                <td><span><%if(stockHQ.getPercentChange()>0){ %><img src="/pic/infoCenter/arrow2.gif"/><%}else{ %><img src="/pic/infoCenter/arrow1.gif"/><%} %></span><%=df2.format(stockHQ.getPercentChange())+"%" %></td>
              </tr>
              <%}} %>
              
            
            </table>
         <table width="55%" border="0" cellspacing="0" cellpadding="0" align="center">
	              <tr>
	                <td height="35" class="tdr"><%=PageUtil.pagination("corpForm",totleCount, currentPage, pagesize)%></td>
	              </tr>
	            </table>
    </table> 
 </form>
</body> 
</html>