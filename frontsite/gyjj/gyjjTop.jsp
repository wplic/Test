<jsp:directive.page import="com.cssweb.common.util.StringUtils"/>
<%request.setCharacterEncoding("UTF-8");%>
<%@ page contentType="text/html; charset=UTF-8"  %>
<%@ include file="/commons/taglibs.jsp"%>
<link href="${contextPath }/gyjj/css/community.css" rel="stylesheet" type="text/css" />
<%@page import="com.css.cms.document.util.DocumentHelper"%>
<bean:parameter id="category" name="whichCat" value="" />
<%
	if(category==null){
%>
<script type="text/javascript">
	alert('您请求的资讯栏目错误');
</script>
	<%
		return ;
	}
	int rowNum = 1;
	int i=0;
%>
	 <paging:page count="false" row="<%=rowNum%>"
		provider="<%=new com.css.cms.document.model.DocumentFrontListProvider(category, request)%>">
		<div class="hotTips">
	   <paging:pageRow id="doc" type="com.css.cms.document.Document">
		<%	
			String detailPage = "/gyjj/messageShow.jsp?docId="+doc.getId() ;
		%>
            <p>
            <%
		       					String content=DocumentHelper.getContent(doc);
		       					content = content.replaceAll("&nbsp;","");
				           		content = content.replaceAll("<P>","");
				           		content = content.replaceAll("</P>","");
				           		content = content.replaceAll("<p>","");
				           		content = content.replaceAll("</p>","");
				           		content = content.replaceAll("<B>","");
				           		content = content.replaceAll("</B>","");
				           		content = content.replaceAll("<STRONG>","");
				           		content = content.replaceAll("</STRONG>","");
		      					content=StringUtils.subString(content,170,"......");
					            out.println(content);
			      %>
			    
			       </p><br/><br/>
			       <a href="#" onclick="window.open('<%=detailPage %>','')"></a>
            
    </paging:pageRow>
    </div>
	</paging:page>