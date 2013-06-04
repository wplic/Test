<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<table width="100%" bordercolor="#cccccc" border="1" class="lh24 center">
	<tbody>
		<tr>
			<td class="tab_th1 bold">日期</td>
			<td class="tab_th1 bold">分红(或拆分比例)</td>
			<td class="tab_th1 bold">参与份额(份)</td>
			<td class="tab_th1 bold">现金分红(元)</td>
			<td class="tab_th1 bold">转投(份)</td>
		</tr>
		<c:choose>
			<c:when test="${not empty abonus_list}">
				<c:forEach var="item" items="${abonus_list}">
					<tr align="center" class="bg_ec">
						<td align="center">&nbsp; <c:out value="${item.init_date}" />
						</td>
						<td align="center">&nbsp; <c:out value="${item.abonus_rate}" />
						</td>
						<td align="center">&nbsp; <f:formatNumber
								value="${item.sum_amount }" pattern="#,##0.0#" /></td>
						<td align="center">&nbsp; <f:formatNumber
								value="${item.abonus }" pattern="#,##0.0#" /></td>
						<td align="center">&nbsp; <f:formatNumber
								value="${item.pt_amount }" pattern="#,##0.0#" /></td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="5" bgcolor="#FFFFFF">暂无数据</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</tbody>
</table>