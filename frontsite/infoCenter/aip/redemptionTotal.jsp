<%@ page contentType="text/html; charset=utf-8" language="java"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<table width="100%" bordercolor="#cccccc" border="1" class="lh24 center">
      <tbody>
      <tr>
        <td class="tab_th1 bold">当前市值(元) </td>
        <td class="tab_th1 bold">赎回日期 </td>
        <td class="tab_th1 bold">赎回价格(元) </td>
        <td class="tab_th1 bold">赎回份额(份) </td>
        <td class="tab_th1 bold">赎回费用(元)</td>       
      </tr>
      <c:choose>
			<c:when test="${not empty data}">
				<tr align="center" class="bg_ec">
					<td align="center">&nbsp; <f:formatNumber value="${data.market_value }" pattern="#,##0.0#"/>
					</td>
					<td align="center">&nbsp; <c:out value="${data.init_date}" />
					</td>
					<td align="center">&nbsp; <c:out value="${data.last_price}" />
					</td>
					<td align="center">&nbsp; <f:formatNumber value="${data.sum_amount }" pattern="#,##0.0#"/>
					</td>
					<td align="center">&nbsp; <f:formatNumber value="${data.sell_fee }" pattern="#,##0.0#"/>
					</td>
				</tr>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="5" bgcolor="#FFFFFF">暂无数据</td>
				</tr>
			</c:otherwise>
		</c:choose>    								
      </tbody></table>