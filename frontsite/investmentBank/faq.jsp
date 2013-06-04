<%@ page contentType="text/html; charset=UTF-8" language="java"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.cssweb.common.util.PageUtil"%>
<%@page import="com.cssweb.question.service.QuestionService"%>
<jsp:directive.page import="com.css.cms.document.util.DocumentHelper"/><html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<%@ include file="/commons/turnPage.jsp"%>

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
	String pagenum = (String) request.getParameter("currentPage");		
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
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<link href="/css/investmentBank/investmentBank.css" rel="stylesheet" type="text/css" />
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
<body>
<%
		String category = "tzyh_thgg";
 %>
<jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：首页 - 投资银行 - 常见问题</div>
</div>
<div class="wrap_2right">
  <!--左侧sied开始-->
  <div class="w706 fleft">
  		<div class="comtit1"><h4>常见问题</h4></div>
    <div class="blank10"></div>
      <form action="${ctx }/question.do?method=getQuestionList" name="queForm" method="post">
    <table width="100%" border="1" bordercolor="#cfcfcf" class="lh28 faqtab1" >
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
        <td align="left" class="pl10"><a href="javascript:showPoolHotContent('<%=k %>','${question.id }')">${question.question } </a></td>
        <td>${question.update_date }</td>
      </tr>
      <tr class="bg_f5" style="display: none" id="poolHotContent<%=k %>">
        <td>&nbsp;</td>
        <td colspan="2" align="left" class="p10">答：${question.result }</td>
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
  </div>
  
  <!--左侧sied结束-->
   
 <!--右侧sied开始-->
  <div class="w210 fright">
		<div class="rtit1">投行公告</div>
        <div class="bg_ff ptb6 ribor3">
        <marquee scrollamount="3" direction="up" onmouseover="this.stop()" onmouseout="this.start()" height="200">
          <paging:page count="false" row="20" provider="<%= new com.css.cms.document.model.DocumentFrontListProvider(category,request)%>" tableId="doclist">
	          <table width="93%" align="center" class="lh20 fcenter">
		          <paging:pageRow id="doc" type="com.css.cms.document.Document"> 
		          	 <tr>
		              <td width="13" valign="top"><img src="/pic/stockResearch/dot-hjt.gif" /></td>
		              <td><a href="${contextPath }/commons/infoList.jsp?docId=<%=doc.getId()%>" target=\"_blank\"><%=DocumentHelper.getTitle(doc ,60)%></a></td>
		            </tr>
		          </paging:pageRow>
	          </table>
          </paging:page>
          </marquee>
        </div>
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<div class="blank5"></div>
<jsp:include page="/commons/msbottom.jsp" />
</body>
</html>