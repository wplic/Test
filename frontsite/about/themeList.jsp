<%@ page contentType="text/html; charset=utf-8" language="java"%>
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<jsp:directive.page import="com.cssweb.theme.service.ThemeCategoryService"/>
<jsp:directive.page import="com.cssweb.theme.pojo.ThemeCategory"/>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="java.util.Date"/>
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
ServletContext st = this.getServletConfig().getServletContext();
ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
ThemeCategoryService themeCategoryService = (ThemeCategoryService) ctx.getBean("themeCategoryService");
List list=themeCategoryService.getAll();
%>
</head>
<body>
<jsp:include page="${ctx }/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="${ctx }/default.html">首页</a> - <a href="${ctx }/about/aboutUs.html">关于广发</a> - <a href="${ctx }/about/themeList.jsp">专题活动</a></div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft">
		<jsp:include page="${ctx }/about/about_lmenu.jsp?meun=gygf_zthd">
		           <jsp:param name="meun" value="gfkl"/>
		           <jsp:param name="nav2" value="gsjj"/>
		    	</jsp:include>
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w706 fright">
  		<div class="comtit1"><h4>专题活动</h4></div>
    <div class="clearfloat h25"></div>
    <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="listtxt">
    <%if(null!=list){
    	for(int i=0;i<list.size();i++){
    		ThemeCategory themeCategory = (ThemeCategory)list.get(i);%>
      <tr>
        <td width="80%">·<a href="${ctx }/about/theme.jsp?themeid=<%=themeCategory.getId()%>"><%=themeCategory.getTitle()%></a></td>
        <td><%=sdf.format(themeCategory.getMeettime())%></td>
      </tr>
      <%}
      } %>
    </table>
        <div class="clearfloat h25"></div>
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<div class="blank5"></div>
<jsp:include page="${ctx }/commons/msbottom.jsp" />
</body>
</html>