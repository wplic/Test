<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page	import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page	import="com.cssweb.credit.service.CreditService"%>
<%@page	import="com.cssweb.credit.pojo.Credit"%>
<%
     ServletContext st = this.getServletConfig().getServletContext();
	 ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
	 CreditService creditService = (CreditService)ctx.getBean("creditService");//
	 List list=creditService.selectFenye("2",0,10);
 %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<link href="/css/stockResearch/stockResearch.css" rel="stylesheet" type="text/css" />
</head>
<body>
<jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：首页 - 证券研究 - 部门大事记</div>
</div>
<div class="wrap_2right">
  <!--左侧sied开始-->
  <div class="w706 fleft">
  		<div class="comtit1"><h4>部门大事记</h4></div>
    <div class="clearfloat h25"></div>
  
		 <jsp:include page="/about/aboutListCon.jsp">
		           <jsp:param name="whichCat" value="zqyj_bmdsj"/>
		           <jsp:param name="showSize" value="20"/>
		           <jsp:param name="titleWidth" value="56"/>
		    	</jsp:include>

    <div class="clearfloat h25"></div>
  </div>
  
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w210 fright">
  <div class="rtit1">  荣誉  </div>
  <div class="bg_ff ptb6 ribor3">
        <marquee scrollamount="3" direction="up" onmouseover="this.stop()" onmouseout="this.start()" height="300">
        <table width="187" align="center" bgcolor="#ffffff">
          <%
            if(list!=null&&list.size()>0)
            	  {
            	    for(int j=0;j<list.size();j++)
	            	 {
	            	   Credit credit=(Credit)list.get(j);
	            	    %>
		            		 <tr>
				            <td align="center" class="rcxb">
				            <img src="${ctx}/share/showUploadImage.jsp?id=<%=credit.getPicId() %>" width="187" height="112" alt="无相片"/>
				            <h4 class="lh30"><%=credit.getTitle() %></h4>
				            </td>
				          </tr>  
		            	 <%
	            	 }
	              }%>
        </table>
        </marquee>
    </div>
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<div class="blank5"></div>
<jsp:include page="/commons/msbottom.jsp" />
</body>
</html>