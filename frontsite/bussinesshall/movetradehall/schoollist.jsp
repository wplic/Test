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

<%
		int tempNum = 0;
 %>
 <div class="lh24" style="width:610px; margin-left:auto; margin-right:auto">
<paging:page count="false" row="10" provider="<%= new com.css.cms.document.model.DocumentFrontListProvider(column,request)%>" tableId="doclist">

<form name="querylist" action="">

<paging:pageRow id="doc" type="com.css.cms.document.Document"> 
          <%
          		
          		
          		String content=DocumentHelper.getContent(doc);
								//content=content.replaceAll("\\</?(?!(input)|(img)).*?\\>","");
								//content=content.replaceAll("    "," ");
								//content=content.replaceAll("   "," ");
								//content=content.replaceAll("  "," ");
								//content=content.replaceAll("　","");
								//content=content.replaceAll("	","");
								//content=content.replaceAll("&nbsp;","");
								//content=content.replaceAll("\r\n\r\n\r\n\r\n\r\n","\r\n");
								//content=content.replaceAll("\r\n\r\n\r\n\r\n","\r\n");
								//content=content.replaceAll("\r\n\r\n\r\n","\r\n");
								//content=content.replaceAll("\r\n\r\n","\r\n");
								//content=content.replace("\r\n","<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
							//content="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+content;
								tempNum ++ ;
								
           %>
           <p class="red"><%=tempNum %>、<%= DocumentHelper.getTitle(doc ,60)%></p>
            <p class="ml20 font_73"><%= content %></p>
          
     </paging:pageRow>
             

</form>


<div align="center">
      <p align="center"><paging:pageInfo empty="没有记录"/>&nbsp;&nbsp;<paging:pageLink pages="8" mode="text" hasGo="false"/></p>
</div>

</paging:page>
</div>
<br>
