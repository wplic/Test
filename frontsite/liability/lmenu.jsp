<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<script src="/js/about_lmenu.js"></script>
<p>
<a href="${ctx }/liability/index.jsp"> 
<img src="/pic/liability/ltpic1.gif" />
</a></p>
<%
String nav2="";
if(request.getParameter("nav2")!=null&&!request.getParameter("nav2").equals(""))
 nav2=request.getParameter("nav2").trim();
 %>
<div class="sidemenu3">
  		<table>
          <tr>
            <td <%=nav2.equals("jbjs")?"class='active sideblue'":"class='link sideblue'" %>>
            <a href="${ctx }/liability/liablilityjbjs.jsp?whichCat=gfwqjbjs&nav2=jbjs">基本介绍</a></td>
          </tr>
          <tr>
            <td <%=nav2.equals("xwbd")?"class='active sideblue'":"class='link sideblue'" %>>
           <a href="${ctx }/liability/liablility.jsp?whichCat=gfwqxwbd&nav2=xwbd"> 
            新闻报道</a></td>
          </tr>
          <tr>
            <td <%=nav2.equals("gyhd")?"class='active sideblue'":"class='link sideblue'" %>>
           <a href="${ctx }/liability/liablility.jsp?whichCat=gfwqgyhd&nav2=gyhd"> 
            公益活动</a></td>
          </tr>
          <tr>
            <td <%=nav2.equals("shzrbgs")?"class='active sideblue'":"class='link sideblue'" %>>
           <a href="${ctx }/liability/liablility.jsp?whichCat=gfwqshzrbgs&nav2=shzrbgs"> 
            社会责任报告书</a></td>
          </tr>       
        </table>

  </div>
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
List list=themeCategoryService.getAllByGqisshow();
%>
<div class="leftlink8">
 <%if(null!=list){
    	for(int i=0;i<list.size();i++){
    		ThemeCategory themeCategory = (ThemeCategory)list.get(i);%>
      <p>
      <a href="${ctx }/about/theme.jsp?themeid=<%=themeCategory.getId()%>"><%=themeCategory.getTitle()%></a>
     </p>
      <%}
      } %>
</div>
