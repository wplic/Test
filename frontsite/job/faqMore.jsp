<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page import="com.cssweb.common.util.PageUtil"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@ include file="/commons/turnPage.jsp"%>
<bean:parameter name="nav" id="nav" value="cjwt"/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<script type="text/javascript" src="${contextPath }/js/jsIfUtils.js"></script>
<script>
var hotCount =${requestScope.listCount};
var lastOperatedPool = -1;
var lastOperatedHotPool = -1;

function showPoolHotContent(showPoolId, questionId){
	if(hotCount != -1){
		if(lastOperatedHotPool != showPoolId){
			for(var i=0; i<hotCount; i++){
				document.getElementById("poolHotContent"+i).style.display="none";
			}
			document.getElementById("poolHotContent"+showPoolId).style.display="";
			lastOperatedHotPool = showPoolId;
		}else{
			document.getElementById("poolHotContent"+showPoolId).style.display="none";
			lastOperatedHotPool = -1;
		}
	}
}

</script>
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
	//String pagenum = (String) request.getParameter("currentPage");
	String pagenum = (String) request.getParameter("current_page");
	String pageSize = (String) request.getParameter("pagesize");
	if(null!=pagenum &&sqlInjectValidate.vakidateSqlIfIngter(pagenum)){
			response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");	
			return;
		}
		
		if(null!=pageSize &&sqlInjectValidate.vakidateSqlIfIngter(pageSize)){
			response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");	
			return;
		}
		
		if(null!=pagenum && sqlInjectValidate.vakidateSqlStringForLength(pagenum, 6)){
			response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");	
			return;
		}
		if(null!=pageSize && sqlInjectValidate.vakidateSqlStringForLength(pageSize,6)){
			response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");	
			return;
		}
%>
<body>
<jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="/default.html">首页 </a> - <a href="${contextPath }/job/index.html">人才招聘</a> - 常见问题解答</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft">
		<jsp:include page="/job/job_lmenu.jsp" />
        <div class="blank5"></div>
<iframe target="_blank" id="leftlogin" name="leftlogin"  marginWidth="0" marginHeight="0" src="${contextPath }/job/job_login.jsp"
						frameBorder="0" noresize width="100%" scrolling="no" onload="iframeFitHeight(this)"></iframe>
    <div class="blank5"></div>
<jsp:include page="faq.jsp" />
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w706 fright">
<div class="comtit1"><h4>常见问题解答</h4></div>
<div class="clearfloat h15"></div>
 <form action="${ctx }/question.do?method=getHrQuestionList" name="queForm" method="post">
 <input name="nav" type="hidden" value="<%=nav %>"/>
<table width="100%" border="1" bordercolor="#cfcfcf" class="lh28 faqtab1">
  <tr>
    <th width="8%">序号</th>
    <th width="69%">问题</th>
    <th width="23%">时间</th>
    </tr>
     <%
	      	int k = 0;
	 %>
      <c:forEach items="${requestScope.list }" var="question">
      
      <tr>
        <td><%=k+1 %></td>
        <td align="left" class="pl10" onclick="showPoolHotContent('<%=k %>','${question.id }')">${question.question }</td>
        <td>${question.updateDateStr }</td>
      </tr>
      <tr class="bg_f5" style="display: none" id="poolHotContent<%=k %>">
        <td>&nbsp;</td>
        <td colspan="2" align="left" class="p10">
        答：${question.result }</td>
      </tr>
      <%k++; %>
      </c:forEach>
</table>
 <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="28" align="right"> <%=PageUtil.pagination("window.queForm",totleCount, currentPage, pagesize)%></td>
      </tr>
    </table>
    </form>
<div class="clearfloat"></div>
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<div class="blank5"></div>
<jsp:include page="/commons/msbottom.jsp" />
</body>
</html>