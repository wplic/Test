<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
  DocumentFrontListProvider documentProvider = new DocumentFrontListProvider(request);
  int i=0;
%>
	
	<paging:page count="false" row="<%=showSize==null?1:Integer.parseInt(showSize) %>" provider="<%= documentProvider%>">
	 <table width="98%" align="center" border="0" class="lh27 list_bline1 mt10">
		<paging:pageRow id="doc" type="com.css.cms.document.Document">  
		<%
    	i++;	
    	
		String title = DocumentHelper.getTitle(doc);
		title = title.replaceAll("\\</?(?!(input)|(img)).*?\\>","");
		%>
		<tr>
	      <td align="center" width="18"><img src="/pic/msindex/list_03.gif"/></td>
	      <td><a href="#"><a title="<%= title %>" href="${contextPath }/commons/infoList.jsp?docId=<%= doc.getId()%>"   target=\"_blank\">
        	 <%= DocumentHelper.getTitle(doc ,50)%> </a></a></td>
	      <td width="72" class="font_8c"><%= DocumentHelper.getUploadDate(doc ,"yyyy/MM/dd")%></td>
	    </tr>
		
        </paging:pageRow>
       </table> 
	</paging:page> 
