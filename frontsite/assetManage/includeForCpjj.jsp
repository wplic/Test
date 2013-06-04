<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@page import="com.css.cms.document.util.DocumentHelper"%>
<bean:parameter id="whichCat" name="whichCat" value="cpzx_jhlc_jhgk" />
<bean:parameter id="assetProd" name="assetProd" value="2" />
<%
	int rowNum = 1;
	String target = request.getContextPath() + "/commons/infoList.jsp";
%>

 
<paging:page count="false" row="<%=rowNum%>"
	provider="<%=new com.css.cms.document.model.DocumentFrontListProvider(
													request)%>">
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
		<paging:pageRow id="doc" type="com.css.cms.document.Document">
			<tr>
				<td>
					<%=DocumentHelper.getContent(doc)%>
				</td>
			</tr>

		</paging:pageRow>
	</table>
</paging:page>






