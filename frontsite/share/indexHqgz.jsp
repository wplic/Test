<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<jsp:directive.page import="com.cssweb.hq.service.HqgzService"/>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="java.util.Date"/>
<jsp:directive.page import="com.cssweb.hq.pojo.Hqgz"/>
<jsp:directive.page import="java.text.DecimalFormat"/>
<jsp:directive.page import="java.text.SimpleDateFormat"/>
<script src="/js/setTab.js"></script>
<table width="90%" class="lh24 bg_ff center" border="0" cellspacing="0" cellpadding="0" align="center">      
      <%
        int count=3;
        if(request.getParameter("count")!=null&&!request.getParameter("count").equals(""))
        count=Integer.parseInt(request.getParameter("count").trim());
        
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        ServletContext st = this.getServletConfig().getServletContext();
        ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
        HqgzService hqgzService = (HqgzService) ctx.getBean("hqgzService");
		List list=hqgzService.getHqgz(0,count);
		DecimalFormat df =new DecimalFormat("0.00");
      
            Date fsrq=null;
            if(list!=null&&list.size()>0){
	                 fsrq=((Hqgz)list.get(0)).getFsrq();
                 }
       %>
      <tr>
        <td class="green">名称</td>
        <td class="green">收盘价</td>
        <td class="green">涨跌%</td>
      </tr>
            
            <%
            if(list!=null&&list.size()>0){
                 for(int i=0;i<list.size();i++){
                 Hqgz hqgz=(Hqgz)list.get(i);
                 double sspj=Double.valueOf(String.valueOf(hqgz.getSp()==null?0l:hqgz.getSp()));
                 double hspj=Double.valueOf(String.valueOf(hqgz.getZdf()==null?0l:hqgz.getZdf()));
             %>
            <tr>
              <td align="left"><%=hqgz.getZsmc()!=null&&hqgz.getZsmc().length()>5?hqgz.getZsmc().substring(0,5)+"..":hqgz.getZsmc() %></td>
              <td><%=df.format(sspj) %></td>
              <td <%=hspj>0?"class='red'":"class='green'" %>><%=df.format(hspj)%></td>
            </tr>
            <%}} %>
</table>            