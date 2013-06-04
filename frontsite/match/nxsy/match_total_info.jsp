<%@ page contentType="text/html; charset=utf-8" language="java"	import="java.sql.*" errorPage=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<jsp:include page="${ctx }/match/nxsy/login_ok.jsp"></jsp:include>
<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">

<META HTTP-EQUIV="pragma" CONTENT="no-cache">   
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">   
<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT"> 
<link href="${ctx }/match/nxsy/mncg/skin/default/css/global.css" rel="stylesheet" type="text/css">
<link href="${ctx }/match/nxsy/mncg/skin/default/css/font.css"	rel="stylesheet" type="text/css">
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
	<form name="searchForm" id="searchForm"	action="${contextPath}/nxsy/web/NxsyQueryMaAction.go?function=ListTotalInfo" method="post">
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
											<td class="b">竞赛榜排名</td>
											<td>排名日期:<input style="width: 100px;"  class="Wdate" name="begin_date" id="begin_date"
											value="${data.begin_date }" type="text" onClick="WdatePicker()"></td>
											<td>昵称:<input style="border: 1px solid #999999; width: 100px;" name="nick_name" id="nick_name"
											value="${data.nick_name }" type="text" ></td>
											<td>营业部:<input style="border: 1px solid #999999; width: 100px;"  name="branch_name" id="branch_name"
											value="${data.branch_name }" type="text" ></td>
											<td>推荐人:<input style="border: 1px solid #999999; width: 100px;" name="recommend_name" id="recommend_name"
											value="${data.recommend_name }" type="text" ></td>
											
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
										    <th nowrap="nowrap">排名</th>
											<th nowrap="nowrap">参赛编号</th>
											<th nowrap="nowrap">昵称</th>
											<th nowrap="nowrap">营业部</th>
											<th nowrap="nowrap">累计收益率</th>
											<th nowrap="nowrap">日期</th>
										</tr>
										<c:choose>
											<c:when test="${not empty page2.data}">
												<c:forEach var="item" varStatus="status" items="${page2.data}">
													<tr align="center" class="odd blue">
													    <td align="center">&nbsp; <c:out
															   value="${item.no}" /></td>
														<td align="center">&nbsp; <c:out
																value="${item.client_id}" /></td>
														<td align="center">&nbsp; <c:out
																value="${item.nick_name}" /></td>
														<td align="center">&nbsp; <c:out
																value="${item.branch_name}" /></td>
														<td align="center">&nbsp; <f:formatNumber value="${item.profitrate_total}" type="number" pattern="0.00%"/></td>
														<td align="center">&nbsp; <c:out
															   value="${item.init_date}" /></td>
													</tr>
												</c:forEach>
												<tr height="5" bgcolor="#FFFFFF">
													<td colspan="7"></td>
												</tr>
												<tr height="5">
													<td colspan="7" align="right" bgcolor="#FFFFFF"><c:out
															value="${linkStr}" escapeXml="false"></c:out>
														&nbsp;&nbsp; 跳到 <input type=text name=jump id=jump size=3
														style="text-align:center" value='${page2.currentPage}'>
														页&nbsp; <img border="0"
														src="${ctxPath }/match/nxsy/mncg/skin/default/pic/button020.gif" width="26"
														height="24" style="cursor:pointer;"
														onclick="javascript:checkPage(${page2.totalPages});">
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
																
						<!-- end tb_body2 -->
						
						
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