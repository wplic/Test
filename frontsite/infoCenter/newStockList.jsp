<%@page import="com.cssweb.gazxNewStock.pojo.NewStockInfo"%><%request.setCharacterEncoding("UTF-8");%>
<%@ page contentType="text/html; charset=UTF-8" language="java"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.util.List"%>
<%@page import="com.cssweb.complaints.pojo.FinanceQuestion"%>
<%@page import="java.text.SimpleDateFormat"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<%@page import="com.cssweb.common.util.PageUtil"%>
<%@ include file="/commons/turnPage.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
<script src="/js/setTab.js"></script>
</head>
<%
	List list=null;
	if(request.getAttribute("newStockInfoList")!=null){
		list=(List)request.getAttribute("newStockInfoList");
	}
 %>
<body>
<form name="newStockInfoForm" action="${ctx}/gazxNewStock.do?method=getNewStockInfoList" method="post">
<table border="1" class="lh24 center" bordercolor="#cccccc" width="100%" id="tabs11">
      <tr>
        <td width="10%" class="tab_th1 bold">代码 </td>
        <td width="12%" class="tab_th1 bold">证券名称 </td>
        <td width="9%" class="tab_th1 bold">发行价(元) </td>
        <td width="12%" class="tab_th1 bold">发行数量(万股) </td>
        <td width="12%" class="tab_th1 bold">发行日期 </td>
        <td width="13%" class="tab_th1 bold">上市日期 </td>
        <td width="13%" class="tab_th1 bold">配售日期 </td>
        <td width="11%" class="tab_th1 bold">发行市盈率 </td>
      </tr>
      <%if(list!=null&&list.size()>0) {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		for(int i=0;i<list.size();i++){
			NewStockInfo newStockInfo=(NewStockInfo)list.get(i);
			String wsfxrq = "未公布";
			if(newStockInfo.getWsfxrq()!=null){
				wsfxrq = sdf.format(newStockInfo.getWsfxrq());
			}
			String ssrq = "未公布";
			if(newStockInfo.getSsrq()!=null){
				ssrq = sdf.format(newStockInfo.getSsrq());
			}
			String wxpsrq = "未公布";
			if(newStockInfo.getWxpsrq()!=null){
				wxpsrq = sdf.format(newStockInfo.getWxpsrq());
			}
			if(i%2==0){
			%>
				<tr>
			<% 
			}else{
			%>
				<tr class="bg_ec">
			<% 
			}
			%>
			 
	        <td width="10%"><%=newStockInfo.getGpdm() %></td>
	        <td width="12%"><%=newStockInfo.getGpjc() %></td>
	        <td width="9%"><%=newStockInfo.getFxjg() %></td>
	        <td width="12%"><%=newStockInfo.getFxsl() %></td>
	        <td width="12%"><%=wsfxrq %></td>
	        <td width="13%"><%=ssrq %></td>
	        <td width="13%"><%=wxpsrq %></td>
	        <td width="11%"><%=newStockInfo.getQmtbfxsyl() %></td>
      		</tr>
			<% 
		}
		}
		%>
    </table>
     <div class="clearfloat"></div>
      <p align="center"> <%=PageUtil.pagination("window.newStockInfoForm",totleCount, currentPage, pagesize)%></p>
  	</form>
</body>
</html>
