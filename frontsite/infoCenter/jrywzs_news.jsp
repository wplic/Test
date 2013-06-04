<%@ page contentType="text/html; charset=utf-8" language="java"  %>
<html><title>广发证券</title>
<link href="${ctx}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
<%@ include file="/commons/taglibs.jsp"%>
<jsp:directive.page import="com.css.cms.document.util.DocumentHelper"/>
<jsp:directive.page import="com.css.cms.document.DocumentManager"/>
<jsp:directive.page import="com.cssweb.common.util.StringUtils"/>
<jsp:directive.page import="com.css.cms.document.model.DocumentFrontListProvider"/>
<jsp:directive.page import="com.css.cms.document.util.DocumentHelper"/>
<jsp:directive.page import="com.cssweb.common.util.HTMLutils"/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
</head>
<%
    int rowNum=5;
    if(request.getParameter("showSize")!=null&&!request.getParameter("showSize").equals(""))
    {
      rowNum=Integer.parseInt(request.getParameter("showSize").trim());
    }
    
    String whichCat="zxzx_jryw";
    if(request.getParameter("whichCat")!=null&&!request.getParameter("whichCat").equals(""))
    {
      whichCat=request.getParameter("whichCat");
    }
    DocumentFrontListProvider documentProvider = new com.css.cms.document.model. DocumentFrontListProvider(whichCat,request);
 %>
<body class="body_bg">
<div class="w706 fright">
    <div class="left_tit2">今日要闻综述</div>
    <div class="blank5"></div>
<paging:page count="false" row="<%=rowNum%>" provider="<%= documentProvider%>">
		<paging:pageRow id="doc" type="com.css.cms.document.Document">   
		
		<div class="ywzs_box mt10" style="word-wrap:break-word;">
    <h2>
    <a href="${contextPath }/cms/newsContent.jsp?docId=<%= doc.getId()%>" target=\"_blank\">
	 <%= DocumentHelper.getTitle(doc ,30)%> </a>
    </h2>
    <h3>
    <%= DocumentHelper.getUploadDate(doc ,"yyyy-MM-dd")%>
    <%= DocumentHelper.getAttrValue(doc ,"source" , "广发证券") %> </h3>
    <p><a href="${contextPath }/cms/newsContent.jsp?docId=<%= doc.getId()%>" target=\"_blank\">
   <%
    String content=DocumentHelper.getContent(doc);
	content=HTMLutils.TextToHtml(content);
	content=content.replaceAll("&nbsp;","");
	content=content.replaceAll("    "," ");
	content=content.replaceAll("   "," ");
	content=content.replaceAll("  "," ");
	content=content.replaceAll("　","");
	content=content.replaceAll("	","");
	content=content.replaceAll("\r\n\r\n\r\n\r\n\r\n","\r\n");
	content=content.replaceAll("\r\n\r\n\r\n\r\n","\r\n");
	content=content.replaceAll("\r\n\r\n\r\n","\r\n");
	content=content.replaceAll("\r\n\r\n","\r\n");
	if(content!=null && content.length()>100){
		content = content.substring(0,100)+"...";
	}
    out.print(content);
    %>
   </a></p>
    <div class="blank10"></div>
  </div>
</paging:pageRow> 
  
  <div class="blank10"></div>
          <table width="90%" cellspacing="0" cellpadding="0" >
		        	<tr>
		        		<td height="1">
		        			&nbsp;
		        		</td>
		        	</tr>
		            <tr>
		            	<td width="30%" align="center">
		            	</td>
						<td width="35%" align="right">
								<paging:pageInfo empty="没有记录" />
										</td>
										<td width="35%" align="right">
								<paging:pageLink hasText="true" hasPageNo="true" mode="text"
								pages="2" hasGo="false" />
						</td>
					</tr>
		          </table>
  </div>
  </paging:page>  
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</body>
</html>