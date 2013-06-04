<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<jsp:directive.page import="com.css.cms.document.util.DocumentHelper"/><%request.setCharacterEncoding ("UTF-8") ;%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.css.cms.document.*"%>
<%@page import="com.css.cms.document.Document"%>
<%@page import="com.css.cms.category.CategoryFactory"%>
<%@page import="com.css.cms.category.CategoryTree"%>
<%@page import="com.css.cms.category.*"%>
<%@ taglib uri="/WEB-INF/plugins/paging/css-paging.tld" prefix="paging"%>
<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
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
<paging:page count="false" row="15" provider="<%= new com.css.cms.document.model.DocumentFrontListProvider(column,request)%>" tableId="doclist">

<form name="querylist" action="">
<table width="98%" align="center" border="0" class="lh27 list_bline1 mt10">
<paging:pageRow id="doc" type="com.css.cms.document.Document">
		<%
	    	String title = DocumentHelper.getTitle(doc);
			title = title.replaceAll("\\</?(?!(input)|(img)).*?\\>","");
		%>
		<tr>
	      <td align="center" width="18"><img src="/pic/msindex/list_03.gif"/></td>
	      <td align="left"><a title="<%= title %>" href="${contextPath }/commons/infoList.jsp?docId=<%= doc.getId()%>"   target=\"_blank\">
        	 <%= DocumentHelper.getTitle(doc ,50)%> </a></a></td>
	      <td width="72" class="font_8c"><%= DocumentHelper.getUploadDate(doc ,"yyyy/MM/dd")%></td>
	    </tr>
	</paging:pageRow>
             
 </table>
 <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="30" align="right"><paging:pageInfo empty="没有记录"/>&nbsp;&nbsp;<paging:pageLink pages="8" mode="text" hasGo="false"/></td>
      </tr>
    </table>
</form>
</paging:page></center>

