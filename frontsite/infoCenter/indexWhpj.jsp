<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" %>
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<jsp:directive.page import="com.cssweb.hq.service.WhpjService"/>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="java.util.Date"/>
<jsp:directive.page import="com.cssweb.hq.pojo.Whpj"/>
<jsp:directive.page import="java.text.DecimalFormat"/>
<jsp:directive.page import="java.text.SimpleDateFormat"/>
<script src="/js/setTab.js"></script>
      
      <%
        ServletContext st = this.getServletConfig().getServletContext();
        ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
        WhpjService whpjService=(WhpjService)ctx.getBean("whpjService");
        String whpjsql="select hbmc HBMC,round(XCMRJ, 4) XCMRJ ,round(MCJ, 4) MRJ, fsrq from whsc where fsrq=(select max(fsrq) from whsc) and scbz=0 and gkbz=1  and xcmrj is not null and MCJ is not null order by hbmc";
        List pjList=whpjService.getWhpj(whpjsql,1,11);
  
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
        Date fsrq=null;
            if(pjList!=null&&pjList.size()>0){
                   Whpj whpj=(Whpj)pjList.get(0);
                   fsrq=whpj.getFsrq();
             }
       %>
       <tr>
        <td colspan="3" align="left" class="font_cs">日期：<%=fsrq!=null?sdf.format(fsrq):"" %></td>
      </tr>  
      <tr>
        <td class="intab_th1">币种</td>
        <td class="intab_th1">买价</td>
        <td class="intab_th1">卖价</td>
      </tr>
            
            <%
            if(pjList!=null&&pjList.size()>0){
                   for(int i=0;i<pjList.size();i++){
                   Whpj whpj=(Whpj)pjList.get(i);
                   fsrq=whpj.getFsrq();
             %>
            <tr>
              <td align="left"><%=whpj.getHbmc() %></td>
              <td><%=whpj.getXcmrj() %></td>
              <td class="green"><%=whpj.getMcj() %></td>
            </tr>
            <%}} %>