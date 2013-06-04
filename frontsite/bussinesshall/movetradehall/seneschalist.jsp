<jsp:directive.page import="com.css.cms.document.util.DocumentHelper"/><%request.setCharacterEncoding ("UTF-8") ;%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.css.cms.document.*"%>
<%@page import="com.css.cms.document.Document"%>
<%@page import="com.css.cms.category.CategoryFactory"%>
<%@page import="com.css.cms.category.CategoryTree"%>
<%@page import="com.css.cms.category.*"%>
<%@ taglib uri="/WEB-INF/plugins/paging/css-paging.tld" prefix="paging"%>
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
<link href="${ctx}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />

<center>    
<paging:page count="false" row="15" provider="<%= new com.css.cms.document.model.DocumentFrontListProvider(column,request)%>" tableId="doclist">

<form name="querylist" action="">
 <table width="90%" align="center" class="lh28 mt20  font_st list_bline1">
<paging:pageRow id="doc" type="com.css.cms.document.Document"> 
          <tr>
            <td width="515"><a href="${contextPath }/cms/newsContent.jsp?docId=<%= doc.getId()%>" target=\"_blank\">
           ·<%= DocumentHelper.getTitle(doc ,60)%> </a></td>
            <td width="108"><div align="right"><%= DocumentHelper.getUploadDate(doc ,"yyyy-MM-dd")%></div></td>
          </tr><%
          
           %>
     </paging:pageRow>
             
</table>
</form>


<div class="ym_bg mt5 center">
      <p align="center"><paging:pageInfo empty="没有记录"/>&nbsp;&nbsp;<paging:pageLink pages="8" mode="text" hasGo="false"/></p>
</div>

</paging:page></center>
<br>
