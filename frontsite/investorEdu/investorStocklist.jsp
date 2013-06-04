<jsp:directive.page import="com.css.cms.document.util.DocumentHelper"/>
<%request.setCharacterEncoding ("UTF-8") ;%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.css.cms.document.*"%>
<%@page import="com.css.cms.document.Document"%>
<%@page import="com.css.cms.category.CategoryFactory"%>
<%@page import="com.css.cms.category.CategoryTree"%>
<%@page import="com.css.cms.category.*"%>
<%@ taglib uri="/WEB-INF/plugins/paging/css-paging.tld" prefix="paging"%>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/investorEdu/investorEdu.css" rel="stylesheet" type="text/css" />
<link href="/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
<jsp:directive.page import="com.cssweb.common.web.filter.SqlInjectValidate"/>
<%
 SqlInjectValidate sqlInjectValidate = SqlInjectValidate.getSqlInjectValidate();
	if(request.getParameter("nav1")!=null&&!request.getParameter("nav1").equals("")){
				if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("nav1"),10)){
					response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
				 }
			}
	if(request.getParameter("nav")!=null&&!request.getParameter("nav").equals("")){
				if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("nav"),10)){
					response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
				 }
			}
	if(request.getParameter("nav2")!=null&&!request.getParameter("nav2").equals("")){
		if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("nav2"),10)){
			response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
		 }
	}
	
	if(request.getParameter("state")!=null&&!request.getParameter("state").equals("")){
				if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("state"),3)){
					response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
				 }
			}
	if(request.getParameter("whichCat")!=null&&!request.getParameter("whichCat").equals("")){
		if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("whichCat"),12)){
			response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
		 }
	}
	
	if(request.getParameter("is_delete")!=null&&!request.getParameter("is_delete").equals("")){
		if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("is_delete"),12)){
			response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
		 }
	}
	String search = "";
	CategoryTree catTree= null;
	if(request.getParameter("siteName")!=null){
		catTree = CategoryFactory.getCategoryTree(request.getParameter("siteName"));
	}else{
		catTree = CategoryFactory.getCategoryTree(DocumentManager.getCmsRootName());
		
	}   
	String column="zxzx_jj_jjzs";
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
<table width="90%" align="center" border="0" class="lh28 mt20  font_st list_bline1">
<paging:pageRow id="doc" type="com.css.cms.document.Document"> 
         <tr>
            <td width="515"><a href="${contextPath }/cms/newsContent.jsp?docId=<%= doc.getId()%>" target=\"_blank\">
           <%= DocumentHelper.getTitle(doc ,60)%> </a></td>
            <td width="108"><%= DocumentHelper.getUploadDate(doc ,"yyyy/MM/dd")%></td>
          </tr>
              
     </paging:pageRow>
       <tr>
       		<td colspan="2" ><div class="ym_bg mt5 center">
	<p align="center"><paging:pageInfo empty="没有记录"/>&nbsp;&nbsp;<paging:pageLink pages="8" mode="text" hasGo="false"/></p>
</div> </td>
       </tr>     
		
 </table>
	
</form>
</paging:page>

