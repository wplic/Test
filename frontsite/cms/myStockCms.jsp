<%@ page contentType="text/html; charset=utf-8" language="java" %>
<html><title>广发证券</title>
<link href="${ctx}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
<%@ include file="/commons/taglibs.jsp"%>
<jsp:directive.page import="com.css.cms.document.util.DocumentHelper"/>
<jsp:directive.page import="com.cssweb.common.util.StringUtils"/>
<jsp:directive.page import="com.css.cms.document.model.DocumentFrontListProvider"/>

<body>
<% 
  String showSize = request.getParameter("showSize");
    String column="nbzx|gfyj|wgzx";
	if(request.getParameter("whichCat")!=null)
	column=request.getParameter("whichCat");
  DocumentFrontListProvider documentProvider = new DocumentFrontListProvider(column,request);
%>        
	<paging:page count="false" row="<%=showSize==null?6:Integer.parseInt(showSize) %>" provider="<%= documentProvider%>">

		<paging:pageRow id="doc" type="com.css.cms.document.Document">   
             <tr>
               <td width="769" class="red">
               <a href="${contextPath }/cms/newsContent.jsp?docId=<%= doc.getId()%>" target=\"_blank\">
		          · <%= DocumentHelper.getTitle(doc ,60)%> </a>
               </td>
               <td width="121" class="red"><%= DocumentHelper.getUploadDate(doc ,"yyyy-MM-dd")%></td>
             </tr>
</paging:pageRow> 
</paging:page> 
  </body>
  </html>