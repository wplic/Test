<%@ page contentType="text/html; charset=UTF-8" language="java"  %>
<jsp:directive.page import="com.cssweb.common.util.PageUtil"/>
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<jsp:directive.page import="com.cssweb.systemset.service.BranchManagerService"/>
<jsp:directive.page import="com.cssweb.systemset.pojo.Branch"/>
<jsp:directive.page import="java.util.*"/>

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
<%
	ServletContext st = this.getServletConfig().getServletContext();
	ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
	BranchManagerService branchManagerService = (BranchManagerService) ctx.getBean("branchManagerService");
	Branch branch =	branchManagerService.getByBranchCode("fzjg");
	Map map = new HashMap();
	map.put("begin",0);
	map.put("end",5);
	map.put("parentId",branch.getId());
	List branchlist = branchManagerService.getBranchRzrqPages(map);

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page	import="com.cssweb.question.po.*"%>
<%@page import="java.util.List"%>
<%@ include file="/commons/turnPage.jsp"%>
<%@ include file="/commons/taglibs.jsp"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<script language="javascript">
function changeStyle(id){
	var toptable = document.getElementById("toptable");
	var trs = toptable.getElementsByTagName("tr");
	for(var i=0;i<trs.length;i++){
		if(""!=trs[i].id){
			if(id==trs[i].id){
				trs[i].style.display="block";
			}else{
				trs[i].style.display="none";
			}
		}
	}
}

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
<%
	List list=null;
	if(request.getAttribute("list")!=null)
	list=(List)request.getAttribute("list");
	long quesid = -1L;
	if(null!=request.getAttribute("quesid"))
		quesid = Long.parseLong((String)request.getAttribute("quesid"));
 %>
<body>
<jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="/default.html">首页</a> - <a href="/financing/index.html"> 融资融券</a> - 常见问题</div>
</div>
<div class="wrap_2right">
  <!--左侧sied开始-->
  <div class="w706 fleft">
  	<div class="comtit1"><h4>常见问题</h4></div>
    <div class="blank5"></div>
	<form name="qForm" action="${ctx}/question.do?method=getRzrqQuestionList" method="post">
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
        <td align="left" class="pl10" onclick="showPoolHotContent('<%=k %>','${question.id }')">
        <a href="javascript:void(0)">
        ${question.question }</a></td>
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
        <td height="28" align="right"><p align="center"> <%=PageUtil.pagination("window.qForm",totleCount, currentPage, pagesize)%></p></td>
      </tr>
    </table>
	</form> 
  </div>  
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w210 fright">
  <div class="rtit1">营业网点</div>
  <div class="bg_ff ptb6 ribor3">
    <table width="180" class="fcenter lh25 textcenter">
      <tr class="xuxian bold">
        <td width="39">序号</td>
        <td width="129">网点名称</td>
      </tr>
	  <%if(null!=branchlist){
		  for(int i=0;i<branchlist.size();i++){
			  Branch _branch = (Branch)branchlist.get(i);%>
			  <tr class="xuxian">
				<td><%=_branch.getBranchCode()%></td>
				<td><a href="${contextPath }/branchManagerAction.do?method=getBranchInfoById&id=<%=_branch.getId()%>"><%=_branch.getBranchName()%></a></td>
			  </tr>
	  <%
		  }
	  }%>
      <tr>
        <td colspan="2" align="right"><span class="red font_st"><a href="${contextPath }/branchManagerAdminAction.do?method=getMainBranchList&menu=mainywwd">[查看所有网点]</a></span></td>
        </tr>
    </table>
  </div>
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<div class="blank5"></div>
<jsp:include page="/commons/msbottom.jsp" />

</body>
</html>