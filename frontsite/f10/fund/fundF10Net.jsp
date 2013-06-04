<%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.cssweb.common.util.PageUtil"%>
<%@ include file="/commons/turnPage.jsp"%>
<%@include file="/commons/taglibs.jsp"%>
<jsp:directive.page import="org.apache.commons.lang.StringUtils"/>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${ctx }/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx }/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
</head>
<script>
		function doSubmit(){
			document.fundForm.submit();
		}
</script>
<%
  java.util.List bean = (java.util.List) request.getAttribute("fundNetValueList");
%>
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
			<jsp:param name="menu" value="6" />
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
	<span class="red font14 bold ml32">${fundShortName}</span>
    <span class="font14 ml10"> (${fundCode})</span>
    <span class="ml20"></span>
</div>
<div class="blank5"></div>
<div class=" textcenter">
    <% 
	String startDate = StringUtils.isEmpty(request.getParameter("startDate"))?"":request.getParameter("startDate");
		String endDate =  StringUtils.isEmpty(request.getParameter("endDate"))?"":request.getParameter("endDate");
	%>
    <form action="/fund.do?method=getFundNetValueByCodeAndDate" method="post" name="fundForm">
    <table width="90%" align="center"><tr><td>
   开始时间:
   <input name="startDate" class="input108" style="width:90px" onfocus="this.blur()" value="<%=startDate%>" size="10" readonly />
   <a href="javascript:void(0)" onclick="gfPop.fStartPop(document.fundForm.startDate,document.fundForm.endDate);return false;" HIDEFOCUS>
   <img src="${ctx}/pic/share/selectTime.gif" name="popcal" width="19" height="18" border="0" align="absmiddle"></a>
   截止时间:
   <input name="endDate" class="input108" style="width:90px" onfocus="this.blur()" value="<%=endDate %>" size="10" readonly><a href="javascript:void(0)" onClick="gfPop.fEndPop(document.fundForm.startDate,document.fundForm.endDate);return false;" HIDEFOCUS><img src="${ctx}/pic/share/selectTime.gif" name="popcal" width="19" height="18" border="0" align="absmiddle"></a>
	<img src="/pic/news/query.gif" onmouseover="this.src='/pic/news/query_s.gif'" onmouseout="this.src='/pic/news/query.gif'" style="cursor: hand" onclick="doSubmit();"/>								
    </td></tr></table>
    </form>
    
</div>
<div class="blank5"></div>

<table border="1" class="lh24 center" bordercolor="#cccccc" width="100%" id="tabs11">
  <tr>
    <td width="19%" class="tab_th1 bold">截止日期 </td>
    <td class="tab_th1 bold">单位基金净值（元）</td>
    <td class="tab_th1 bold">单位基金净值（元）</td>
    </tr>
    
    <c:forEach items="<%=bean%>" var="bean" varStatus="status">
		<tr>
			<td>
				<c:choose>
					<c:when test="${empty bean.netValueDate}">&nbsp;</c:when>
					<c:otherwise>
						<bean:write name="bean" property="netValueDate"
							format="yyyy-MM-dd" />
					</c:otherwise>
				</c:choose>
			</td>
			<td>
				<c:choose>
					<c:when test="${empty bean.NAV }">0</c:when>
					<c:otherwise>
						<bean:write name="bean" property="NAV" format="#.####" />
					</c:otherwise>
				</c:choose>
			</td>
			<td>
				<c:choose>
					<c:when test="${empty bean.totalNetValue}">0</c:when>
					<c:otherwise>
						<bean:write name="bean" property="totalNetValue"
							format="#.####" />
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
	</c:forEach>
  </table>
<div class="lh30 textcenter">
<form action="/fund.do?method=getFundNetValueByCodeAndDate&gpdm=${fundCode}" method="post" id="relationForm">					
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
<iframe width=174 height=189 name="gToday:normal:agenda.js" id="gToday:normal:agenda.js"
			src="${ctx}/js/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; left:-500px; top:0px;"> 

</body>
</html>