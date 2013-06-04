<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<div class="content1">
	
	<h2 class="title line1 blue">
		看涨股份卖出委托申报
	</h2>
	<div id="sell_1001" class="overTable">
		<table class="content ">

			<tbody>
				<tr>
					<th>
						<input type="radio" disabled="disabled" />
					</th>
					<th>
						委托数量
					</th>
					<th>
						价格
					</th>
				</tr>
				<input type="hidden" id="pageNumber" name="pageNumber" value="1" />
				<tr>
					<c:choose>
						<c:when test="${not empty page2}">
							<c:forEach var="item" items="${page2}">
								<tr align="center" class="odd blue">
									<td>
										<input type="radio" name="sradio" value="${item.stock_code}"
											onclick="radio_click(1001,${item.remain_amount},${item.entrust_price},1)">
									</td>
									<td align="center">									
										&nbsp;<f:formatNumber value="${item.remain_amount }" pattern="#,##0" />
									</td>
									<td align="center">
										&nbsp;<f:formatNumber value="${item.entrust_price }" pattern="#,##0.000#" />
									</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="8" bgcolor="#FFFFFF">
									暂无数据
								</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tr>
			</tbody>
		</table>
	</div>
	<h2 class="title line1 red">
		<b style="margin-right: 5px;">最新净值:<f:formatNumber value="${data2.entrust_net_price_Rose }" pattern="#,##0.000#" /></b>
		<b style="margin-right: 5px;">成交价:<f:formatNumber value="${data2.entrust_deliver_price_Rose }" pattern="#,##0.000#" /></b>
	</h2>
	<h2 class="title line1 red">
		<b style="margin-right: 5px;">平均价:<f:formatNumber value="${data2.avg_price_Rose }" pattern="#,##0.000#" /></b>
	</h2>
	<!-- 
	<h2 class="title line1 red">		
		<b style="margin-right: 5px;">最高:<f:formatNumber value="${data2.max_price_Rose }" pattern="#,##0.000#" /></b>
		<b style="margin-right: 5px;">最低:<f:formatNumber value="${data2.min_price_Rose }" pattern="#,##0.000#" /></b>
	</h2>
	 -->
	<div class="overTable">
		<table class="content ">
			<tbody>
				<input type="hidden" id="pageNumber" name="pageNumber" value="1" />
				<input type="hidden" name="max_entrust_price_Rose"
					id="max_entrust_price_Rose" value="${data2.max_entrust_price_Rose}" />
				<input type="hidden" name="min_entrust_price_Rose"
					id="min_entrust_price_Rose" value="${data2.min_entrust_price_Rose}" />
				<input type="hidden" name="max_entrust_price_Drop"
					id="max_entrust_price_Drop" value="${data2.max_entrust_price_Drop}" />
				<input type="hidden" name="min_entrust_price_Drop"
					id="min_entrust_price_Drop" value="${data2.min_entrust_price_Drop}" />
				<!-- 股票 -->
				<!-- 股票 -->
				<input type="hidden" name="canuse_balance_1002"
					id="canuse_balance_1002" value="${data2.canuse_balance_1002}" />
				<input type="hidden" name="canuse_balance_1001"
					id="canuse_balance_1001" value="${data2.canuse_balance_1001}" />
				<tr>
					<c:choose>
						<c:when test="${not empty page1}">
							<c:forEach var="item" items="${page1}">

								<tr align="center" class="odd blue">
									<td>
										<input type="radio" name="sradio" value="${item.stock_code}"
											onclick="radio_click(1001,${item.remain_amount},${item.entrust_price},2)">
									</td>
									<td align="center">									
										&nbsp;<f:formatNumber value="${item.remain_amount }" pattern="#,##0" />
									</td>
									<td align="center">
										&nbsp;<f:formatNumber value="${item.entrust_price }" pattern="#,##0.000#" />
									</td>
								</tr>
							</c:forEach>

						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="8" bgcolor="#FFFFFF">
									暂无数据
								</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tr>
			</tbody>
		</table>
	</div>
	<h2 class="title line1 blue" style="margin-top:-24px;">
		看涨股份买入委托申报
	</h2>
</div>


<div class="content1 content2  ">
	
	<h2 class="title line1 blue">
		看跌股份卖出委托申报
	</h2>
	<div class="overTable" id="sell_1002">
		<table class="content content2">
			<tbody>
				<tr>
					<th>
						<input type="radio" disabled="disabled" />
					</th>
					<th>
						委托数量
					</th>
					<th>
						价格
					</th>

				</tr>

				<!-- 股票 -->
				<tr align="center" class="odd blue">
					<c:choose>
						<c:when test="${not empty page4}">
							<c:forEach var="item" items="${page4}">

								<tr align="center" class="odd blue">
									<td>
										<input type="radio" name="sradio" value="${item.stock_code}"
											onclick="radio_click(1002,${item.remain_amount},${item.entrust_price},1)">
									</td>
									<td align="center">									
										&nbsp;<f:formatNumber value="${item.remain_amount }" pattern="#,##0" />
									</td>
									<td align="center">
										&nbsp;<f:formatNumber value="${item.entrust_price }" pattern="#,##0.000#" />
									</td>
								</tr>

							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="8" bgcolor="#FFFFFF">
									暂无数据
								</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tr>
			</tbody>
		</table>
	</div>
	<h2 class="title line1 red">
		<b style="margin-right: 5px;">最新净值:<f:formatNumber value="${data2.entrust_net_price_Drop }" pattern="#,##0.000#" /></b>
		<b style="margin-right: 5px;">成交价:<f:formatNumber value="${data2.entrust_deliver_price_Drop }" pattern="#,##0.000#" /></b>
	</h2>
	<h2 class="title line1 red">
		
		<b style="margin-right: 5px;">平均价:<f:formatNumber value="${data2.avg_price_Drop }" pattern="#,##0.000#" /></b>
		
	</h2>
	<!-- 
	<h2 class="title line1 red">
		<b style="margin-right: 5px;">最低:<f:formatNumber value="${data2.min_price_Drop }" pattern="#,##0.000#" /></b>		
		<b style="margin-right: 5px;">最高:<f:formatNumber value="${data2.max_price_Drop }" pattern="#,##0.000#" /></b>
	</h2>
	 -->
	<div class="overTable">
		<table class="content content2">
			<tbody>
				<input type="hidden" id="pageNumber" name="pageNumber" value="1" />

				<!-- 股票 -->
				<tr align="center" class="odd blue">
					<c:choose>
						<c:when test="${not empty page3}">
							<c:forEach var="item" items="${page3}">

								<tr align="center" class="odd blue">
									<td>
										<input type="radio" name="sradio" value="${item.stock_code}"
											onclick="radio_click(1002,${item.remain_amount},${item.entrust_price},2)">
									</td>
									<td align="center">									
										&nbsp;<f:formatNumber value="${item.remain_amount }" pattern="#,##0" />
									</td>
									<td align="center">
										&nbsp;<f:formatNumber value="${item.entrust_price }" pattern="#,##0.000#" />
									</td>
								</tr>

							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="8" bgcolor="#FFFFFF">
									暂无数据
								</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tr>

			</tbody>
		</table>
	</div>
	<h2 class="title line1 blue" style="margin-top:-24px;">
		看跌股份买入委托申报
	</h2>
</div>

<script>
	var div = document.getElementById('sell_1001');
	div.scrollTop = div.scrollHeight;
</script>





