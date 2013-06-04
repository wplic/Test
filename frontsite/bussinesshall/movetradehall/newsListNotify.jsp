<jsp:directive.page import="com.css.cms.document.util.DocumentHelper"/>
<jsp:directive.page import="com.cssweb.common.util.StringUtils"/>
<jsp:directive.page import="com.css.cms.document.model.DocumentFrontListProvider"/>
<%request.setCharacterEncoding("UTF-8");%>
<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/WEB-INF/plugins/paging/css-paging.tld" prefix="paging"%>
<%
	int tempNum = 0;	 
  String showSize = request.getParameter("showSize");
  DocumentFrontListProvider documentProvider = new DocumentFrontListProvider(request);
%>
	<table width="93%" align="center" bgcolor="#ffffff" class="lh21 font_43 font_st" height="180">
  	<tr>
  	<td style=" padding:5px"><marquee direction="up" height="160" scrollamount="3" onmouseover="this.stop()" onmouseout="this.start()">
	<paging:page count="false" row="<%=showSize==null?4:Integer.parseInt(showSize) %>" provider="<%= documentProvider%>">
		<paging:pageRow id="doc" type="com.css.cms.document.Document">  
		<%
          		String content=DocumentHelper.getContent(doc,80);
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
							//content="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+content;
								tempNum ++ ;
								String title = DocumentHelper.getTitle(doc);
								title = title.replaceAll("\\</?(?!(input)|(img)).*?\\>","");
		%>  
         <p class="red"><a href="${contextPath }/cms/newsContent.jsp?docId=<%= doc.getId()%>"  title="<%= title%>" target=\"_blank\">
           ·<%= content%> </a></p></br>
           
        </paging:pageRow>
	</paging:page> 
</marquee></td>
  </tr>
</table>