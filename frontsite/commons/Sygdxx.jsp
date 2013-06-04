<jsp:directive.page import="com.css.cms.document.util.DocumentHelper"/>
<jsp:directive.page import="com.cssweb.common.util.StringUtils"/>
<jsp:directive.page import="com.css.cms.document.model.DocumentFrontListProvider"/>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/WEB-INF/plugins/paging/css-paging.tld" prefix="paging"%>
<link href="${contextPath }/css/global.css" rel="stylesheet" type="text/css" />
<link href="${contextPath }/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
<%
      
String catName = "";
if (request.getParameter("catName") != null && !"".equals(request.getParameter("catName")))
{
	catName = request.getParameter("catName");
}
	  DocumentFrontListProvider documentProvider = new DocumentFrontListProvider(request);
	  int rowNum = 1;
%>
<paging:page count="false" row="<%=rowNum%>" provider="<%= documentProvider%>">
<paging:pageRow id="doc" type="com.css.cms.document.Document">
		<%	
			String title=DocumentHelper.getTitle(doc);
		%>
		<center><%=title %></center>
		<marquee direction="up" scrolldelay="200">
            <p class="gushiTips"> 
            <%
		       					String content=DocumentHelper.getContent(doc);
								content=content.replaceAll("\\</?(?!(input)|(img)).*?\\>","");
								//content="&nbsp;&nbsp;&nbsp;"+content;
		      					//content=StringUtils.subString(content,148,"......");
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
					            out.print(content);
			      %> 
             </p>
       </marquee>
 </paging:pageRow>
 </paging:page>