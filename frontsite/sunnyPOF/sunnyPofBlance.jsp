<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@page import="com.cssweb.collect.pojo.BalFund"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.fortuneage.sunnyPOF.pojo.SunnyCust"%>
<%@page import="java.util.List"%>
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
	 	<jsp:param value="zhyexx" name="menu"/>
	 </jsp:include>
  </div>
  <!--左侧sied结束-->
   
  <!--中侧sied开始-->
  <div class="w706 fright">
  <div class="comtit1">
    <h4>账户余额信息</h4></div>
  <div class="blank10"></div>
  <table border="1" bordercolor="#cccccc" width="98%" align="center" class="lh24 mt10">
    <tr class="rrtab_tt bold">
      <td><p align="center">产品名称</p></td>
      <td align="center">最新市值</td>
      <td><p align="center">持有份额</p></td>
      <td align="center">最新净值</td>
      <td align="center">净值更新时间</td>
      <td align="center">投资顾问</td>
      <td align="center">信托公司</td>
      <td align="center">保管银行</td>
      
     </tr>
    <!-- 这里开始循环 -->
    <c:choose>
    	<c:when test="${hsbList!=null }">
    		<c:forEach items="${hsbList }" var="hsb">
   				<tr>
					<td align="center">
						${hsb.fundname }
					</td>
					
					<td align="center">
						<fmt:formatNumber value="${hsb.marketvalue }" type="number" pattern="#.0000"></fmt:formatNumber>
					</td>
					<td align="center">
						${hsb.holdshare }
					</td>
					
					<td align="center">
					   	${hsb.newnav }
					</td>
					<td align="center">
						${hsb.initdate }
					</td>
					
					<td align="center">
						${hsb.str }
					</td>
					<td align="center">
						${hsb.fxjg }
					</td>
					<td align="center">
						${hsb.bgyh }
					</td>
					  
					
					
					
					
					
			    </tr>
    		</c:forEach>
    	</c:when>
    	<c:otherwise>
    		<tr>
    			<td align="center" colspan="7">暂时没有记录</td>
    		</tr>
    	</c:otherwise>
    </c:choose>
  </table>
  
  </div>
  <!--中侧sied结束--> 
    <!--右侧sied开始-->
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
    <div class="blank5"></div>
<jsp:include page="${contextPath}/commons/msbottom.jsp" />
</body>
</html>