<%@ page contentType="text/html; charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
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
<jsp:include page="/gyjj/index_top.jsp?nav=jjhdt" />
<!-- header end -->
<div id="subbanner"><img src="${contextPath }/gyjj/images/subBanner.jpg" /></div>
<div class="subMainconter">
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layout">
  <tr>
    <th valign="top" class="wrapleft">
    <div class="navLeft">
      <h3><img src="${contextPath }/gyjj/images/title_jjdt.jpg" /></h3>
      <ul class="navleftList">
      <li><a href="${contextPath }/gyjj/news.jsp">新闻动态</a></li>
      <li class="this"><a href="${contextPath }/gyjj/newxmzt.jsp">项目专题</a></li>
      <li><a href="${contextPath }/gyjj/newtggg.jsp">通知公告</a></li>
    </ul>
    </div>
    </th>
    <td valign="top" class="wrapright">
      <div class="columnOut">
      <div class="columnTitle"><h3>项目专题</h3><span><b>首页</b>><b>基金会动态 </b>><strong>项目专题</strong></span></div>
      <div class="columnMain system">
      <jsp:include page="/gyjj/project_download_list.jsp">
				<jsp:param value="gyjj_xmzt" name="whichCat"/>
            		<jsp:param value="1" name="state"/>
            		<jsp:param value="0" name="is_delete"/>
            		<jsp:param value="20" name="showSize"/>
            </jsp:include>
            </div>
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
