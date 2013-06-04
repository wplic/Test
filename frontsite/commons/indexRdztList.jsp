<%@page import="com.css.cms.document.util.DocumentHelper"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@ page contentType="text/html; charset=UTF-8" language="java" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<jsp:directive.page import="com.cssweb.theme.service.ThemeCategoryService"/>
<jsp:directive.page import="com.cssweb.theme.service.ThemeNewsService"/>
<jsp:directive.page import="com.cssweb.theme.pojo.ThemeCategory"/>
<jsp:directive.page import="com.cssweb.theme.pojo.ThemeNews"/>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="java.util.*"/>
<jsp:directive.page import="java.text.SimpleDateFormat"/>
<%@ include file="/commons/taglibs.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
</head>
<%
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
ServletContext st = this.getServletConfig().getServletContext();
ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
ThemeCategoryService themeCategoryService = (ThemeCategoryService) ctx.getBean("themeCategoryService");
ThemeNewsService themeNewsService = (ThemeNewsService) ctx.getBean("themeNewsService");
List list=themeCategoryService.getAll();
ThemeCategory themeCategory = null;
if(null!=list && list.size()>0)
	themeCategory = (ThemeCategory)list.get(0);
Map map = new HashMap();
map.put("sortName","PUBLICATIONTIME");
map.put("dir","desc");
map.put("begin","0");
map.put("end","100");
List newslist = null;
if(null!=themeCategory)
	newslist = themeNewsService.getFrontByMap(themeCategory.getId(),map);
%>
<body>
<div class="ritagt1">

<div class="newtit10"> <a href="${contextPath}/about/themeList.jsp?meun=gygf_zthd"><span style="float:right;color:#2c5ea3;cursor:hand;">更多</span></a>热点专题</div>
</div>
 <div class="ritagm1">
    <table width="92%" border="0" align="center" cellpadding="0" cellspacing="0" class=" mt10 lh23">
    <%if(null!=themeCategory){
    		String title = themeCategory.getTitle();
    		if(title.length()>10)
    			title = title.substring(0,10)+"...";%>
      <tr>
        <td colspan="2" align="center"><a href="${ctx }/about/theme.jsp?themeid=<%=themeCategory.getId()%>" title="<%=themeCategory.getTitle() %>"><b><%=title%></b></a></td>
      </tr>
      <%
		if(null!=newslist){
			for(int i=0;i<newslist.size()&&i<3;i++){
			ThemeNews news = (ThemeNews)newslist.get(i);
			String newtitle = news.getTitle();
    		if(newtitle.length()>10)
    			newtitle = newtitle.substring(0,10)+"...";%>
			      <tr>
			            <td width="15" align="center" valign="top"><img src="${ctx}/pic/msindex/list_02.gif" class=" mt8"/></td>
			            <td><a href="${ctx }/about/themeBd.jsp?themeid=<%=themeCategory.getId()%>&newsid=<%=news.getId() %>" title="<%=news.getTitle() %>" target="_blank"><%=newtitle %></a></td>
			      </tr>
			<%}
		}
      } %>
       
    </table>
    </div>

</body>
</html>