<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<jsp:directive.page import="com.cssweb.common.web.filter.SqlInjectValidate"/>
<jsp:directive.page import="java.util.*"/>
<jsp:directive.page import="java.text.SimpleDateFormat"/>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.cssweb.common.util.PageUtil"%>
<%@page import="com.cssweb.common.util.StringUtils"%>
<%@page import="com.cssweb.item.pojo.Donate"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<%@ include file="/commons/turnPage.jsp"%>
<%
request.setCharacterEncoding("UTF-8");
%>
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
%>
<%
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		List frontlist = null;
		if (request.getAttribute("list") != null)
		{
			frontlist = (List) request.getAttribute("list");
		} 
		
 %>
<body>
<jsp:include page="/gyjj/index_top.jsp?nav=jjjx" />
<!-- header end -->
<div id="subbanner"><img src="${contextPath }/gyjj/images/subBanner.jpg" /></div>
<div class="subMainconter">
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layout">
  <tr>
    <th valign="top" class="wrapleft">
    <div class="navLeft">
      <h3><img src="${contextPath }/gyjj/images/title_jsjz.jpg" /></h3>
      <ul class="navleftList">
      <li><a href="${contextPath }/gyjj/system.jsp">如何捐赠</a></li>
      <li class="this"><a href="${contextPath }/donateAction.do?method=frontlist">捐赠名单</a></li>
    </ul>
    </div>
    </th>
    <td valign="top" class="wrapright">
      <div class="columnOut">
      <div class="columnTitle"><h3>捐赠名单</h3><span><b>首页</b>><b>接受捐赠  </b>><strong>捐赠名单</strong></span></div>
      <div class="columnMain help"> 
      <form action="${contextPath }/donateAction.do?method=frontlist" name="queryForm" method="post">
          <table width="100%" border="0" cellspacing="0" cellpadding="0" class="donateList">
		<tr>
			<th>捐赠人</th>
			<th>捐赠动态</th>
			<th>捐赠时间</th>
		</tr>
		<%
				for(int i =0;i<frontlist.size();i++){
					Donate donate = (Donate)frontlist.get(i);
					%>
						<tr class="blue">
							<td><%=donate.getDonateName()%></td>
							<td class="red"><%=donate.getRemark()%></td>
							<td><%=(donate.getDonateTime()==null?"":sdf.format(donate.getDonateTime()))%></td>
						</tr>
				<%}
		 %>
		
	
        
       
       
      
          </table>
           <div align="right" class="page"> <%=PageUtil.pagination("window.queryForm",totleCount, currentPage, pagesize)%></div>
        </form>
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
