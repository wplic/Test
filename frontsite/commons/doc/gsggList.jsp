<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="com.cssweb.common.util.DataRow"%>
<%@page import="com.cssweb.common.doc.DocService"%>
<%@page import="com.cssweb.common.util.DataPage"%>
<%@ include file="/commons/taglibs.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title></title>
		<style type="text/css">
.select {
	left: -2px;
	top: -2px;
	font-size: 12px;
	width: 80px;
	line-height: 18px;
	BORDER: #B5B8C8 1px solid;
	color: #909993;
	top: -2px;
	font-size: 13px;
	width: 104px;
	line-height: 18px;
	BORDER: #B5B8C8 1px solid;
	color: #909993;
}

.doc_input {
	width: 80px;
	background: #FFFFFF
		url("${contextPath }/images/branchcomp/time_btn.jpg") no-repeat;
	padding-left: 23px;
	BORDER: #B5B8C8 1px solid;
	FONT-SIZE: 13px;
	COLOR: #000000;
	HEIGHT: 18px
}

.title_input {
	width: 210px;
	BORDER: #B5B8C8 1px solid;
	FONT-SIZE: 13px;
	COLOR: #000000;
	HEIGHT: 18px
}
#search {
	position:absolute;
	left:255px;
	top:59px;
	width:540px;
	height:43px;
	z-index:10;
}
.doc1{ background:url(/pic/commons/comtit1.jpg) repeat-x; height:100px; overflow:hidden;}
.doc1 h4{ background:url(/pic/commons/comtitp1.jpg) no-repeat; padding-left:27px; padding-top:11px;font-weight:bold}
*html .doc1 h4{ background:url(/pic/commons/comtitp1.jpg) no-repeat; padding-left:27px; padding-top:12px;font-weight:bold}
*+html .doc1 h4{ background:url(/pic/commons/comtitp1.jpg) no-repeat; padding-left:27px; padding-top:12px;font-weight:bold}

</style>
		<script src="${ctx }/financing/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<link href="${ctx }/css/investorNexus/investorNexus.css" rel="stylesheet" type="text/css" />
		<link href="${ctx }/css/style.css" rel="stylesheet" type="text/css" />
		<script src="${ctx }/commons/js/page.js"
			type="text/javascript"></script>
		<script language="javascript">	
	function refresh()
	{
		document.forms.searchForm.submit(); 
	}
</script>
	</head>
	<body>

		<form name="searchForm" id="searchForm"
			action="${ctx }/gsgg/web/GsggAction.go?function=InitList"
			method="post">
			<input type="hidden" id="pageNumber" name="pageNumber" value="1" />
			<input type="hidden" id="catname" name="catname" value="tzzgx_gsgg" />
			<div class="doc1">
				<table width="100%">
					<tr>
						<td>
						<div align="left">
							<h4>
								公司公告
							</h4>
							</div>
						</td>
						
						</tr>
						<tr>
						<td height="40">
							<div align="left">
								公告类型：
								<SELECT ID="title_type" name="title_type" class="select">
									<OPTION VALUE="-1"
										<c:if test="${data.title_type==null}">SELECTED</c:if>>
										选择查询
									</OPTION>
									<OPTION VALUE="股东大会"
										<c:if test="${data.title_type=='股东大会'}">SELECTED</c:if>>
										股东大会
									</OPTION>
									<OPTION VALUE="董事会"
										<c:if test="${data.title_type=='董事会'}">SELECTED</c:if>>
										董事会
									</OPTION>
									<OPTION VALUE="财务信息公告"
										<c:if test="${data.title_type=='财务信息公告'}">SELECTED</c:if>>
										财务信息公告
									</OPTION>
									<OPTION VALUE="其它公告"
										<c:if test="${data.title_type=='其它公告'}">SELECTED</c:if>>
										其它公告
									</OPTION>
								</SELECT>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;标题：
								<input type="text" id="title" class="title_input" name="title"
									value="${data.title}" />
								
							
									
								</div>
								</td>
								</tr>
								<tr>
								<td>
								开始日期：
								<input type="text" id="begintime" name="begintime"
									value="${data.begintime}" onClick="WdatePicker()" class="doc_input"
									style="background-image: url('${contextPath }/images/time_btn.jpg');width:105px;"/>
								&nbsp;结束日期：
								<input type="text" id="endtime" name="endtime"
									value="${data.endtime}" onClick="WdatePicker()" class="doc_input"
									style="background-image: url('${contextPath }/images/time_btn.jpg');width:105px;" />
								<input type="button" onclick="refresh()"
									style="background: url('${contextPath }/pic/mobile/btn_sear.jpg'); border-style: none; width: 65px; height: 20px; background-repeat: no-repeat;">
								
								</td>
								
								</tr>
						
				</table>
			</div>
			<div class="blank10"></div>
			<table width="100%" align="center" border="0" cellspacing="0"
				cellpadding="0" class="lh27 list_bline1">
				<tr>
					<td></td>
					<td></td>
				</tr>
				<c:choose>
					<c:when test="${not empty page.data}">
						<c:forEach var="item" items="${page.data}">
							<tr>
								<td width="19" align="center">
									<img src="/pic/msindex/list_03.gif" />
								</td>
								<td>
									<a
										href="${contextPath }/commons/newsContent.jsp?docId=${item.doc_id}"
										target=\"_blank\"> <c:set var="len"
											value="${fn:length(item.title)}" /> <c:if test="${len>40}">
											<c:set var="str"
												value="${fn:substring(item.title, 0, 40)}..." />
								    ${str}
									</c:if> <c:if test="${len<=40}">
								    ${item.title}
									</c:if> </a>
								</td>
								<td nowrap="nowrap">
									<bean:write name="item" property="upload_date"
										format="yyyy-MM-dd" />
								</td>
							</tr>
						</c:forEach>
						
						<tr height="25">
							<td colspan="10" align="right" bgcolor="#FFFFFF">
								<c:out value="${linkStr}" escapeXml="false"></c:out>
								&nbsp;&nbsp; 跳到
								<input type=text name=jump id=jump size=3
									style="text-align: center" value='${page.currentPage}'>
								页&nbsp;
								<img border="0"
									src="${ctxPath }/match/nxsy/mncg/skin/default/pic/button020.gif"
									width="26" height="24" style="cursor: pointer;"
									onclick="javascript:checkPage(${page.totalPages});">
							</td>
						</tr>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="10" bgcolor="#FFFFFF">
								没有记录
							</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</table>
			<div class="listPage">
				<div class="listPageBtn">
					${pages_document.toolsMenu}
				</div>
			</div>
		</form>
	</body>
</html>
