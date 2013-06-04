<jsp:directive.page import="com.css.cms.document.util.DocumentHelper"/>
<jsp:directive.page import="com.cssweb.common.util.StringUtils"/>
<jsp:directive.page import="com.css.cms.document.model.DocumentFrontListProvider"/>
<%request.setCharacterEncoding("UTF-8");%>
<%@page contentType="text/html; charset=UTF-8"%>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
<%@ taglib uri="/WEB-INF/plugins/paging/css-paging.tld" prefix="paging"%>
<%
	int tempNum = 0;	 
  String showSize = request.getParameter("showSize");
  DocumentFrontListProvider documentProvider = new DocumentFrontListProvider(request);
%>
	
	<paging:page count="false" row="<%=showSize==null?15:Integer.parseInt(showSize) %>" provider="<%= documentProvider%>">
	 <table width="90%" align="center" class="lh28 mt20  font_st list_bline1">
		<paging:pageRow id="doc" type="com.css.cms.document.Document">  
		<%
          		
								String title = DocumentHelper.getTitle(doc);
								title = title.replaceAll("\\</?(?!(input)|(img)).*?\\>","");
		%>
		<%
				if (tempNum > 0)
				{
					
					%>
							 <tr>
						        <td width="515"><a href="${contextPath }/cms/gjzxContent.jsp?docId=<%= doc.getId()%>" title="<%= title%>" target=\"_blank\">·<%= DocumentHelper.getTitle(doc ,60)%></a></td>
						        <td width="108"><%= DocumentHelper.getUploadDate(doc ,"yyyy-MM-dd")%></td>
						      </tr>
						    
					<%
				}
				tempNum ++ ;
		 %>  
        
		</paging:pageRow>
		    </table>
	</paging:page> 
