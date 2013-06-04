<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<table width="100%" bordercolor="#cccccc" border="1" class="lh24 center">
	<tbody>
		<tr>
			<td class="tab_th1 bold">赎回所得(元)</td>
			<td class="tab_th1 bold">累计红利(元)</td>
			<td class="tab_th1 bold">累计转投(份)</td>
			<td class="tab_th1 bold">定投总收益(元)</td>
			<td class="tab_th1 bold">定投总收益率</td>
		</tr>
		<c:choose>
			<c:when test="${not empty data}">
				<tr align="center" class="bg_ec">
					<td align="center">&nbsp; <f:formatNumber value="${data.sell_balance }" pattern="#,##0.0#"/>
					</td>
					<td align="center">&nbsp; <f:formatNumber value="${data.sum_abonus }" pattern="#,##0.0#"/>
					</td>
					<td align="center">&nbsp; <f:formatNumber value="${data.sum_abonus_pt }" pattern="#,##0.0#"/>
					</td>
					<td align="center">&nbsp; <f:formatNumber value="${data.profit }" pattern="#,##0.0#"/>
					</td>
					<td align="center">&nbsp; <c:out value="${data.profit_rate}" />
					</td>
				</tr>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="5" bgcolor="#FFFFFF">暂无数据</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</tbody>
</table>