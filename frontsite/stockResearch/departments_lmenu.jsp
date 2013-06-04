<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"    %>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<p><img src="/pic/about/siedban1.jpg" /></p>
<%
String nav2="bmjs";
if(request.getParameter("nav2")!=null&&!request.getParameter("nav2").equals(""))
 nav2=request.getParameter("nav2").trim();
 %>
<div class="sidemenu">
  		<table>
          <tr> 
            <td <%=nav2.equals("zqyj_bmgk")?"class='active sideblue'":"class='link sideblue'" %>><a href="${contextPath }/stockResearch/departmentsInfo.jsp">部门概况</a></td>
          </tr>
          <tr>
            <td <%=nav2.equals("zqyj_bmly")?"class='active sideblue'":"class='link sideblue'" %>><a href="${contextPath }/stockResearch/departmentsly.jsp">部门荣誉</a></td>
          </tr>
          <!-- 2013-3-13关闭
         <tr>
            <td nav2.equals("zqyj_bmzj")?"class='active sideblue'":"class='link sideblue'" %>><a href="${contextPath }/stockResearch/departmentszj.jsp">部门足迹</a></td>
          </tr>  -->
          <tr>
            <td <%=nav2.equals("yftd")?"class='active sideblue'":"class='link sideblue'" %>><a href="${contextPath }/stockResearch/resrarchTeam.jsp">研究团队优势</a></td>
          </tr>
          <!-- 2013-3-13关闭
          <tr>
            <td nav2.equals("xstd")?"class='active sideblue'":"class='link sideblue'" %>> <a href="${contextPath }/stockResearch/resrarchXstd.jsp">销售团队</a></td>
          </tr>
          <tr>
            <td nav2.equals("zqyj_gzz")?"class='active sideblue'":"class='link sideblue'" %>><a href="${contextPath }/stockResearch/departmentsgzz.jsp">博士后工作站</a></td>
          </tr>  -->
        </table>

  </div>


