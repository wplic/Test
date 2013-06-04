<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"    %>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<p><img src="/pic/about/siedban1.jpg" /></p>
<%
String nav2="";
if(request.getParameter("nav2")!=null&&!request.getParameter("nav2").equals(""))
 nav2=request.getParameter("nav2").trim();
 %>
<div class="sidemenu">
  		<table>
  		<tr>
            <td <%=nav2.equals("zqyj_yjbg_ch")?"class='active sideblue'":"class='link sideblue'" %>><a href="${ctx }/stockResearch/companyResearchChyj.html">晨会纪要</a></td>
          </tr>
  		  <tr>
            <td <%=nav2.equals("zqyj_yjbg_hgyj")?"class='active sideblue'":"class='link sideblue'" %>><a href="${ctx }/stockResearch/companyResearchHgyj.html">宏观研究</a></td>
          </tr>
          <tr>
            <td <%=nav2.equals("zqyj_yjbg_scyj")?"class='active sideblue'":"class='link sideblue'" %>><a href="${ctx }/stockResearch/companyResearchTzcl.html">市场策略研究</a></td>
          </tr>
          <tr>
            <td <%=nav2.equals("zqyj_yjbg_gdsycy")?"class='active sideblue'":"class='link sideblue'" %>><a href="${ctx }/stockResearch/companyResearchGdsy.html">固定收益策略</a></td>
          </tr>
           <tr>
            <td <%=nav2.equals("zqyj_yjbg_hyyj")?"class='active sideblue'":"class='link sideblue'" %>><a href="${ctx }/stockResearch/companyResearchHyyj.html">行业研究</a></td>
          </tr>
          <tr>
            <td <%=nav2.equals("zqyj_yjbg_gsyj")?"class='active sideblue'":"class='link sideblue'" %>><a href="${ctx }/stockResearch/companyResearch.html">公司研究</a></td>
          </tr>
          <tr>
            <td <%=nav2.equals("zqyj_yjbg_yspyj")?"class='active sideblue'":"class='link sideblue'" %>><a href="${ctx }/stockResearch/companyResearchYsp.html">衍生品研究</a></td>
          </tr>
          <tr>
            <td <%=nav2.equals("zqyj_yjbg_jjyj")?"class='active sideblue'":"class='link sideblue'" %>><a href="${ctx }/stockResearch/companyResearchJj.html">基金研究</a></td>
          </tr>
           
         <tr>
            <td <%=nav2.equals("zqyj_yjbg_qtzt")?"class='active sideblue'":"class='link sideblue'" %>><a href="${ctx }/stockResearch/companyResearchQtzt.html">其它专题</a></td>
          </tr>
        </table>

  </div>


