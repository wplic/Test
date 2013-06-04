<jsp:directive.page import="com.css.cms.document.util.DocumentHelper"/>
<jsp:directive.page import="com.cssweb.common.util.StringUtils"/>
<jsp:directive.page import="com.css.cms.document.model.DocumentFrontListProvider"/>
<jsp:directive.page import="com.cssweb.common.util.HTMLutils"/>
<%request.setCharacterEncoding("UTF-8");%>
<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/WEB-INF/plugins/paging/css-paging.tld" prefix="paging"%>
<%
	int tempNum = 0;	 
  String showSize = request.getParameter("showSize");
  DocumentFrontListProvider documentProvider = new DocumentFrontListProvider(request);
%>
	
	<paging:page count="false" row="<%=showSize==null?5:Integer.parseInt(showSize) %>" provider="<%= documentProvider%>">
	  <div class="side_mid">
      <p class="side_tit1">软件下载公告</p>
      <marquee direction="up" scrollamount="3" onmouseover="this.stop()" onmouseout="this.start()">
	<table width="88%" align="center" class="lh22 mt5">
		<paging:pageRow id="doc" type="com.css.cms.document.Document">  
		<%
          		String content=DocumentHelper.getContent(doc);
			    content=content.replaceAll("\\</?(?!(input)|(img)).*?\\>","");
				content=content.replaceAll("&nbsp;","");
				content=content.replaceAll("    "," ");
				content=content.replaceAll("   "," ");
				content=content.replaceAll("  "," ");
				content=content.replaceAll("　","");
				content=content.replaceAll("	","");
				content=content.replaceAll("\r\n\r\n\r\n\r\n\r\n","\r\n");
				content=content.replaceAll("\r\n\r\n\r\n\r\n","\r\n");
				content=content.replaceAll("\r\n\r\n\r\n","\r\n");
				content=content.replaceAll("\r\n\r\n","\r\n");
				content=HTMLutils.TextToHtml(content);
				if(content!=null && content.length()>100){
					content = content.substring(0,100)+"...";
				}
				
				tempNum ++ ;
				String title = DocumentHelper.getTitle(doc);
				title = title.replaceAll("\\</?(?!(input)|(img)).*?\\>","");
		%>  
		<tr>
            <td><a href="${contextPath }/cms/newsContent.jsp?docId=<%= doc.getId()%>"  title="<%= title%>" target=\"_blank\">·<%= content%></a></td>
          </tr>
         </paging:pageRow>
         </table>
         </marquee>
          <div style="height:10px; overflow:hidden"></div>
          </div>
	</paging:page> 
