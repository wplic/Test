<%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.cssweb.common.util.PageUtil"%>
<%@ include file="/commons/turnPage.jsp"%>
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
			<jsp:param name="menu" value="11" />
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
      <td class="font14 bold lh30 font_st red">·持仓调整</td>
      <td align="right">
   <html:form action="/fund.do?method=getPositionAdjustmentByCodeAndDate" method="post" styleId="fundForm">
     <html:select property="endDate" styleId="endDate" onchange="document.fundForm.submit();">
              	<html:options collection="dateList" property="endDateString"
								labelProperty="endDateString" />
				<%List list = (List)request.getAttribute("dateList");
				  if(list==null || list.size()==0){
				  %>
				  <html:option value="">=请选择=</html:option>
				  <%
				  } 
				 %>
              </html:select>
    </html:form> 
</td>
    </tr>
  </table>
</div>
<table border="1" class="lh24 center" bordercolor="#cccccc" width="100%" id="tabs11">
  <tr>
    <td width="16%" class="tab_th1 bold">证券名称 </td>
    <td width="15%" class="tab_th1 bold">证券代码</td>
    <td width="16%" class="tab_th1 bold">变动类别</td>
    <td width="19%" class="tab_th1 bold">增加市值（万元）</td>
    <td width="19%" class="tab_th1 bold">剔除市值（万元）</td>
    <td width="15%" class="tab_th1 bold">截止日期</td>
    </tr>
   <c:forEach items="${positionAdjustmentList}" var="bean">
              <tr>
                <td>
					<c:choose>
						<c:when test="${empty bean.secName}">&nbsp;</c:when>
						<c:otherwise>
							<bean:write name="bean" property="secName" />
						</c:otherwise>
					</c:choose>                
                </td>
                                <td>
					<c:choose>
						<c:when test="${empty bean.secCode}">&nbsp;</c:when>
						<c:otherwise>
							<bean:write name="bean" property="secCode" />
						</c:otherwise>
					</c:choose>                
                </td>
                <td>
					<c:choose>
						<c:when test="${empty bean.changeStyle}">&nbsp;</c:when>
						<c:otherwise>
							<bean:write name="bean" property="changeStyle" />
						</c:otherwise>
					</c:choose>                
                </td>
                <td>
					<c:choose>
						<c:when test="${empty bean.addMarketValue}">&nbsp;</c:when>
						<c:otherwise>
							<bean:write name="bean" property="addMarketValue" format="###,##0.00"/>
						</c:otherwise>
					</c:choose>                
                </td>
                                <td>
					<c:choose>
						<c:when test="${empty bean.recMarketValue}">&nbsp;</c:when>
						<c:otherwise>
							<bean:write name="bean" property="recMarketValue" format="###,##0.00"/>
						</c:otherwise>
					</c:choose>                
                </td>
                <td>
					<c:choose>
						<c:when test="${empty bean.endDate}">&nbsp;</c:when>
						<c:otherwise>
							<bean:write name="bean" property="endDate"  format="yyyy-MM-dd" />
						</c:otherwise>
					</c:choose>                
                </td>                                    
                </tr>
               </c:forEach>
  </table>
<div class="lh30 textcenter">
<form action="/fund.do?method=getPositionAdjustmentByCodeAndDate&gpdm=${fundCode}" method="post" id="relationForm">					
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