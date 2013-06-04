<%@ page contentType="text/html; charset=utf-8" language="java"	import="java.sql.*" errorPage=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
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
	<form name="searchForm" id="searchForm"	action="/nxsyQueryHisAction.do?method=listHisentrust" method="post">
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
										<tr>
											<td class="b">历史委托查询</td>
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
										    <th>委托日期</th>
											<th>委托时间</th>
											<th>流水号</th>
											<th>证券代码</th>
											<th>证券名称</th>											
											<th>转换比例</th>
											<th>委托数量</th>
											<th>成交数量</th>
											<th>委托状态</th>
											<th>委托方向</th>
										</tr>
										<c:choose>
											<c:when test="${not empty page.data}">
												<c:forEach var="item" items="${page.data}">
													<tr align="center" class="odd blue">
													    <td align="center">&nbsp; <c:out
																value="${item.init_date2}" /></td>
														<td align="center">&nbsp; <c:out
																value="${item.curr_time2}" /></td>
														<td align="center">&nbsp; <c:out
																value="${item.entrust_no}" /></td>
														<td align="center">&nbsp; <c:out
																value="${item.stock_code}" /></td>
														<td align="center">&nbsp; <c:out
																value="${fn:replace(item.stock_name, '股份', '份额')}" /></td>														
														<td align="center">&nbsp; <c:out
																value="${item.entrust_price}" /></td>
														<td align="center">&nbsp; <c:out
																value="${item.entrust_amount}" /></td>
														<td align="center">&nbsp; <c:out
																value="${item.business_amount}" /></td>
														<td align="center" >&nbsp;
							                              <c:if test="${item.entrust_status == 2}"> 已报 </c:if>
							                              <c:if test="${item.entrust_status == 5}"> 部撤 </c:if>
							                              <c:if test="${item.entrust_status == 6}"> 已撤</c:if>
							                              <c:if test="${item.entrust_status == 7}"> 部成</c:if>
							                              <c:if test="${item.entrust_status == 8}"> 已成</c:if>
							                              <c:if test="${item.entrust_status == 9}"> 废单</c:if>
							                            </td>
							                            <td align="center" >&nbsp;
							                              <c:if test="${item.entrust_bs == 1}"> 转入 </c:if>
							                              <c:if test="${item.entrust_bs == 2}"> 转出</c:if>
							                            </td>
													</tr>
												</c:forEach>
												<tr height="10" bgcolor="#FFFFFF">
													<td colspan="10"></td>
												</tr>
												<tr height="25">
													<td colspan="10" align="right" bgcolor="#FFFFFF"><c:out
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
													<td colspan="10" bgcolor="#FFFFFF">暂无数据</td>
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