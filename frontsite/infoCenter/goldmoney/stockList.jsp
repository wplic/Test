<%@page import="com.css.cms.document.util.DocumentHelper"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<%@ include file="/commons/taglibs.jsp"%>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>广发证券</title>
		<link href="/css/global.css" rel="stylesheet" type="text/css" />
		<link href="/css/infoCenter/infoCenter.css" rel="stylesheet"
			type="text/css" />
	</head>
	<bean:parameter id="category" name="whichCat" value="" />
	<bean:parameter id="showSize1" name="showSize" value="15" />
	<bean:parameter id="docId1" name="docId" value="" />
	<bean:parameter id="titleWidth" name="titleWidth" value="50" />
	<%
		if (category == null) {
	%>
	<script type="text/javascript">
alert('您请求的资讯栏目错误');
</script>
	<%
		return;
		}

		int rowNum = Integer.parseInt(showSize1);
		int i = 0;
	%>



	<body>
		<paging:page count="false" row="<%=rowNum%>"
			provider="<%=new com.css.cms.document.model.DocumentFrontListProvider(category, request)%>">

			<table width="95%" align="center" class="lh28 font_st">
				<paging:pageRow id="doc" type="com.css.cms.document.Document">
					<%
						String detailPage = "/cms/newsContent.jsp?docId="
										+ doc.getId();
					%>
					<tr class="list_bline1">
						<td width="524">
							<a href="<%=detailPage%>" target="_blank"> <%=DocumentHelper.getTitle(doc, Integer
							.parseInt(titleWidth))%></a>
						</td>

						<td width="67">
							<%=DocumentHelper.getUploadDate(doc, "yy/MM/dd")%>
						</td>
					</tr>
				</paging:pageRow>
			</table>
			<table width="96%" border="0" align="center" cellpadding="0"
				cellspacing="0" class="color-border-title2">
				<tr>
					<td width="40%" align="right">
						<paging:pageInfo empty="没有记录" />
					</td>
					<td width="60%" align="center">
						<paging:pageLink pages="15" hasPageNo="true" mode="text"
							hasGo="false" />
					</td>
				</tr>
			</table>
		</paging:page>
	</body>
</html>