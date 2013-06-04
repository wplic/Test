<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<jsp:directive.page import="com.cssweb.client.pojo.TsystemWebuser"/>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page	import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.cssweb.subscribe.pojo.TcsswebFwtcdy"%>
<%@page import="com.cssweb.subscribe.service.TcsswebFwtcdyService"%>
<%@page import="com.cssweb.subscribe.service.TcsswebFwtcdySfclService"%>
<%@page import="com.cssweb.subscribe.pojo.TcsswebFwtcdySfcl"%>
<%@page import="com.cssweb.subscribe.service.TcsswebFwcpdyService"%>
<%@page import="com.cssweb.subscribe.pojo.TcsswebFwcpdy"%>
<%@page import="java.text.DecimalFormat"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${ctx }/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx }/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
<%
    DecimalFormat df = new DecimalFormat("0.0###");
	ServletContext st = this.getServletConfig().getServletContext();
	ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
    List tcsswebFwtcdyList=null;
    TcsswebFwtcdyService tcsswebFwtcdyService = (TcsswebFwtcdyService)ctx.getBean("tcsswebFwtcdyService");
    tcsswebFwtcdyList=tcsswebFwtcdyService.getTcsswebFwtcdyListAllByabc(0);
    TcsswebFwtcdySfclService tcsswebFwtcdySfclService = (TcsswebFwtcdySfclService)ctx.getBean("tcsswebFwtcdySfclService");
    
    List sfcllist=null;
    
    TsystemWebuser tsystemWebuser=null;
	if(request.getSession().getAttribute("tsystemWebuser")!=null)
	tsystemWebuser=(TsystemWebuser)request.getSession().getAttribute("tsystemWebuser");
	if(tsystemWebuser!=null) {
	     if(tsystemWebuser.getBranchCode()!=null && !tsystemWebuser.getBranchCode().equals(""))
	     {
	         String branchCode="";
	         if((tsystemWebuser.getBranchCode().substring(0,1)).equals("0") )
	         branchCode=tsystemWebuser.getBranchCode().substring(1,tsystemWebuser.getBranchCode().length());
	         else if ((tsystemWebuser.getBranchCode().substring(0,2)).equals("00") )
	         branchCode=tsystemWebuser.getBranchCode().substring(2,tsystemWebuser.getBranchCode().length());
	         else
	         branchCode=tsystemWebuser.getBranchCode();
	         
	         sfcllist=tcsswebFwtcdySfclService.getTcsswebFwtcdySfclList(branchCode);
	     }
	 }
	 if(sfcllist!=null&&sfcllist.size()>0){
	  //说明取到对应营业部　数据
	 }else{
    sfcllist=tcsswebFwtcdySfclService.getTcsswebFwtcdySfclList("1");
    }
 %>
</head>

<body>
<div class="cpsm">
	<p style="padding:10px 0"><img src="${ctx }/pic/share/top/logo.jpg" /></p>
    <p align="center"><img src="${ctx }/pic/Subscribe/zscp.jpg"/></p>
    <div class="zsbox">
    	<h3><img src="${ctx }/pic/Subscribe/zstop.jpg" /></h3>
	<div class="cont">
	
	<%
	        if(tcsswebFwtcdyList!=null&&tcsswebFwtcdyList.size()>0)
	        {
	         for(int i=0;i<tcsswebFwtcdyList.size();i++)
	         {
	          TcsswebFwtcdy tcsswebFwtcdy=(TcsswebFwtcdy)tcsswebFwtcdyList.get(i);
	          %>
	           <p class="zsLIne"><span class="font14 bold"><%=tcsswebFwtcdy.getPackageName() %></span>：<%=tcsswebFwtcdy.getIntroduce() %></p>
				  <p class="lh22"><%=tcsswebFwtcdy.getNote() %></p>
				<div class="blank10"></div>
				         
	          <%
	         }
	        }
         %>
      </div>
        <h5></h5>
    </div>
    
    
    
    <div class="blank10"></div>
    <div class="zsbox">
    	<h3><img src="${ctx }/pic/Subscribe/zstop2.jpg" /></h3>
	<div class="cont">
	  <p><span class="bold">速递系列</span>：在投资顾问团队中最具传统优势的标准化咨询产品，适用于营业部中小客户。</p>
	  <div class="blank10"></div>
            <p><span class="bold">内参系列</span>：在广发证券投资顾问团队精心打造的核心资讯产品之一。</p>
			<div class="blank10"></div>
            <p><span class="bold">产品策略系列</span>：在集中广发证券投资顾问团队智慧精华的重点资讯系列产品。市场策略系列资讯为投资者分析市场中短期走势，合理选择投资品种，提供最及时的具体操作建议。 </p>
    
      </div>
        <h5></h5>
    </div>
    
    
    <%if(tsystemWebuser!=null) {%>
    <div class="blank10"></div>
    <div class="zsbox">
    	<h3><img src="${ctx }/pic/Subscribe/zstop3.jpg" /></h3>
	<div class="cont">
	  	<p><span class="bold">套餐定价标准</span><br />
            (定制套餐后，佣金需达到的最低水平)</p>
	  		<div class="blank10"></div>
            <table width="90%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td>&nbsp;</td>
                <td class="bold">乐享套餐 </td>
                <td class="bold">优享套餐 </td>
                <td class="bold">尊享套餐 </td>
              </tr>
              <tr>
                <td>财经汇客户</td>
                <%if(sfcllist!=null&&sfcllist.size()>0){
                 for(int i=0;i<sfcllist.size();i++ ){
                 
                TcsswebFwtcdySfcl tcsswebFwtcdySfcl=(TcsswebFwtcdySfcl)sfcllist.get(i);
                %>
                <%if(tcsswebFwtcdySfcl.getPackageLevel()==0&&tcsswebFwtcdySfcl.getSfclId()==9 ){ 
                    if(tcsswebFwtcdySfcl.getCommission()==0)
                    {
                   out.print("<td>免费 </td>");
                    }else{
                    
	                %>
	                <td>至少<%=df.format(tcsswebFwtcdySfcl.getCommission()*100) %> %</td>
	                <%
                   }} }%> 
                
                <%
                for(int i=0;i<sfcllist.size();i++ ){
                TcsswebFwtcdySfcl tcsswebFwtcdySfcl=(TcsswebFwtcdySfcl)sfcllist.get(i);
                if(tcsswebFwtcdySfcl.getPackageLevel()==0&&tcsswebFwtcdySfcl.getSfclId()==10 ){ 
                    if(tcsswebFwtcdySfcl.getCommission()==0)
                    {
                    out.print("<td>免费 </td>");
                    }else{
	                %>
	                <td>至少<%=df.format(tcsswebFwtcdySfcl.getCommission()*100) %>%</td>
	                <%
                   } }}%>
                   
                   <%
                   for(int i=0;i<sfcllist.size();i++ ){
                    TcsswebFwtcdySfcl tcsswebFwtcdySfcl=(TcsswebFwtcdySfcl)sfcllist.get(i);
                   if(tcsswebFwtcdySfcl.getPackageLevel()==0&&tcsswebFwtcdySfcl.getSfclId()==11 ){ 
                    if(tcsswebFwtcdySfcl.getCommission()==0)
                    {
                    out.print("<td>免费 </td>");
                    }else{
	                %>
	                <td>至少<%=df.format(tcsswebFwtcdySfcl.getCommission()*100) %> %</td>
	                <%
                   }}} %>
                   
                <%}%>
              </tr>
              <tr>
                <td>财智汇客户</td>
                <%if(sfcllist!=null&&sfcllist.size()>0){
                 for(int i=0;i<sfcllist.size();i++ ){
                 
                TcsswebFwtcdySfcl tcsswebFwtcdySfcl=(TcsswebFwtcdySfcl)sfcllist.get(i);
                %>
                <%if(tcsswebFwtcdySfcl.getPackageLevel()==1&&tcsswebFwtcdySfcl.getSfclId()==9 ){ 
                    if(tcsswebFwtcdySfcl.getCommission()==0)
                    {
                    out.print("<td>免费 </td>");
                    }else{
                    
	                %>
	                <td>至少<%=df.format(tcsswebFwtcdySfcl.getCommission()*100) %> %</td>
	                <%
                   }}} %> 
                
                <%
                for(int i=0;i<sfcllist.size();i++ ){
                 
                TcsswebFwtcdySfcl tcsswebFwtcdySfcl=(TcsswebFwtcdySfcl)sfcllist.get(i);
                if(tcsswebFwtcdySfcl.getPackageLevel()==1&&tcsswebFwtcdySfcl.getSfclId()==10 ){ 
                    if(tcsswebFwtcdySfcl.getCommission()==0)
                    {
                    out.print("<td>免费 </td>");
                    }else{
	                %>
	                <td>至少<%=df.format(tcsswebFwtcdySfcl.getCommission()*100) %> %</td>
	                <%
                   }}} %>
                   
                   <%
                   for(int i=0;i<sfcllist.size();i++ ){
                 
                  TcsswebFwtcdySfcl tcsswebFwtcdySfcl=(TcsswebFwtcdySfcl)sfcllist.get(i);
                   if(tcsswebFwtcdySfcl.getPackageLevel()==1&&tcsswebFwtcdySfcl.getSfclId()==11 ){ 
                    if(tcsswebFwtcdySfcl.getCommission()==0)
                    {
                    out.print("<td>免费 </td>");
                    }else{
	                %>
	                <td>至少<%=df.format(tcsswebFwtcdySfcl.getCommission()*100) %> %</td>
	                <%
                   }}} %>
                   
                <%}%>
              </tr>
              <tr>
                <td>财富汇客户</td>
                <%if(sfcllist!=null&&sfcllist.size()>0){
                 for(int i=0;i<sfcllist.size();i++ ){
                 
                TcsswebFwtcdySfcl tcsswebFwtcdySfcl=(TcsswebFwtcdySfcl)sfcllist.get(i);
                %>
                <%if(tcsswebFwtcdySfcl.getPackageLevel()==2&&tcsswebFwtcdySfcl.getSfclId()==9 ){ 
                    if(tcsswebFwtcdySfcl.getCommission()==0)
                    {
                    out.print("<td>免费 </td>");
                    }else{
	                %>
	                <td>至少<%=df.format(tcsswebFwtcdySfcl.getCommission()*100) %> %</td>
	                <%
                   } }}%> 
                
                <%
                for(int i=0;i<sfcllist.size();i++ ){
                 
                TcsswebFwtcdySfcl tcsswebFwtcdySfcl=(TcsswebFwtcdySfcl)sfcllist.get(i);
                if(tcsswebFwtcdySfcl.getPackageLevel()==2&&tcsswebFwtcdySfcl.getSfclId()==10 ){ 
                    if(tcsswebFwtcdySfcl.getCommission()==0)
                    {
                   out.print("<td>免费 </td>");
                    }else{
	                %>
	                <td>至少<%=df.format(tcsswebFwtcdySfcl.getCommission()*100) %> %</td>
	                <%
                   }}} %>
                   
                   <%
                   for(int i=0;i<sfcllist.size();i++ ){
                 
                TcsswebFwtcdySfcl tcsswebFwtcdySfcl=(TcsswebFwtcdySfcl)sfcllist.get(i);
                   if(tcsswebFwtcdySfcl.getPackageLevel()==2&&tcsswebFwtcdySfcl.getSfclId()==11 ){ 
                    if(tcsswebFwtcdySfcl.getCommission()==0)
                    {
                   out.print("<td>免费 </td>");
                    }else{
	                %>
	                <td>至少<%=df.format(tcsswebFwtcdySfcl.getCommission()*100) %> %</td>
	                <%
                   }}} %>
                   
                <%} %>
              </tr>
            </table>
      <p class="zsLIne"></p>
        <h5></h5>
    </div>
    
    
    
</div><%} %>
</body>
</html>