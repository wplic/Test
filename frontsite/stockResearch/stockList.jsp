<%@page import="com.css.cms.document.util.DocumentHelper"%>
<jsp:directive.page import="com.cssweb.common.util.HTMLutils"/>
<%request.setCharacterEncoding("UTF-8");%>
<%@ page contentType="text/html; charset=UTF-8" language="java"    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<link href="/css/stockResearch/stockResearch.css" rel="stylesheet" type="text/css" />
</head>
<body>
<table class="mt16 lh20" width="96%" align="center">

    <% String category_yfdt="zqyj_gsdt"; %>
     <paging:page count="false" row="<%=5%>" provider="<%=new com.css.cms.document.model.DocumentFrontListProvider(category_yfdt, request)%>">
		<paging:pageRow id="doc" type="com.css.cms.document.Document">
				   <%
					 String detailPage = "/commons/infoList.jsp?docId="+doc.getId() ;
					 String content=DocumentHelper.getContent(doc,120);
					 content=HTMLutils.TextToHtml(content);
			        %> 
				   	  <tr>
					    <td width="13" valign="top"><img src="/pic/stockResearch/dot-hjt.gif" /></td>
					    <td>
					    <a href="<%=detailPage %>"  target="_blank">
					    <%=DocumentHelper.getTitle(doc) %>
					    </a>
					    </td>
					  </tr>  
					  <tr>
    <td colspan="2" class="xuxian10">&nbsp;</td>
  </tr>
		</paging:pageRow>
</paging:page>
  </table>
</body>
</html>