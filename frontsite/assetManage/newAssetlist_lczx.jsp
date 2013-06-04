<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<jsp:directive.page import="com.css.cms.document.util.DocumentHelper"/><%request.setCharacterEncoding ("UTF-8") ;%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.css.cms.document.*"%>
<%@page import="com.css.cms.document.Document"%>
<%@page import="com.css.cms.category.CategoryFactory"%>
<%@page import="com.css.cms.category.CategoryTree"%>
<jsp:directive.page import="com.cssweb.common.web.filter.SqlInjectValidate"/>
<%@page import="com.css.cms.category.*"%>
<%@ taglib uri="/WEB-INF/plugins/paging/css-paging.tld" prefix="paging"%>
<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
<%
	String search = "";
	CategoryTree catTree= null;
	int showsize = 55;
	if(request.getParameter("siteName")!=null){
		catTree = CategoryFactory.getCategoryTree(request.getParameter("siteName"));
	}else{
		catTree = CategoryFactory.getCategoryTree(DocumentManager.getCmsRootName());
		
	}   
	if(request.getParameter("showSize")!=null){
		showsize = Integer.parseInt(request.getParameter("showSize"));
	}
	String column="wsyyt_jygg";
	if(request.getParameter("whichCat")!=null)
	column=request.getParameter("whichCat");
	CategoryNode catNode = catTree.getCategoryNode(column);
	String bt="";
	if(catNode!=null)
	bt=catNode.getDisplayName();
	
	SqlInjectValidate sqlInjectValidate = SqlInjectValidate.getSqlInjectValidate();
if(null!=request.getParameter("showSize") && sqlInjectValidate.vakidateSqlIfIngter(request.getParameter("showSize")))
		response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
		if(null!=request.getParameter("pageno") && sqlInjectValidate.vakidateSqlIfIngter(request.getParameter("pageno")))
		response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
%>
<SCRIPT LANGUAGE="JavaScript">
function f_frameStyleResize(targObj){
 var targWin = targObj.parent.document.all[targObj.name];

 if(targWin != null) {

  var HeightValue = targObj.document.body.scrollHeight
 if(HeightValue < 120)
 HeightValue = 140
 targWin.style.pixelHeight = HeightValue;
 }
}


function f_iframeResize(){

 bLoadComplete = true; f_frameStyleResize(self);

}

var bLoadComplete = false;

window.onload = f_iframeResize;

</SCRIPT>

<center>    
<paging:page count="false" row="4" provider="<%= new com.css.cms.document.model.DocumentFrontListProvider(column,request)%>" tableId="doclist">

<form name="querylist" action="">
<table width="95%" align="center" border="0" cellspacing="0" cellpadding="0" class="lh27 list_bline1">
<paging:pageRow id="doc" type="com.css.cms.document.Document">
		<%String _title = DocumentHelper.getTitle(doc); %>
		<tr>
        <td width="20" align="center"><img src="${contextPath}/pic/msindex/list_03.gif"/></td>
        <td width="557" align="left"><a href="${contextPath }/commons/infoList_lczx.jsp?docId=<%= doc.getId()%>&whichCat=<%=column%>" target=\"_blank\" title="<%=_title%>">
           <%= DocumentHelper.getTitle(doc ,showsize)%></a></td>
        <td width="94" align="right" class="font_8c"><%= DocumentHelper.getUploadDate(doc ,"yyyy-MM-dd")%></td>
      </tr> 
</paging:pageRow>
             
 </table>

</form>
</paging:page></center>

