<jsp:directive.page import="com.css.cms.document.util.DocumentHelper"/>
<jsp:directive.page import="com.cssweb.common.util.StringUtils"/>
<jsp:directive.page import="com.css.cms.document.model.DocumentFrontListProvider"/>
<%request.setCharacterEncoding("UTF-8");%>
<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/WEB-INF/plugins/paging/css-paging.tld" prefix="paging"%>
<%
  String showSize = request.getParameter("showSize");
  String catName = "";
  if (request.getParameter("catName") != null && !"".equals(request.getParameter("catName")))
  {
  	catName = request.getParameter("catName");
  }
  String whichCat = request.getParameter("whichCat");
  DocumentFrontListProvider documentProvider = new DocumentFrontListProvider(request);
%>
 <table width="95%" align="center" border="0" cellspacing="0" cellpadding="0" class=" mt10 lh23">
	<paging:page count="false" row="<%=showSize==null?1:Integer.parseInt(showSize) %>" provider="<%= documentProvider%>">
		<paging:pageRow id="doc" type="com.css.cms.document.Document">  
		<%
		String detailPage = "/commons/yjbgContent.jsp" ;
						if(whichCat.indexOf("nbzx_jjgs")>=0||whichCat.indexOf("zqyj_yjbg_")==0||whichCat.equals("blcj_nbzx_cyb")||whichCat.equals("blcj_nbzx_gcjcck")||whichCat.equals("blcj_nbzx_sxzqcc")||whichCat.equals("blcj_nbzx_zgsxcj") ){
						       detailPage="/cms/gjzxGfyjContent.jsp" ;
						   }
		String title = DocumentHelper.getTitle(doc);
		title = title.replaceAll("\\</?(?!(input)|(img)).*?\\>","");
		%>  
		<tr>
            <td width="20" align="center"><img src="pic/msindex/list_02.gif"/></td>
            <td width="75%">
            <a title="<%= title %>" href="${contextPath }<%=detailPage %>?docId=<%= doc.getId()%>"   target=\"_blank\">
            <%= DocumentHelper.getTitle(doc ,50)%> </a> 
            </td>
            <td align="right"><%= DocumentHelper.getUploadDate(doc ,"yyyy-MM-dd")%> </td>
          </tr>
        
        </paging:pageRow>
	</paging:page> 
  </table>