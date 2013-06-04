<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<META HTTP-EQUIV="pragma" CONTENT="no-cache">   
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">   
<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT"> 
<input type="hidden" id="pageNumber" name="pageNumber" value="1" />

<table class="content">
	<tbody>
		<tr>
			<th align="center">证券名称</th>
			<th align="center">冻结数量</th>
			<th align="center">可用数量</th>
			<th align="center">总数量</th>
			<th align="center">持仓成本</th>
			<th align="center">净值盈亏</th>			
			<th align="center">净值增长率</th>
			<th align="center">市值收益率</th>
			<th align="center">净值</th>
			<th align="center">市值</th>						
			<th align="center">操作</th>
		</tr>
		<input type="hidden" id="pageNumber" name="pageNumber" value="1" />
		<input type="hidden" name="valid_entrust_1001_buy"
			id="valid_entrust_1001_buy" value="${data_valid.valid_entrust_1001_buy}" />
		<input type="hidden" name="valid_entrust_1001_sell"
			id="valid_entrust_1001_sell" value="${data_valid.valid_entrust_1001_sell}" />
		<input type="hidden" name="valid_entrust_1002_buy"
			id="valid_entrust_1002_buy" value="${data_valid.valid_entrust_1002_buy}" />
		<input type="hidden" name="valid_entrust_1002_sell"
			id="valid_entrust_1002_sell" value="${data_valid.valid_entrust_1002_sell}" />
		<input type="hidden" name="one_entrust_1001_buy"
			id="one_entrust_1001_buy" value="${data_valid.buy_1001}" />
		<input type="hidden" name="one_entrust_1001_sell"
			id="one_entrust_1001_sell" value="${data_valid.sell_1001}" />
		<input type="hidden" name="one_entrust_1002_buy"
			id="one_entrust_1002_buy" value="${data_valid.buy_1002}" />
		<input type="hidden" name="one_entrust_1002_sell"
			id="one_entrust_1002_sell" value="${data_valid.sell_1002}" />
		<c:choose>
		
					
			<c:when test="${not empty stockpage.data}">
				<c:forEach var="item" items="${stockpage.data}">
					<c:choose>
					<c:when test="${fn:contains(item.profit_rate,'-')}">
						<tr align="center" class="odd green">
					</c:when>
					<c:when test="${item.profit_rate   ==   '0'}">
						<tr align="center" class="odd blue">
					</c:when>
					<c:otherwise>
						<tr align="center" class="odd red">
					</c:otherwise>
    				</c:choose>
						<td align="center">&nbsp; <c:out value="${fn:replace(item.stock_name, '股份', '份额')}" />
						</td>
						<td align="center">&nbsp; <f:formatNumber value="${item.real_frozen_balance }" pattern="#,##0.0#" /></td>
						<td align="center">&nbsp;<f:formatNumber value="${item.remain_balance }" pattern="#,##0.0#" /> </td>
						<td align="center">&nbsp; <f:formatNumber value="${item.total_balance }" pattern="#,##0.0#" />
						</td>
						<td align="center">&nbsp; <c:out value="${item.cost_price}" />
						</td>
						<td align="center">&nbsp; <c:out value="${item.profit}" />
						</td>
						
						<td align="center">&nbsp;<f:formatNumber value="${item.net_profit_rate }" pattern="#,##0.0#" />%
						</td>
						<td align="center">&nbsp;<f:formatNumber value="${item.profit_rate }" pattern="#,##0.0#" />%
						</td>
						<td align="center">&nbsp;  <f:formatNumber value="${item.net_market_value }" pattern="#,##0.0#" />
						</td>
						<td align="center">&nbsp; <f:formatNumber value="${item.market_value }" pattern="#,##0.0#" />
						</td>
						<td align="center">&nbsp; 
						<a style="text-decoration:underline;color:blue;" href="${ctx }/nxsyBSAction.do?method=listBuy&stock_code=${item.stock_code}&trade_dir=trade_in&entrust_price=${item.net_price}">转入</a>&nbsp;&nbsp;
						<a style="text-decoration:underline;color:blue;" href="${ctx }/nxsyBSAction.do?method=listBuy&stock_code=${item.stock_code}&trade_dir=trade_out&entrust_price=${item.net_price}">转出</a>&nbsp;&nbsp;
						</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="11" bgcolor="#FFFFFF">暂无数据</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</tbody>
</table>