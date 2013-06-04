<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<jsp:directive.page import="com.cssweb.gazx.data.service.GazxDateService"/>
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="java.util.Map"/>
<jsp:directive.page import="java.util.HashMap"/>
<jsp:directive.page import="org.apache.commons.lang.StringUtils"/>
<jsp:directive.page import="com.cssweb.systemset.service.TsystemFundSaleService"/>
<jsp:directive.page import="com.cssweb.systemset.pojo.TsystemFundSale"/>
<jsp:directive.page import="java.text.SimpleDateFormat"/>

<%
  String beginNum=StringUtils.isEmpty(request.getParameter("beginNum"))?"0":request.getParameter("beginNum");
  String endNum=StringUtils.isEmpty(request.getParameter("endNum"))?"5":request.getParameter("endNum");
  int begin=Integer.valueOf(beginNum);
  int end=Integer.valueOf(endNum);  
  ServletContext st = this.getServletConfig().getServletContext();
  ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
  TsystemFundSaleService tsystemFundSaleService = (TsystemFundSaleService) ctx.getBean("tsystemFundSaleService");
  Map map=new HashMap();
  map.put("begin",begin);
  map.put("end",end);
  List list=tsystemFundSaleService.getFrontAllFund(map);
 
 %>
   	
   	 <tr>
        <td class="intab_th1">基金名称</td>
        <td class="intab_th1">单位净值</td>
        <td class="intab_th1">累计净值</td>
      </tr>
       <%
         if(list!=null&&list.size()>0){
            for(int i=0;i<list.size();i++){
            TsystemFundSale tsystemFundSale=(TsystemFundSale)list.get(i);
      %>
	         <tr>
	              <td><%=StringUtils.isEmpty(tsystemFundSale.getJjjc())?"":tsystemFundSale.getJjjc() %></td>
	              <td><%=tsystemFundSale.getDwjz()%></td>
	              <td><%=tsystemFundSale.getLjjz()%></td>
	            </tr>
	            
	   <%}} %>         