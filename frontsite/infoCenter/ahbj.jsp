<%@ page contentType="text/html; charset=utf-8" language="java"  %>
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<jsp:directive.page import="com.cssweb.hq.service.AhbjService"/>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="com.cssweb.hq.pojo.Ahbj"/>
<jsp:directive.page import="java.text.DecimalFormat"/>
<script src="/js/setTab.js"></script>
      
      <%
        ServletContext st = this.getServletConfig().getServletContext();
        ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
        AhbjService ahbjService = (AhbjService) ctx.getBean("ahbjService");
		List alist=ahbjService.getAhbj(0,15);
		DecimalFormat df =new DecimalFormat("0.00");
      
       %>
       <ul class="info_tab1">
       		<li class="active red">A / H比价</li>
        </ul>
	    <div class="blank5"></div>
      
        <table width="100%" class="lh24 bg_ff center tabbott01" border="0" cellspacing="0" cellpadding="0" align="center">
        <tr>
          <th class="intab_th1">公司名称</th>
          <th class="intab_th1">A股价</th>
          <th class="intab_th1">H股价</th>
          <th class="intab_th1">比价</th>
        </tr>
            
            <%if(alist!=null&&alist.size()>0){
                 for(int i=0;i<alist.size();i++){
                 Ahbj ahbj=(Ahbj)alist.get(i);
                 double sspj=Double.valueOf(String.valueOf(ahbj.getSspj()==null?0l:ahbj.getSspj()));
                 double hspj=Double.valueOf(String.valueOf(ahbj.getHspj()==null?0l:ahbj.getHspj()));
             %>
            <tr class="news_stock_td"  style="height: 22px">
              <td align="left"><%=ahbj.getGsmc()!=null&&ahbj.getGsmc().length()>10?ahbj.getGsmc().substring(0,10)+"..":ahbj.getGsmc() %></td>
              <td class="green"><%=df.format(sspj/1000) %></td>
              <td class="red"><%=df.format(hspj/1000)%></td>
              <td><%=df.format(hspj*0.881/sspj)%></td><%--两地比价=H股价格*人民币兑港币汇率/A股价格 (人民币兑港币汇率0.881)A+H股比价(一览表)--%>
            </tr>
            <%}} %>
          
          </table>