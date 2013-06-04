<jsp:directive.page import="com.css.cms.document.util.DocumentHelper"/>
<jsp:directive.page import="com.cssweb.common.util.StringUtils"/>
<jsp:directive.page import="com.css.cms.document.model.DocumentFrontListProvider"/>
<%request.setCharacterEncoding("UTF-8");%>
<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/WEB-INF/plugins/paging/css-paging.tld" prefix="paging"%>
<link href="${contextPath }/css/global.css" rel="stylesheet" type="text/css" />
<link href="${contextPath }/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
<%
      String catName = "";
	  if (request.getParameter("catName") != null && !"".equals(request.getParameter("catName")))
	  {
	  	catName = request.getParameter("catName");
	  }
	  DocumentFrontListProvider documentProvider = new DocumentFrontListProvider(request);
	int rowNum = 1;
	String title="收盘综述";
%>
<paging:page count="false" row="<%=rowNum%>" provider="<%= documentProvider%>">
<paging:pageRow id="doc" type="com.css.cms.document.Document">
<div id="wjsd">
    	<div class="blank5"></div>
    	<%	
			String titlep=DocumentHelper.getTitle(doc);
			if(titlep!=null&&!titlep.equals("")&&titlep.equals("早盘视点"))
			title=titlep;
			else if(titlep!=null&&!titlep.equals("")&&titlep.equals("午间视点"))
			title=titlep;
		%>
      <table width="95%" align="center">
        <tr>
          <td width="6%" height="25" class="list_bline01" align="center"><img src="${contextPath }/pic/msindex/new/ico3.gif" width="16" height="17" /></td>
          <td width="94%" class="fontbluem font13 bold list_bline01"><%=title %></td>
        </tr>
      </table>
    <table width="95%" border="0" cellspacing="0" cellpadding="0" align="center">
     	 <tr>
	        <td valign="top" class="font_43">
		<%	
			String detailPagess = "/cms/newsContent.jsp?docId="+doc.getId() ;
		%>
            <p class="lh21 inden25"> 
            <%
		       					String content=DocumentHelper.getContent(doc);
								content=content.replaceAll("\\</?(?!(input)|(img)).*?\\>","");
								content="&nbsp;&nbsp;&nbsp;"+content;
		      					content=StringUtils.subString(content,148,"......");
					            out.println(content);
			      %> 
             <span class="red"><a href="#" onclick="window.open('<%=detailPagess %>','')">[查看详情]</a></span></p>
     </td>
      </tr>
    </table>
 </div>
 </paging:pageRow>
 </paging:page>