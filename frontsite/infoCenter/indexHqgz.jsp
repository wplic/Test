<%@ page contentType="text/html; charset=utf-8" language="java"  %>
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
      
            Date fsrq=null;
            if(list!=null&&list.size()>0){
	                 fsrq=((Hqgz)list.get(0)).getFsrq();
                 }
       %>
       <tr>
        <td colspan="3" align="left" class="font_cs">日期：<%=fsrq!=null?sdf.format(fsrq):"" %></td>
      </tr>  
      <tr>
        <td class="intab_th1">名称</td>
        <td class="intab_th1">收盘价</td>
        <td class="intab_th1">涨跌</td>
      </tr>
            
            <%
            if(list!=null&&list.size()>0){
                 for(int i=0;i<list.size();i++){
                 Hqgz hqgz=(Hqgz)list.get(i);
                 double sspj=Double.valueOf(String.valueOf(hqgz.getSp()==null?0l:hqgz.getSp()));
                 double hspj=Double.valueOf(String.valueOf(hqgz.getZdf()==null?0l:hqgz.getZdf()));
             %>
            <tr>
              <td align="left"><%=hqgz.getZsmc()!=null&&hqgz.getZsmc().length()>10?hqgz.getZsmc().substring(0,10)+"..":hqgz.getZsmc() %></td>
              <td><%=df.format(sspj) %></td>
              <td class="green"><%=df.format(hspj)%></td>
            </tr>
            <%}} %>