<%@ page contentType="text/html; charset=utf-8" language="java"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
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
			<jsp:param name="zqdm" value="" />
			<jsp:param name="menu" value="1" />
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
    <span class="font14 ml10">(${fundCode })</span>
    <span class="ml20"></span>
</div>
<div class="blank5"></div>
       <!--日K线开始-->

<div class="kline">
<div class="qiebg">
<iframe src="http://121.14.21.4/_gfflash.php?code=${fundCode }" id="fundIframe" marginheight="0" marginwidth="0" frameborder="0" scrolling="auto" width="660" style="height: 492px" ></iframe>
<div class="clearfloat"></div>
</div>
<!--日K线结束-->
<div class="blank5"></div>
<table border="1" class="lh30 tab_pl5 f10_tab01" bordercolor="#cccccc" width="100%">
  <tr>
    <td width="14%">基金代码 </td>
    <td width="86%">${fundCode } </td>
    </tr>
  <tr>
    <td>基金名称 </td>
    <td>${fundInfo.fundName } </td>
    </tr>
  <tr>
    <td>基金简称 </td>
    <td>${fundShortName } </td>
    </tr>
  <tr>
    <td>成立日期 </td>
    <td>
    <c:choose>
		<c:when test="${empty fundInfo.foundationDate}">&nbsp;</c:when>
		<c:otherwise>
			<bean:write name="fundInfo" property="foundationDate"
				format="yyyy-MM-dd" />
		</c:otherwise>
	</c:choose>
     </td>
    </tr>
  <tr>
    <td>基金类型 </td>
    <td>
    <c:choose>
		<c:when test="${empty fundInfo.fundType}">&nbsp;</c:when>
		<c:otherwise>${fundInfo.fundType }</c:otherwise>
	</c:choose>
     </td>
    </tr>
  <tr>
    <td>基金总规模</td>
    <td>
    <c:choose>
		<c:when test="${empty fundInfo.totalScale}">&nbsp;</c:when>
		<c:otherwise>
			<bean:write name="fundInfo" property="totalScale"
				format="###,###" />
		</c:otherwise>
	</c:choose>
    </td>
    </tr>
  <tr>
    <td>投资类型 </td>
    <td>
		<c:choose>
			<c:when test="${empty fundInfo.investmentStyle}">&nbsp;</c:when>
			<c:otherwise>${fundInfo.investmentStyle }</c:otherwise>
		</c:choose>    
     </td>
    </tr>
  <tr>
    <td>到期日期</td>
    <td>
    <c:choose>
		<c:when test="${empty fundInfo.dueDate }">&nbsp;</c:when>
		<c:otherwise>
			<bean:write name="fundInfo" property="dueDate"
				format="yyyy-MM-dd" />
		</c:otherwise>
	</c:choose>
    </td>
    </tr>
  <tr>
    <td>投资对象 </td>
    <td>
		<c:choose>
			<c:when test="${empty fundInfo.investee}">&nbsp;</c:when>
		<c:otherwise>${fundInfo.investee }</c:otherwise>
		</c:choose>    
    
     </td>
    </tr>
  <tr>
    <td>基准指数 </td>
    <td>
	<c:choose>
		<c:when test="${empty fundInfo.benchmarkIndex}">&nbsp;</c:when>
		<c:otherwise>${fundInfo.benchmarkIndex }</c:otherwise>
	</c:choose>    
    
     </td>
    </tr>
  <tr>
    <td>基金管理人</td>
    <td>
<c:choose>
	<c:when test="${empty companyInfo.companyName}">&nbsp;</c:when>
	<c:otherwise>${companyInfo.companyName }</c:otherwise>
</c:choose>    
     </td>
    </tr>
      <tr>
    <td>投资目标 </td>
    <td>
    <c:choose>
		<c:when test="${empty fundInfo.investmentObjective}">&nbsp;</c:when>
		<c:otherwise>${fundInfo.investmentObjective }</c:otherwise>
	</c:choose>
    </td>
    </tr>
      <tr>
    <td>投资范围</td>
    <td>
    <c:choose>
		<c:when test="${empty fundInfo.investmentUniverse}">&nbsp;</c:when>
		<c:otherwise>${fundInfo.investmentUniverse }</c:otherwise>
	</c:choose>    
    </td>
    </tr>
      <tr>
    <td>投资理念 </td>
    <td>
    <c:choose>
		<c:when test="${empty fundInfo.investmentPhilosophy}">&nbsp;</c:when>
		<c:otherwise>${fundInfo.investmentPhilosophy }</c:otherwise>
	</c:choose>
    </td>
    </tr>
</table>
  </div> 
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div></div>
<jsp:include page="/share/bottom.jsp" />
<script src="/js/setTab.js"></script>
</body>
</html>