<%@ page contentType="text/html; charset=utf-8" language="java"%>
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<jsp:directive.page import="com.cssweb.theme.service.ThemeIntroService"/>
<jsp:directive.page import="com.cssweb.theme.pojo.ThemeIntro"/>
<jsp:directive.page import="com.cssweb.theme.service.ThemeCategoryService"/>
<jsp:directive.page import="com.cssweb.theme.pojo.ThemeCategory"/>
<jsp:directive.page import="com.cssweb.theme.service.ThemeArticleCategoryService"/>
<jsp:directive.page import="com.cssweb.theme.pojo.ThemeArticleCategory"/>
<jsp:directive.page import="java.util.*"/>
<jsp:directive.page import="java.text.SimpleDateFormat"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
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

ServletContext st = this.getServletConfig().getServletContext();
ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
ThemeIntroService themeIntroService = (ThemeIntroService) ctx.getBean("themeIntroService");
ThemeCategoryService themeCategoryService = (ThemeCategoryService) ctx.getBean("themeCategoryService");
ThemeArticleCategoryService themeArticleCategoryService = (ThemeArticleCategoryService) ctx.getBean("themeArticleCategoryService");

ThemeCategory  theme=themeCategoryService.getById(Long.parseLong(themeid));
Map map = new HashMap();
map.put("sortName","UPDATETIME");
map.put("dir","desc");
map.put("begin","0");
map.put("end","100");
List artcatlist = themeArticleCategoryService.getFrontByMap(Long.parseLong(themeid),map);
ThemeIntro themeIntro=themeIntroService.getByCategoryId(Long.parseLong(themeid));
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
<!-- header begin -->
<jsp:include page="/gyjj/index_top.jsp?nav=grhg" />
<div id="subbanner">
  <div id="subbanner2"><img src="${contextPath }/gyjj/images/subBanner.jpg" /></div>
</div>
<div class="subMainconter">
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layout">
  <tr>
    <th valign="top" class="wrapleft">
    <div class="navLeft">
      <h3><img src="${contextPath }/gyjj/images/title_gehg.jpg" /></h3>
      <ul class="navleftList">
      <li><a href="${contextPath }/gyjj/owed.jsp?themeid=<%=themeid%>">专题活动首页</a></li>
      <li class="this"><a href="${contextPath }/gyjj/presentations.jsp?themeid=<%=themeid%>">专题简介</a></li>
      <li><a href="${contextPath }/gyjj/mediaList.jsp?themeid=<%=themeid%>">相关媒体报道</a></li>
      <li><a href="${contextPath }/gyjj/videoList.jsp?themeid=<%=themeid%>">专题视频</a></li>
      <li><a href="${contextPath }/gyjj/topicspicList.jsp?themeid=<%=themeid%>">专题图片</a></li>
    </ul>
    </div>
    </th>
    <td valign="top" class="wrapright">
      <div class="columnOut">
      <div class="columnTitle"><h3>专题简介</h3></div>
      <div class="columnMain summary">
        <p>
         <%  
				String content=themeIntro.getIntro();
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
		   %> 
        </p>
        </div>
      <div class="columnButtom"><img src="${contextPath }/gyjj/images/columnButtom.jpg" /></div>
    </div></td>
    </tr>
</table>
</div>
<div class="clear"></div>
<jsp:include page="/gyjj/index_bottom.jsp" />
</body>
</html>
