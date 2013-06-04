<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page import="java.util.List"%>
<%@page import="com.cssweb.gazxfund.pojo.FundGsInfo"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@page import="com.cssweb.common.util.PageUtil"%>
<jsp:directive.page import="com.cssweb.collect.service.MgrInfoService"/>
<jsp:directive.page import="com.cssweb.collect.pojo.TcsswebRyxx"/>
<jsp:directive.page import="com.cssweb.collect.pojo.MgrInfo"/>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/golden/golden.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.tab_cj{ border:1px solid #ece9d8;}
</style>
</head>
<script type="text/javascript">
	
	function gotoSelectedPage()  
	{  
	    var x = document.getElementById("navigatorForm");  
	     //alert("Original action: " + x.action)  
	     x.submit();  
	 }  
	function gotoNextPage()  
	{  
	    var x = document.getElementById("navigatorForm");  
	    var gotopage=document.getElementById("pageNumber");
	    gotopage.value=${pageNumber+1};
	   
	     x.submit();  
	 }  
	function gotoPage()  
	{  
	    var x = document.getElementById("navigatorForm");  
	    var gotopage=document.getElementById("pageNumber");
	    gotopage.value=${pageNumber-1};
	     //alert("Original action: " + x.action)  
	     x.submit();  
	 }  
	
	function gotoStartPage()  
	{  
	    var x = document.getElementById("navigatorForm");  
	    var gotopage=document.getElementById("pageNumber");
	    gotopage.value=1;
	     //alert("Original action: " + x.action)  
	     x.submit();  
	 }  

	function gotoindexPage()  
	{  
	    var x = document.getElementById("navigatorForm");  
	    var gotopage=document.getElementById("pageNumber");
	    gotopage.value=${totalPages};
	     //alert("Original action: " + x.action)  
	     x.submit();  
	 }  


</script>
<jsp:directive.page import="com.cssweb.common.web.filter.SqlInjectValidate"/>
<%

List mgrList = null;
if (request.getAttribute("list") != null)
{
		mgrList = (List)request.getAttribute("mgrList");
}
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
	if(request.getParameter("ryxm")!=null&&!request.getParameter("ryxm").equals("")){
		if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("ryxm"),10)){
			response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
			return;
		 }
	}
	if(request.getParameter("zsbh")!=null&&!request.getParameter("zsbh").equals("")){
		if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("zsbh"),20)){
			response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
			return;
		 }
	}
%>
<body  onload="MM_preloadImages('/pic/golden/but_lczx2.jpg')">
<jsp:include page="/share/top.jsp?nav=grgf" />
<div class="body_bg">
<div class="main">
  <div class="dqwz">当前位置：<a href="${contextPath }/index.jsp?nav=index">首页</a> &gt; <a href="${contextPath }/branches/index.html">分支机构</a> &gt; 投资顾问人员信息查询</div>
  <p align="center"><img src="/pic/golden/banner.jpg" /></p>
  <div class="blank10"></div>
    <div class="blank10"></div>
  <div class="goldenp1">


	<table border="3" width="100%" align="center" >
	 <tr>
  		<td class="xl64" colspan="5" align="center">
  			 <form action="${contextPath }/mgrInfoAction.do?method=getAll" method="post" id="mgrForm" name="mgrForm" onSubmit="return check1();">
  				<div cellpadding="0" cellspacing="0" border="0" class="zgsearch">  						
  								   <h3>投资顾问人员资格查询</h3> 		
  								<label>员工姓名：</label>
  								<c:choose><c:when test="${ryxm!=null }">
  								<input type="text" size="10" class="input108" name="ryxm" id="ryxm" value="${ryxm }"/> 
  								</c:when>
  								<c:otherwise>
			  								<input type="text" size="10" class="input108" name="ryxm" id="ryxm"/> 
							</c:otherwise>
  								</c:choose>
  								<label>执业证书编号：</label>
  								<c:choose><c:when test="${zsbh!=null }">
  								<input type="text" size="20" class="input108" name="zsbh" id="zsbh" value="${zsbh }"/> 
  								</c:when>
  								<c:otherwise>
			  					<input type="text" size="20" class="input108" name="zsbh" id="zsbh" /> 
							</c:otherwise>
  								</c:choose>
  								 <input type="image" src="${ctx}/pic/wsyyt/but_cx1.jpg" />
  								
  						 						
  				</div>
  			</form>	
  		</td>
  </tr>
      <tr class="rrtab_tt bold">
    <td class="xl64" align="center" width="59">姓名</td>
    <td class="xl65" align="center" width="30">性别</td>   
    <td align="center">执业资格</td>
    <td align="center">执业资格证书编号</td>
    <td align="center" >证书有效截止日期</td>   
  </tr>
 
	<c:choose>
		<c:when test="${list!=null }">
			<c:forEach items="${list }" var="exchange">
				<tr class="zgcxContent">
					<td align="center"><a href="#" title="${exchange.ryxm }" onclick="javascript:window.open('${contextPath }/branches/zqtzzgInfo.jsp?zsbh=${exchange.zsbh}','','width=492,height=215,resizable=no,scrollbars=no,menubar=no,location=no,status=yes');"> ${exchange.ryxm }</a></td>
					<td align="center">${exchange.sex}</td>
					<td align="center">${exchange.zyzg}</td>
					<td align="center">${exchange.zsbh}</td>
					<td align="center">${exchange.jzrq}</td>
					
				</tr>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<tr class="rrtab_tt bold">
		        <td colspan="9" align="center">暂无讯息</td>
		    </tr>
		</c:otherwise>
	</c:choose>

    </table>
 <div class="pageBar">
				<form action="/mgrInfoAction.do?method=getAll" method="post" id="navigatorForm">
				
				
				<c:choose><c:when test="${ryxm!=null }">
  								<input type="hidden" size="10" class="input108" name="ryxm" id="ryxm" value="${ryxm }"/> 
  								</c:when>
  								<c:otherwise>
			  					<input type="hidden" size="10" class="input108" name="ryxm" id="ryxm" /> 
							</c:otherwise>
  								</c:choose>
  								<c:choose><c:when test="${zsbh!=null }">
  								<input type="hidden" size="10" class="input108" name="zsbh" id="zsbh" value="${zsbh }"/> 
  								</c:when>
  								<c:otherwise>
			  					<input type="hidden" size="10" class="input108" name="zsbh" id="zsbh" /> 
							</c:otherwise>
  								</c:choose>
					总共 ${totalPages } 页，每页 20 条&nbsp;&nbsp;
				    <a href="javascript:gotoStartPage();">首页</a>   
				    <c:if test="${pageNumber>1}">  
				        <a href="javascript:gotoPage();">上一页</a>  
				    </c:if>   
				    跳转到第 <select name="pageNumber" id="pageNumber" onchange="gotoSelectedPage();">  
				    <c:forEach begin="1" end="${totalPages}" step="1" var="pageIndex">  
				        <c:choose>  
				            <c:when test="${pageIndex eq pageNumber}">  
				                <option value="${pageIndex}" selected="selected">${pageIndex}</option>  
				            </c:when>  
				            <c:otherwise>  
				                <option value="${pageIndex}">${pageIndex}</option>  
				            </c:otherwise>  
				        </c:choose>  
				    </c:forEach>  
				    </select> 页
				    <c:if test="${pageNumber<totalPages}">  
				        <a href="javascript:gotoNextPage();">下一页</a>  
				    </c:if>   
				    <a href="javascript:gotoindexPage();">末页</a>  
				</form> 	
				<a href="branches/newInfoDatum.jsp" title="广发证券投资顾问业务行为规范"  class="ywxwxwgf">▲广发证券投资顾问业务行为规范</a>			
			</div>
			
  </div>
    <div class="blank10"></div>

</div>
<script src="/js/imge.js"></script>
<jsp:include page="/share/bottom.jsp" />
</div>
</body>
<SCRIPT LANGUAGE="JavaScript">
     function check1(){
	   var ryxm=document.getElementById("ryxm").value;
	   var zsbh=document.getElementById("zsbh").value;
	   var userid=document.getElementById("userid").value;  
	   if(ryxm==""&&zsbh==""&&userid=="")
	   {
	     alert("请输入任何一个查询条件！");
	     return false;
	   }
     }  
  </script>
</html>