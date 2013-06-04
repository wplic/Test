<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/commons/taglibs.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>My JSP 'gncj.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	</head>

	<body>
		<form id="fomr1" action="${ctx }/sz/init_sz.do?method=initInfoCenter"
			method="post">
			<input type="hidden" value="1" name="input_" />
			<table class="tb_" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 0px; margin-left: 0px;" bordercolor="#cccccc"
				width="100%" align="center">
				<c:if test="${infoCenter_gfdt!=null}">
				<logic:iterate id="data" name="infoCenter_gfdt" scope="session"
					indexId="indexid">
					<tr align="center">
						<td width="10" align="center" style="line-height: 25px;">
							<img src="${ctx }/pic/msindex/list_02.gif" />
						</td>
						<td width="85%" align="left" style="line-height: 25px;">
							<a title="${data.title }"
								href="${contextPath }/sz/newsContent.jsp?docId=${data.docId }"
								target=\"_blank\"> 
								<c:set var="len" value="${fn:length(data.title)}"/>
								<c:if test="${len>40}">
									<c:set var="str" value="${fn:substring(data.title, 0, 40)}..."/>
								    ${str}
								</c:if>
								<c:if test="${len<=40}">
								    ${data.title}
								</c:if>
							</a>
						</td>
						<td align="right" style="line-height: 25px;">
							<bean:write name="data" property="uploadDate" format="yyyy-MM-dd" />
						</td>
					</tr>
				</logic:iterate>
				</c:if>
			</table>
			<div class="listPage">
				<div class="listPageBtn">
					${pages_gfdt.toolsMenu}
				</div>
			</div>
		</form>
	</body>
</html>
