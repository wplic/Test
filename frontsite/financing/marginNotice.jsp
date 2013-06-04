<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%request.setCharacterEncoding("UTF-8");%>
<%@ page contentType="text/html; charset=UTF-8" language="java"  %>
<%@page import="com.cssweb.rzrq.service.PledgeAndKeepService"%>
<%@page import="com.cssweb.rzrq.pojo.PledgeAndKeep"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.List"%>
<%@page import="com.cssweb.rzrq.service.PledgeQuoteService"%>
<%@page import="com.cssweb.rzrq.pojo.PledgeQuote"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@ include file="/commons/turnPage.jsp"%>
<%@page import="com.cssweb.common.util.PageUtil"%>
<%@page import="java.util.Date"%>

<%
		PledgeAndKeep pledgeAndKeep  =	null;
		if (request.getAttribute("pledgeAndKeep") != null)
		{
			pledgeAndKeep =	(PledgeAndKeep)request.getAttribute("pledgeAndKeep");
		}
		
	   
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日");
		DecimalFormat mdf = new DecimalFormat("#0");
		List<PledgeQuote> quoteList = null;
		if (request.getAttribute("quoteList") != null)
		{
				quoteList = (List)request.getAttribute("quoteList");
		}
 %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<jsp:include page="/commons/mstop.jsp" />
<form action="${contextPath }/pledgeAndKeepAction.do?method=getPledgeAndKeepFrontList" id="pledgeAndKeepForm" name="pledgeAndKeepForm" method="post">

<div class="main">
  <div class="dqwz">当前位置：<a href="/default.html">首页</a> - <a href="/financing/index.html"> 融资融券</a> - <a href="/financing/rateNoticeLl.html">公告信息</a> - 保证金与维持担保</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft">
		<jsp:include page="/financing/notice_lmenu.jsp?menu=margin&nav3=wcdbpbl" />
         <div class="blank5"></div>
 </div>
  <!--左侧sied结束-->
   
  <!--中侧sied开始-->
  <div class="w706 fright">
  		<div class="comtit1"><h4>保证金与维持担保公告</h4></div>
    <div class="blank10"></div>
    <table width="96%" align="center">
   <jsp:include page="/financing/indexTitles.jsp">
           <jsp:param name="whichCat" value="bzjhwcdbp"/>
    	</jsp:include>

  <tr>
    <td>
    <table width="78%" border="1" bordercolor="#CCCCCC" class="lh25 mtb10 textcenter fcenter">
      <tr class="rrtab_top bold">
        <td width="13%">名称</td>
        <td width="13%">数值</td>
        <td colspan="3">注释</td>
        </tr>
      <tr>
        <td>取保线</td>
        <td><%
        			if (pledgeAndKeep != null && pledgeAndKeep.getBeforeAdjust() != null)
        			{
        					%>
        							<%
        							  if(pledgeAndKeep.getBeforeAdjust()!=null&&pledgeAndKeep.getBeforeAdjust()>0)
        							  {
        							   out.print(mdf.format(pledgeAndKeep.getBeforeAdjust()*100)+"%");
        							  }
        							%>
        					<%	
        			}
         %> </td>
         <td colspan="3" align="left">当客户信用账户维持担保比例高于取保线时，客户可以提取超出部分的担保物。但提取担保物后，客户账户维持担保比例应不低于
        <%
        			if (pledgeAndKeep != null && pledgeAndKeep.getBeforeAdjust() != null)
        			{
        					%>
        							<%
        							  if(pledgeAndKeep.getBeforeAdjust()!=null&&pledgeAndKeep.getBeforeAdjust()>0)
        							  {
        							   out.print(mdf.format(pledgeAndKeep.getBeforeAdjust()*100)+"%");
        							  }
        							%>
        					<%	
        			}
         %> 
         。</td>
        </tr>
      <tr>
        <td>警戒线</td>
        <td>
        <% 
					if (pledgeAndKeep != null && pledgeAndKeep.getAfterAdjust() != null)
        			{
        					%>
        							<% 
        							if(pledgeAndKeep.getAfterAdjust()!=null&&pledgeAndKeep.getAfterAdjust()>0)
        							 {
        							   out.print(mdf.format(pledgeAndKeep.getAfterAdjust()*100)+"%");
        							  }
        							%>
        					<%	
        			}
        %>		
		</td>
		 <td colspan="3" align="left">当客户信用账户维持担保比例低于警戒线时，我司将通知客户及时追加保证金。</td>
        </tr>
      <tr>
        <td>平仓线
</td>
        <td>
				 	 <% 
								if (pledgeAndKeep != null && pledgeAndKeep.getParityAdjust() != null)
			        			{
			        					%>
			        							<%if(pledgeAndKeep.getParityAdjust()!=null&&pledgeAndKeep.getParityAdjust()>0)
			        							 {
			        							   out.print(mdf.format(pledgeAndKeep.getParityAdjust()*100)+"%");
			        							  }
			        							 %>
			        					<%	
			        			}
			        %>	
		</td>
		 <td colspan="3" align="left">当客户信用账户维持担保比例低于平仓线时，我司将通知客户在合同约定的时间内追加保证金，若客户没有在合同约定时间内补足担保物，我司将按合同约定对客户信用账户资产进行强制平仓处理。</td>
        </tr>
    </table></td>
  </tr>
  <tr>
    <td class="lh25">特此公告。</td>
  </tr>

  <tr>
    <td align="right" class="lh25">广发证券股份有限公司<br />
<jsp:include page="/financing/indexTitleUpdateTime.jsp">
		<jsp:param name="whichCat" value="bzjhwcdbp"/>
	</jsp:include>
	</td>
  </tr>
  <tr>
    <td class="cuxuxian lh25">&nbsp;</td>
  </tr>
</table>

    <div class="clearfloat h15"></div>
  </div>
  <!--中侧sied结束--> 
   
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
    <div class="blank5"></div>
</form>    
<jsp:include page="/commons/msbottom.jsp" />
</body>
</html>