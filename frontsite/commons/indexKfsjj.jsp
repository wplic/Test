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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
</head>


<%
  String beginNum=StringUtils.isEmpty(request.getParameter("beginNum"))?"0":request.getParameter("beginNum");
  String endNum=StringUtils.isEmpty(request.getParameter("endNum"))?"4":request.getParameter("endNum");
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
<div class="ritagt1">
    	  <table width="93%" align="center">
    	    <tr>
              <td width="3"></td>
    	      <td class="font12">基金名称</td>
    	      <td class="font12">单位净值</td>
    	      <td class="font12">累计净值</td>
  	      </tr>
  	    </table>
   	</div>
<div class="ritagm1">
          <table width="100%" class="lh25">
       <%
         if(list!=null&&list.size()>0){
            for(int i=0;i<list.size()&&i<4;i++){
            TsystemFundSale tsystemFundSale=(TsystemFundSale)list.get(i);
      %>
	         <tr>
	              <td><%=StringUtils.isEmpty(tsystemFundSale.getJjjc())?"":tsystemFundSale.getJjjc() %></td>
	              <td><%=tsystemFundSale.getDwjz()%></td>
	              <td><%=tsystemFundSale.getLjjz()%></td>
	            </tr>
	            
	   <%}} %>         
		</table>
       <p align="right"><a href="${contextPath}/tsystemFundSaleFrontAction.do?method=getFundSaleList&nav=zxzx&nav1=jj&nav2=hor1&menu1=hor1&menu2=board1&menu3=dxjj"><img src="${contextPath}/pic/msindex/more.gif"/></a></p>
	</div>
   <div class="ritagb1"></div>
</html>