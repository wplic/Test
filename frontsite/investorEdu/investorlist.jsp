<jsp:directive.page import="com.css.cms.document.util.DocumentHelper"/><%request.setCharacterEncoding ("UTF-8") ;%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.css.cms.document.*"%>
<%@page import="com.css.cms.document.Document"%>
<%@page import="com.css.cms.category.CategoryFactory"%>
<%@page import="com.css.cms.category.CategoryTree"%>
<%@page import="com.css.cms.category.*"%>
<%@ taglib uri="/WEB-INF/plugins/paging/css-paging.tld" prefix="paging"%>
<link href="${contextPath }/css/global.css" rel="stylesheet" type="text/css" />
<link href="${contextPath }/css/investorEdu/investorEdu.css" rel="stylesheet" type="text/css" />
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

<paging:page count="false" row="10" provider="<%= new com.css.cms.document.model.DocumentFrontListProvider(column,request)%>" tableId="doclist">
<table width="90%" align="center" class="lh28 mt20  font_st list_bline1">
<form name="querylist" action="">

<paging:pageRow id="doc" type="com.css.cms.document.Document"> 
           <tr>
            <td width="420"><a href="${contextPath }/cms/newsContent.jsp?docId=<%= doc.getId()%>" target=\"_blank\">
           <%= DocumentHelper.getTitle(doc ,60)%> </a></td>
            <td width="106"><%= DocumentHelper.getUploadDate(doc ,"yyyy/MM/dd")%></td>
          </tr>
              
     </paging:pageRow>
             

</form>
 </table>


<div class="ym_bg mt5">
    <p align="center"><paging:pageInfo empty="没有记录"/>&nbsp;&nbsp;<paging:pageLink pages="8" mode="text" hasGo="false"/></p>
        </div>

</paging:page>

