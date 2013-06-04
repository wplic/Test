<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<jsp:directive.page import="com.cssweb.hr.service.ThrPostInfoService"/>
<jsp:directive.page import="com.cssweb.hr.service.HrApplyRecorderService"/>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="com.cssweb.hr.pojo.HrUser"/>
<jsp:directive.page import="java.util.Map"/>
<jsp:directive.page import="java.util.HashMap"/>
<jsp:directive.page import="com.cssweb.hr.pojo.ThrPostInfo"/>
<jsp:directive.page import="com.cssweb.hr.pojo.HrApplyRecorder"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<link href="/css/job/job.css" rel="stylesheet" type="text/css" />
</head>
<%
	ServletContext sc = this.getServletConfig().getServletContext();
	ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(sc);
	ThrPostInfoService thrPostInfoService = (ThrPostInfoService)ctx.getBean("thrPostInfoService");
	HrUser hrUser = (HrUser)request.getSession().getAttribute("hrUser");
	
	long oneJobId = 0l;
	long twoJobId = 0l;
	List<ThrPostInfo> list =null;
	if(hrUser!=null){
		list = thrPostInfoService.getPostByUserId2(hrUser.getId());
		if(null!=list && list.size()>0){
			oneJobId = list.get(0).getId();
		}
		if(null!=list && list.size()>1){
			twoJobId = list.get(1).getId();
		}
	}
	pageContext.setAttribute("list",list);
%>
<body>
<jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="/default.html">首页 </a> - <a href="${contextPath }/job/index.html">人才招聘</a> - 应聘信息</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft">
		<jsp:include page="/job/job_lmenu.jsp" />
        <div class="blank5"></div>
<iframe target="_blank" id="leftlogin" name="leftlogin"  marginWidth="0" marginHeight="0" src="${contextPath }/job/job_login.jsp"
						frameBorder="0" noresize width="100%" scrolling="no" height="198"></iframe>
    <div class="blank5"></div>
<jsp:include page="faq.jsp" />
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w706 fright">
<div class="comtit1"><h4>应聘信息</h4></div>
<div class="clearfloat h15"></div>
<table width="100%" border="1" bordercolor="#cfcfcf" class="lh28 faqtab1">
  <tr>
    <td width="15%">&nbsp;</td>
    <td width="15%">总部/分支机构</td>
    <td width="25%">部门</td>
    <td width="30%">岗位</td>
    <td width="15%">类型</td>
    </tr>
   <c:forEach items="${list }" var="bean">
   	 <tr>
    <td><c:if test="${bean.wish eq '1' }">第一志愿岗位：</c:if>
    	<c:if test="${bean.wish eq '2' }">第二志愿岗位：</c:if>
    </td>
    <td><strong>${bean.type }</strong></td>
    <td><strong>${bean.branchName }</strong></td>
    <td><strong>${bean.postName }</strong></td>
    <td><strong>${bean.category }</strong></td>
    </tr>
   
   </c:forEach> 
    
</table>
<div class="clearfloat h15"></div>
<div class="clearfloat h15"></div>
<table>
	<tr>
		<td align="left"><p>亲爱的应聘者:</p></td>
	</tr>
	<tr>
		<td align="left" class="h15"></td>
	</tr>
	<tr>
		<td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;您好！您的简历已经进入我们的人才库，请再次核对应聘的职位，若需修改职位，请点击<a href="${ctx }/job/jobApp.jsp?oneJobId=<%=oneJobId%>&twoJobId=<%=twoJobId%>"><font color="red"> 此处 </font></a>进入职位申请页面。</td>
	</tr>
	<tr>
		<td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;我们人力资源管理部的同事会尽快阅读您的简历。如果您通过了我们的简历筛选环节，我们将会与您联系，请保持通讯工具的畅通。</td>
	</tr>
	<tr>
		<td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;再次感谢您对广发证券的关注！</td>
	</tr>
	<tr>
		<td align="left" class="h15"></td>
	</tr>
	<tr>
		<td align="right">广发证券人力资源管理部</td>
	</tr>
</table>
<div class="clearfloat"></div>
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<div class="blank5"></div>
<jsp:include page="/commons/msbottom.jsp" />
</body>
</html>