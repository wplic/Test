<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<jsp:directive.page import="com.cssweb.hq.service.HqgzService"/>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="java.util.Date"/>
<jsp:directive.page import="com.cssweb.hq.pojo.Hqgz"/>
<jsp:directive.page import="java.text.DecimalFormat"/>
<jsp:directive.page import="java.text.SimpleDateFormat"/>
<script src="/js/setTab.js"></script>
      
      <%
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        ServletContext st = this.getServletConfig().getServletContext();
        ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
        HqgzService hqgzService = (HqgzService) ctx.getBean("hqgzService");
		List list=hqgzService.getHqgz(0,12);
		DecimalFormat df =new DecimalFormat("0.00");
      
       %>
       <ul class="info_tab1">
       		<li class="active red">环球股指</li>
        </ul>
	    <div class="blank5"></div>
      
        <table width="100%" class="lh24 bg_ff center tabbott01" border="0" cellspacing="0" cellpadding="0" align="center">
        <tr>
          <th class="intab_th1">币种</th>
          <th class="intab_th1">收盘价</th>
          <th class="intab_th1">涨跌</th>
        </tr>
            
            <%
             Date fsrq=null;
            if(list!=null&&list.size()>0){
                 for(int i=0;i<list.size();i++){
                 Hqgz hqgz=(Hqgz)list.get(i);
                 if(i==0) {
	                 fsrq=hqgz.getFsrq();
                 }
                 double sspj=Double.valueOf(String.valueOf(hqgz.getSp()==null?0l:hqgz.getSp()));
                 double hspj=Double.valueOf(String.valueOf(hqgz.getZdf()==null?0l:hqgz.getZdf()));
             %>
            <tr class="news_stock_td"  style="height: 22px">
              <td align="left"><%=hqgz.getZsmc()!=null&&hqgz.getZsmc().length()>10?hqgz.getZsmc().substring(0,10)+"..":hqgz.getZsmc() %></td>
              <td class="green"><%=df.format(sspj) %></td>
              <td class="red"><%=df.format(hspj)%></td>
            </tr>
            <%}} %>
          
          </table>
          <p align="right" class="mr10 mt5">发布日期：<%=fsrq!=null?sdf.format(fsrq):"" %></p>