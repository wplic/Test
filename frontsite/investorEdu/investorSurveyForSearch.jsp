<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="com.cssweb.questionnaire.service.QuestionnaireCategoryService"%>
<%@page import="java.util.List"%>
<%@page import="com.cssweb.questionnaire.pojo.QuestionnaireCategory"%>
<%@page import="com.cssweb.questionnaire.service.QuestionnaireService"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.cssweb.questionnaire.pojo.Questionnaire"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@page import="com.cssweb.common.util.PageUtil"%>
<%@ include file="/commons/turnPage.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<script type="text/javascript" src="${contextPath }/js/jsIfUtils.js"></script>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/investorEdu/investorEdu.css" rel="stylesheet" type="text/css" />
</head>
<%
	ServletContext st = this.getServletConfig().getServletContext();
	ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
	QuestionnaireCategoryService questionnaireCategoryService = (QuestionnaireCategoryService)ctx.getBean("questionnairecategoryservice");
	QuestionnaireService questionnaireService = (QuestionnaireService)ctx.getBean("questionnaireservice");
	List<Questionnaire> preList = questionnaireService.getPreList();
	List cateList = questionnaireCategoryService.getIdNameList();
	pageContext.setAttribute("preList",preList);
	pageContext.setAttribute("cateList",cateList);
	List list = (List)request.getAttribute("list");
	
%>
<body class="body_bg">
<jsp:include page="/share/top.jsp" />
<div class="main">
  <div class="dqwz">当前位置：首页 > 投资者园地 > 问卷调查</div>
  <!--左侧sied开始-->
  <div class="w680 fleft">
  <p><img src="/pic/investorEdu/wjdc_ban.jpg" /></p>
   <div class="blank10"></div>

  <div class="wj_boxbg">
      <div class="blank10"></div>
      <form name="quesForm" action="${ctx }/questionnaire.do?method=searchQuestion" method="post"> 
   		 	<input type="hidden" name="cate" value="${cate }">
   		 	 <input type="hidden" name="name" value="${name }">
   		 	 <input type="hidden" name="author" value="${author }">
   		 	 <input type="hidden" name="startTime" value="${startTime }">
   		 	 <input type="hidden" name="endTime" value="${endTime }">
        <%
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        if(list!=null&&list.size()>0) {
        	Questionnaire question = null;
              for(int i=0;i<list.size();i++)
              {
            	  question = (Questionnaire)list.get(i);
         %>
    	<div>
	    	<div class="wj_box">
                <%if(question.getPicid() != null && question.getPicid()>0){ %>
                	 <img class="fleft mr5" src="${ctx}/share/showUploadImage.jsp?id=<%=question.getPicid()%>" width="90" height="100"/>
                <%}else{ %>
                	<img src="${ctx}/pic/investorEdu/wj_pic1.jpg" class="fleft mr5"/>
                <%} %>
				<h4><span><%=sdf.format(question.getPublishdate()) %></span><%=question.getTitle() %></h4>
				<p><span class="bold">说明：</span><%=question.getContent() %></p>
				<p align="right" class="mr10 mt5"><a href="${ctx }/investorEdu/investorSurveyList.jsp?questionId=<%=question.getId() %>"><img src="/pic/investorEdu/but_wjdc.jpg" /></a></p>
			</div>	
	    </div>		
      
      <%
        }}
      %>
       <p align="center"> <%=PageUtil.pagination("window.quesForm",totleCount, currentPage, pagesize)%></p>
    </form> 
      
      
  </div>
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w230 fright">
   <div style="width:212px; height:212px; background: url(/pic/share/logbg.jpg)  no-repeat bottom; padding-left:18px;padding-bottom:6px;">
      <iframe target="_blank" id="leftlogin" name="leftlogin"  marginWidth="0" marginHeight="0" src="${contextPath }/share/loginTemp.jsp?url=/share/afterLogin.jsp&temp=temp"
						frameBorder="0" noresize width="95%" scrolling="no" onload="frameFitSelfHeight('leftlogin')"></iframe>
   </div> 
    <div class="blank10"></div>
    <p class="wjlog_top"> 最热问卷调查</p>
    <div class="wjlog2 lh28">
      <ul>
      	  <c:forEach items="${preList}" var="bean">
      	  		 <li class="li_list1"><a href="${ctx }/investorEdu/investorSurveyList.jsp?questionId=${bean.id}">${bean.title }</a></li>
      	  </c:forEach>
         
      </ul>
   	  <div class="blank10"></div>
      	<div class="p10 bg_ff" style="border:1px solid #cccccc">
      	<form name="frm" method="post" action="${ctx }/questionnaire.do?method=searchQuestion">
      	<table width="100%" class="font_43">
      	  <tr>
      	    <td>标签：</td>
      	    <td>
      	    <label>
      	      <select name="cate" id="cate">
      	      <option value="">--全部--</option>
      	      <c:forEach items="${cateList}" var="bean">
			  		<option value="${bean.id }" <c:if test="${bean.id eq cate}">selected</c:if>>${bean.name }</option>
			  </c:forEach>
      	      
      	      
    	        </select>
   	        </label></td>
   	      </tr>
      	  <tr>
      	    <td>时间：</td>
      	    <td><input type="text" id="startTime" name="startTime" value="${startTime }" onfocus="this.blur()"  style="width:86px; border:1px solid #c3c3c3;"  ><a href="javascript:void(0)" onclick="gfPop.fStartPop(document.frm.startTime,document.frm.endTime);return false;" HIDEFOCUS><img src="${ctx}/pic/share/selectTime.gif" name="popcal" width="19" height="18" border="0" align="middle"></a></td>
   	      </tr>
      	  <tr>
      	    <td>到：</td>
      	    <td><input type="text" name="endTime" id="endTime"  value="${endTime }" onfocus="this.blur()"  style="width:86px; border:1px solid #c3c3c3;" ><a href="javascript:void(0)" onClick="gfPop.fEndPop(document.frm.startTime,document.frm.endTime);return false;" HIDEFOCUS><img src="${ctx}/pic/share/selectTime.gif" name="popcal" width="19" height="18" border="0" align="middle"></a></td>
   	      </tr>
      	  <tr>
      	    <td>名称：</td>
      	    <td><input type="text" name="name" id="name" value="${name }"  class="input108"/></td>
   	      </tr>
      	  <tr>
      	    <td>作者：</td>
      	    <td><input type="text" name="anthor"   value="${anthor }" id="anthor" class="input108"/></td>
   	      </tr>
      	  <tr>
      	    <td height="28" colspan="2" align="center"><input type="submit" class="but_01" name="button3" id="button3" value="查询" /></td>
   	      </tr>
   	  </table></form>
      </div>
      	<div class="blank10"></div>
    </div>
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="/share/bottom.jsp" />
<iframe width=174 height=189 name="gToday:normal:agenda.js" id="gToday:normal:agenda.js"
			src="${ctx}/js/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; left:-500px; top:0px;"> 

</body>
</html>