<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<table width="100%" bordercolor="#cccccc" border="1" class="lh24 center">
	<tbody>
		<tr>
			<td class="tab_th1 bold">投入本金</td>
			<td class="tab_th1 bold">定投日期</td>
			<td class="tab_th1 bold">当天净值</td>
			<td class="tab_th1 bold">购得份额</td>
			<td class="tab_th1 bold">累计份额</td>
			<td class="tab_th1 bold">收益率</td>
		</tr>
		<c:choose>
			<c:when test="${not empty detail_list}">
				<c:forEach var="item" items="${detail_list}">
					<tr align="center" class="bg_ec">
						<td align="center">&nbsp; <c:out value="${item.money}" /></td>
						<td align="center">&nbsp; <c:out value="${item.init_date}" />
						</td>
						<td align="center">&nbsp; <c:out value="${item.last_price}" />
						</td>
						<td align="center">&nbsp; <f:formatNumber
								value="${item.buy_amount }" pattern="#,##0.0#" /></td>
						<td align="center">&nbsp; <f:formatNumber
								value="${item.sum_amount }" pattern="#,##0.0#" /></td>
						<td align="center">&nbsp; <c:out value="${item.profit_rate}" />
						</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="8" bgcolor="#FFFFFF">暂无数据</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</tbody>
</table>