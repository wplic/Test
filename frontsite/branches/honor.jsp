<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*"   %>
<%@page import="java.util.List"%>
<%@page import="com.cssweb.systemset.pojo.SystemCredit"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.css.app.util.StringUtil"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@ include file="/commons/taglibs.jsp"%>
<%@page import="com.cssweb.common.util.PageUtil"%>
<%@ include file="/commons/turnPage.jsp"%>

<%
		List list =(List)request.getAttribute("list");
		DecimalFormat mdf = new DecimalFormat("#.00");
 %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/branches/branches.css" rel="stylesheet" type="text/css" />
</head>

<body class="body_bg">
<jsp:include page="${contextPath }/share/top.jsp" />
 <form action="${contextPath }/systemCreditAction.do?method=getSystemCreditList&nav=grgf&nav1=jjywcredit" name="creditForm" method="post">
<div class="wrap_r262">
  <div class="w650 fleft">
	<div class="dqwz">当前位置：<a href="${contextPath }/index.jsp?nav=index">首页</a> &gt; <a href="${contextPath }/branches/index.jsp?nav=grgf">分支机构</a>  &gt; 经纪业务荣誉</div>
    <p><img src="/pic/branches/banner2.jpg" /></p>
    <div class="blank10"></div>
   
    <div class="kline">
      <div class="font14 bold center mtb5">广发证券经纪业务各项指标（95年以来）</div>
      <div class="qiebg">
        <table width="100%" border="0" class="tab_pl5" >
          <tr class="red">
            <th class="f10_tab02 pl5 center">年份</th>
            <th class="f10_tab02 pl5 center">市场排名</th>
            <th class="f10_tab02 pl5 center">证券交易总额(亿元) </th>
            <th class="f10_tab02 pl5 center ">股票基金交易额</th>
          </tr>
          <%
          		if (list != null )
          		{
          				for (int i = 0;i < list.size() ; i ++ )
          				{
          						SystemCredit systemCredit =	(SystemCredit)list.get(i);
          						
          						%>
          								<tr class="tab_xuxian25">
								            <td align="center"><%= systemCredit.getYear() %>年</td>
								            <td>
								            	<%
								            			if (systemCredit.getMartOrder() != null)
								            			{
								            					
						            						%>
						            								<%= systemCredit.getMartOrder() %>
						            						<%
								            			}
								            			else
								            			{
								            					%>&nbsp;<%
								            			}
								            	 %>
								            	
								            </td>
								            <td align="center"><%= mdf.format(systemCredit.getTradeallMoney()) %></td>
								            <td align="center"><%= mdf.format(systemCredit.getStockfundMoney()) %></td>
								          </tr>
          						<%
          				}
          		}
           %>
           <tr>
           		<td colspan="4" align="center"><%=PageUtil.pagination("window.creditForm",totleCount, currentPage, pagesize)%></td>
           </tr>
   
        </table>
     </div>
    </div>
  </div>
  <div class="w262 fright bg_ec ptb13">
  		<div class="side_top"></div>
    <div class="side_mid">
   	  <p class="side_tit1">更多荣誉</p>
      <div class="blank10"></div>
      <%
      		if (list != null )
      		{
      				for (int i = 0; i < list.size() ; i ++)
      				{
      						SystemCredit systemCredit =	(SystemCredit)list.get(i);
      						String martOrder = "";
      						if (systemCredit.getMartOrder() != null && systemCredit.getMartOrder().length() >= 20)
      						{
      							martOrder = systemCredit.getMartOrder().substring(0,10);
      						}
      						else
      						{
      							martOrder = systemCredit.getMartOrder();
      						}
      						if (i < 3)
      						{
      								%>
      									<p align="center"><img width="204" height="103" src="${contextPath }/share/showUploadImage.jsp?id=<%=systemCredit.getPicId() %>" /></p>
      									<p align="center" class="lh30 bold" title="<%=systemCredit.getMartOrder() %>"><%=martOrder %></p>
      								<%
      						}
      				}
      		}
       %>
           
      <div class="blank10"></div>
      </div>
    <div class="side_bot"></div>
  </div>
  <div class="clearfloat"></div>
</div>
</form>
<jsp:include page="${contextPath }/share/bottom.jsp" />

</body>
</html>