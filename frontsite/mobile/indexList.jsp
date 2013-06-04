<jsp:directive.page import="com.css.cms.document.util.DocumentHelper"/>
<jsp:directive.page import="com.cssweb.common.util.StringUtils"/>
<jsp:directive.page import="com.css.cms.document.model.DocumentFrontListProvider"/>
<%request.setCharacterEncoding("UTF-8");%>
<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/WEB-INF/plugins/paging/css-paging.tld" prefix="paging"%>
<%
  int tempNum = 0;	 
  String showSize = request.getParameter("showSize");
  String whichCat = request.getParameter("whichCat");
  String catName = "";
  if (request.getParameter("catName") != null && !"".equals(request.getParameter("catName")))
  {
  	catName = request.getParameter("catName");
  }
  
  String selectSize="1";
  if(request.getParameter("selectSize") != null && !"".equals(request.getParameter("selectSize"))) 
  selectSize=request.getParameter("selectSize");
  DocumentFrontListProvider documentProvider = new DocumentFrontListProvider(request);
  int i=0;
%>
	<ul class="newlist">
   	 
	<paging:page count="false" row="<%=showSize==null?1:Integer.parseInt(showSize) %>" provider="<%= documentProvider%>">
		<paging:pageRow id="doc" type="com.css.cms.document.Document">  
		<%
		String title = DocumentHelper.getTitle(doc);
		title = title.replaceAll("\\</?(?!(input)|(img)).*?\\>","");
		%>  
		<li><span><%=DocumentHelper.getUploadDate(doc,"yyyy/MM/dd") %> </span>·
		<a title="<%= title %>" href="${contextPath }/cms/CmsnewsContent.jsp?docId=<%= doc.getId()%>&whichCat=<%=whichCat%>"   target=\"_blank\">
			        <span class="bold"></span> <%= StringUtils.subString(title,35,"...")+"&nbsp;&nbsp;"%> </a> 
			       
		</li>
		
        </paging:pageRow>
	</paging:page> 
</ul>