<%@ page contentType="text/html; charset=utf-8" language="java"%>
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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<link href="/css/theme/style.css" rel="stylesheet" type="text/css" />
<style >
	.zttit3{margin-top:30px;}
</style>
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
%>
</head>

<body>
<jsp:include page="${ctx }/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="${ctx }/default.html">首页</a> - <a href="${ctx }/about/aboutUs.html">关于广发</a> - <a href="${ctx }/about/themeList.jsp">专题活动</a></div>
</div>

<div class="warp">
  <div class="bg_f5">
	<div>
	<%
	String picurl="#";
	if(theme!=null&&theme.getPicurl()!=null&&!theme.getPicurl().equals(""))
	{
	 picurl=theme.getPicurl();
	}
	 %>
	 <a href="<%=picurl %>">
	<img src="${ctx}/share/showUploadImage.jsp?id=<%=null==theme?"0":theme.getPicid()%>" width="920" height="136" />
	</a>
	</div>	
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
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
       <td width="18">&nbsp;</td>
        <td valign="top">
        	
        	 <table>
        	  <tr>
			     <%
			      long picid=0;
			      if(null!=themeIntro)
			      {
			        picid = themeIntro.getPicid();
			         %>
			        <td>
			        <img src="${ctx}/share/showUploadImage.jsp?id=<%=picid%>" width="380" height="227" />
			        </td>
			      <% }else{
			      %>
			       <td width="380">
        	    
        	       </td>
			      <%
			      }%>
        	  
        	  </tr>
        	 </table>
           
        </td>
        <td>&nbsp;</td>
        <td valign="top">
        		<div style="repeat-x bottom;width:472px; padding:16px 15px; line-height:20px;">
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
            	<%=intro%> ......             [<a href="${ctx }/about/themeJj.jsp?themeid=<%=themeid%>">详细</a>]
        	</div>
        	<div style=" no-repeat bottom;width:482px; height:30px; line-height:30px">
        	 <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" background="/pic/theme/titbg4.jpg">
        	    <tr>
        	      <td width="3%" align="center"></td>
        	      <td width="64%" class="bold">相关媒体报道</td>
        	      <td width="33%" align="right"><a href="${ctx }/about/themeXgmtbd.jsp?themeid=<%=themeid%>">更多...</a></td>
      	      </tr>
      	    </table>
      	    </div>
            <div style=" no-repeat bottom;width:472px; height:26px; line-height:26px">
            	<%if(null!=newslist && newslist.size()>0){ 
            		for(int i=0;i<newslist.size()&&i<5;i++){
            			ThemeNews news = (ThemeNews)newslist.get(i);%>
            	·<a href="${ctx }/about/themeBd.jsp?themeid=<%=themeid%>&newsid=<%=news.getId() %>" target="_blank" title='作者:<%=news.getAuthor() %> 来源:<%=news.getSource() %> 日期:<%=news.getPublicationtime()!=null&&!news.getPublicationtime().equals("")?sdf.format(news.getPublicationtime()):"" %>'><%=news.getTitle() %></a>
            	&nbsp;&nbsp;&nbsp;
            	<%if(news.getSource()!=null&&!news.getSource().equals("")){ %>
            	来源:<%=news.getSource() %>
            	<%} %>
            	<br />
				<%}
				} %>
        </td>
      </tr>
    </table>
    <div class="block9"></div>
     <div class="zttit3"><span><a href="${ctx }/about/themePic.jsp?themeid=<%=themeid%>">更多...</a></span>现场图片</div>
    <div class="block9"></div>
    <div class="block9"></div>
    <%if(null!=piclist && piclist.size()>0){%>
  	<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
      	<%for(int i=0;i<piclist.size();i++){ 
      		ThemePic pic = (ThemePic)piclist.get(i);%>
        <td align="center" width="20%">
        	<a href="${ctx}/about/themePicShow.jsp?themeid=<%=themeid%>&picid=<%=pic.getId()%>">
        	<img class="borimg" src="${ctx}/share/showUploadImage.jsp?id=<%=pic.getPicid()%>" width="100" height="90"/>
        	<p class="imgtxt"  title="<%=pic.getTitle() %>">
        		<%=StringUtils.subString(pic.getTitle(),20,"...")%>
        	</p>
        	</a>
        </td>
        <%}
        for(int i=piclist.size();i<5;i++){%>
        <td align="center" width="20%">
        	&nbsp;
        </td>
        <%} %>
      </tr>
    </table>
    <%} %>
  <div class="block9"></div>
    <div class="zttit3"><span><a href="${ctx }/about/themeVideo.jsp?themeid=<%=themeid%>">更多...</a></span>现场视频</div>
    <div class="block9"></div>
    <div class="block9"></div>
    <%if(null!=videolist && videolist.size()>0){%>
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
      	<%for(int i=0;i<videolist.size();i++){ 
      		ThemeVideo video = (ThemeVideo)videolist.get(i);%>
        <td align="center" width="20%">
        	<a href="${ctx }/about/themeVideoPlay.jsp?themeid=<%=themeid%>&videoid=<%=video.getId()%>">
        	<img class="borimg" src="${ctx}/share/showUploadImage.jsp?id=<%=video.getPicid()%>" width="100" height="90"/>
        	<p class="imgtxt"><%=video.getTitle()%></p></a>
        </td>
        <%}
        for(int i=videolist.size();i<5;i++){%>
        <td align="center" width="20%">
        	&nbsp;
        </td>
        <%} %>
      </tr>
    </table>
    <%} %>
    <div class="block9"></div>
  
  <%if(null!=artcatlist && artcatlist.size()>0){ 
  	for(int i=0;i<artcatlist.size();i++){
  		ThemeArticleCategory artcat = (ThemeArticleCategory)artcatlist.get(i);
  		List artlist = themeArticleService.getFrontByMap(artcat.getId(),map);%>
    <div class="zttit3"><span><a href="${ctx }/about/themeQt.jsp?themeid=<%=themeid%>&artcatid=<%=artcat.getId()%>">更多...</a></span><%=artcat.getTitle()%></div>
  <div class="block9"></div>
    <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="listtxt">
    	<%if(null!=artlist && artlist.size()>0){
    		for(int j=0;j<artlist.size();j++){ 
    			ThemeArticle art = (ThemeArticle)artlist.get(j);%>
      <tr>
        <td width="90%">·<a href="${ctx }/about/themeArtcle.jsp?themeid=<%=themeid%>&artid=<%=art.getId() %>"><%=art.getTitle() %></a></td>
        <td><%=sdf.format(art.getUpdatetime()) %></td>
      </tr>
      	<%}
      	} %>
    </table>
    <div class="block9"></div>
    <%}
    }%>

    <div class="zttit3"><span><a href="${ctx }/investorEdu/investorSurvey.html">更多...</a></span>问卷调查</div>
   <div class="block9"></div>
    <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="listtxt">
      <%if(null!=quelist && quelist.size()>0){
      	Questionnaire que = null;
      	for(int i=0;i<quelist.size();i++){ 
      		que = (Questionnaire)quelist.get(i);%>
	      <tr>
	        <td>·<a href="${ctx }/investorEdu/investorSurveyList.jsp?questionId=<%=que.getId() %>&cateName=<%=cate.getName() %>"><%=que.getTitle() %></a></td>
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
