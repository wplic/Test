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

	<paging:page count="false" row="<%=showSize==null?4:Integer.parseInt(showSize) %>" provider="<%= documentProvider%>">
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
							//content="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+content;
								tempNum ++ ;
								
		%>  
         <p class="red"><%=tempNum %>、<%= DocumentHelper.getTitle(doc ,60)%></p>
            <p class="ml20 font_73"><%= content %></p>
		</paging:pageRow>
	</paging:page> 
