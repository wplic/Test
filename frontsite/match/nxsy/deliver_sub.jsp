<%@ page contentType="text/html; charset=utf-8" language="java"	import="java.sql.*" errorPage=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>




<html xmlns="http://www.w3.org/1999/xhtml">
<jsp:include page="${ctx }/match/nxsy/login_ok.jsp"></jsp:include>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<META HTTP-EQUIV="pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">
<link href="${ctx }/match/nxsy/mncg/skin/default/css/global.css" rel="stylesheet"	type="text/css">
<link href="${ctx }/match/nxsy/mncg/skin/default/css/font.css" rel="stylesheet"	type="text/css">
<script src="${ctx }/match/nxsy/mncg/js/jquery-1.3.2.js" type="text/javascript"></script>
<script src="${ctx }/match/nxsy/mncg/js/page.js" type="text/javascript"></script>
<style>
		.content{width:100%; font-size:13px; vertical-align:middle; line-height:19px;text-align:center; } /**min-width:700px;*/
		.content th{background:url(${ctx }/match/nxsy/mncg/skin/default/pic/th_line.jpg) repeat-x; text-align:center; line-height:21px;border:1px solid #BEC8D4;}
		.content td{border:1px solid #BEC8D4;padding:0 2px;}
		.content .odd{ background-color:#FFFFFF; }
		.content .even{ background-color:#F1F1F1;}
		.content .selected{ background-color:#FBFFDA; }
		.content .hover{ background-color:#D3DAE2;}
</style>
</head>
<script language="javascript">
	function refresh()
	{
		document.forms.searchForm.submit();
	}


</script>
<body style="margin-top:0px;">
	<form name="searchForm" id="searchForm"	action="/nxsyQueryAction.do?method=listDeliver" method="post">
	<input type="hidden" vaule="">
		<script>
		  	var errorMsg="${errorMsg}";
		  	if(errorMsg!=""){
		  		alert(errorMsg);
		  	}
		</script>
		<input type="hidden" id="pageNumber" name="pageNumber" value="1" />
		<input type="hidden" id="numPerPage" name="numPerPage" value="2" />
		<input type="hidden" id="chooseSuburl" name="chooseSuburl" value="yes" />
		<div align="center">
			<div class="wrap" style="width:99%">

				<div class="alignleft w1">
					<div class="tb_wrap">
						
						<!-- end header -->
						<div class="tb_body">
							<div class="tb_content yichu" id="contentBox" style="height:auto;">
								<table class="content">
									<tbody>
										<tr>
											<th>流水号</th>
											<th>证券代码</th>
											<th>证券名称</th>
											<th>成交日期</th>
											<th>成交时间</th>
											<th>成交数量</th>
											<th>转换比例</th>
											<th>成交金额</th>
											<th>成交方向</th>
											<th>对方委托号</th>
										</tr>
										<c:choose>
											<c:when test="${not empty page.data}">
												<c:forEach var="item" items="${page.data}">
													<tr align="center" class="odd blue">
														<td align="center">&nbsp; <c:out
																value="${item.serial_no}" /></td>
														<td align="center">&nbsp; <c:out
																value="${item.stock_code}" /></td>
														<td align="center">&nbsp; <c:out
																value="${fn:replace(item.stock_name, '股份', '份额')}" /></td>
														<td align="center">&nbsp; <c:out
																value="${item.init_date2}" /></td>
														<td align="center">&nbsp; <c:out
																value="${item.curr_time2}" /></td>
														<td align="center">&nbsp; <c:out
																value="${item.business_amount}" /></td>
														<td align="center">&nbsp; <c:out
																value="${item.entrust_price}" /></td>
														<td align="center">&nbsp; <c:out
																value="${item.business_price}" /></td>
							                            <td align="center" >&nbsp;
							                              <c:if test="${item.entrust_bs == 1}"> 转入 </c:if>
							                              <c:if test="${item.entrust_bs == 2}"> 转出</c:if>
							                            </td>
							                            <td align="center">&nbsp; <c:out
																value="${item.report_no}" /></td>
													</tr>
												</c:forEach>
												
											</c:when>
											<c:otherwise>
												<tr>
													<td colspan="10" bgcolor="#FFFFFF">暂无数据</td>
												</tr>
											</c:otherwise>
										</c:choose>
									</tbody>
								</table>
					<div style="width: 100%; margin-top: 5px;" align="right">
					<c:out value="${linkStr}" escapeXml="false"></c:out>
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

			</div>
		</div>
		<!-- end center -->
	</form>
	<script type="text/javascript">
		$("#stock_code option[value='${data.stock_code}']").attr("selected", true);
		$("#entrust_bs option[value='${data.entrust_bs}']").attr("selected", true);
		$("#select_order option[value='${data.select_order}']").attr("selected", true);
	</script>

</body>
</html>