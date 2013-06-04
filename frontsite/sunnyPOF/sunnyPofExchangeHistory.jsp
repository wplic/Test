<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@page import="com.fortuneage.sunnyPOF.pojo.SunnyCust"%>
<%@page import="java.text.DecimalFormat"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@page import="java.util.List"%>
<%@page import="com.cssweb.collect.pojo.TradeLog"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@page import="com.cssweb.common.util.PageUtil"%>
<%@ include file="/commons/turnPage.jsp"%>
<%
SunnyCust sunnyCust = null;
if(null!=request.getSession().getAttribute("sunnyCust")){
	sunnyCust = (SunnyCust)request.getSession().getAttribute("sunnyCust");
	}else{%>
		<script language="javascript">
			window.location="login.jsp";
		</script>
	<%}
	//String fundAccount = assetUser.getFundAccount();
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!-- 历史交易记录查询   -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
	
	function gotoSelectedPage()  
	{  
	    var x = document.getElementById("navigatorForm");  
	     //alert("Original action: " + x.action)  
	     x.submit();  
	 }  



</script>

</head>
<body>
<jsp:include page="/commons/mstop.jsp" />
  
<div class="main">
  <div class="dqwz">当前位置：<a href="${contextPath }/default.html"> 首页 </a>-<a href="${contextPath }/assetManage/index.jsp">资产管理</a> - 客户服务 - 交易记录及资金明细</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft">
	 <jsp:include page="sunnyPofService_lmenu.jsp" >
	 	<jsp:param value="ywbgxx" name="menu"/>
	 </jsp:include>
  </div>
  <!--左侧sied结束-->
   
  <!--中侧sied开始-->
  <div class="w706 fright">
  <div class="comtit1"><h4>历史交易查询</h4></div>


  <div class="blank10"></div>

	<table border="1" bordercolor="#cccccc" width="700" align="center" class="lh24">
      <tr class="rrtab_tt bold">
        <td align="center">委托人姓名</td>
        <td align="center">产品名称</td>
        <td align="center">确认日期</td>
        <td align="center">业务类型</td>
        <td align="center">成交价格</td>
        <td align="center">确认份额</td>
        <td align="center">确认金额</td>
      </tr>
     <!-- 开始循环数据 -->
     <c:choose>
     	<c:when test="${exchangeList!=null}">
     		<c:forEach items="${exchangeList }" var="exchange">
     			<tr>
			      <td align="center">${sunnyCust.custname }</td>
			      <td align="center">${exchange.fundname }</td>
			      <td align="center"><fmt:formatDate value="${exchange.exchangedate }" dateStyle="short" type="date" pattern="yyyy-MM-dd"/></td>
			      <td align="center">${exchange.exchangetype }</td>
			      <td align="center">${exchange.exchangeprice }</td>
			      <td align="center">${exchange.exchangeshare }</td>
			      <td align="center">${exchange.exchangemoney }</td>
			    </tr>
     		</c:forEach>
     	</c:when>
     	<c:otherwise>
			<tr>
		      <td colspan="7" align="center">没有数据</td>
		    </tr>
		</c:otherwise>
     </c:choose>
	  
    </table>
	<div class="pageBar">
				<form action="/sunnyCustAction.do?method=showExchangeByCust" method="post" id="navigatorForm">
					总共${totalPages }条，每页20条&nbsp;&nbsp;&nbsp;
				    <a href="/sunnyCustAction.do?method=showExchangeByCust&pageNumber=1">首页</a>   
				    <c:if test="${pageNumber>1}">  
				        <a href="/sunnyCustAction.do?method=showExchangeByCust&pageNumber=${pageNumber-1}">上一页</a>  
				    </c:if>   
				    跳转到第 <select name="pageNumber" onchange="gotoSelectedPage();">  
				    <c:forEach begin="1" end="${totalPages}" step="1" var="pageIndex">  
				        <c:choose>  
				            <c:when test="${pageIndex eq pageNumber}">  
				                <option value="${pageIndex}" selected="selected">${pageIndex}</option>  
				            </c:when>  
				            <c:otherwise>  
				                <option value="${pageIndex}">${pageIndex}</option>  
				            </c:otherwise>  
				        </c:choose>  
				    </c:forEach>  
				    </select>页
				    <c:if test="${pageNumber<totalPages}">  
				        <a href="/sunnyCustAction.do?method=showExchangeByCust&pageNumber=${pageNumber+1}">下一页</a>  
				    </c:if>   
				    <a href="/sunnyCustAction.do?method=showExchangeByCust&pageNumber=${pageNumber}">末页</a>  
				</form> 
				
			</div>
  </div>
  <!--中侧sied结束--> 
    <!--右侧sied开始-->
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
    <div class="blank5"></div>

<jsp:include page="/commons/msbottom.jsp" />
<iframe width=174 height=189 name="gToday:normal:agenda.js" id="gToday:normal:agenda.js"
			src="${ctx}/js/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; left:-500px; top:0px;"> 

</body>
</html>