<%@ page contentType="text/html; charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<jsp:directive.page import="com.cssweb.theme.service.ThemeIntroService"/>
<jsp:directive.page import="com.cssweb.theme.service.ThemeNewsService"/>
<jsp:directive.page import="com.cssweb.theme.service.ThemeVideoService"/>
<jsp:directive.page import="com.cssweb.theme.service.ThemePicService"/>
<jsp:directive.page import="com.cssweb.theme.service.ThemeArticleCategoryService"/>
<jsp:directive.page import="com.cssweb.theme.service.ThemeArticleService"/>
<jsp:directive.page import="com.cssweb.theme.service.ThemeCategoryService"/>
<jsp:directive.page import="com.cssweb.theme.pojo.ThemeCategory"/>
<jsp:directive.page import="com.cssweb.theme.pojo.ThemeIntro"/>
<jsp:directive.page import="com.cssweb.theme.pojo.ThemeVideo"/>
<jsp:directive.page import="com.cssweb.theme.pojo.ThemeNews"/>
<jsp:directive.page import="com.cssweb.theme.pojo.ThemePic"/>
<jsp:directive.page import="com.cssweb.theme.pojo.ThemeArticleCategory"/>
<jsp:directive.page import="com.cssweb.theme.pojo.ThemeArticle"/>
<jsp:directive.page import="com.cssweb.common.web.filter.SqlInjectValidate"/>
<jsp:directive.page import="java.util.*"/>
<jsp:directive.page import="java.text.SimpleDateFormat"/>
<%@page import="com.cssweb.questionnaire.service.QuestionnaireService"%>
<%@page import="com.cssweb.questionnaire.service.QuestionnaireCategoryService"%>
<%@page import="com.cssweb.questionnaire.pojo.QuestionnaireCategory"%>
<%@page import="com.cssweb.questionnaire.pojo.Questionnaire"%>
<%@page import="com.cssweb.common.util.StringUtils"%>
<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	String themeid = null==request.getParameter("themeid")?"0":request.getParameter("themeid");
	
	ServletContext st = this.getServletConfig().getServletContext();
	ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
	ThemeIntroService themeIntroService = (ThemeIntroService) ctx.getBean("themeIntroService");
	ThemeNewsService themeNewsService = (ThemeNewsService) ctx.getBean("themeNewsService");
	ThemeVideoService themeVideoService = (ThemeVideoService) ctx.getBean("themeVideoService");
	ThemePicService themePicService = (ThemePicService) ctx.getBean("themePicService");
	ThemeArticleCategoryService themeArticleCategoryService = (ThemeArticleCategoryService) ctx.getBean("themeArticleCategoryService");
	ThemeArticleService themeArticleService = (ThemeArticleService) ctx.getBean("themeArticleService");
	QuestionnaireCategoryService questionnaireCategoryService = (QuestionnaireCategoryService)ctx.getBean("questionnairecategoryservice");
	QuestionnaireService questionnaireService = (QuestionnaireService)ctx.getBean("questionnaireservice");
	ThemeCategoryService themeCategoryService = (ThemeCategoryService) ctx.getBean("themeCategoryService");
	
	ThemeCategory  theme=themeCategoryService.getById(Long.parseLong(themeid));
	//
	ThemeIntro themeIntro=themeIntroService.getByCategoryId(Long.parseLong(themeid));
	Map map = new HashMap();
	//
	map.put("sortName","PUBLICATIONTIME");
	map.put("dir","desc");
	map.put("begin","0");
	map.put("end","4");
	List newslist = themeNewsService.getFrontByMap(Long.parseLong(themeid),map);
	//
	map.put("sortName","UPDATETIME");
	map.put("end","5");
	List videolist = themeVideoService.getFrontByMap(Long.parseLong(themeid),map);
	//
	map.put("sortName","UPDATETIME");
	List piclist = themePicService.getFrontByMap(Long.parseLong(themeid),map);
	//
	map.put("end","100");
	//
	List artcatlist = themeArticleCategoryService.getFrontByMap(Long.parseLong(themeid),map);
	map.put("end","5");
	//
	QuestionnaireCategory cate = questionnaireCategoryService.getCategoryByCode2("wjdt_zthd");
	List quelist = null;
	if(null!=cate)
		quelist = questionnaireService.getQuestionInfoByCateId(cate.getId());
	 SqlInjectValidate sqlInjectValidate = SqlInjectValidate.getSqlInjectValidate();
	if(null!=request.getParameter("themeid") && sqlInjectValidate.vakidateSqlIfIngter(request.getParameter("themeid")))
			response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
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
	</head>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证劵_社会公益基金</title>
<link href="${contextPath }/gyjj/css/community.css" rel="stylesheet" type="text/css" />
<script src="${contextPath }/gyjj/js/swfobject_source.js" type=text/javascript></script>
</head>
<body>
<!-- header begin -->
<jsp:include page="/gyjj/index_top.jsp?nav=grhg" />
<!-- header end -->
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
      <li><a href="${contextPath }/gyjj/presentations.jsp?themeid=<%=themeid%>">专题简介</a></li>
      <li><a href="${contextPath }/gyjj/mediaList.jsp?themeid=<%=themeid%>">相关媒体报道</a></li>
      <li><a href="${contextPath }/gyjj/videoList.jsp?themeid=<%=themeid%>">专题视频</a></li>
      <li><a href="${contextPath }/gyjj/topicspicList.jsp?themeid=<%=themeid%>">专题图片</a></li>
    </ul>
    </div>
    </th>
    <td valign="top" class="wrapright">
      <div class="columnOut">
      <div class="columnTitle"><h3>专题简介</h3><span><strong><a href="${contextPath }/gyjj/presentations.jsp?themeid=<%=themeid%>"></a></strong></span></div>
      <div class="columnMain">
         <dl class="hotTopics">
           <dt>
           <%
			      long picid=0;
			      if(null!=themeIntro)
			      {
			        picid = themeIntro.getPicid();
			         %>
			        <img src="${ctx}/share/showUploadImage.jsp?id=<%=picid%>" width="260" height="158" />
			      <% }%>
           </dt>
           <dd><p>
           <%String intro = null;
            	if(null!=themeIntro)
            		intro = themeIntro.getIntro(); 
            	if(null==intro)
            		intro ="";
           		intro = intro.replaceAll("&nbsp;","");
           		intro = intro.replaceAll("<P>","");
           		intro = intro.replaceAll("</P>","");
           		intro = intro.replaceAll("<B>","");
           		intro = intro.replaceAll("</B>","");
           		intro = intro.replaceAll("<STRONG>","");
           		intro = intro.replaceAll("</STRONG>","");
            	if(intro.length()>136){
            		intro = intro.substring(0,136);
            	}%>
            	<%=intro%> ......  
           </p></dd>
           <dd class="full"><a href="${contextPath }/gyjj/presentations.jsp?themeid=<%=themeid%>" class="red">[查看详细]</a></dd>
         </dl>
      </div>
      <div class="columnButtom"><img src="${contextPath }/gyjj/images/columnButtom.jpg" /></div>
    </div>
      <div class="columnOut owedBox">
      <div class="columnTitle"><h3>相关媒体报道</h3><span><strong><a href="${contextPath }/gyjj/mediaList.jsp?themeid=<%=themeid%>">更多</a></strong></span></div>
      <div class="columnMain">
        <ul class="newsList">
        
        <%if(null!=newslist && newslist.size()>0){ 
            		for(int i=0;i<newslist.size()&&i<5;i++){
            			ThemeNews news = (ThemeNews)newslist.get(i);%>
            	<li><strong><img src="${contextPath }/gyjj/images/newsList_ico.jpg" /></strong>
            	<a href="${ctx }/about/themeBd.jsp?themeid=<%=themeid%>&newsid=<%=news.getId() %>" target="_blank" title='作者:<%=news.getAuthor() %> 来源:<%=news.getSource() %> 日期:<%=news.getPublicationtime()!=null&&!news.getPublicationtime().equals("")?sdf.format(news.getPublicationtime()):"" %>'>
            	<%=news.getTitle() %></a>
            	&nbsp;&nbsp;&nbsp;
            	<%if(news.getSource()!=null&&!news.getSource().equals("")){ %>
            	来源:<%=news.getSource() %>
            	<%} %>
            	</li>
				<%}
				} %>
		 </ul>
      </div>
      <div class="columnButtom"><img src="${contextPath }/gyjj/images/columnButtom.jpg" /></div>
    </div>
      <div class="columnOut owedBox">
      <div class="columnTitle"><h3>专题视频</h3><span><strong><a href="${contextPath }/gyjj/videoList.jsp?themeid=<%=themeid%>">更多</a></strong></span></div>
      <div class="columnMain">
        <ul class="videoList">
        
         <%if(null!=videolist && videolist.size()>0){%>
      	<%for(int i=0;i<videolist.size();i++){ 
      		ThemeVideo video = (ThemeVideo)videolist.get(i);%>
       <li>
        	<a href="${ctx }/about/themeVideoPlay.jsp?themeid=<%=themeid%>&videoid=<%=video.getId()%>">
        	<img class="borimg" src="${ctx}/share/showUploadImage.jsp?id=<%=video.getPicid()%>" width="144" height="97"/>
        	<span><%=video.getTitle()%></span></a>
        </li>
        <%} %>
    <%} %>
     </ul>
      </div>
      <div class="columnButtom"><img src="${contextPath }/gyjj/images/columnButtom.jpg" /></div>
    </div>
      <div class="columnOut owedBox">
      <div class="columnTitle"><h3>专题图片</h3><span><strong><a href="${contextPath }/gyjj/topicspicList.jsp?themeid=<%=themeid%>">更多</a></strong></span></div>
      <div class="columnMain">
        <ul class="videoList">
        <%if(null!=piclist && piclist.size()>0){%>
      	<%for(int i=0;i<piclist.size();i++){ 
      		ThemePic pic = (ThemePic)piclist.get(i);%>
           <li>
        	<a href="${ctx}/about/themePicShow.jsp?themeid=<%=themeid%>&picid=<%=pic.getId()%>">
        	<img class="borimg" src="${ctx}/share/showUploadImage.jsp?id=<%=pic.getPicid()%>" width="144" height="97"/>
        	<p title="<%=pic.getTitle() %>">
        		<%=StringUtils.subString(pic.getTitle(),20,"...")%>
        	</p>
        	</a></li>
        <%}
           } %>      
        </ul>
      </div>
      <div class="columnButtom"><img src="${contextPath }/gyjj/images/columnButtom.jpg" /></div>
    </div>
    </td>
    </tr>
</table>
</div>
<div class="clear"></div>
<jsp:include page="/gyjj/index_bottom.jsp" />
</body>
</html>
