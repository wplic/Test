<%@ page contentType="text/html; charset=utf-8" language="java"	import="java.sql.*" errorPage=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<jsp:include page="${ctx }/match/nxsy/commons/head.jsp"></jsp:include>
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
<style type="text/css">
<!--
.aff {
	color: #0000CC;
	text-decoration: underline;
}
-->
</style>
</head>
<script language="javascript">
	function refresh()
	{
		document.forms.searchForm.submit();
	}
	function godownload(url,_id){
	location.href=url;
	var ccount=0;
	ccount=document.getElementById("hid"+_id).value;
	document.getElementById("hid"+_id).value=Number(ccount)+1;
	document.getElementById("downcount"+_id).innerHTML=Number(ccount)+1;
	}
</script>
<body>
	<form name="searchForm" id="searchForm"	action="${contextPath}/nxsy/web/NxsyMicroCommentAction.go?function=FrontShowItems" method="post">
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
											<td class="b">微点评</td>
											<td>开始日期:<input style="width: 100px;" class="Wdate" name="begin_date" id="begin_date"
											value="${data.begin_date }" type="text" onClick="WdatePicker()"></td>
											<td>结束日期:<input style="width: 100px;" class="Wdate" name="end_date" id="end_date"
											value="${data.end_date }" type="text" onClick="WdatePicker()"></td>
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
								<table class="content" >
									<tbody>
										<tr>
											<th nowrap="nowrap">主题</th>
											<th nowrap="nowrap">简介</th>
											<th nowrap="nowrap">创建时间</th>
											<th nowrap="nowrap">下载次数</th>
										</tr>
										<c:choose>
											<c:when test="${not empty page.data}">
												<c:forEach var="item" varStatus="status" items="${page.data}">
													<tr align="center" class="odd blue">

														<td align="center">&nbsp;
														<c:if test="${item.attachmentid!=-1}">
														<a  class="aff" onclick="godownload('${contextPath}/match/nxsy/micro_show_file.jsp?id=${item.id}','${item.id}')" href="#" >
														<c:if test="${fn:indexOf(item.filename,'.')!=-1}">
														<c:set var="data" value="${fn:split(item.filename,'.')}"></c:set>
														<c:set var="count" value="${fn:length(data)}"></c:set>
														<c:set var="charcount" value="${fn:length(item.filename)}"></c:set>
														<c:set var="midcharcount" value="${fn:length(data[count-1])}"></c:set>
														<c:set var="endcount" value="${charcount-midcharcount}"></c:set>
														${fn:substring(item.filename,0,endcount-1)}
														</c:if>
														<c:if test="${fn:indexOf(item.filename,'.')==-1}">
														${item.filename}
														</c:if>
														</a>
														</c:if>
															<c:if test="${item.attachmentid==0}">
														<c:out value="${item.filename}" />
														</c:if>

														</td>
														<td align="center">&nbsp; ${item.remark}</td>
														<td align="center">&nbsp;
																<c:if test="${fn:length(item.createdate)==8}">
																${fn:substring(item.createdate,0,4)}年${fn:substring(item.createdate,4,6)}月${fn:substring(item.createdate,6,8)}日
																</c:if>
																<c:if test="${fn:length(item.createdate)!=8}">
																<c:out
																value="${item.createdate}" />
																</c:if>
																<input type="hidden" id="hid${item.id}" value="${item.downloadcount}">
																</td>
														<td align="center">
														<div id="downcount${item.id}">${item.downloadcount}</div>
														&nbsp;

													</tr>
												</c:forEach>
												<tr height="5" bgcolor="#FFFFFF">
													<td colspan="4"></td>
												</tr>
												<tr height="5">
													<td colspan="4" align="right" bgcolor="#FFFFFF"><c:out
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
													<td colspan="4" bgcolor="#FFFFFF">暂无数据</td>
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