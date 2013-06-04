<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
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
	TvideoBoardService tvideoBoardService = (TvideoBoardService)ctx.getBean("tvideoBoardService");//视频版块管理
	TvideoCategoryService tvideoCategoryService = (TvideoCategoryService)ctx.getBean("tvideoCategoryService");//视频分类管理
	TvideoProgramService tvideoProgramService = (TvideoProgramService)ctx.getBean("tvideoProgramService");//视频
	String code ="ib_spyj";//investorVideo.jsp
	if(request.getParameter("code")!=null&&!request.getParameter("code").equals(""))
	code=request.getParameter("code");
	List proList =  tvideoProgramService.getTvideoProgramByCategoryCode(code,9);
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<link href="/css/investorEdu/investorEdu.css" rel="stylesheet" type="text/css" />
</head>
<body>
<jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：首页 - 期货IB业务 - 投资者教育园地</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft">
		<jsp:include page="FuturesIB_lmenu.jsp?nav2=ibtzzjy" />
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w706 fright">
  		<div class="eduinbox fleft">
    	<h1>
    	<span class="red fright"><a href="${contextPath }/bottom/ibtzzjy.jsp?nav3=ib_glgg">更多>> &nbsp;</a></span>
    	<a href="${contextPath }/bottom/ibtzzjy.jsp?nav3=ib_glgg">
    	法律法规</a>
    	</h1>
        <div class="imgs"><a href="${contextPath }/bottom/ibtzzjy.jsp?nav3=ib_glgg"><img src="/pic/investorEdu/yanjiubaogao.gif"/></a></div>
   	  	<jsp:include page="/bottom/list.jsp">
		           <jsp:param name="whichCat" value="ib_glgg"/>
		           <jsp:param name="showSize" value="20"/>
		    	</jsp:include>
   	  	<div class="blank5"></div>
    </div>
    
    <div class="eduinbox fright">
    	<h1>
    	<span class="red fright"><a href="${contextPath }/bottom/ibtzzjy.jsp?nav3=ib_ggxx">更多>> &nbsp;</a></span>
    	<a href="${contextPath }/bottom/ibtzzjy.jsp?nav3=ib_ggxx">
    	公告信息</a> </h1>
        <div class="imgs"><a href="${contextPath }/bottom/ibtzzjy.jsp?nav3=ib_ggxx"><img src="/pic/investorEdu/xinguyanjiu.gif"/></a></div>
  	  	<jsp:include page="/bottom/list.jsp">
		           <jsp:param name="whichCat" value="ib_ggxx"/>
		           <jsp:param name="showSize" value="20"/>
		    	</jsp:include>
		  <div class="blank5"></div>
    </div>
   
    <div class="blank10"></div>
    <div class="eduinbox fleft">
    	<h1>
    	<span class="red fright"><a href="${contextPath }/bottom/ibtzzjy.jsp?nav3=ib_cjwt">更多>> &nbsp;</a></span>
    	<a href="${contextPath }/bottom/ibtzzjy.jsp?nav3=ib_cjwt">常见问题</a> </h1>
      	<div class="imgs"><a href="${contextPath }/bottom/ibtzzjy.jsp?nav3=ib_cjwt"><img src="/pic/investorEdu/zhuantiyanjiu_pic.gif"/></a></div>
      	<jsp:include page="/bottom/list.jsp">
		           <jsp:param name="whichCat" value="ib_cjwt"/>
		           <jsp:param name="showSize" value="20"/>
		    	</jsp:include>
      	<div class="blank5"></div>
    </div>
    
   
  <div class="eduinbox fright">
    	<h1>
    	<span class="red fright">
    	<a href="${contextPath }/bottom/investorVideo.jsp">更多>> &nbsp;</a></span>
    	<a href="${contextPath }/bottom/investorVideo.jsp">股指期货基础知识 </a></h1>
        <div class="imgs"><a href="${contextPath }/bottom/investorVideo.jsp"><img src="/pic/investorEdu/bguluntan_pic.gif"/></a></div>
  	    <p class="blue3">
    	 <img src="${contextPath}/pic/msindex/list_03.gif"/>
    	 <a href="${ctx}/gf/IBedu/index.html" target="_blank">
    	 股指期货投资者教育视频
    	 </a>
    	 </p>
  	     <%if(proList!=null && proList.size()>0){
    		TvideoProgram pro = null;
    		 String urlLink="";//视频链接
    		for(int i=0;i<proList.size();i++){
    			pro = (TvideoProgram)proList.get(i);
    			
    	%>
    	<p class="blue3">
    	 <img src="${contextPath}/pic/msindex/list_03.gif"/>
    	 <a href="${ctx}/investorEdu/investorPlayObject.jsp?id=<%=pro.getId()%>" target="_blank">
    	 <%=pro.getTitle()==null?"":(pro.getTitle().length()>10?pro.getTitle().substring(0,10):pro.getTitle()) %>
    	 </a>
    	 </p>
    	<%}} %>
  	   <div class="blank5"></div>
    </div>
    <div class="clearfloat h25"></div>
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<div class="blank5"></div>
<jsp:include page="/commons/msbottom.jsp" />
</body>
</html>