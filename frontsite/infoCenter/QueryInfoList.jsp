<%request.setCharacterEncoding ("UTF-8") ;%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.css.cms.document.*"%>
<%@page import="com.css.cms.document.dql.*"%>
<%@page import="com.css.cms.document.util.*"%>
<%@ include file="/commons/taglibs.jsp"%>
<%
	String column="gfzq";
	if(request.getParameter("whichCat")!=null)
	column=request.getParameter("whichCat");
%>
<paging:page count="false" row="30" provider="<%= new com.css.cms.document.model.DocumentFrontListProvider(column,request)%>" tableId="doclist">
  <table id="doclist" width="95%" align="center" class="lh28 font_st list_bline1">
  <form name="queryList" action="" method="post">
  <paging:pageRow id="doc" type="com.css.cms.document.Document">
  <tr align="center">    
    <td width="70%" align="left"><a href="${ctx}/cms/newsContent.jsp?docId=<%=doc.getId()%>" target="_blank"><%= DocumentHelper.getTitle(doc ,150)%></a></td>
    <td width="30%" align="right"><%= DocumentHelper.getUploadDate(doc ,"yyyy-MM-dd")%></td>
  </tr>
  </paging:pageRow>
  </form>
</table>
<table width="96%" border="0" align="center" cellpadding="0" cellspacing="0" class="color-border-title2">
  <tr> 
    <td width="40%" align="right"><paging:pageInfo empty="没有记录"/></td>
    <td width="60%" align="center"><paging:pageLink pages="8" hasPageNo="true" mode="text" hasGo="false"/></td>    
  </tr>
</table>
</paging:page>