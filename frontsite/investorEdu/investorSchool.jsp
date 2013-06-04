<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="com.cssweb.questionnaire.service.QuestionnaireCategoryService"%>
<%@page import="java.util.List"%>
<%@page import="com.cssweb.questionnaire.pojo.QuestionnaireCategory"%>
<%@page import="com.cssweb.questionnaire.service.QuestionnaireService"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.cssweb.questionnaire.pojo.Questionnaire"%>
<%@page import="com.cssweb.video.service.TvideoBoardService"%>
<%@page import="com.cssweb.video.service.TvideoCategoryService"%>
<%@page import="com.cssweb.video.service.TvideoProgramService"%>
<%@page import="com.cssweb.video.pojo.TvideoProgram"%>
<%
	ServletContext st = this.getServletConfig().getServletContext();
	ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
	QuestionnaireCategoryService questionnaireCategoryService = (QuestionnaireCategoryService)ctx.getBean("questionnairecategoryservice");
	QuestionnaireService questionnaireService = (QuestionnaireService)ctx.getBean("questionnaireservice");
	
	 TvideoBoardService tvideoBoardService = (TvideoBoardService)ctx.getBean("tvideoBoardService");//视频版块管理
	 TvideoCategoryService tvideoCategoryService = (TvideoCategoryService)ctx.getBean("tvideoCategoryService");//视频分类管理
	 TvideoProgramService tvideoProgramService = (TvideoProgramService)ctx.getBean("tvideoProgramService");//视频
	 
	List programList =	 tvideoProgramService.getTvideoProgramByNewVideo();
	 
	List cateList = questionnaireCategoryService.getIdNameList();
	List<Questionnaire> preList = questionnaireService.getPreList();
	
	pageContext.setAttribute("preList",preList);
	
%>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/investorEdu/investorEdu.css" rel="stylesheet" type="text/css" />
</head>

<body class="">
<jsp:include page="${contextPath}/share/top.jsp?nav=tzzyd&nav1=tzschool" />
<div class="body_bg">
<div class="wjdc_box">
  <p class="wjdc"><a href="/investorEdu/investorSurvey.html"><img src="/pic/index/wzdc.jpg"/></a></p>
</div>

 <!-- 浮动广告位置 -->
		     		<jsp:include page="${contextPath}/ad/ad_paintings.jsp">
		              <jsp:param name="widths" value="120"/>
					  <jsp:param name="heights" value="250"/>
					  <jsp:param name="subAdCode" value="ad_paintings_question"/>
		    		 </jsp:include>
		    	<!-- 浮动广告位置  END-->
<div class="main">
  <div class="dqwz">当前位置：<a href="/index.html">首页</a>  > 投资者园地</div>
  <div class="mb6"><img src="/pic/investorEdu/banner1.jpg" /></div>	
  
 
  <!--左侧sied开始-->
  <div class="w210 fleft">
       	<jsp:include page="${contextPath}/investorEdu/investorEduNewlist.jsp">
       			<jsp:param name="state" value="1"/>
       			<jsp:param name="whichCat" value="zxdt"/>
       			<jsp:param name="is_delete" value="0"/>
       	</jsp:include>
       	 <div class="blank10"></div>
    <table width="99%" border="1" bordercolor="#cfcfcf" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
      <tr>
        <td class="info_th01"><span class="font_43">调查问卷</span></td>
      </tr>
      <tr>
        <td class="lh28 p10">
        <ul>
        <%
   	   		if (preList != null )
   	   		{
   	   				for (int i = 0; i < preList.size(); i++)
   	   				{
   	   					if (i < 10)
   	   					{
   	   						Questionnaire questionnaire	= (Questionnaire)preList.get(i);
	   	   					%>
	   	   						<li class="li_list1"><a href="${contextPath }/investorEdu/investorSurveyList.jsp?questionId=<%= questionnaire.getId() %>"><%= questionnaire.getTitle() %></a></li>
	   	   					<%
   	   					}
   	   					
   	   				}
   	   		}
   	    %>
        </ul>
        </td>
      </tr>
    </table>
    <div class="blank10"></div>
    <table width="99%" border="1" bordercolor="#cfcfcf" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
      <tr>
        <td class="info_th01"><span class="font_43">相关链接</span></td>
      </tr>
      <tr>
        <td class="lh28 p10">
        <ul>
	   	   	<li class="li_list1"><a href="hhttp://edu.sse.com.cn/newedu/home/home.shtml">上交所投资者教育网站</a></li>
	   	   	<li class="li_list1"><a href="http://www.szse.cn/main/investor/">深交所投资者教育网站</a></li>
	   	   	<li class="li_list1"><a href="http://www.sipf.com.cn/index.shtml">中国证券投资者保护网</a></li>
	   	   	<li class="li_list1"><a href="http://www.csrc.gov.cn/pub/newsite/">中国证监会</a></li>
	   	   	<li class="li_list1"><a href="http://www.sac.net.cn/">中国证券业协会</a></li>
	   	   	<li class="li_list1"><a href="http://www.easyik.cn/">深交所“投知易”</a></li>
        </ul>
        </td>
      </tr>
    </table>
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w706 fright">
	
    <div class="eduinbox fleft">
    	<h1>股民学校</h1>
        <div class="imgs"><img src="/pic/investorEdu/edu_ban2.jpg"/></div>
   	  	<h4>投资知识浩淼，怎样寻求真理？广发股民学校帮您大海拾贝！</h4>
        <p class="blue3"><img src="/pic/investorEdu/list_01.jpg" class="mr5" /><a href="${contextPath }/investorEdu/investorBasicZqzczs.html">基础知识</a>
       	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="/pic/investorEdu/list_01.jpg" class="mr5" /><a href="${contextPath }/investorEdu/investorJygzJygz.html">交易规则</a></p>
        <p class="blue3"><img src="/pic/investorEdu/list_01.jpg" class="mr5" /><a href="${contextPath }/investorEdu/investorRisk.html">风险揭示</a>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="/pic/investorEdu/list_01.jpg" class="mr5" /><a href="${contextPath }/investorEdu/investorDxalDxal.html">典型案例</a></p>
        <p class="blue3"><img src="/pic/investorEdu/list_01.jpg" class="mr5" /><a href="${contextPath }/investorEdu/investorCyb.html">新业务介绍</a></p>
        <div class="blank5"></div>
    </div>
    <div class="eduinbox fright">
    	<h1>财智大讲堂</h1>
        <div class="imgs"><img src="/pic/investorEdu/edu_ban4.jpg"/></div>
  	  	<h4>严格遵守国家金融政策法规，自觉成为遵纪守法的投资者！</h4>
        <p class="blue3"><img src="/pic/investorEdu/list_01.jpg" class="mr5" /><a href="${contextPath }/investorEdu/investorJbfxJcfx.html">基本分析</a></p>
        <p class="blue3"><img src="/pic/investorEdu/list_01.jpg" class="mr5" /><a href="${contextPath }/investorEdu/investorJbfxJsfx.html">技术分析</a></p>
        <p class="blue3"><img src="/pic/investorEdu/list_01.jpg" class="mr5" /><a href="${contextPath }/investorEdu/investorJbfxGsfx.html">公司分析</a></p>
      	<p class="blue3"><img src="/pic/investorEdu/list_01.jpg" class="mr5" /><a href="${contextPath }/investorEdu/investorJbfxTzjq.html">投资技巧</a></p>
        <div class="blank5"></div>
    </div>
    <div class="blank10"></div>
    
    <div class="eduinbox fleft">
    	<h1>财富学院</h1>
      	<div class="imgs"><img src="/pic/investorEdu/edu_ban3.jpg"/></div>
      	<h4>失败乃成功之母，投资经验一席谈给您更多智慧的启迪！</h4>
      	<p class="blue3"><img src="/pic/investorEdu/list_01.jpg" class="mr5" /><a href="${contextPath }/investorEdu/investorHgjjHgjj.html">宏观经济</a>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="/pic/investorEdu/list_01.jpg" class="mr5" /><a href="${contextPath }/investorEdu/investorLlyj.html">理论研究</a></p>
        <p class="blue3"><img src="/pic/investorEdu/list_01.jpg" class="mr5" /><a href="${contextPath }/investorEdu/investorGjjr.html">国际金融</a>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="/pic/investorEdu/list_01.jpg" class="mr5" /><a href="${contextPath }/investorEdu/investorXxqy.html">学术前沿</a></p>
        <p class="blue3"><img src="/pic/investorEdu/list_01.jpg" class="mr5" /><a href="${contextPath }/investorEdu/investorCfgl.html">财富管理</a></p>
   		<div class="blank5"></div>
    </div>
     <div class="eduinbox fright">
    	<h1>政策法规</h1>
        <div class="imgs"><img src="/pic/investorEdu/edu_ban4.jpg"/></div>
  	  <h4 >严格遵守国家金融政策法规，自觉成为遵纪守法的投资者！</h4>
        <p class="blue3"><img src="/pic/investorEdu/list_01.jpg" class="mr5" /><a href="${contextPath }/investorEdu/investorZcfg.html">交易规则</a></p>
        <p class="blue3"><img src="/pic/investorEdu/list_01.jpg" class="mr5" /><a href="${contextPath }/investorEdu/investorZqf.html">证券法</a></p>
        <p class="blue3"><img src="/pic/investorEdu/list_01.jpg" class="mr5" /><a href="${contextPath }/investorEdu/investorTzjjf.html">投资基金法</a></p>
        <p class="blue3"><img src="/pic/investorEdu/list_01.jpg" class="mr5" /><a href="${contextPath }/investorEdu/investorFxqfg.html">反洗钱法律法规和规章</a></p>
        <div class="blank5"></div>
    </div>
     <div class="eduinbox fright">
    	<h1>非法证券活动风险揭示<font color="red">(new)</font></h1>
        <div class="imgs"><img src="/pic/investorEdu/edu_ban4.jpg"/></div>
  	  <h4 style="color:red;">认清本质，抵制诱惑，远离非法证券期货活动！</h4>
        <p class="blue3"><img src="/pic/investorEdu/list_01.jpg" class="mr5" /><a href="${contextPath }/investorEdu/investorFfjsDxal.jsp">典型案例</a></p>
        <p class="blue3"><img src="/pic/investorEdu/list_01.jpg" class="mr5" /><a href="${contextPath }/investorEdu/investorPlayObject.jsp?id=122">视频教育</a></p>
        <p class="blue3"><img src="/pic/investorEdu/list_01.jpg" class="mr5" /><a href="${contextPath }/investorEdu/investorFfjsFfyl.jsp">防范要领</a></p>
        
        <div class="blank5"></div>
    </div>
   
    <div class="blank10"></div>
    <div id="spjy"><span class="smwz">全面生动和多视角，视频教育给您讲投资的故事！</span>视频教育</div>
    <div class="blank10"></div>
    <div id="spjy_box">
    	<%
    			if (programList != null)
    			{ 
    					for (int i = 0; i < programList.size() ; i ++)
    					{
    						TvideoProgram tvideoProgram =	(TvideoProgram)programList.get(i);
    							if (i < 5)
    							{
		    						if (tvideoProgram.getPicId() != 0)
		    						{
		    								if (i < 4)
		    								{
		    								%>
		    									<span class="mr26"><a href="${contextPath }/investorEdu/investorPlayObject.jsp?id=<%= tvideoProgram.getId() %>" target="_blank"><img width="113" height="87" src="${contextPath }/share/showUploadImage.jsp?id=<%=tvideoProgram.getPicId() %>"  /><h4><%=tvideoProgram.getTitle() %></h4></a></span>
		    								<%
		    								}
		    								else
		    								{
		    									%>
		    									<span ><a href="${contextPath }/investorEdu/investorPlayObject.jsp?id=<%= tvideoProgram.getId() %>" target="_blank"><img width="113" height="87" src="${contextPath }/share/showUploadImage.jsp?id=<%=tvideoProgram.getPicId() %>"  /><h4><%=tvideoProgram.getTitle() %></h4></a></span>
		    									<%
		    								}
		    						}
	    						}
    						
    						
    					}
    			}
    	 %>
    	
    </div>
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="/share/bottom.jsp" />
</div>
</body>
</html>