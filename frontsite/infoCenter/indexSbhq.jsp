<%@ page contentType="text/html; charset=utf-8" language="java"  %>
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="org.apache.commons.lang.StringUtils"/>
<%request.setCharacterEncoding("UTF-8");%>
<jsp:directive.page import="java.text.DecimalFormat"/>
<jsp:directive.page import="com.cssweb.hq.pojo.ThirdStockHQ"/>
<jsp:directive.page import="com.cssweb.hq.service.ThirdStockHQService"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link href="/css/news.css" rel="stylesheet" type="text/css"/>
</head>


<%

  ServletContext st = this.getServletConfig().getServletContext();
  ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
  ThirdStockHQService thirdStockHQService = (ThirdStockHQService) ctx.getBean("thirdStockHQService");
  List sbhqList=thirdStockHQService.getThirdStockHQ("", 0, 10);
  DecimalFormat df2=new DecimalFormat("#0.00");
 %>
 
    <ul class="info_tab1">
       		<li class="active red">三板行情</li>
        </ul>
     <div class="blank5"></div>
<table width="95%" class="lh24 bg_ff center tabbott01" border="0" cellspacing="0" cellpadding="0" align="center">
          <tr>
            <th class="intab_th1">序号</th>
            <th class="intab_th1">名称</th>
            <th class="intab_th1">开盘价</th>
            <th class="intab_th1">涨跌幅</th>
          </tr>
       <%
              if(sbhqList!=null&&sbhqList.size()>0){
                 for(int i=0;i<sbhqList.size();i++){
                     ThirdStockHQ stockHQ=(ThirdStockHQ)sbhqList.get(i);
               %>
              <tr>
                <td><%=i+1 %></td>
                <td><%=stockHQ.getStockName()%></td>
                <td class="red"><%=stockHQ.getOpenPrice()%></td>
                <td class="red"><span><%if(stockHQ.getPercentChange()>0){ %><img src="/pic/infoCenter/arrow2.gif"/><%}else{ %><img src="/pic/infoCenter/arrow1.gif"/><%} %></span><%=df2.format(stockHQ.getPercentChange())+"%" %></td>
              </tr>
              <%}} %>
         </table>     
</html>