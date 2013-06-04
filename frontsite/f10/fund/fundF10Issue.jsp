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
			<jsp:param name="menu" value="4" />
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
<div>
  <table width="100%" border="0">
    <tr>
      <td class="font14 bold lh30 font_st red">·基金发行上市</td>
      <td align="right">&nbsp;</td>
    </tr>
  </table>
</div>
<table border="1" class="lh30 tab_pl5 f10_tab01" bordercolor="#cccccc" width="100%">
  <tr>
    <th width="15%">发行名称</th>
    <td width="30%">
    <c:choose>
		<c:when test="${empty fundIssuedAndListedInfo.fundShortName}">&nbsp;</c:when>
		<c:otherwise>
			<bean:write name="fundIssuedAndListedInfo"
				property="fundShortName" format="###,##0.00"/>
		</c:otherwise>
	</c:choose>
    
    </td>
    <th width="15%">基金面值（元）</th>
    <td width="30%">
    <c:choose>
		<c:when test="${empty fundIssuedAndListedInfo.fundPrice}">&nbsp;</c:when>
		<c:otherwise>
			<bean:write name="fundIssuedAndListedInfo"
				property="fundPrice" format="###,##0.00"/>
		</c:otherwise>
	</c:choose>
    
    </td>
  </tr>
  <tr>
    <th>发行起始日期</th>
    <td>
    <c:choose>
		<c:when
			test="${empty fundIssuedAndListedInfo.issueStartDate}">&nbsp;</c:when>
		<c:otherwise>
			<bean:write name="fundIssuedAndListedInfo"
				property="issueStartDate" format="yyyy-MM-dd" />
		</c:otherwise>
	</c:choose>
    
    </td>
    <th>发行截止日期</th>
    <td>
    <c:choose>
			<c:when test="${empty fundIssuedAndListedInfo.issueEndDate}">&nbsp;</c:when>
			<c:otherwise>
				<bean:write name="fundIssuedAndListedInfo"
					property="issueEndDate" format="yyyy-MM-dd" />
			</c:otherwise>
		</c:choose>
    
    </td>
  </tr>
  <tr>
    <th>上市日期</th>
    <td>
    <c:choose>
		<c:when test="${empty fundIssuedAndListedInfo.listedDate}">&nbsp;</c:when>
		<c:otherwise>
			<bean:write name="fundIssuedAndListedInfo"
				property="listedDate" format="yyyy-MM-dd" />
		</c:otherwise>
	</c:choose>
    
    </td>
    <th>上市地点</th>
    <td>
    <c:choose>
		<c:when
			test="${empty fundIssuedAndListedInfo.listedAddress}">&nbsp;</c:when>
		<c:otherwise>
			<bean:write name="fundIssuedAndListedInfo"
				property="listedAddress" />
		</c:otherwise>
	</c:choose>
    
    </td>
  </tr>
  <tr>
    <th>发行价格（元）</th>
    <td>
    <c:choose>
		<c:when test="${empty fundIssuedAndListedInfo.issuePrice}">&nbsp;</c:when>
		<c:otherwise>
			<bean:write name="fundIssuedAndListedInfo"
				property="issuePrice"  format="###,##0.00"/>
		</c:otherwise>
	</c:choose>
    </td>
    <th>发行规模</th>
    <td>
    <c:choose>
		<c:when test="${empty fundIssuedAndListedInfo.issueScope}">&nbsp;</c:when>
		<c:otherwise>
			<bean:write name="fundIssuedAndListedInfo"
				property="issueScope"  format="###,###"/>
		</c:otherwise>
	</c:choose>
    </td>
  </tr>
  <tr>
    <th>发行总市值</th>
    <td>
    <c:choose>
		<c:when test="${empty fundIssuedAndListedInfo.issueAmount}">&nbsp;</c:when>
		<c:otherwise>
			<bean:write name="fundIssuedAndListedInfo"
				property="issueAmount"  format="###,##0.00"/>
		</c:otherwise>
	</c:choose>
    </td>
    <th>发行费用</th>
    <td>
    <c:choose>
		<c:when test="${empty fundIssuedAndListedInfo.issueRate}">&nbsp;</c:when>
		<c:otherwise>
			<bean:write name="fundIssuedAndListedInfo"
				property="issueRate"  format="###,##0.00"/>
		</c:otherwise>
	</c:choose>
    </td>
  </tr>
  <tr>
    <th>募资净额</th>
    <td>
    <c:choose>
		<c:when test="${empty fundIssuedAndListedInfo.fundsNetAmount}">&nbsp;</c:when>
		<c:otherwise>
			<bean:write name="fundIssuedAndListedInfo"
				property="fundsNetAmount"  format="###,##0.00"/>
		</c:otherwise>
	</c:choose>	
    </td>
    <th>中签率（%）</th>
    <td>
    <c:choose>
		<c:when test="${empty fundIssuedAndListedInfo.successRate}">&nbsp;</c:when>
		<c:otherwise>
			<bean:write name="fundIssuedAndListedInfo"
				property="successRate"  format="###,##0.00"/>%
		</c:otherwise>
	</c:choose>	
    </td>
  </tr>
  <tr>
    <th>发行冻结资金</th>
    <td>
    <c:choose>
		<c:when test="${empty fundIssuedAndListedInfo.freezeAmount}">&nbsp;</c:when>
		<c:otherwise>
			<bean:write name="fundIssuedAndListedInfo"
				property="freezeAmount"  format="###,##0.00"/>
		</c:otherwise>
	</c:choose>
    </td>
    <th>现在可流通份额</th>
    <td>
    <c:choose>
		<c:when test="${empty fundIssuedAndListedInfo.circulationCount}">&nbsp;</c:when>
		<c:otherwise>
			<bean:write name="fundIssuedAndListedInfo"
				property="circulationCount"  format="###,###"/>
		</c:otherwise>
	</c:choose>	
    </td>
  </tr>
  <tr>
    <th>发起人认购份额</th>
    <td>
    <c:choose>
		<c:when test="${empty fundIssuedAndListedInfo.purchaseAmount}">&nbsp;</c:when>
		<c:otherwise>
			<bean:write name="fundIssuedAndListedInfo"
				property="purchaseAmount"  format="###,###"/>
		</c:otherwise>
	</c:choose>	
    </td>
    <th>上网定价发行份额</th>
    <td>
    <c:choose>
		<c:when test="${empty fundIssuedAndListedInfo.netIssueAmount}">&nbsp;</c:when>
		<c:otherwise>
			<bean:write name="fundIssuedAndListedInfo"
				property="netIssueAmount"  format="###,###"/>
		</c:otherwise>
	</c:choose>
    </td>
  </tr>
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