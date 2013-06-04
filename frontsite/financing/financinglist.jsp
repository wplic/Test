<jsp:directive.page import="com.css.cms.document.util.DocumentHelper"/>
<%request.setCharacterEncoding ("UTF-8") ;%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.css.cms.document.*"%>
<%@page import="com.css.cms.document.Document"%>
<%@page import="com.css.cms.category.CategoryFactory"%>
<%@page import="com.css.cms.category.CategoryTree"%>
<%@page import="com.css.cms.category.*"%>
<%@ taglib uri="/WEB-INF/plugins/paging/css-paging.tld" prefix="paging"%>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<%
	String search = "";
	CategoryTree catTree= null;
	if(request.getParameter("siteName")!=null){
		catTree = CategoryFactory.getCategoryTree(request.getParameter("siteName"));
	}else{
		catTree = CategoryFactory.getCategoryTree(DocumentManager.getCmsRootName());
		
	}   
	String column="wsyyt_jygg";
	if(request.getParameter("whichCat")!=null)
	column=request.getParameter("whichCat");
	CategoryNode catNode = catTree.getCategoryNode(column);
	String bt="";
	if(catNode!=null)
	bt=catNode.getDisplayName();
%>

<link href="${ctx}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />

<paging:page count="false" row="20" provider="<%= new com.css.cms.document.model.DocumentFrontListProvider(column,request)%>" tableId="doclist">
<form name="querylist" action="">
    <table width="95%" align="center" border="0" cellspacing="0" cellpadding="0" class="lh27 list_bline1">
<paging:pageRow id="doc" type="com.css.cms.document.Document"> 
         <tr>
	        <td width="20" align="center"><img src="/pic/msindex/list_03.gif"/></td>
	        <td width="509"><a href="${contextPath }/commons/infoList.jsp?docId=<%= doc.getId()%>" target=\"_blank\"><%= DocumentHelper.getTitle(doc ,60)%> </a></td>
	        <td align="right" class="font_8c"><%= DocumentHelper.getUploadDate(doc ,"yyyy/MM/dd")%></td>
	      </tr>
        
     </paging:pageRow>
       
		
 </table>
 	 <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="30" align="right"><paging:pageInfo empty="没有记录"/>&nbsp;&nbsp;<paging:pageLink pages="8" mode="text" hasGo="false"/></td>
      </tr>
    </table>
	
</form>
</paging:page>

