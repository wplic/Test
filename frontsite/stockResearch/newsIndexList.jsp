<jsp:directive.page import="com.css.cms.document.util.DocumentHelper"/>
<jsp:directive.page import="com.cssweb.common.util.StringUtils"/>
<jsp:directive.page import="com.css.cms.document.model.DocumentFrontListProvider"/>
<%request.setCharacterEncoding("UTF-8");%>
<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/WEB-INF/plugins/paging/css-paging.tld" prefix="paging"%>
<%
  int tempNum = 0;	 
  String showSize = request.getParameter("showSize");
  String catName = "";
  if (request.getParameter("catName") != null && !"".equals(request.getParameter("catName")))
  {
  	catName = request.getParameter("catName");
  }
  
  String selectSize="1";
  if(request.getParameter("selectSize") != null && !"".equals(request.getParameter("selectSize"))) 
  selectSize=request.getParameter("selectSize");
  DocumentFrontListProvider documentProvider = new DocumentFrontListProvider(catName,request);
  int i=0;
%>
	
	<paging:page count="false" row="<%=showSize==null?1:Integer.parseInt(showSize) %>" provider="<%= documentProvider%>">
		<paging:pageRow id="doc" type="com.css.cms.document.Document">  
		<%
	    	
								String content=DocumentHelper.getContent(doc);
								//content=content.replaceAll("    "," ");
							//	content=content.replaceAll("   "," ");
							//	content=content.replaceAll("  "," ");
							//	content=content.replaceAll("　","");
							//	content=content.replaceAll("	","");
							//	content=content.replaceAll("&nbsp;","");
							//	content=content.replaceAll("\r\n\r\n\r\n\r\n\r\n","\r\n");
							//	content=content.replaceAll("\r\n\r\n\r\n\r\n","\r\n");
							//	content=content.replaceAll("\r\n\r\n\r\n","\r\n");
							//	content=content.replaceAll("\r\n\r\n","\r\n");
							//	content=content.replace("\r\n","<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
							//	content="&nbsp;&nbsp;&nbsp;&nbsp;"+content;
								
		  %> 
		
		<tr valign="top">
            <td class="lh22"><p class="inden25"><%=content %></td>
        </tr>  
       
        </paging:pageRow>
	</paging:page> 
