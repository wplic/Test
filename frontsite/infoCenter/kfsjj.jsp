<%@ page contentType="text/html; charset=utf-8" language="java" %>
<jsp:directive.page import="com.cssweb.gazx.data.service.GazxDateService"/>
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="com.cssweb.gazx.data.pojo.GazxDate"/>
<jsp:directive.page import="org.apache.commons.lang.StringUtils"/>
<jsp:directive.page import="java.text.SimpleDateFormat"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link href="/css/news.css" rel="stylesheet" type="text/css"/>
<style >
		.tabsL011{background:url(${contextPath}/pic/infoCenter/cjzt_tbg2.jpg) repeat-x; height:29px; line-height:29px;border-left:1px solid #b1bdc6;border-right:1px solid #b1bdc6;border-top:1px solid #b1bdc6; width:222px; margin:0 auto}
		.tabsL011 h2{ float:left; padding:0 8px;border-right:1px solid #b1bdc6;}
		.tabsL011 h2.active{ background:#ffffff;border-right:1px solid #b1bdc6; padding:0 8px;}
</style>
</head>
<jsp:directive.page import="com.cssweb.common.web.filter.SqlInjectValidate"/>
<%
 SqlInjectValidate sqlInjectValidate = SqlInjectValidate.getSqlInjectValidate();
	if(request.getParameter("nav1")!=null&&!request.getParameter("nav1").equals("")){
				if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("nav1"),10)){
					response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
				 }
			}
	if(request.getParameter("nav")!=null&&!request.getParameter("nav").equals("")){
				if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("nav"),10)){
					response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
				 }
			}
	if(request.getParameter("nav2")!=null&&!request.getParameter("nav2").equals("")){
		if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("nav2"),10)){
			response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
		 }
	}
%>

<%
  String beginNum=StringUtils.isEmpty(request.getParameter("beginNum"))?"1":request.getParameter("beginNum");
  String endNum=StringUtils.isEmpty(request.getParameter("endNum"))?"8":request.getParameter("endNum");
  int begin=Integer.valueOf(beginNum);
  int end=Integer.valueOf(endNum);
  //封闭式基金
  String condition_fb="select a.fsrq,a.dwjz,a.ljjz,b.jjjc, b.jjdm from jjjzcz a,jjzb b where a.T_JJZB_ID=b.t_jjzb_id and a.fsrq=(select max(fsrq) from jjjzcz where fsrq is not null and scbz=0 and gkbz=1)and a.scbz=0 and a.gkbz=1 and a.dwjz is not null  and a.ljjz is not null and b.jjlx like '%封闭式%' order by fsrq desc";
  //开放式基金
  String condition_kf="select a.fsrq,a.dwjz,a.ljjz,b.jjjc, b.jjdm from jjjzcz a,jjzb b where a.T_JJZB_ID=b.t_jjzb_id and a.fsrq=(select max(fsrq) from jjjzcz where fsrq is not null and scbz=0 and gkbz=1)and a.scbz=0 and a.gkbz=1 and a.dwjz is not null  and a.ljjz is not null and b.jjlx like '%开放式%' order by fsrq desc";
  
  ServletContext st = this.getServletConfig().getServletContext();
  ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
  GazxDateService gazxDateService = (GazxDateService) ctx.getBean("gazxDateService");
  List fblist=gazxDateService.kfsjjjzIndexNew(condition_fb,begin,end);
  List kflist=gazxDateService.kfsjjjzIndexNew(condition_kf,begin,end);
  String fsrq_kfs="";
  String fsrq_fbs="";
  SimpleDateFormat sdf=new SimpleDateFormat("yy-MM-dd");
 
 %>
<body>
 
         <div class="tabsL011">
   	      	<h2 class="active red" id="tagtabs101" onmouseover="SwitchNews('tabs10', 1, 2,'active red','')"><a href="#">开放式基金</a></h2>
            <h2 id="tagtabs102" onmouseover="SwitchNews('tabs10', 2, 2,'active red','')"><a href="#">封闭式基金</a></h2>
    	</div>
    	 <div class="blank5"></div>
      <table width="95%" class="lh24 bg_ff center tabbott01" border="0" cellspacing="0" cellpadding="0" align="center" id="tabs101">
         <tr>
              <th class="intab_th1">代码</th>
              <th class="intab_th1">名称</th>
              <th class="intab_th1">净值</th>
              <th class="intab_th1">累计</th>
       </tr>
       <%
         if(kflist!=null&&kflist.size()>0){
            for(int i=0;i<kflist.size();i++){
            GazxDate gazxDate=(GazxDate)kflist.get(i);
            fsrq_kfs=sdf.format(gazxDate.getFsrq());
            if(i%2==0){
      %>
	         <tr>
	              <td><%=StringUtils.isEmpty(gazxDate.getJjdm())?"":gazxDate.getJjdm() %></td>
	              <td><%=StringUtils.isEmpty(gazxDate.getJjjc())?"":gazxDate.getJjjc() %></td>
	              <td><%=gazxDate.getDwjz()%></td>
	              <td><%=gazxDate.getLjjz()%></td>
	            </tr>
	            
	   <%}else
	        {
	        		%>
	       		<tr>
		              <td><%=StringUtils.isEmpty(gazxDate.getJjdm())?"":gazxDate.getJjdm() %></td>
		              <td><%=StringUtils.isEmpty(gazxDate.getJjjc())?"":gazxDate.getJjjc() %></td>
		              <td><%=gazxDate.getDwjz()%></td>
		              <td><%=gazxDate.getLjjz()%></td>
		       </tr>
		        <%
	        }
	   
	   
	   
	   }} %>         
		</table>
       <table width="95%" class="lh24 bg_ff center tabbott01" border="0" cellspacing="0" cellpadding="0" align="center" id="tabs102" style=" display:none">
	        <tr>
	              <th class="intab_th1">代码</th>
	              <th class="intab_th1">名称</th>
	              <th class="intab_th1">净值</th>
	              <th class="intab_th1">累计</th>
	       </tr>
	      
	         <%
		         if(fblist!=null&&fblist.size()>0){
		            for(int i=0;i<fblist.size();i++){
		            GazxDate gazxDate=(GazxDate)fblist.get(i);
		             fsrq_fbs=sdf.format(gazxDate.getFsrq());
		            if(i%2==0){
	         %>
       		<tr>
	              <td><%=StringUtils.isEmpty(gazxDate.getJjdm())?"":gazxDate.getJjdm() %></td>
	              <td><%=StringUtils.isEmpty(gazxDate.getJjjc())?"":gazxDate.getJjjc() %></td>
	              <td><%=gazxDate.getDwjz()%></td>
	              <td><%=gazxDate.getLjjz()%></td>
	       </tr>
	        <%}else
	        {
	        		%>
	       		<tr>
		              <td><%=StringUtils.isEmpty(gazxDate.getJjdm())?"":gazxDate.getJjdm() %></td>
		              <td><%=StringUtils.isEmpty(gazxDate.getJjjc())?"":gazxDate.getJjjc() %></td>
		              <td><%=gazxDate.getDwjz()%></td>
		              <td><%=gazxDate.getLjjz()%></td>
		       </tr>
		        <%
	        }
	        
	        }}%>
        </table>
</body>
</html>