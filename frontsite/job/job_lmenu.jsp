<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<%@ include file="/commons/taglibs.jsp"%>
<bean:parameter name="nav" id="nav" value=""/>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<script src="/js/about_lmenu.js"></script>
<p><img src="/pic/job/joblmenu.jpg" /></p>

<div class="sidemenu">
  		<table>
          <tr>
          <td class="<%="tfzgf".equals(nav)?"active sideblue":"link sideblue" %>"><a href="${contextPath }/job/fly.jsp">腾飞在广发</a></td>
          </tr>
          <tr>
           <td class="<%="zpgg".equals(nav)?"active sideblue":"link sideblue" %>"><a href="${contextPath }/hrBbsAction.do?method=list">招聘BBS</a></td>
          </tr>
          <tr>
            <td class="<%="shzp".equals(nav)?"active sideblue":"link sideblue" %>"><a href="${contextPath }/job/jobSocial.html">
            	社会招聘职位</a></td>
          </tr>
          <tr>
          <td class="<%="xyzp".equals(nav)?"active sideblue":"link sideblue" %>"><a href="${contextPath }/job/jobCampus.html">
            	校园招聘职位</a></td>
          </tr>
          <tr>
            <td class="<%="ygxs".equals(nav)?"active sideblue":"link sideblue" %>"><a href="${contextPath }/job/staff.html">
            	广发员工心声</a></td>
          </tr>
          <tr>
            <td class="<%="cjwt".equals(nav)?"active sideblue":"link sideblue" %>"><a href="${contextPath }/job/faqMore.html">常见问题解答</a></td>
          </tr>
       
        </table>

  </div>


