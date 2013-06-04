<%request.setCharacterEncoding("UTF-8");%>
<%@ page contentType="text/html; charset=UTF-8" language="java"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/commons/taglibs.jsp"%>
<%@page import="com.css.cms.document.util.DocumentHelper"%>
<bean:parameter id="category" name="whichCat" value="" />
<bean:parameter id="imgUrl" name="imgUrl" value="/pic/infoCenter/gsyw.jpg"/>
<jsp:directive.page import="com.cssweb.common.util.StringUtils"/>
<%
	if(category==null){
%>
<script type="text/javascript">
	alert('您请求的资讯栏目错误');
</script>
	<%
		return ;
	}
	//String ctx = request.getContextPath();
	int rowNum = 1;
%>
	 <paging:page count="false" row="<%=rowNum%>"
		provider="<%=new com.css.cms.document.model.DocumentFrontListProvider(category, request)%>">
		<paging:pageRow id="doc" type="com.css.cms.document.Document">
		<%	
			String detailPage = "/cms/newsContent.jsp?docId="+doc.getId() ;
		%>
       <table width="95%" border="0" cellspacing="0" cellpadding="0" align="center">
      <tr>
        <td width="28%"><img src="<%=imgUrl %>"/></td>
        <td width="72%" valign="top" class="font_43">
        	<p class="font14 red bold" style="line-height:30px"><%=DocumentHelper.getTitle(doc,50) %></p>
            <p class="lh21 inden25">
            <%
		       					String content=DocumentHelper.getContent(doc);
								content="&nbsp;&nbsp;&nbsp;"+content;
		      					content=StringUtils.subString(content,200,"......");
					            out.println(content);
			 %> 
             <span class="red"><a href="#" onclick="window.open('<%=detailPage %>','')">[全文]</a></span></p>
        </td>
      </tr>
    </table>
    </paging:pageRow>
	</paging:page>