<jsp:directive.page import="com.css.cms.document.util.DocumentHelper"/>
<jsp:directive.page import="com.cssweb.common.util.StringUtils"/>
<jsp:directive.page import="com.css.cms.document.model.DocumentFrontListProvider"/>
<%request.setCharacterEncoding("UTF-8");%>
<%@page contentType="text/html; charset=UTF-8"%>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
<%@ taglib uri="/WEB-INF/plugins/paging/css-paging.tld" prefix="paging"%>
<%
	int tempNum = 0;	 
  String showSize = request.getParameter("showSize");
  DocumentFrontListProvider documentProvider = new DocumentFrontListProvider(request);
%>
	
	<paging:page count="false" row="<%=showSize==null?1:Integer.parseInt(showSize) %>" provider="<%= documentProvider%>">
		<paging:pageRow id="doc" type="com.css.cms.document.Document">  
		<%
          		String content=DocumentHelper.getContent(doc,260);
								//content=content.replaceAll("\\</?(?!(input)|(img)).*?\\>","");
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
								content=content.replace("\r\n","&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
								content="&nbsp;&nbsp;&nbsp;&nbsp;"+content + "...";
								
		%>
		<%
				if (tempNum == 0)
				{
					
					%>
						      <p align="center" class="font_blk20 red mt20"><%= DocumentHelper.getTitle(doc ,60)%></p>
    						  <p align="right" class="mr30 font_73 mt10">时间:<%= DocumentHelper.getUploadDate(doc ,"yyyy-MM-dd")%> 来源:<%= DocumentHelper.getAttrValue(doc ,"source" , "广发证券") %></p>
    						  <div class="gjzx mt10">
						   	  <p><%= content %>
						   	  <span style="float:right" class="red"><a href="${contextPath }/cms/gjzxContent.jsp?docId=<%= doc.getId()%>&whichCat=nbzx_gfmrtznc" target=\"_blank\">查看详情</a></span></p>
						
						      </div>
					<%
				}
				tempNum ++ ;
		 %>  
        
		</paging:pageRow>
	</paging:page> 
