<%@ page contentType="text/html; charset=utf-8" language="java"%>

<%@ include file="/f10/bond/init.jsp" %>

<jsp:directive.page import="org.apache.commons.lang.StringUtils" />

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<HEAD>
		<TITLE>广发证券</TITLE>
		<link href="${contextPath}/f10/css/style.css" rel="stylesheet"
			type="text/css" />
		<link href="/css/style.css" rel="stylesheet" type="text/css"/>
		<link href="/css/news.css" rel="stylesheet" type="text/css"/>
		<script type="text/javascript" src="${contextPath }/js/tag.js"></script>
		<script type="text/javascript" src="${contextPath }/js/jsIfUtils.js"></script>
		<style type="text/css">
<!--
.black {
	font-family: "黑体"
}
-->
</style>

		<%
			String iframeSrc = "#";
			
			String aId = (String)request.getSession().getAttribute("aId");
			
			String textId = (String)request.getSession().getAttribute("textId");
			
			if (com.cssweb.F10.gazx.bond.util.Validator.isNotNull(request.getSession().getAttribute("currentPath"))) {
				iframeSrc = request.getSession().getAttribute("currentPath").toString() + "&bondCode=" + bondCode + "&code="+bondCode+"&aid=" + aId + "&textid=" + textId + "&gpdm="+bondCode;
			} else {
				iframeSrc = "/f10/bond/bondInfo.do?method=getBondInfoByBondCode&bondCode=" + bondCode;
			}
		%>
	</HEAD>
	<body>
		<jsp:include page="${contextPath}/share/top.jsp" />
		<table border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td class="single_top_red"></td>
				<td class="single_top_red2"></td>
			</tr>
		</table>
		<table border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td class="single_left_tab top">
					<jsp:include page="left.jsp">
						<jsp:param name="aid" value="<%=aId %>"/>
						<jsp:param name="textid" value="<%=textId %>"/>
					</jsp:include>
				</td>
				<td class="single_rig_tab">
					<iframe id="f10Frame" name="f10Frame" src="<%=iframeSrc%>" width="100%" frameborder="0" marginheight="0" marginwidth="0" scrolling="no" onload="frameFitSelfHeight('f10Frame')"></iframe>
				</td>
			</tr>
		</table>
		<jsp:include page="/share/bottom.jsp" />
	</body>
</html>
