<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@include file="/commons/taglibs.jsp"%>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page
	import="com.cssweb.common.web.filter.SqlInjectValidate" />
<jsp:directive.page import="java.util.*" />
<jsp:directive.page import="java.text.SimpleDateFormat" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%
	request.setCharacterEncoding("UTF-8");
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>个人信息</title>
<link href="${contextPath }/css/community.css" rel="stylesheet" type="text/css" />
<link href="${contextPath }/financing/rongzhi/css/rongzhi.css" rel="stylesheet" type="text/css" />

</head>
<%
	SqlInjectValidate sqlInjectValidate = SqlInjectValidate
			.getSqlInjectValidate();
	if (request.getParameter("nav1") != null
			&& !request.getParameter("nav1").equals("")) {
		if (sqlInjectValidate.vakidateSqlStringForLength(
				request.getParameter("nav1"), 10)) {
			response.sendRedirect(request.getContextPath()
					+ "/commons/error2.jsp");
			return;
		}
	}
	if (request.getParameter("nav") != null
			&& !request.getParameter("nav").equals("")) {
		if (sqlInjectValidate.vakidateSqlStringForLength(
				request.getParameter("nav"), 10)) {
			response.sendRedirect(request.getContextPath()
					+ "/commons/error2.jsp");
			return;
		}
	}
%>
<body>
    <jsp:include page="/share/pdLogin.jsp" />
	<jsp:include page="/share/top.jsp" />
	<!-- header end -->
	<div id="subbanner">
		<img src="${contextPath }/pic/financing/rongzhi/rongzhi_banner.jpg" />
	</div>
	<div class="subMainconter">
		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			class="layout">
			<tr>
				<th valign="top" class="wrapleft">
					<div class="navLeft">
						<h3>
							<img src="${contextPath }/images/rongzhi/rongzhi_btn.jpg" style="margin-left: 10px;" />
						</h3>
						<jsp:include page="sideMenu.jsp" />
					</div></th>
				<td valign="top" class="wrapright">
					<div class="columnOut">
						<div class="columnTitle">
							<h3>个人信息</h3>
							<span><b>首页</b>><b>2012年广发证券“融智杯”融资融券仿真交易竞赛</b>><strong>个人信息</strong>
							</span>
						</div>
						<div class="columnMain summary">
						 <table width="100%" border="1" align="center" cellpadding="0" cellspacing="3" class="lh25">
						<tr bgcolor="#f9f9f9">
						<td width="20%" align="center">客户编号 </td>
						<td width="15%" align="center">客户姓名</td>
				        <td width="15%" align="center" >客户昵称</td>
				        <td width="20%" align="center" >联系电话</td>
				        <td width="20%" align="center" >联系地址</td>
				        <td width="10%" align="center" >操作</td>
					</tr>
			 <c:choose><c:when test="${custRegister !=null }">
			<tr bgcolor="#f9f9f9">
				
				<td width="20%" align="center">${custRegister.custNo } </td>
				<td width="15%" align="center">${custRegister.custName }</td>
				
        <td width="15%" align="center">${custRegister.petName}</td>
        <td width="20%" align="center" >${custRegister.phone}</td>
        <td width="20%" align="center" >${custRegister.address}</td>
         <td width="10%" align="center" >
          <a href="${contextPath}/registerAction.do?method=updateCustInfo">
          		修改</a></td>
					
					</tr>
	</c:when>
	</c:choose>
	</table>
						</div>
						<div class="columnButtom">
							<img src="${contextPath }/gyjj/images/columnButtom.jpg" />
						</div>
					</div></td>
			</tr>
		</table>
	</div>
	<div class="clear"></div>
	<jsp:include page="${ctx }/share/bottom.jsp" />
</body>
</html>
