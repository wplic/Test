<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@include file="/commons/taglibs.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
</head>

<body class="body_bg">
<jsp:include page="/share/top.jsp?nav=zxzx" />
<div class="main">
  <div class="dqwz">当前位置：首页 > 个股 > 基金持股</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">  
  <div class="iptvside_top"></div>
  <div class="iptvside_mid">
	 <jsp:include page="/f10/stock/stockF10_lmenu.jsp">
			<jsp:param name="menu" value="7" />
	  </jsp:include>
  </div>
  <div class="iptvside_bot"></div>
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w706 fright">
  <div class="left_tit2">${name }(${stockCode})基金持股</div> 
    <div class="blank10"></div>
    <html:form action="/fund.do" method="post" styleId="fundForm">
    <p align="right">截至日期：
    <html:select property="publishDate" styleId="publishDate" value="${publishDate}">
          		<c:forEach var="dateString" items="${dateList}">
          			<html:option value="${dateString}">${dateString}</html:option>
          		</c:forEach>
          	</html:select>
     <img src="/pic/news/query.gif" onmouseover="this.src='/pic/news/query_s.gif'" onmouseout="this.src='/pic/news/query.gif'" style="cursor: hand" onclick="doSubmit();"/>     	
    </p>
    </html:form>
    <div class="blank5"></div> 
    <table border="1" class="lh30 tab_pl5 f10_tab01" bordercolor="#cccccc" width="100%">
      <tr>
        <th height="30" class="center bold">基金代码</th>
        <th class="center bold">基金名称</th>
        <th class="center bold">持股市值(万元)</th>
        <th class="center bold">占净值比例 (%)</th>
        <th class="center bold">占个股流通市值比例(%)</th>
      </tr>
      <c:forEach var="top" items="${fundhold}">
		<tr>
			<td>
				${top.fundCode }&nbsp;
			</td>
			<td>
				${top.fundName }&nbsp;
			</td>
			<td>
			<fmt:formatNumber value="${top.holdNumber/10000 }"   pattern="0"/>&nbsp;	
			</td>
			<td>
				<fmt:formatNumber value="${top.holdValue /10000 }"  pattern="0"/>&nbsp;
			</td>
			<td>
		 <fmt:formatNumber value="${top.ratioInNV }"  pattern="0.00"/> &nbsp;
			</td>
		</tr>
	</c:forEach>
      
    </table>
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="/share/bottom.jsp" />
</body>
</html>