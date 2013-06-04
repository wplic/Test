<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<jsp:directive.page import="com.cssweb.common.util.PageUtil"/>
<jsp:directive.page import="java.util.*"/>

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
<link href="/css/assetManage/assetManage.css" rel="stylesheet" type="text/css" />
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
</script>

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
</head>
<%
	List list=null;
	if(request.getAttribute("list")!=null)
	list=(List)request.getAttribute("list");
 %>
<body>
	<form name="qForm" action="${ctx}/question.do?method=getAssetQuestionList&assetProd=${assetProd }" method="post" id="toptable">
     <table width="98%" align="center" border="1" bordercolor="#cfcfcf" class="lh28 faqtab1 mt10">
      <tr>
        <th width="8%">序号</th>
        <th width="69%">问题</th>
        <th width="23%">时间</th>
      </tr>
		<%if(list!=null&&list.size()>0) {
			for(int i=0;i<list.size();i++){
				Question ques=(Question)list.get(i);
	    %>
			<tr>
				<td>问：</td>
				<td align="left" class="pl10"><span style="cursor:hand" onclick="changeStyle(<%=i%>)"><%=ques.getQuestion()%></span></td>
				<td><%=ques.getUpdate_date().substring(0,10)%></td>
			</tr>
			<tr id="<%=i%>" style="display:none" class="bg_f5">
				<td>答：</td>
				<td colspan="2" align="left"><%=ques.getResult()%></td>
			</tr>
	    <%}}%>
    </table>
    <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="28" align="right"><p align="center"> <%=PageUtil.pagination("window.qForm",totleCount, currentPage, pagesize)%></p></td>
      </tr>
    </table>
	</form> 
  <!--左侧sied结束-->
</body>
</html>