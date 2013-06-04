<%@ page contentType="text/html; charset=utf-8" language="java" %>
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
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/investorEdu/investorEdu.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${contextPath }/js/jsIfUtils.js"></script>
</head>
<%
	ServletContext st = this.getServletConfig().getServletContext();
	ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
	QuestionnaireCategoryService questionnaireCategoryService = (QuestionnaireCategoryService)ctx.getBean("questionnairecategoryservice");
	QuestionnaireService questionnaireService = (QuestionnaireService)ctx.getBean("questionnaireservice");
	List cateList = questionnaireCategoryService.getIdNameList();
	List<Questionnaire> preList = questionnaireService.getPreList();
	pageContext.setAttribute("preList",preList);
	
%>

<body class="">
<%
		String flag = null;
		if (request.getAttribute("flag") != null )
		{
				%>
					<script >
							alert("对不起,一个用户相同的问题只能回答一次!");
					</script>
				<%
		}
 %>
<jsp:include page="/share/top.jsp" />
<div class="body_bg">
<div class="main">
  <div class="dqwz">当前位置：<a href="${contextPath }/index.jsp?nav=index">首页</a> &gt;<a href="${contextPath }/investorEdu/investorSchool.html"> 投资者园地</a> &gt;问卷调查</div>
  <!--左侧sied开始-->
  <div class="w680 fleft">
  <p><img src="/pic/investorEdu/wjdc_ban.jpg" /></p>
   <div class="blank10"></div>
  <ul class="wj_tags">
  	
    		<li class="active"><a href="#">
    			调查问卷
    		</a></li>	
    	
  </ul>
  <div class="wj_boxbg">
      <div class="blank10"></div>
      
      <%
      	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
      	if(cateList!=null && cateList.size()>0){
    		 QuestionnaireCategory cate = null;
    		 List queList = null;
    		for(int i=0;i<cateList.size();i++){
    			cate = (QuestionnaireCategory)cateList.get(i);
    	%>
    			<div>
    	<%	
    			queList = questionnaireService.getQuestionInfoByCateId(cate.getId());
	    		if(queList!=null && queList.size()>0){
	    			Questionnaire que = null;
	    			for(int j=0;j<queList.size();j++){
	    				que = (Questionnaire)queList.get(j);
	    %>				
	    			 <div class="wj_box">
	    			 <%if(que.getPicid() != null && que.getPicid()>0){ %>
                	 <img class="fleft mr5" src="${ctx}/share/showUploadImage.jsp?id=<%=que.getPicid()%>" width="90" height="100"/>
                	<%}else{ %>
                	<img src="${ctx}/pic/investorEdu/wj_pic1.jpg" class="fleft mr5"/>
                	<%} %>
				            <h4><span><%=sdf.format(que.getPublishdate()) %></span><%=que.getTitle() %></h4>
				        <p><span class="bold">说明：</span><%=que.getContent() %></p>
				            <p align="right" class="mr10 mt5"><a href="${ctx }/investorEdu/investorSurveyList.jsp?questionId=<%=que.getId() %>&cateName=<%=cate.getName() %>"><img src="/pic/investorEdu/but_wjdc.jpg" /></a></p>
				      </div>	
	    <%			}
	    		}else{
	    			 %>		
	    			 <div class="wj_box">
	    			 &nbsp;
	    			 </div>	
	    			  <%	
	    		}
	    		 %>		
	    		 </div>		
	    	 <%	
    		}
    	}
    	%>
      
      
      
      
      
      
  </div>
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w230 fright">
  <div style="width:212px; height:280px; background: url(/pic/share/logbg.jpg)  no-repeat bottom; padding-left:18px;padding-bottom:6px;">
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
      <script>
      		function commit(){
				document.getElementById("cateName").value=document.getElementById("cate").options[document.getElementById("cate").selectedIndex].text;
	      		}
      </script>
   	  <div class="blank10"></div>
      	<div class="p10 bg_ff" style="border:1px solid #cccccc">
      	<form name="frm" method="post" action="${ctx }/questionnaire.do?method=searchQuestion" onsubmit="commit();">
      	<input type="hidden" id="cateName" name="cateName" value=""/>
      	<table width="100%" class="font_43">
      	  <tr>
      	    <td>标签：</td>
      	    <td>
      	    <label>
      	      <select name="cate" id="cate">
      	      <option value="">--全部--</option>
      	      <%
	      	    if(cateList!=null && cateList.size()>0){
		       		 QuestionnaireCategory cate = null;
		       		 List queList = null;
		       		for(int i=0;i<cateList.size();i++){
		       			cate = (QuestionnaireCategory)cateList.get(i);
      	       %>
      	       	 <option value="<%=cate.getId()+"" %>"><%=cate.getName() %></option>
      	       <%
		       		}
	      	    }
      	      %>
      	      
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
      	    <td><input type="text" name="name" id="name" class="input108"/></td>
   	      </tr>
      	  <tr>
      	    <td>作者：</td>
      	    <td><input type="text" name="anthor" id="anthor" class="input108"/></td>
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
<script src="/js/setTab.js"></script>
<iframe width=174 height=189 name="gToday:normal:agenda.js" id="gToday:normal:agenda.js"
			src="${ctx}/js/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; left:-500px; top:0px;"> 
</iframe>
</div>
</body>
</html>