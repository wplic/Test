<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<jsp:directive.page import="com.cssweb.common.web.filter.SqlInjectValidate"/>
<jsp:directive.page import="java.util.*"/>
<jsp:directive.page import="java.text.SimpleDateFormat"/>
<jsp:directive.page import="com.cssweb.common.util.PageUtil"/>
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<jsp:directive.page import="com.cssweb.systemset.service.BranchManagerService"/>
<jsp:directive.page import="com.cssweb.systemset.pojo.Branch"/>
<jsp:directive.page import="java.util.*"/>
<%@page	import="com.cssweb.question.po.*"%>
<%@page import="java.util.List"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<%
request.setCharacterEncoding("UTF-8");
%>
<%@ include file="/commons/taglibs.jsp"%>
<%@ include file="/commons/turnPage.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证劵_社会公益基金</title>
<link href="${contextPath }/gyjj/css/community.css" rel="stylesheet" type="text/css" />
<script src="${contextPath }/gyjj/js/swfobject_source.js" type=text/javascript></script>
</head>
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
	List list=null;
	if(request.getAttribute("list")!=null)
	list=(List)request.getAttribute("list");

%>
<body>
<jsp:include page="/gyjj/index_top.jsp?nav=gtbz" />
<!-- header end -->
<div id="subbanner"><img src="${contextPath }/gyjj/images/subBanner.jpg" /></div>
<div class="subMainconter">
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layout">
  <tr>
    <th valign="top" class="wrapleft">
    <div class="navLeft">
      <h3><img src="${contextPath }/gyjj/images/title_gtbz.jpg" /></h3>
      <ul class="navleftList">
      <li><a href="${contextPath }/financeMsgAction.do?method=getFinanceMessageList&ext3=4">留言板</a></li>
      <li class="this"><a href="${contextPath }/gyjj/questions.jsp">常见问题</a></li>
    </ul>
    </div>
    </th>
    <td valign="top" class="wrapright">
      <div class="columnOut">
      <div class="columnTitle"><h3>常见问题</h3><span><b>首页</b>><b>沟通帮助 </b>><strong>常见问题</strong></span></div>
        <jsp:include page="/gyjj/project_download_list.jsp">
				<jsp:param value="gyjj_cjwt" name="whichCat"/>
            		<jsp:param value="1" name="state"/>
            		<jsp:param value="0" name="is_delete"/>
            		<jsp:param value="20" name="showSize"/>
            </jsp:include>
      
      <div class="columnButtom"><img src="${contextPath }/gyjj/images/columnButtom.jpg" /></div>
    </div>
    </td>
    </tr>
</table>
</div>
<div class="clear"></div>
<jsp:include page="/gyjj/index_bottom.jsp" />
</body>
</html>
