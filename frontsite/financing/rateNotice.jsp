<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=utf-8" language="java"  %>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="com.cssweb.rzrq.service.RzrqRateService"%>
<%@page import="com.cssweb.rzrq.pojo.RzrqRate"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Date"%>
<%
	ServletContext st = this.getServletConfig().getServletContext();
	ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
	RzrqRateService rzrqRateService  = (RzrqRateService)ctx.getBean("rzrqRateService");
	RzrqRate rzrqRate = rzrqRateService.getRzrqRateNewStartDate();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日");
	DecimalFormat mdf = new DecimalFormat("#0.00");
 %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<jsp:include page="${contextPath}/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="/default.html">首页</a> - <a href="/financing/index.html"> 融资融券</a> - <a href="/financing/rateNoticeLl.html">公告信息</a> - 利率和费率</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft">
		<jsp:include page="${contextPath}/financing/notice_lmenu.jsp?menu=rateNotic" />
  </div>
  <!--左侧sied结束-->
   
  <!--中侧sied开始-->
  <div class="w706 fright">
  		<div class="comtit1"><h4>利率和费率公告</h4></div>
    <div class="blank10"></div>
    <table width="96%" align="center">
    <jsp:include page="/financing/indexTitles.jsp">
		<jsp:param name="whichCat" value="rzllhrqgl"/>
	</jsp:include>

  <tr>
    <td>
    <table width="66%" border="1" bordercolor="#CCCCCC" class="lh25 mtb10 textcenter fcenter">
      <tr class="rrtab_tt bold">
        <td>类型</td>
        <td>利率 / 费率</td>
      </tr>
      <tr class="zqpzzslb">
        <td>融资年利率</td>
        <td>
        	<%
		        	if (rzrqRate != null && rzrqRate.getRzYear() != null)
		    		{
		    				%>
		    				<%= rzrqRate.getRzYear()!=null&&rzrqRate.getRzYear()>0?mdf.format(rzrqRate.getRzYear()):"" %>
		    				%
		    				<%
		    		}
        	%>
			
		</td>
      </tr>
      
      <tr class="zqpzzslb">
        <td>融券年费率</td>
        <td>
				<%
		        	if (rzrqRate != null && rzrqRate.getRqYear()!= null)
		    		{
		    				%>
		    				<%= rzrqRate.getRqYear()!=null&&rzrqRate.getRqYear()>0?mdf.format(rzrqRate.getRqYear()):"" %>
		    				%
		    				<%
		    		}
       			%>	
		</td>
      </tr>
      
    </table></td>
  </tr>
 
  <tr>
    <td class="lh25"> 特此公告。</td>
  </tr>
  <tr>
    <td align="right" class="lh25">广发证券股份有限公司<br />
    <jsp:include page="/financing/indexTitleUpdateTime.jsp">
		<jsp:param name="whichCat" value="rzllhrqgl"/>
	</jsp:include>
   
   </td>
  </tr>
  <tr>
    <td class="cuxuxian lh25">&nbsp;</td>
  </tr>
  <tr>
    <td align="right">
    </td>
  </tr>
</table>

    <div class="clearfloat h15"></div>
  </div>
  <!--中侧sied结束--> 
   
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
    <div class="blank5"></div>
<jsp:include page="${contextPath}/commons/msbottom.jsp" />
</body>
</html>