<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@ include file="/commons/taglibs.jsp"%>
<html><title>广发证券</title>
<link href="${ctx}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
<script src="${ctx}/js/setTab.js"></script>
<%@ include file="/commons/taglibs.jsp"%>
<jsp:directive.page import="com.css.cms.document.util.DocumentHelper"/>
<jsp:directive.page import="com.cssweb.common.util.StringUtils"/>
<jsp:directive.page import="com.css.cms.document.model.DocumentFrontListProvider"/>

<body>
<% 
  String showSize = request.getParameter("showSize");
  DocumentFrontListProvider documentProvider = new DocumentFrontListProvider(request);
%>        
	<paging:page count="false" row="<%=showSize==null?2:Integer.parseInt(showSize) %>" provider="<%= documentProvider%>">
		<paging:pageRow id="doc" type="com.css.cms.document.Document">  
		       <%  
		       					String content=DocumentHelper.getContent(doc);
								content=content.replaceAll("\\</?(?!(input)|(img)).*?\\>","");
								content=content.replaceAll("    "," ");
								content=content.replaceAll("   "," ");
								content=content.replaceAll("  "," ");
								content=content.replaceAll("　","");
								content=content.replaceAll("	","");
								content=content.replaceAll("&nbsp;","");
								content=content.replaceAll("\r\n\r\n\r\n\r\n\r\n","\r\n");
								content=content.replaceAll("\r\n\r\n\r\n\r\n","\r\n");
								content=content.replaceAll("\r\n\r\n\r\n","\r\n");
								content=content.replaceAll("\r\n\r\n","\r\n");
								content=content.replace("\r\n","<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
								

				content="&nbsp;&nbsp;&nbsp;&nbsp;"+content;
		       
					//String content=DocumentHelper.getContent(doc);
					content=StringUtils.subString(content,220,"......");
					//content=content;
					//content=HTMLutils.TextToHtml(content);
			   %> 		
			   <p><span class="red"><%=DocumentHelper.getUploadDate(doc,"yyyy-MM-dd") %> </span><br />	
			   <a href="<%=request.getContextPath()%>/cms/newsContent.jsp?docId=<%=doc.getId()%>" target="_blank"><%=content %></a>
			   </p>   
</paging:pageRow>
</paging:page> 

  </body>
  </html>