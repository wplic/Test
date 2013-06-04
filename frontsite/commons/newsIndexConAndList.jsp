<jsp:directive.page import="com.css.cms.document.util.DocumentHelper"/>
<jsp:directive.page import="com.cssweb.common.util.StringUtils"/>
<jsp:directive.page import="com.css.cms.document.model.DocumentFrontListProvider"/>
<%request.setCharacterEncoding("UTF-8");%>
<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/WEB-INF/plugins/paging/css-paging.tld" prefix="paging"%>
<%
  String showSize = request.getParameter("showSize");
  String catName = "";
  if (request.getParameter("catName") != null && !"".equals(request.getParameter("catName")))
  {
  	catName = request.getParameter("catName");
  }
  DocumentFrontListProvider documentProvider = new DocumentFrontListProvider(request);
  int i=0;
%>
 <table width="95%" align="center" border="0" cellspacing="0" cellpadding="0" class=" mt10 lh23">
	<paging:page count="false" row="<%=showSize==null?1:Integer.parseInt(showSize) %>" provider="<%= documentProvider%>">
		<paging:pageRow id="doc" type="com.css.cms.document.Document">  
		<%-- 
			<%
		i++;
		String title = DocumentHelper.getTitle(doc);
		title = title.replaceAll("\\</?(?!(input)|(img)).*?\\>","");

		if(i==1)
		{
		 %>
		 <tr>
		    <td width="20" align="center" valign="top">
		      <img class="pt7" src="${contextPath }/pic/msindex/list_02.gif"/>
		    </td>
		    <td width="70%">
		    <%
    		String content=DocumentHelper.getContent(doc);
			//content="&nbsp;&nbsp;&nbsp;"+content;
   			content=StringUtils.subString(content,120,"......");
			%> 
			   <a title="<%= title %>" href="${contextPath }/commons/infoList.jsp?docId=<%= doc.getId()%>"   target=\"_blank\">
			   <%=content %><%= DocumentHelper.getUploadDate(doc ,"yyyy-MM-dd")%>
			   </a>
		    </td>
		    <td width="107" align="right"><img src="pic/msindex/ban01.jpg" /></td>
	      </tr>
		 <%
		}else{
		%>  
		<tr>
            <td width="20" align="center"><img src="${contextPath }/pic/msindex/list_02.gif"/></td>
            <td width="75%">
            <a title="<%= title %>" href="${contextPath }/commons/infoList.jsp?docId=<%= doc.getId()%>"   target=\"_blank\">
            <%= DocumentHelper.getTitle(doc ,50)%> </a> 
            </td>
            <td align="right"><%= DocumentHelper.getUploadDate(doc ,"yyyy-MM-dd")%> </td>
          </tr>
        <%} %>
		
		
		 --%>
		 <%
		 	String title = DocumentHelper.getTitle(doc);
			title = title.replaceAll("\\</?(?!(input)|(img)).*?\\>","");
		 	%>
		 			<tr>
	            <td width="20" align="center"><img src="${contextPath }/pic/msindex/list_02.gif"/></td>
	            <td width="75%">
	            <a title="<%= title %>" href="${contextPath }/commons/infoList.jsp?docId=<%= doc.getId()%>"   target=\"_blank\">
	            <%= DocumentHelper.getTitle(doc ,50)%> </a> 
	            </td>
	            <td align="right"><%= DocumentHelper.getUploadDate(doc ,"yyyy-MM-dd")%> </td>
	          </tr>
		 	<%
		  %>
		
        </paging:pageRow>
	</paging:page> 
  </table>