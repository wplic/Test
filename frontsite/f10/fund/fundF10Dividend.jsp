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
<%
					java.util.List bean = (java.util.List) request
					.getAttribute("fundDividendList");
		%>
</head>

<body class="body_bg">
<jsp:include page="/share/top.jsp?nav=zxzx" />
<div class="main">
  <div class="dqwz">当前位置：首页 > 资讯中心 > 基金个股</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">  
  <div class="iptvside_top"></div>
  <div class="iptvside_mid">
	  <jsp:include page="/f10/fund/fundF10_lmenu.jsp">
			<jsp:param name="menu" value="5" />
	  </jsp:include>
  </div>
  <div class="iptvside_bot"></div>
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
<div class="w706 fright"> 
   <!--右侧个股价格开始-->
  <div class="ggxx"><!--右侧个股价格结束-->
 <div class="left_tit2">
    <jsp:include flush="true" page="/f10/fund/FundCodeSearch.jsp"></jsp:include>
 </div> 
<div class="blank5"></div>
<div class="f10_tab03 textcenter">
	<span class="red font14 bold ml32">${fundShortName }</span>
    <span class="font14 ml10"> (${fundCode })</span>
    <span class="ml20"></span>
</div>
<div class="blank5"></div>
<div>
  <table width="100%" border="0">
    <tr>
      <td class="font14 bold lh30 font_st red">·基金分红</td>
      <td align="right">&nbsp;</td>
    </tr>
  </table>
</div>
<table border="1" class="lh24 center" bordercolor="#cccccc" width="100%" id="tabs11">
  <tr>
    <td width="19%" class="tab_th1 bold">分配年度 </td>
    <td width="37%" class="tab_th1 bold">每10份基金单位派发（含税）</td>
    <td width="17%" class="tab_th1 bold">权益登记日</td>
    <td width="12%" class="tab_th1 bold">除息日</td>
    <td width="15%" class="tab_th1 bold">公告日期</td>
    </tr>
    <c:forEach items="<%=bean%>" var="bean" varStatus="status">
		<tr>
			<td>
				<c:choose>
					<c:when test="${empty bean.dividendYear}">&nbsp;</c:when>
					<c:otherwise>
						<bean:write name="bean" property="dividendYear" format="yyyy-MM-dd" />
					</c:otherwise>
				</c:choose>
			</td>
			<td>
               	<c:choose>
					<c:when
						test="${empty bean.unitsDistributed}">0</c:when>
					<c:otherwise>
						<bean:write name="bean"
							property="unitsDistributed" format="###,##0.00"/>
					</c:otherwise>
				</c:choose> 
			</td>
			<td>
               	<c:choose>
					<c:when
						test="${empty bean.registeredDate}">&nbsp;</c:when>
					<c:otherwise>
						<bean:write name="bean"
							property="registeredDate"  format="yyyy-MM-dd"/>
					</c:otherwise>
				</c:choose> 
			</td>
			<td>
               	<c:choose>
					<c:when
						test="${empty bean.remInterestDate}">&nbsp;</c:when>
					<c:otherwise>
						<bean:write name="bean"
							property="remInterestDate"  format="yyyy-MM-dd"/>
					</c:otherwise>
				</c:choose> 
			</td>
			<td>
               	<c:choose>
					<c:when
						test="${empty bean.startdate}">&nbsp;</c:when>
					<c:otherwise>
						<bean:write name="bean"
							property="startdate"  format="yyyy-MM-dd"/>
					</c:otherwise>
				</c:choose> 
			</td>
		</tr>
	</c:forEach>
  
  </table>
<div class="lh30 textcenter">
<form action="/fund.do?method=getFundDividendByFundCode&gpdm=${fundCode}" method="post" id="relationForm">					
					<table width="70%" border="0" cellspacing="0" cellpadding="0" align="center">
						<tr>
							<td height="35" class="tdr"><%=PageUtil.pagination("relationForm",totleCount, currentPage, pagesize)%></td>
						</tr>
					</table>
				</form>
        </div>
  </div> 
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="/share/bottom.jsp" />
<script src="/js/setTab.js"></script>
</body>
</html>