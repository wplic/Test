<%@ page contentType="text/html; charset=utf-8" language="java" %>
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<jsp:directive.page import="com.cssweb.theme.service.ThemeNewsService"/>
<jsp:directive.page import="com.cssweb.theme.pojo.ThemeNews"/>
<jsp:directive.page import="com.cssweb.theme.service.ThemeCategoryService"/>
<jsp:directive.page import="com.cssweb.theme.pojo.ThemeCategory"/>
<jsp:directive.page import="com.cssweb.theme.service.ThemeArticleCategoryService"/>
<jsp:directive.page import="com.cssweb.theme.pojo.ThemeArticleCategory"/>
<jsp:directive.page import="com.cssweb.common.toDbLob.service.LobService"/>
<jsp:directive.page import="com.cssweb.common.toDbLob.pojo.FileBlob"/>
<jsp:directive.page import="com.cssweb.common.web.filter.SqlInjectValidate"/>
<jsp:directive.page import="java.util.*"/>
<jsp:directive.page import="java.text.SimpleDateFormat"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证劵_社会公益基金</title>
<link href="${contextPath }/gyjj/css/community.css" rel="stylesheet" type="text/css" />
<script src="${contextPath }/gyjj/js/swfobject_source.js" type=text/javascript></script>
</head>
<jsp:directive.page import="com.cssweb.common.web.filter.SqlInjectValidate"/>
<%
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

String themeid = null==request.getParameter("themeid")?"0":request.getParameter("themeid");
String newsid = null==request.getParameter("newsid")?"0":request.getParameter("newsid");

ServletContext st = this.getServletConfig().getServletContext();
ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
ThemeNewsService themeNewsService = (ThemeNewsService) ctx.getBean("themeNewsService");
ThemeCategoryService themeCategoryService = (ThemeCategoryService) ctx.getBean("themeCategoryService");
ThemeArticleCategoryService themeArticleCategoryService = (ThemeArticleCategoryService) ctx.getBean("themeArticleCategoryService");
LobService lobService=(LobService)ctx.getBean("lobService");

ThemeCategory  theme=themeCategoryService.getById(Long.parseLong(themeid));
Map map = new HashMap();
map.put("sortName","UPDATETIME");
map.put("dir","desc");
map.put("begin","0");
map.put("end","100");
List artcatlist = themeArticleCategoryService.getFrontByMap(Long.parseLong(themeid),map);

ThemeNews news = themeNewsService.getById(Long.parseLong(newsid));

 SqlInjectValidate sqlInjectValidate = SqlInjectValidate.getSqlInjectValidate();
	if(request.getParameter("nav1")!=null&&!request.getParameter("nav1").equals("")){
				if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("nav1"),10)){
					response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
					return;
				 }
			}
	if(request.getParameter("nav")!=null&&!request.getParameter("nav").equals("")){
				if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("nav"),10)){
					response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
					return;
				 }
			}
	if(request.getParameter("themeid")!=null&&!request.getParameter("themeid").equals("")){
				if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("themeid"),6)){
					response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
					return;
				 }
			}
  if(request.getParameter("themeid")!=null&&!request.getParameter("themeid").equals("")){
				if(sqlInjectValidate.vakidateSqlIfIngter(request.getParameter("themeid"))){
					response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
					return;
				 }
			}
%>
<body>
<jsp:include page="/gyjj/index_top.jsp" />
<!-- header end -->
<div id="subbanner"><img src="${contextPath }/gyjj/images/subBanner.jpg" /></div>
<div class="subMainconter">
  <div class="newshowup"><img src="${contextPath }/gyjj/images/newshowup.jpg" /></div>
  <div class="newshowMain">
      <dl class="newsTitle">
        <dt><%=news.getTitle() %></dt>
        <dd><span>来源：<%=news.getSource()%>&nbsp;&nbsp;&nbsp;&nbsp; </span>
        <span>报道时间：<%=sdf.format(news.getPublicationtime())%>  </span>
        <span>作者：<%=news.getAuthor() %>&nbsp;&nbsp;&nbsp;&nbsp;</span></dd>
      </dl>
       <br />
      <%  
				String content=new String(news.getContent(),"UTF-8");
				//content=content.replaceAll("\\</?(?!(input)|(img)).*?\\>","");
				//content=content.replaceAll("    "," ");
				//content=content.replaceAll("   "," ");
				//content=content.replaceAll("  "," ");
				//content=content.replaceAll("　","");
				//content=content.replaceAll("	","");
				//content=content.replaceAll("&nbsp;","");
				//content=content.replaceAll("\r\n\r\n\r\n\r\n\r\n","\r\n");
				//content=content.replaceAll("\r\n\r\n\r\n\r\n","\r\n");
				//content=content.replaceAll("\r\n\r\n\r\n","\r\n");
				//content=content.replaceAll("\r\n\r\n","\r\n");
				//content=content.replace("\r\n","<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
				//content="&nbsp;&nbsp;&nbsp;&nbsp;"+content;
				
				out.println(content);
				if (news != null && news.getFileid() >0)
				{
						
						FileBlob file = lobService.getFileBlobById(news.getFileid());
						String fileName =  "" ;
						if (file != null && file.getFileName() != null)
						{
							fileName = file.getFileName();
						}
						
						
						%>
								<br/>【附件】：<a href="${ctx}/commons/showDocumentFile.jsp?id=<%=news.getFileid() %>"><%=fileName %></a>
								
						<%
				}
		   %> 
                           <br />
      <div class="close">
      <a href="#" onClick="javascript:window.opener=null;window.close();"><img src="${contextPath }/gyjj/images/closeBtn.jpg" /></a></div>
  </div>
  <div class="newshowdown"><img src="${contextPath }/gyjj/images/newshowdown.jpg" /></div>
</div>
<div class="clear"></div>
<jsp:include page="/gyjj/index_bottom.jsp" />
</body>
</html>
