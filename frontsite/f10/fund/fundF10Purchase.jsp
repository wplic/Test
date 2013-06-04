<%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="/commons/taglibs.jsp"%>
<jsp:directive.page import="java.util.List"/>
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
  <div class="dqwz">当前位置：首页 > 资讯中心 > 基金个股</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">  
  <div class="iptvside_top"></div>
  <div class="iptvside_mid">
	  <jsp:include page="/f10/fund/fundF10_lmenu.jsp">
			<jsp:param name="menu" value="3" />
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
    <span class="ml20">         
    </span>
</div>
<div class="blank5"></div>
<div>
  <table width="100%" border="0">
    <tr>
      <td class="font14 bold lh30 font_st red">·基金申购与赎回</td>
      <td align="right">
</td>
    </tr>
  </table>
</div>
<table border="1" class="lh24 center" bordercolor="#cccccc" width="100%" id="tabs11">
  <tr>
    <td width="25%" class="tab_th1">申购开始日期： </td>
    <td width="25%" >
    <c:choose>
		<c:when test="${empty fundPurAndRedInfo.purchaseStartDate}">&nbsp;</c:when>
		<c:otherwise>
			<bean:write name="fundPurAndRedInfo"
				property="purchaseStartDate" format="yyyy-MM-dd" />
		</c:otherwise>
	</c:choose>
    </td>
    <td width="25%" class="tab_th1">赎回开始日期：</td>
    <td width="25%">
    <c:choose>
		<c:when
			test="${empty fundPurAndRedInfo.redemptionStartDate}">&nbsp;</c:when>
		<c:otherwise>
			<bean:write name="fundPurAndRedInfo"
				property="redemptionStartDate" format="yyyy-MM-dd" />
		</c:otherwise>
	</c:choose>
    </td>
  </tr>
  <tr>
    <td width="25%" class="tab_th1">认购最低投资额（元）： </td>
    <td width="25%">
    <c:choose>
		<c:when test="${empty fundPurAndRedInfo.purLeastInvest}">&nbsp;</c:when>
		<c:otherwise>
			<bean:write name="fundPurAndRedInfo"
				property="purLeastInvest" format="###,##0.00" />
		</c:otherwise>
	</c:choose>
    </td>
    <td width="25%" class="tab_th1">申购最低投资额（元）：</td>
    <td width="25%">
    <c:choose>
		<c:when test="${empty fundPurAndRedInfo.redLeastInvest}">&nbsp;</c:when>
		<c:otherwise>
			<bean:write name="fundPurAndRedInfo"
				property="redLeastInvest" format="###,##0.00" />
		</c:otherwise>
	</c:choose>
    </td>
  </tr>
  <tr>
    <td width="25%" class="tab_th1">最低赎回份额： </td>
    <td width="25%">
    <c:choose>
		<c:when test="${empty fundPurAndRedInfo.purLeastCount}">&nbsp;</c:when>
		<c:otherwise>
			<bean:write name="fundPurAndRedInfo"
				property="purLeastCount" format="###,##0" />
		</c:otherwise>
	</c:choose>
    </td>
    <td width="25%" class="tab_th1">认购费率：</td>
    <td width="25%">
    <c:choose>
		<c:when test="${empty fundPurAndRedInfo.subscriptionRates}">&nbsp;</c:when>
		<c:otherwise>
			<bean:write name="fundPurAndRedInfo"
				property="subscriptionRates" />
		</c:otherwise>
	</c:choose>
    </td>
  </tr>
  <tr>
    <td width="25%" class="tab_th1">申购费率：</td>
    <td width="25%">
    <c:choose>
		<c:when test="${empty fundPurAndRedInfo.purchaseRates}">&nbsp;</c:when>
		<c:otherwise>
			<bean:write name="fundPurAndRedInfo"
				property="purchaseRates" />
		</c:otherwise>
	</c:choose>
    </td>
    <td width="25%" class="tab_th1">赎回费率：</td>
    <td width="25%">
    <c:choose>
		<c:when test="${empty fundPurAndRedInfo.redemptionRates}">&nbsp;</c:when>
		<c:otherwise>
			<bean:write name="fundPurAndRedInfo"
				property="redemptionRates" />
		</c:otherwise>
	</c:choose>
    </td>
  </tr>
  <tr>
    <td width="25%" class="tab_th1">最高申购费率： </td>
    <td width="25%">
    <c:choose>
		<c:when test="${empty fundPurAndRedInfo.purchaseMostRates}">&nbsp;</c:when>
		<c:otherwise>
			<bean:write name="fundPurAndRedInfo"
				property="purchaseMostRates"  format="###,##0.0"/>
		</c:otherwise>
	</c:choose>
    </td>
    <td width="25%" class="tab_th1">最高赎回费率：</td>
    <td width="25%">
    <c:choose>
		<c:when test="${empty fundPurAndRedInfo.redemptionMostRates}">&nbsp;</c:when>
		<c:otherwise>
			<bean:write name="fundPurAndRedInfo"
				property="redemptionMostRates" format="###,##0.0"/>
		</c:otherwise>
	</c:choose>
    </td>
  </tr>
  <tr>
    <td width="25%" class="tab_th1">转换开始时间： </td>
    <td width="25%">
    <c:choose>
		<c:when test="${empty fundPurAndRedInfo.transitionDate}">&nbsp;</c:when>
		<c:otherwise>
			<bean:write name="fundPurAndRedInfo"
				property="transitionDate" format="yyyy-MM-dd" />
		</c:otherwise>
	</c:choose>
    </td>
    <td width="25%" class="tab_th1">最低转换份额：</td>
    <td width="25%">
    <c:choose>
		<c:when
			test="${empty fundPurAndRedInfo.leastTransitionCount}">&nbsp;</c:when>
		<c:otherwise>
			<bean:write name="fundPurAndRedInfo"
				property="leastTransitionCount" format="###,##0"/>
		</c:otherwise>
	</c:choose>
    </td>
  </tr>
  </table>


<div class="blank5"></div>
<div>
  <table width="100%" border="0">
    <tr>
      <td class="font14 bold lh30 font_st red">·费率调整</td>
      <td align="right">
</td>
    </tr>
  </table>
</div>
<table border="1" class="lh24 center" bordercolor="#cccccc" width="100%" id="tabs11">
  <tr>
    <td width="20%" class="tab_th1">费项 </td>
    <td width="15%" class="tab_th1">费率</td>
    <td width="15%" class="tab_th1">调整日期</td>
    <td width="50%" class="tab_th1">调整说明</td>				
    </tr>
    <c:forEach items="${rateAdjustmentList}" var="bean" varStatus="status">
		<tr>
			<td align="center" width="10%">
				<c:choose>
					<c:when test="${empty bean.rateObject}">&nbsp;</c:when>
					<c:otherwise>
						<bean:write name="bean" property="rateObject" />
					</c:otherwise>
				</c:choose>
			</td>
			<td align="center" width="10%">
				<c:choose>
					<c:when test="${empty bean.rate}">&nbsp;</c:when>
					<c:otherwise>
						<bean:write name="bean" property="rate" format="#,###"/>
					</c:otherwise>
				</c:choose>
			</td>
			<td align="center" width="15%">
				<c:choose>
					<c:when test="${empty bean.adjustmentDate}">&nbsp;</c:when>
					<c:otherwise>
						<bean:write name="bean" property="adjustmentDate" format="yyyy-MM-dd"/>
					</c:otherwise>
				</c:choose>
			</td>
			<bean:define id="detail" name="bean" property="adjustmentDatail" type="String" ></bean:define>
			<td width="65%" style="padding-left: 5px" title="<%=detail%>">
				
				<c:choose>
					<c:when test="${empty bean.adjustmentDatail}">&nbsp;</c:when>
					<c:otherwise>
						
						<%
						if(detail.length()>40){
							out.print(detail.substring(1,40)+"..."); 
						}else{
							out.print(detail); 
						}
						%>
					</c:otherwise>
				</c:choose>
			</td>
			
		</tr>
	</c:forEach>
  </table>
  </div> 
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="/share/bottom.jsp" />
<script src="/js/setTab.js"></script>
</body>
</html>