<%@ page contentType="text/html; charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<jsp:directive.page import="com.cssweb.theme.service.ThemeCategoryService"/>
<jsp:directive.page import="com.cssweb.theme.pojo.ThemeCategory"/>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="java.util.Date"/>
<jsp:directive.page import="java.text.SimpleDateFormat"/>
<%
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
ServletContext st = this.getServletConfig().getServletContext();
ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
ThemeCategoryService themeCategoryService = (ThemeCategoryService) ctx.getBean("themeCategoryService");
List list=themeCategoryService.getAllByGyjjshow();
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证劵_社会公益基金</title>
<link href="${contextPath }/gyjj/css/community.css" rel="stylesheet" type="text/css" />
<script src="${contextPath }/gyjj/js/swfobject_source.js" type=text/javascript></script>
</head>
<jsp:directive.page import="com.cssweb.common.web.filter.SqlInjectValidate"/>
<%
 SqlInjectValidate sqlInjectValidate = SqlInjectValidate.getSqlInjectValidate();
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
%>
<body>
<!-- header begin -->
<jsp:include page="/gyjj/index_top.jsp?nav=grhg" />
<!-- header end -->
<div id="subbanner">
  <div id="subbanner2">
    <div id="subbanner3">
      <div id="subbanner4"><img src="${contextPath }/gyjj/images/subBanner.jpg" /></div>
    </div>
  </div>
</div>
<div class="subMainconter">
  <div class="topicstop">感恩回顾</div>
  <div class="topicsIndex">
  
  <%if(null!=list){
        	    int j=0;
		    	for(int i=0;i<list.size();i++){
		    		ThemeCategory themeCategory = (ThemeCategory)list.get(i);%>
		    		<div class="partWrap">
	      <h5>
	      <%if(null!=themeCategory&&themeCategory.getPicidgq()>0){ %>
		      <a href="${contextPath }/gyjj/owed.jsp?themeid=<%=themeCategory.getId()%>" >
		      <img src="${ctx}/share/showUploadImage.jsp?id=<%=themeCategory.getPicidgq()%>" width="144" height="97" />
		      </a>
	      </h5>
	      <dl>
	        <dt><a href="${contextPath }/gyjj/owed.jsp?themeid=<%=themeCategory.getId()%>" ><%=themeCategory.getTitle() %></a></dt>
	      </dl>
	    </div>
	<%}}} %>
    
  </div>
  <div class="newshowdown"><img src="${contextPath }/gyjj/images/newshowdown.jpg" /></div>
</div>
<div class="clear"></div>
<jsp:include page="/gyjj/index_bottom.jsp" />
</body>
</html>
