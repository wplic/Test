<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<jsp:directive.page import="com.cssweb.common.util.PageUtil"/>
<%@page import="com.cssweb.collect.pojo.BalFund"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.fortuneage.sunnyPOF.pojo.SunnyCust"%>
<%@page import="java.util.List"%>
<%@page import="com.cssweb.collect.pojo.FundHistory"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ include file="/commons/turnPage.jsp"%>
<%@ include file="/commons/taglibs.jsp"%>
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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${contextPath }/css/style.css" rel="stylesheet" type="text/css" />

</head>
<body>
<jsp:include page="${contextPath}/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="${contextPath }/default.html"> 首页 </a>-<a href="${contextPath }/assetManage/index.jsp">资产管理</a> - 客户服务</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft">
	 <jsp:include page="sunnyPofService_lmenu.jsp" >
	 	<jsp:param value="zhhistory" name="menu"/>
	 </jsp:include>
  </div>
  <!--左侧sied结束-->
  <!--中侧sied开始-->
  <div class="w706 fright">
  <div class="comtit1">
    <h4>历史份额信息</h4></div>

  <table border="1" bordercolor="#cccccc" width="98%" align="center" class="lh24 mt10">
    <tr class="rrtab_tt bold">
      <td><p align="center">客户号码</p></td>
      <td><p align="center">帐户姓名 </p></td>
      <td><p align="center">产品名称</p></td>
      <td><p align="center">持有份额</p></td>
      <td align="center">最新净值</td>
       <td align="center">最新市值</td>
      <td align="center">净值更新时间</td>
     </tr>
     <!-- 在这里开始循环输出数据 -->
     <c:choose>
     	<c:when test="${cshsList!=null }">
	     	<c:forEach items="${cshsList }" var="history">
				<tr>
					<td class="pl5">
						${sunnyCust.custno }
					</td>
					<td align="center">
						${sunnyCust.custname }
					</td>
					<td align="center">
						${history.fundname }
					</td>
					<td align="center">
						${history.holdshare }
					</td>
					<td align="center">
						${history.newnav }
					</td>
					<td align="center">
						<fmt:formatNumber value="${history.marketvalue }" type="number" pattern="#.0000"></fmt:formatNumber>
					</td>
					<td align="center">
						${history.initdate }
						<%--<fmt:formatDate value="${history.updatetime }" dateStyle="short" type="date" pattern="yyyy-MM-dd"/>
					--%></td>
				</tr>
	     	</c:forEach>
     	</c:when>
     	<c:otherwise>
     		<tr>
				<td colspan="7" class="pl5">
					没有数据
				</td>
		    </tr>
     	</c:otherwise>
     </c:choose>
     					 
  </table>
  <div class="pageBar">
				<form action="/sunnyCustAction.do?method=showCustshareHistory" method="post" id="navigatorForm">
					总共${totalPages }条，每页20条&nbsp;&nbsp;&nbsp;
				    <a href="/sunnyCustAction.do?method=showCustshareHistory&pageNumber=1">首页</a>   
				    <c:if test="${pageNumber>1}">  
				        <a href="/sunnyCustAction.do?method=showCustshareHistory&pageNumber=${pageNumber-1}">上一页</a>  
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
				        <a href="/sunnyCustAction.do?method=showCustshareHistory&pageNumber=${pageNumber+1}">下一页</a>  
				    </c:if>   
				    <a href="/sunnyCustAction.do?method=showCustshareHistory&pageNumber=${pageNumber}">末页</a>  
				</form> 
				
			</div>
  <div class="blank10"></div>
  <!--中侧sied结束--> 
    <!--右侧sied开始-->
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
    <div class="blank5"></div>
<jsp:include page="${contextPath}/commons/msbottom.jsp" />
<iframe width=174 height=189 name="gToday:normal:agenda.js" id="gToday:normal:agenda.js"
			src="${ctx}/js/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; left:-500px; top:0px;"> 

</body>
</html>