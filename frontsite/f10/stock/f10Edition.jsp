<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@include file="/commons/taglibs.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
</head>

<body class="body_bg">
<jsp:include page="/share/top.jsp?nav=zxzx" />
<div class="main">
  <div class="dqwz">当前位置：首页 > 个股 > 发行分配</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">  
  <div class="iptvside_top"></div>
  <div class="iptvside_mid">
	  <jsp:include page="/f10/stock/stockF10_lmenu.jsp">
			<jsp:param name="menu" value="9" />
	  </jsp:include>
  </div>
  <div class="iptvside_bot"></div>
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w706 fright">
  <div class="left_tit2">${name}(${stockCode})发行分配</div> 
    <div class="blank10"></div>
    <table border="1" class=" tab_pl5 f10_tab01" bordercolor="#cccccc" width="100%">
      <tr>
        <th class="bold lh30">股票配股： </th>
      </tr>
      <tr>
        <td>
        <table width="95%" align="center" border="0" class="mtb10">
          <tr class="red">
            <td class="f10_tab02">配股年度</td>
            <td class="f10_tab02"><strong>配股对象</strong></td>
            <td class="f10_tab02"><strong>配股比例</strong></td>
            <td class="f10_tab02"><strong>募集净额</strong></td>
            <td class="f10_tab02"><strong>配股上市日</strong></td>
            <td class="f10_tab02"><strong>保荐机构</strong></td>
            </tr>
         <c:if test="${empty assignStockList}">
			<tr class="tab_xuxian25">
				<td colspan="6" align="center">暂无配股信息</td>
			</tr>
		  </c:if>
          <c:if test="${not empty assignStockList}">
			<c:forEach var="assignStock" items="${assignStockList}">
			 <c:set var="increaseIssueDate1"><fmt:formatDate value="${assignStock.assignMarketDate}" pattern="yyyy-MM-dd" /></c:set>
				<tr class="tab_xuxian25">
					<td><fmt:formatDate value="${assignStock.assignYear}" pattern="yyyy-MM-dd"/></td>
					<td>&nbsp;${assignStock.assignObject}</td>
					<td>&nbsp;<fmt:formatNumber value="${assignStock.assignProportion}"  pattern="0.00"/></td>
					<td>&nbsp;<fmt:formatNumber value="${assignStock.collectIncome}" pattern="#,#00.#"/>	</td>
					<td><c:if test='${increaseIssueDate1!="1900-01-01"}'>${increaseIssueDate1}</c:if>&nbsp;</td>
					<td>&nbsp;${assignStock.sponsorAgency}</td>
				</tr>
			</c:forEach>		  			
           </c:if>
        </table></td>
      </tr>
      <tr>
        <td height="5" class="bg_ec"></td>
      </tr>
      <tr>
        <th class="bold lh30">股票增发：</th>
      </tr>
      <tr>
        <td><table width="95%" align="center" border="0" class="mtb10">
          <tr class="red">
            <td class="f10_tab02">增发年度</td>
            <td class="f10_tab02">募集净额</td>
            <td class="f10_tab02">增发价格</td>
            <td class="f10_tab02">增发上市日</td>
            </tr>
            
             <c:if test="${empty increaseIssueStockList}">
				<tr class="tab_xuxian25">
					<td colspan="4" align="center">暂无股票增发信息</td>
				</tr>
              </c:if>

              <c:if test="${not empty increaseIssueStockList}">
				<c:forEach var="increaseIssueStock" items="${increaseIssueStockList}">
				  <c:set var="increaseIssueDate"><fmt:formatDate value="${increaseIssueStock.increaseIssueDate}" pattern="yyyy-MM-dd" /></c:set>
	              <tr class="tab_xuxian25">
	                <td><fmt:formatDate value="${increaseIssueStock.increaseIssueYear}" pattern="yyyy-MM-dd"/></td>
	                <td>&nbsp;<fmt:formatNumber value="${increaseIssueStock.increaseIncome}" pattern="#,#00.#"/>	</td>
	                <td>&nbsp;<fmt:formatNumber value="${increaseIssueStock.increaseIssuePrice}"  pattern="0.00"/></td>
	                <td>&nbsp;<c:if test='${increaseIssueDate!="1900-01-01"}'>${increaseIssueDate}</c:if></td>
	              </tr>		  			
				</c:forEach>
              </c:if>
         
        </table></td>
      </tr>
    </table>
    
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="/share/bottom.jsp" />
</body>
</html>