<jsp:directive.page import="com.css.cms.document.util.DocumentHelper"/>
<jsp:directive.page import="com.cssweb.common.util.StringUtils"/>
<jsp:directive.page import="com.css.cms.document.model.DocumentFrontListProvider"/>
<%request.setCharacterEncoding("UTF-8");%>
<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/WEB-INF/plugins/paging/css-paging.tld" prefix="paging"%>
<%
  int tempNum = 0;	 
  String showSize = request.getParameter("showSize");
  String whichCat = request.getParameter("whichCat");
  String catName = "";
  if (request.getParameter("catName") != null && !"".equals(request.getParameter("catName")))
  {
  	catName = request.getParameter("catName");
  }
  
  String selectSize="1";
  if(request.getParameter("selectSize") != null && !"".equals(request.getParameter("selectSize"))) 
  selectSize=request.getParameter("selectSize");
  DocumentFrontListProvider documentProvider = new DocumentFrontListProvider(request);
  int i=0;
%>
	
	<paging:page count="false" row="<%=showSize==null?1:Integer.parseInt(showSize) %>" provider="<%= documentProvider%>">
		<paging:pageRow id="doc" type="com.css.cms.document.Document">  
		<%
		String detailPage = "/cms/gjzxContent.jsp" ;
						if(whichCat.indexOf("nbzx_jjgs")>=0||whichCat.indexOf("zqyj_yjbg_")==0||whichCat.equals("blcj_nbzx_cyb")||whichCat.equals("blcj_nbzx_gcjcck")||whichCat.equals("blcj_nbzx_sxzqcc")||whichCat.equals("blcj_nbzx_zgsxcj") ){
						       detailPage="/cms/gjzxGfyjContent.jsp" ;
						   }
    	i++;	
    	if(String.valueOf(i).equals(selectSize))
    	{
		String title = DocumentHelper.getTitle(doc);
		title = title.replaceAll("\\</?(?!(input)|(img)).*?\\>","");
		%>  
			<tr>

	            <td width="3%" valign="top"><img src="${contextPath }/pic/index/list_11.gif"/></td>
	            <td width="77%">
			        <a title="<%= title %>" href="${contextPath }<%=detailPage %>?docId=<%= doc.getId()%>&whichCat=<%=whichCat%>"   target=\"_blank\">
			        <span class="bold">[<%=catName %>]</span> <%= StringUtils.subString(title,35,"...")+"&nbsp;&nbsp;"%> </a> 
			        <%} %>
        		</td>
        		<td width="20%">
        			<%=DocumentHelper.getUploadDate(doc,"yyyy/MM/dd") %>
        		</td>
	          </tr>
        </paging:pageRow>
	</paging:page> 
