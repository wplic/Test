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

<body class="body_bg">
<jsp:include page="${contextPath}/share/top.jsp?nav=tzzyd" />
<div class="wjdc_box">
  <p class="wjdc"><a href="/investorEdu/investorSurvey.html"><img src="/pic/index/wzdc.jpg"/></a></p>
</div>
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
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w706 fright">
	<div class="eduinbox fleft">
    	<h1>风险教育</h1>
        <div class="imgs"><img src="/pic/investorEdu/edu_ban1.jpg"/></div>
      	<h4>股市有风险，入市须谨慎！投资入市前请先阅读本栏目</h4>
        <p class="blue3"><img src="/pic/investorEdu/list_01.jpg" class="mr5" /><a href="${contextPath }/investorEdu/investorZqjyfxts.jsp?nav=tzzyd&nav1=fxjy&nav2=zqjyfxts">证券交易风险揭示</a></p>
        <p class="blue3"><img src="/pic/investorEdu/list_01.jpg" class="mr5" /><a href="${contextPath }/investorEdu/investorQzfxts.jsp?nav=tzzyd&nav1=fxjy&nav2=qzfxts">权证风险揭示</a></p>
        <div class="blank5"></div>
    </div>
    <div class="eduinbox fright">
    	<h1>股民学校</h1>
        <div class="imgs"><img src="/pic/investorEdu/edu_ban2.jpg"/></div>
   	  <h4>投资知识浩淼，怎样寻求真理？广发股民学校帮您大海拾贝！</h4>
        <p class="blue3">
       	<img src="/pic/investorEdu/list_01.jpg" class="mr5" /><a href="${contextPath }/investorEdu/investorBaseStock.jsp?nav=tzzyd&nav1=spjy1&nav2=gpsrx">基股三人行</a> <img src="/pic/investorEdu/list_01.jpg" class="mr5 ml5" /><a href="${contextPath }/investorEdu/investorZsfcg.jsp?nav=tzzyd&nav1=gmxx&nav2=tzzyddsfcg">第三方存管</a></p>
        <p class="blue3">
       	<img src="/pic/investorEdu/list_01.jpg" class="mr5" /><a href="${contextPath }/investorEdu/investorCjlt.jsp?nav=tzzyd&nav1=gmxx&nav2=tzzydcjlt">常见问题</a> <img src="/pic/investorEdu/list_01.jpg" class="mr5 ml17" /><a href="${contextPath }/investorEdu/investorBasic.jsp?nav=tzzyd&nav1=gmxx&nav2=horbasic">证券基础知识</a></p>
        <p class="blue3">
       	<img src="/pic/investorEdu/list_01.jpg" class="mr5" /><a href="${contextPath }/investorEdu/investorStockSchool.jsp?nav=tzzyd&nav1=gmxx&nav2=tzzydgpzs">股票</a> <img src="/pic/investorEdu/list_01.jpg" class="mr5 ml5" /><a href="${contextPath }/investorEdu/investorZqzs.jsp?nav=tzzyd&nav1=gmxx&nav2=tzzydzqzs">债券</a> <img src="/pic/investorEdu/list_01.jpg" class="mr5 ml5" /><a href="${contextPath }/investorEdu/investorJjzs.jsp?nav=tzzyd&nav1=gmxx&nav2=tzzydjjzs">基金</a></p>
        <p class="blue3">
       	<img src="/pic/investorEdu/list_01.jpg" class="mr5" /><a href="${contextPath }/investorEdu/investorQzzs.jsp?nav=tzzyd&nav1=gmxx&nav2=tzzydqzzs">权证</a> <img src="/pic/investorEdu/list_01.jpg" class="mr5 ml5" /><a href="${contextPath }/investorEdu/investorQhzs.jsp?nav=tzzyd&nav1=gmxx&nav2=tzzydqhzs">期货</a><img src="/pic/investorEdu/list_01.jpg" class="mr5 ml5" /><a href="${contextPath }/investorEdu/investorGzqh.jsp">股指期货知识</a>  </p>
        <div class="blank5"></div>
    </div>
    <div class="blank10"></div>
    
    <div class="eduinbox fleft">
    	<h1>投资经验谈</h1>
      <div class="imgs"><img src="/pic/investorEdu/edu_ban3.jpg"/></div>
      	<h4>失败乃成功之母，投资经验一席谈给您更多智慧的启迪！</h4>
      	<p class="blue3"><img src="/pic/investorEdu/list_01.jpg" class="mr5" /><a href="${contextPath }/investorEdu/investorTzjyt.jsp?nav=tzzyd&nav1=tzjyt&nav2=jbmfx">基本面分析方法</a></p>
        <p class="blue3"><img src="/pic/investorEdu/list_01.jpg" class="mr5" /><a href="${contextPath }/investorEdu/investorJsfx.jsp?nav=tzzyd&nav1=tzjyt&nav2=jsfx">技术分析方法</a></p>
   		<div class="blank5"></div>
    </div>
    <div class="eduinbox fright">
    	<h1>政策法规</h1>
        <div class="imgs"><img src="/pic/investorEdu/edu_ban4.jpg"/></div>
  	  <h4>严格遵守国家金融政策法规，自觉成为遵纪守法的投资者！</h4>
        <p class="blue3"><img src="/pic/investorEdu/list_01.jpg" class="mr5" /><a href="${contextPath }/investorEdu/investorZcfg.jsp?nav=tzzyd&nav1=zcfg&nav2=jygz">交易规则</a></p>
        <p class="blue3"><img src="/pic/investorEdu/list_01.jpg" class="mr5" /><a href="${contextPath }/investorEdu/investorZqf.jsp?nav=tzzyd&nav1=zcfg&nav2=zqf">证券法</a></p>
        <p class="blue3"><img src="/pic/investorEdu/list_01.jpg" class="mr5" /><a href="${contextPath }/investorEdu/investorTzjjf.jsp?nav=tzzyd&nav1=zcfg&nav2=tzjjf">投资基金法</a></p>
        <p class="blue3"><img src="/pic/investorEdu/list_01.jpg" class="mr5" /><a href="${contextPath }/investorEdu/investorFxqfg.jsp?nav=tzzyd&nav1=zcfg&nav2=fxqfg">反洗钱法律法规和规章</a></p>
        <div class="blank5"></div>
    </div>
    <div class="blank10"></div>
    
    <div class="eduinbox fleft">
    	<h1>创业板</h1>
      <div class="imgs"><img src="/pic/investorEdu/edu_ban5.jpg"/></div>
      	<h4>规避投资风险，进行审慎投资－聚焦创业板</h4>
      	<p class="blue3"><img src="/pic/investorEdu/list_01.jpg" class="mr5" /><a href="${contextPath }/investorEdu/investorCyb.html">创业板开户指引</a></p>
      	<p class="blue3"><img src="/pic/investorEdu/list_01.jpg" class="mr5" /><a href="${contextPath }/investorEdu/investorCybZxDj.html">创业板相关解读</a></p>
        <p class="blue3"><img src="/pic/investorEdu/list_01.jpg" class="mr5" /><a href="${contextPath }/investorEdu/investorCybZxDt.html">创业板相关动态</a></p>
   		<div class="blank5"></div>
    </div>
    <div class="eduinbox fright">
    	<h1>融资融券</h1>
        <div class="imgs"><img src="/pic/investorEdu/edu_ban6.jpg"/></div>
  	  <h4>发挥资券杠杆作用，认识新型交易方式-融资融券！</h4>
        <p class="blue3"><img src="/pic/investorEdu/list_01.jpg" class="mr5" /><a href="${contextPath }/financing/businessProcess.html">融资融券业务流程</a></p>
        <p class="blue3"><img src="/pic/investorEdu/list_01.jpg" class="mr5" /><a href="${contextPath }/investorEdu/investorRzrqZxDj.html">融资融券相关解读</a></p>
        <p class="blue3"><img src="/pic/investorEdu/list_01.jpg" class="mr5" /><a href="${contextPath }/investorEdu/investorRzrqZxDt.html">融资融券相关动态</a></p>
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

</body>
</html>