<jsp:directive.page import="com.css.cms.document.util.DocumentHelper"/>
<jsp:directive.page import="com.cssweb.common.util.StringUtils"/>
<jsp:directive.page import="com.css.cms.document.model.DocumentFrontListProvider"/>
<%request.setCharacterEncoding("UTF-8");%>
<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/WEB-INF/plugins/paging/css-paging.tld" prefix="paging"%>
<%
  String showSize = request.getParameter("showSize");
  String catName = "ywjs_ywgg|cpzx_jhlc_cpgg|wsyyt_jygg";
  DocumentFrontListProvider documentProvider = new DocumentFrontListProvider(request);
%>
<div class="ritagt1">
		
       	  <div class="newtit8">
       	  	<a href="${contextPath}/business/businessYwgg.html">
       	  		<span style="float:right;color:#2c5ea3;cursor:hand;">更多</span>
       	  	</a>
       	  	<a href="${contextPath }/business/businessYwgg.jsp?nav=ywgg">
       	  		<span style="color:#2c5ea3;cursor:hand;">业务动态</span>
       	  	</a>
       	  </div>
       	
</div>
        <div class="ritagm1">
 <table width="95%" align="center" border="0" cellspacing="0" cellpadding="0" class=" mt10 lh23">
	<paging:page count="false" row="<%=showSize==null?1:Integer.parseInt(showSize) %>" provider="<%=new com.css.cms.document.model.DocumentFrontListProvider(catName, request)%>">
		<paging:pageRow id="doc" type="com.css.cms.document.Document">  
		<%
		String title = DocumentHelper.getTitle(doc);
		title = title.replaceAll("\\</?(?!(input)|(img)).*?\\>","");
		%>  
		<tr>
            <td width="20" align="center"><img src="pic/msindex/list_02.gif"/></td>
            <td>
            <a title="<%= title %>" href="${contextPath }/commons/infoList.jsp?docId=<%= doc.getId()%>"   target=\"_blank\">
            <%= DocumentHelper.getTitle(doc ,20)%> </a> 
            </td>
           
          </tr>
        
        </paging:pageRow>
	</paging:page> 
  </table>
  <%
   String category1="zxzx_jysgg_hstbts";
   String category2="zxzx_jysgg_sstbts";
   %>
  <div class="blank5"></div>
          <div class="newline1"></div>
           <table width="95%" align="center" border="0" cellspacing="0" cellpadding="0" class=" mt10 lh23">
	<paging:page count="false" row="<%=1%>" provider="<%=new com.css.cms.document.model.DocumentFrontListProvider(category1, request)%>">
		<paging:pageRow id="doc" type="com.css.cms.document.Document">  
		<%
		String title = DocumentHelper.getTitle(doc);
		title = title.replaceAll("\\</?(?!(input)|(img)).*?\\>","");
		%>  
		<tr>
            <td width="20" align="center"><img src="pic/msindex/list_02.gif"/></td>
            <td>
            <a title="<%= title %>" href="${contextPath }/commons/newsContent.jsp?docId=<%= doc.getId()%>"   target=\"_blank\">
            <%= DocumentHelper.getTitle(doc ,20)%> </a> 
            </td>
           
          </tr>
        
        </paging:pageRow>
	</paging:page> 
	<paging:page count="false" row="<%=1%>" provider="<%=new com.css.cms.document.model.DocumentFrontListProvider(category2, request)%>">
		<paging:pageRow id="doc" type="com.css.cms.document.Document">  
		<%
		String title = DocumentHelper.getTitle(doc);
		title = title.replaceAll("\\</?(?!(input)|(img)).*?\\>","");
		%>  
		<tr>
            <td width="20" align="center"><img src="pic/msindex/list_02.gif"/></td>
            <td>
            <a title="<%= title %>" href="${contextPath }/commons/newsContent.jsp?docId=<%= doc.getId()%>"   target=\"_blank\">
            <%= DocumentHelper.getTitle(doc ,20)%> </a> 
            </td>
           
          </tr>
        
        </paging:pageRow>
	</paging:page> 
  </table>
        </div>