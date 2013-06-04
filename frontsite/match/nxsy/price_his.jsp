<%@ page contentType="text/html; charset=utf-8" language="java"	import="java.sql.*" errorPage=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<jsp:include page="${ctx }/match/nxsy/login_ok.jsp"></jsp:include>
<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<META HTTP-EQUIV="pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">
<link href="${ctx }/match/nxsy/mncg/skin/default/css/global.css" rel="stylesheet"	type="text/css">
<link href="${ctx }/match/nxsy/mncg/skin/default/css/font.css" rel="stylesheet"	type="text/css">
<script src="${ctx }/match/nxsy/mncg/js/jquery-1.3.2.js" type="text/javascript"></script>
<script src="${ctx }/match/nxsy/mncg/js/page.js" type="text/javascript"></script>
<script src="${ctx }/financing/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
</head>
<script language="javascript">
	function refresh()
	{
		document.forms.searchForm.submit();
	}
</script>
<body>
	<form name="searchForm" id="searchForm"	action="/nxsyQueryHisAction.do?method=listHisprice" method="post">
		<script>
		  	var errorMsg="${errorMsg}";
		  	if(errorMsg!=""){
		  		alert(errorMsg);
		  	}
		</script>
		<input type="hidden" id="pageNumber" name="pageNumber" value="1" />
		<div align="center">
			<div class="wrap" style="width:99%">

				<div class="alignleft w1">
					<div class="tb_wrap">
						<div class="tb_header">
							<div>
								<table cellspacing="0" cellpadding="0" class="title line1">
									<tbody>
										<tr class="deliver_his_search">
											<td class="b">历史净值</td>
											<td>开始日期:<input class="Wdate" name="begin_date" id="begin_date"
											value="${data.begin_date }" type="text" onClick="WdatePicker()"></td>
											<td>结束日期:<input class="Wdate" name="end_date" id="end_date"
											value="${data.end_date }"
											type="text" onClick="WdatePicker()"></td>
											<td>
                                         <input type="submit" class="but_01" value="查询" id="button1" name="button1">
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<!-- end header -->
						<div class="tb_body">
							<div class="tb_content yichu" id="contentBox" style="height:auto;">
								<table class="content">
									<tbody>
										<tr>
										    <th>日期</th>
											<th>看涨份额净值</th>
											<th>看涨份额收盘转换比例</th>
											<th>看跌份额净值</th>
											<th>看跌份额收盘转换比例</th>
											<th>沪深300</th>
											<th>沪深300涨幅</th>
										</tr>
										<c:choose>
											<c:when test="${not empty page.data}">
												<c:forEach var="item" items="${page.data}">
													<tr align="center" class="odd blue">
													    <td align="center">&nbsp; <c:out
															   value="${item.init_date2}" /></td>
														<td align="center">&nbsp; <c:out
																value="${item.price_1001}" /></td>
														<td align="center">&nbsp; <c:out
																value="${item.deliver_price_1001}" /></td>
														<td align="center">&nbsp; <c:out
																value="${item.price_1002}" /></td>
														<td align="center">&nbsp; <c:out
																value="${item.deliver_price_1002}" /></td>
														<td align="center">&nbsp; <c:out
																value="${item.price_300}" /></td>
														<td align="center">&nbsp; <c:out
																value="${item.rose_300}" /></td>
													</tr>
												</c:forEach>
												<tr height="5" bgcolor="#FFFFFF">
													<td colspan="7"></td>
												</tr>
												<tr height="5">
													<td colspan="7" align="right" bgcolor="#FFFFFF"><c:out
															value="${linkStr}" escapeXml="false"></c:out>
														&nbsp;&nbsp; 跳到 <input type=text name=jump id=jump size=3
														style="text-align:center" value='${page.currentPage}'>
														页&nbsp; <img border="0"
														src="${ctxPath }/match/nxsy/mncg/skin/default/pic/button020.gif" width="26"
														height="24" style="cursor:pointer;"
														onclick="javascript:checkPage(${page.totalPages});">
													</td>
												</tr>
											</c:when>
											<c:otherwise>
												<tr>
													<td colspan="7" bgcolor="#FFFFFF">暂无数据</td>
												</tr>
											</c:otherwise>
										</c:choose>
									</tbody>
								</table>
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

</body>
</html>