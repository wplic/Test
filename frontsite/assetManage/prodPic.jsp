<%request.setCharacterEncoding("UTF-8");%>
<jsp:directive.page import="java.text.SimpleDateFormat"/>
<jsp:directive.page import="com.cssweb.business.product.pojo.ProductNetValue"/>
<jsp:directive.page import="com.cssweb.common.web.filter.SqlInjectValidate"/>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.cssweb.common.util.PageUtil"%>
<%@ include file="/commons/turnPage.jsp"%>
<jsp:directive.page import="java.util.*"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
String assetProd = null;
SqlInjectValidate sqlInjectValidate = SqlInjectValidate.getSqlInjectValidate();
if(null!=request.getParameter("assetProd") && sqlInjectValidate.vakidateSqlIfIngter(request.getParameter("assetProd")))
		response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
if(null!=request.getParameter("assetProd") && sqlInjectValidate.validateSql2(request.getParameter("assetProd")))
		response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
if(null!=request.getAttribute("assetProd"))
	assetProd = (String)request.getAttribute("assetProd");
if(null==assetProd && null!=request.getParameter("assetProd"))
	assetProd = request.getParameter("assetProd");
if(null==assetProd)
	assetProd = "";
request.setAttribute("assetProd",assetProd);
//List productNetValueList=(List)request.getAttribute("productNetValueList");
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
Date nowdate = new Date();
String endTime = sdf.format(nowdate);
int year = Integer.parseInt(endTime.split("-")[0]);
String startTime = (year-1)+"-"+endTime.split("-")[1]+"-01";
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<link href="${contextPath }/css/global.css" rel="stylesheet" type="text/css" />
<link href="${contextPath }/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
<link href="${contextPath }/css/style.css" rel="stylesheet" type="text/css" />
<link href="${contextPath }/css/assetManage/assetManage.css" rel="stylesheet" type="text/css" />
<script src="${ctx}/js/prototype.js" type="text/javascript"	charset="UTF-8"></script>
<script>
function isNumber(String){ 
	  var Letters = "1234567890.-"; 
	   var i;
		   var c;
		 for( i = 0; i < String.length; i ++ ){
        c = String.charAt( i );
			  	 if (Letters.indexOf( c ) < 0){
	       		 return false;
				}
		} 
		return true;
}
function calculate(m){
 var url="${ctx}/prod/productAction.do";
// alert(url);
 var pars='method=calculate&date='+m;
//  alert(pars);
 var myAjax = new Ajax.Request(url,{method:'post',parameters:pars,onComplete: showResponse}); 
 
}
function showResponse(res){
	var str=res.responseText; 
	if(str.length>0){
		document.getElementById("outUnitAccount").value=str.split(',')[0];
		document.getElementById("outAllAccount").value=str.split(',')[1];
	}else{
		document.getElementById("outAllAccount").value='';
		document.getElementById("outUnitAccount").value='';
	}
}
function changeIframeSrc(){
	var startTime = document.getElementById("startTime").value;
	var endTime = document.getElementById("endTime").value;
	var src = '${contextPath }/assetManage/gfzqVoteFlex.jsp?assetProd=${assetProd }';
	if(startTime!=''){
		src = src+"&startTime="+startTime;
	}
	if(endTime!=''){
		src = src+"&endTime="+endTime;
	}
	document.getElementById("info").src = src;
	//document.getElementById("info").src = "http://www.qq.com";
}
</script>
<body>  
 
<form action="${contextPath }/prod/productAction.do?method=getProductNetValuetList&assetProd=${assetProd }" method="post" id="corpForm" name="form1">
	<table width="90%" align="center" class="lh28 fcenter">
       <tr>
         <td width="60">开始日期：</td>
         <td width="85"><input name="startTime" type="text" id="startTime" value="<%=startTime%>" onfocus="this.blur()" class="khfwinput" style=" width:80px" /></td>
         <td width="30"><a href="javascript:void(0)" onclick="gfPop.fStartPop(document.form1.startTime,document.form1.endTime);return false;" HIDEFOCUS><img src="${ctx}/pic/assetManage/date.gif" name="popcal" width="19" height="18" border="0" align="middle"></a></td>
         <td width="60">结束日期：</td>
         <td width="87"><input name="endTime" type="text" id="endTime" onpropertychange="calculate(this.value);" value="<%=endTime%>" onfocus="this.blur()" class="khfwinput" onchange="" style=" width:80px" /></td>
         <td width="30">
         <a href="javascript:void(0)" on onclick="gfPop.fEndPop(document.form1.startTime,document.form1.endTime);return false;" HIDEFOCUS><img src="${ctx}/pic/assetManage/date.gif" name="popcal" width="19" height="18" border="0" align="middle"></a>
        </td>
         <td><input type="button" value="查询" class="khfwbut" onclick="changeIframeSrc()"/></td>
       </tr>
	</table>
</form>
	<iframe id="info" src="${contextPath }/assetManage/gfzqVoteFlex.jsp?assetProd=${assetProd }&startTime=<%=startTime%>&endTime=<%=endTime%>" width="720" height="325" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe>
    </body> 
<iframe width=174 height=189 name="gToday:normal:agenda.js" id="gToday:normal:agenda.js"
			src="${ctx}/js/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; left:-500px; top:0px;"> 
    
</html>