<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<META HTTP-EQUIV="pragma" CONTENT="no-cache">   
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">   
<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">  
<link href="${ctx }/match/nxsy/mncg/skin/default/css/global.css" rel="stylesheet" type="text/css">
<link href="${ctx }/match/nxsy/mncg/skin/default/css/font.css" 	rel="stylesheet" type="text/css">
<script src="${ctx }/match/nxsy/mncg/js/jquery-1.3.2.js" type="text/javascript"></script>
<script src="${ctx }/match/nxsy/mncg/js/page.js" type="text/javascript"></script>
</head>
<body>
	<div align="center">
		<div class="wrap" style="width:99%">
			<div class="alignleft " style="width: 60%">
				<div class="tb_wrap">
					<div class="tb_header">
						<div>
							<table cellspacing="0" cellpadding="0" class="title line1">
								<tbody>
									<tr>
										<td class="b">资产信息：</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<!-- end header -->
					<div class="tb_body">
						<div class="tb_content">

							<div class="alignleft " id="stockBox">
								<table class="bs">
									<tbody>
										<tr>
											<td class="lbg">客户编号:</td>
											<td colspan="3">
												<div>${data.client_id}</div></td>
										</tr>
										<tr>
											<td class="lbg">冻结母份额:</td>
											<td>
												<div><f:formatNumber value="${data.real_frozen_balance }" pattern="#,##0.0#" /></div></td>
											<td class="lbg">可用母份额:</td>
											<td><div><f:formatNumber value="${data.canuse_balance }" pattern="#,##0.0#" /></div>
											</td>
										</tr>
										<tr>
											<td class="lbg">当前母份额:</td>
											<td colspan="3">
												<div><f:formatNumber value="${data.total_balance }" pattern="#,##0.0#" /></div></td>
										</tr>
										<tr>
											<td class="lbg">当前市值:</td>
											<td>
												<div><f:formatNumber value="${data.market_value }" pattern="#,##0.0#" /></div></td>
											<td class="lbg">当前净值:</td>
											<td><div><f:formatNumber value="${data.net_market_value }" pattern="#,##0.0#" /></div>
											</td>
										</tr>
										<tr>											
											<td class="lbg">总资产:</td>
											<td ><div><f:formatNumber value="${data.asset }" pattern="#,##0.0#" /></div>
											</td>
											<td class="lbg">昨日排名:</td>
											<td><div>第${data.rank_num }名</div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<!-- end tb_body -->
					<div class="tb_footer">
						<div></div>
					</div>
					<!-- end tb_footer -->
					<div class="clear"></div>
				</div>
			</div>

			<div class="alignleft w1">
				<div class="tb_wrap">
					<div class="tb_header">
						<div>
							<table cellspacing="0" cellpadding="0" class="title line1">
								<tbody>
									<tr>
										<td class="b">持仓信息</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<!-- end header -->
					<div class="tb_body">
						<div class="tb_content yichu" id="contentBox">
					<jsp:include page="stock/stockHold.jsp"></jsp:include>		
						</div>
					</div>
					<!-- end tb_body -->
					<div class="tb_footer">
						<div></div>
					</div>
					<!-- end tb_footer -->
					<div class="clear"></div>
				</div>
			</div>

		</div>
	</div>
	<!-- end center -->


</body>
</html>