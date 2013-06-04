<%@ page contentType="text/html; charset=utf-8" language="java" %>
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<jsp:directive.page import="com.cssweb.theme.service.ThemeNewsService"/>
<jsp:directive.page import="com.cssweb.theme.pojo.ThemeNews"/>
<jsp:directive.page import="com.cssweb.theme.service.ThemeCategoryService"/>
<jsp:directive.page import="com.cssweb.theme.pojo.ThemeCategory"/>
<jsp:directive.page import="com.cssweb.theme.service.ThemeArticleCategoryService"/>
<jsp:directive.page import="com.cssweb.theme.pojo.ThemeArticleCategory"/>
<jsp:directive.page import="java.util.*"/>
<jsp:directive.page import="java.text.SimpleDateFormat"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<link href="/css/theme/style.css" rel="stylesheet" type="text/css" />
<%
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

String themeid = null==request.getParameter("themeid")?"0":request.getParameter("themeid");

ServletContext st = this.getServletConfig().getServletContext();
ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
ThemeNewsService themeNewsService = (ThemeNewsService) ctx.getBean("themeNewsService");
ThemeCategoryService themeCategoryService = (ThemeCategoryService) ctx.getBean("themeCategoryService");
ThemeArticleCategoryService themeArticleCategoryService = (ThemeArticleCategoryService) ctx.getBean("themeArticleCategoryService");

ThemeCategory  theme=themeCategoryService.getById(Long.parseLong(themeid));
Map map = new HashMap();
map.put("sortName","PUBLICATIONTIME");
map.put("dir","desc");
map.put("begin","0");
map.put("end","100");
List newslist = themeNewsService.getFrontByMap(Long.parseLong(themeid),map);
map.put("sortName","UPDATETIME");
List artcatlist = themeArticleCategoryService.getFrontByMap(Long.parseLong(themeid),map);
%>
</head>

<body>
<jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="${ctx }/default.html">首页</a> - <a href="${ctx }/about/aboutUs.html">关于广发</a> - <a href="${ctx }/about/themeList.jsp">专题活动</a></div>
</div>
<div class="warp">
  <div class="bg_f5">
	<div><img src="${ctx}/share/showUploadImage.jsp?id=<%=null==theme?"0":theme.getPicid()%>" width="920" height="136" /></div>	
  <div class="tmenu">
    	<table border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td class="txt bold"><a href="${ctx }/about/theme.jsp?themeid=<%=themeid%>">专题首页</a></td>
            <td class="txt bold"><a href="${ctx }/about/themeJj.jsp?themeid=<%=themeid%>">专题简介</a></td>
            <td class="txt bold"><a href="${ctx }/about/themeXgmtbd.jsp?themeid=<%=themeid%>">相关媒体报道</a></td>
            <td class="txt bold"><a href="${ctx }/about/themeVideo.jsp?themeid=<%=themeid%>">专题视频</a></td>
            <td class="txt bold"><a href="${ctx }/about/themePic.jsp?themeid=<%=themeid%>">专题图片</a></td>
            <%if(null!=artcatlist){
            	for(int i=0;i<artcatlist.size();i++){
            		ThemeArticleCategory artcat = (ThemeArticleCategory)artcatlist.get(i);%>
            <td class="txt150 bold"><a href="${ctx }/about/themeQt.jsp?themeid=<%=themeid%>&artcatid=<%=artcat.getId()%>"><%=artcat.getTitle() %></a></td>
            <%	}
            }%>
          </tr>
        </table>
  </div>
  <div class="block9"></div>

    <div class="zttit3">相关媒体报道</div>
  <div class="block9"></div>
    <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="listtxt">
        
          	<%if(null!=newslist && newslist.size()>0){ 
          		for(int i=0;i<newslist.size();i++){
          			ThemeNews news = (ThemeNews)newslist.get(i);%>
			      <tr>
			            <td width="90%">·<a href="${ctx }/about/themeBd.jsp?themeid=<%=themeid%>&newsid=<%=news.getId() %>" target="_blank"><%=news.getTitle() %></a>
			           &nbsp;&nbsp;&nbsp;作者:<%=news.getAuthor() %> 来源:<%=news.getSource() %>
			            </td>
			            <td><%=sdf.format(news.getPublicationtime()) %></td>
			      </tr>
		<%}
		} %>
    </table>
    <div class="block9"></div>
    </div>

    
</div>
<div class="blank5"></div>
<jsp:include page="/commons/msbottom.jsp" />
</body>
</html>
