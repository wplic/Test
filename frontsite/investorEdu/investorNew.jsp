<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=utf-8" language="java"  %>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="com.cssweb.questionnaire.service.QuestionnaireCategoryService"%>
<%@page import="java.util.List"%>
<%@page import="com.cssweb.questionnaire.pojo.QuestionnaireCategory"%>
<%@page import="com.cssweb.questionnaire.service.QuestionnaireService"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.cssweb.questionnaire.pojo.Questionnaire"%>

<%
	ServletContext st = this.getServletConfig().getServletContext();
	ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
	QuestionnaireCategoryService questionnaireCategoryService = (QuestionnaireCategoryService)ctx.getBean("questionnairecategoryservice");
	QuestionnaireService questionnaireService = (QuestionnaireService)ctx.getBean("questionnaireservice");
	List cateList = questionnaireCategoryService.getIdNameList();
	List<Questionnaire> preList = questionnaireService.getPreList();
	
	pageContext.setAttribute("preList",preList);
	
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${contextPath }/css/global.css" rel="stylesheet" type="text/css" />
<link href="${contextPath }/css/investorEdu/investorEdu.css" rel="stylesheet" type="text/css" />
</head>

<body class="body_bg">
<jsp:include page="${contextPath}/share/top.jsp?nav=tzzyd&nav1=tzzydzxdt" />
<div class="wrap_r262">
  <div class="w650 fleft">
	<div class="dqwz">当前位置：<a href="${contextPath }/index.jsp?nav=index">首页</a> &gt;<a href="${contextPath }/investorEdu/investorSchool.html"> 投资者园地</a> &gt; 最新动态</div>
        <div class="left_tit1 red bold">最新动态</div>
  <iframe  id="ifm" name="" src="${ctx }/investorEdu/investorlist.jsp?state=1&whichCat=zxdt&is_delete=0"   frameborder="0"  marginheight="0"  marginwidth="0"  width="100%" scrolling="no">
                   </iframe>
	</div>
  <div class="w262 fright bg_ec ptb13">
  		<div class="side_top"></div>
    <div class="side_mid">
   	  <p class="side_tit1">最热调查问卷</p>
   	  <table width="82%" align="center" border="0" cellspacing="0" cellpadding="0" class="lh28 mt5">
   	   <%
   	   		if (preList != null )
   	   		{
   	   				for (int i = 0; i < preList.size(); i++)
   	   				{
   	   					if (i < 10)
   	   					{
   	   						Questionnaire questionnaire	= (Questionnaire)preList.get(i);
	   	   					%>
	   	   						<tr>
						   	      <td class="li_list1"><a href="${ctx }/investorEdu/investorSurveyList.jsp?questionId=<%= questionnaire.getId() %>"><%= questionnaire.getTitle() %></a></td>
						        </tr>
	   	   					<%
   	   					}
   	   					
   	   				}
   	   		}
   	    %>
   	  	<c:forEach items="${preList}" var="bean">
   	  			<tr>
		   	      <td class="li_list1"><a href="${ctx }/investorEdu/investorSurveyList.jsp?questionId=${bean.id}">${bean.title }</a></td>
		        </tr>
      </c:forEach>
   	  
      </table>
   	  <p class="side_line"></p>
      <div style="height:5px; overflow:hidden"></div>
        <jsp:include page="/infoCenter/Search.jsp"/>
<div style="height:10px; overflow:hidden"></div>
      </div>
    <div class="side_bot"></div>
  </div>
  <div class="clearfloat"></div>
</div>
<jsp:include page="${contextPath}/share/bottom.jsp" />

</body>
</html>
<iframe width=174 height=189 name="gToday:normal:agenda.js" id="gToday:normal:agenda.js"
			src="${ctx}/js/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; left:-500px; top:0px;"> 
