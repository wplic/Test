
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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


<%
		int tempNum = 0;
 %>
 <table width="99%" border="1" bordercolor="#cfcfcf" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
      <tr>
        <td class="info_th01 "><span class="font_43">最新公告</span></td>
      </tr>
      <tr>
        <td class="lh28 p10">
 <ul>
<paging:page count="false" row="10" provider="<%= new com.css.cms.document.model.DocumentFrontListProvider(column,request)%>" tableId="doclist">

<form name="querylist" action="">

<paging:pageRow id="doc" type="com.css.cms.document.Document"> 
          <%
          		
          		String content=DocumentHelper.getContent(doc);
								content=content.replaceAll("\\</?(?!(input)|(img)).*?\\>","");
								content=content.replaceAll("    "," ");
								content=content.replaceAll("   "," ");
								content=content.replaceAll("  "," ");
								content=content.replaceAll("　","");
								content=content.replaceAll("	","");
								content=content.replaceAll("&nbsp;","");
								content=content.replaceAll("\r\n\r\n\r\n\r\n\r\n","\r\n");
								content=content.replaceAll("\r\n\r\n\r\n\r\n","\r\n");
								content=content.replaceAll("\r\n\r\n\r\n","\r\n");
								content=content.replaceAll("\r\n\r\n","\r\n");
								content=content.replace("\r\n","<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
							//content="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+content;
							
								
           %>
           <%-- <li class="li_list1"><a href="${contextPath }/cms/newsContent.jsp?docId=<%= doc.getId()%>" target="_blank"><%= DocumentHelper.getTitle(doc ,20)%> </a> </li> --%>
          
            <img src="${contextPath }/pic/index/list_06.gif" />&nbsp;&nbsp; <a href="${contextPath }/cms/newsContent.jsp?docId=<%= doc.getId()%>" target="_blank"><%= DocumentHelper.getTitle(doc ,18)%> </a>
            <br/>
         
     </paging:pageRow>
             

</form>


</paging:page>
</ul>
  </td>
      </tr>
    </table>

