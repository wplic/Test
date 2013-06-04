<%@page import="com.css.cms.document.util.DocumentHelper"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@ page contentType="text/html; charset=UTF-8" language="java"  %>
<%@ include file="/commons/taglibs.jsp"%>
<bean:parameter id="category" name="whichCat" value="rzllhrqgl" />
<bean:parameter id="showSize1" name="showSize" value="1" />
<%
	if(category==null){
		%>
<script type="text/javascript">
	alert('您请求的资讯栏目错误');
</script>
	<%
		return ;
	}
%>
<div id="tabs03">
 <table class="lh25 mt10">
    <tr><td>
     <paging:page count="false" row="<%=1%>" provider="<%=new com.css.cms.document.model.DocumentFrontListProvider(category, request)%>">
		<paging:pageRow id="doc" type="com.css.cms.document.Document">
				          <%=DocumentHelper.getContent(doc)%>
		   </paging:pageRow>
        </paging:page>
         </td>
        </tr>
  </table>      
</div>