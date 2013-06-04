<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*"   %>
<jsp:directive.page import="com.css.cms.document.util.DocumentHelper"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<style type="text/css">
body{ 
SCROLLBAR-FACE-COLOR: #97B0D9; 
SCROLLBAR-HIGHLIGHT-COLOR: #ffffff;
SCROLLBAR-SHADOW-COLOR: #ffffff; 
SCROLLBAR-3DLIGHT-COLOR: #ffffff;
SCROLLBAR-ARROW-COLOR: #5779B2; 
SCROLLBAR-TRACK-COLOR: #ffffff;
SCROLLBAR-DARKSHADOW-COLOR: #ffffff;
}
td {font-size: 12px}
</style>
</head>
<body>
<%
	String category = request.getParameter("whichCat");
 %>
<div id="tabs03">
<table width="94%" align="center" class="lh25 mt10" style="height: 100%">
  <tr>
    <td>
    	 <paging:page count="false" row="1" provider="<%= new com.css.cms.document.model.DocumentFrontListProvider(category,request)%>" tableId="doclist">
  		    	<paging:pageRow id="doc" type="com.css.cms.document.Document"> 
		          	 <%=DocumentHelper.getContent(doc)%>
		          </paging:pageRow>
          </paging:page>
    </td>
    </tr>
</table>
</div>
</body>
</html>