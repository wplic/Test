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
<link href="${ctx }/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx }/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
</head>

<body class="body_bg">
<jsp:include page="/share/top.jsp?nav=zxzx" />
<div class="main">
  <div class="dqwz">当前位置：首页 > 个股 > 高管介绍</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">  
  <div class="iptvside_top"></div>
  <div class="iptvside_mid">
	  <jsp:include page="/f10/stock/stockF10_lmenu.jsp">
			<jsp:param name="menu" value="3" />
	  </jsp:include>
  </div>
  <div class="iptvside_bot"></div>
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w706 fright">
  <div class="left_tit2">${name}(${stockCode})高管介绍</div> 
    <div class="blank5"></div>
    <table border="1" class="lh30 tab_pl5 f10_tab01" bordercolor="#cccccc" width="100%">
      <tr>
        <th height="30" class="center bold">姓名</th>
        <th class="center bold">职务</th>
        <th class="center bold">任职起止日</th>
        <th class="center bold">任职终止日</th>
        <th class="center bold">
		离职说明
		</th>
		<th class="center bold">
		续聘说明
		</th>
      </tr>
      <c:forEach var="top" items="${topman}">
      <tr>
        <td width="15%" align="center"><a href="/stock.do?method=getPersonalInfo&code=${top.personalInfoId }" target="_blank">${top.name }</a>
        </td>
        <td width="15%" align="center">${top.job }&nbsp;</td>
        <td width="15%" align="center">
        <c:set var="increaseIssueDate1">
			<fmt:formatDate value="${top.serviceStartDate}" pattern="yyyy-MM-dd" />
		</c:set>
		<c:if test='${increaseIssueDate1!="1900-01-01"}'>${increaseIssueDate1}</c:if>
        
        </td>
        <td width="15%" align="center">
        <c:set var="increaseIssueDate">
			<fmt:formatDate value="${top.serviceEndDate}" pattern="yyyy-MM-dd" />
		</c:set>
			&nbsp;
		<c:if test='${increaseIssueDate!="1900-01-01"}'>${increaseIssueDate}</c:if>
        
        </td>
        <td width="20%" align="center">${top.separationReason }&nbsp;</td>
       <td width="20%" align="center"> ${top.rehireReason }&nbsp;</td>
      </tr>
      </c:forEach>
    </table>
    <form action="/stock.do?method=getCutives&code=${stockCode}" method="post" id="relationForm">					
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
</body>
</html>