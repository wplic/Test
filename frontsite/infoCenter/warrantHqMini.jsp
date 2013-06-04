<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="com.cssweb.hq.service.QuoteService"%>
<%@page import="com.cssweb.hq.pojo.Quote"%>
<%@page import="java.text.DecimalFormat"%><%request.setCharacterEncoding("UTF-8");%>
<%@ page contentType="text/html; charset=UTF-8" language="java"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.util.List"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
<script src="/js/setTab.js"></script>
</head>
<%
	ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(this.getServletConfig().getServletContext());
	QuoteService quoteService = (QuoteService)ctx.getBean("quoteService");
	List list=quoteService.getQuoteHq(0,10);
 %>
<body>
<form name="newStockInfoForm" action="${ctx}/gazxNewStock.do?method=getNewStockInfoList" method="post">
<div class="blank5"></div>
            <ul class="info_tab1">
       		<li class="active red">权证行情</li>
        </ul>
    <div class="blank5"></div>
      <table width="95%" class="lh24 bg_ff center tabbott01" border="0" cellspacing="0" cellpadding="0" align="center">
        <tr>
          <th class="intab_th1">权证名称</th>
          <th class="intab_th1">最新价</th>
          <th class="intab_th1">涨跌幅</th>
        </tr>
        <%
        	if(list!=null&&list.size()>0){
        		DecimalFormat df2=new DecimalFormat("#0.00");
        		for(int i=0;i<list.size();i++){
        			Quote quote = (Quote)list.get(i);
        			%>
        			<tr>
			          <td><%=quote.getZqjc() %></td>
			          <td><%=df2.format(quote.getZjcj()) %></td>
			          <%if(quote.getZf()>0){ %><td class="red"><%=df2.format(quote.getZf()*100) %>%</td><%}else{%><td class="green"><%=df2.format(quote.getZf()*100) %>%</td><% } %>
			        </tr>
        			<%
        		}
        	}
        
         %>
        </table>
        <div class="blank5"></div>
        <p align="right" class="red mr10"><a href="#">更多>></a></p>
    </form>
</body>
</html>