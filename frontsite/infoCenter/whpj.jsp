<%@ page contentType="text/html; charset=utf-8" language="java"  %>
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
        List pjList=whpjService.getWhpj(whpjsql,1,12);
  
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
        Date fsrq=null;
  %>
       <ul class="info_tab1">
       		<li class="active red">外汇牌价</li>
        </ul>
	    <div class="blank5"></div>
      
        <table width="100%" class="lh24 bg_ff center tabbott01" border="0" cellspacing="0" cellpadding="0" align="center">
         <tr>
          <td colspan="3" align="left" class="pl3">人民币元/100外币</td>
          </tr>
	      <tr>
	        <th class="intab_th1">币种</th>
	        <th class="intab_th1">买价</th>
	        <th class="intab_th1">卖价</th>
	      </tr>
            
             <%if(pjList!=null&&pjList.size()>0){
                   for(int i=0;i<pjList.size();i++){
                   Whpj whpj=(Whpj)pjList.get(i);
                   fsrq=whpj.getFsrq();
                   
               %>
            <tr style="height: 22px">
              <td align="left"><%=whpj.getHbmc() %></td>
              <td class="green"><%=whpj.getXcmrj() %></td>
              <td class="red"><%=whpj.getMcj() %></td>
              </tr>
           <%}} %>
                      
          </table>
          <p align="right" class="mr10 mt5">发布日期： <%=sdf.format(fsrq)%></p>