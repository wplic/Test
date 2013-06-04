<%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.cssweb.common.util.PageUtil"%>
<%@ include file="/commons/turnPage.jsp"%>
<%@include file="/commons/taglibs.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
</head>

<body class="body_bg">
<jsp:include page="/share/top.jsp?nav=zxzx" />
<div class="main">
  <div class="dqwz">当前位置：首页 > 个股 > 重要行为</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">  
  <div class="iptvside_top"></div>
  <div class="iptvside_mid">
	  <jsp:include page="/f10/stock/stockF10_lmenu.jsp">
			<jsp:param name="menu" value="8" />
	  </jsp:include>
  </div>
  <div class="iptvside_bot"></div>
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
<div class="w706 fright">
  <div class="left_tit2">${name}(${stockCode})重要行为</div> 
    <div class="blank10"></div>
   
    <div class="blank10"></div>
     <table border="1" class="tab_pl5 f10_tab01" bordercolor="#cccccc" width="100%">
      <tr>
        <th height="30" class="center bold">是否关联交易</th>
        <th class="center bold">重要行为类别</th>
        <th class="center bold">重要行为内容</th>
        <th class="center bold">发生日期</th>
   </tr>
   
	<c:forEach var="importantActivity" items="${importantActivityList}">
		<tr>
			<td width="10%">
				${importantActivity.linkTransaction}&nbsp;
			</td>
			<td width="10%">
				${importantActivity.importantActivityType}&nbsp;
			</td>
			<td width="70%">
				${importantActivity.textExplain}&nbsp;
			</td>
			<td width="10%">
				<c:set var="increaseIssueDate1">
					<fmt:formatDate value="${importantActivity.publishDate}"
						pattern="yyyy-MM-dd" />
				</c:set>
				<c:if test='${increaseIssueDate1!="1900-01-01"}'>${increaseIssueDate}</c:if>
				&nbsp;
			</td>
		</tr>
	</c:forEach>
     </table>
     <form action="/stock.do?method=getImportantActivity&code=${stockCode}" method="post" id="importForm">				
					<table width="70%" border="0" cellspacing="0" cellpadding="0" align="center">
						<tr>
							<td height="35" class="tdr"><%=PageUtil.pagination("relationForm",totleCount, currentPage, pagesize)%></td>
						</tr>
					</table>
				</form>
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="/share/bottom.jsp" />
<script src="/js/setTab.js"></script></body>
</html>