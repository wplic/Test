<%request.setCharacterEncoding("UTF-8");%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<jsp:directive.page import="com.cssweb.business.product.pojo.ProductNetValue"/>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.cssweb.common.util.PageUtil"%>
<%@ include file="/commons/turnPage.jsp"%>
<jsp:directive.page import="java.util.*"/>
<jsp:directive.page import="java.text.NumberFormat"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
String assetProd = null;
if(null!=request.getAttribute("assetProd"))
	assetProd = (String)request.getAttribute("assetProd");
if(null==assetProd && null!=request.getParameter("assetProd"))
	assetProd = request.getParameter("assetProd");
if(null==assetProd)
	assetProd = "";
request.setAttribute("assetProd",assetProd);
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
Date nowdate = new Date();
ProductNetValue productNetValue=null;
if(null!=request.getAttribute("productNetValue")&&!request.getAttribute("productNetValue").equals(""))
{
 productNetValue=(ProductNetValue)request.getAttribute("productNetValue");
}
DecimalFormat percentFormat = new DecimalFormat("#0.0000");
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<link href="${contextPath }/css/global.css" rel="stylesheet" type="text/css" />
<link href="${contextPath }/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
<link href="${contextPath }/css/style.css" rel="stylesheet" type="text/css" />
<link href="${contextPath }/css/assetManage/assetManage.css" rel="stylesheet" type="text/css" />
<script src="${ctx}/js/prototype.js" type="text/javascript"	charset="UTF-8"></script>
<script>
function changeIframeSrc(){
	var startTime = document.getElementById("startTime").value;
	if(startTime!=''){
	    var stTime="2010-08-27";
	    if(startTime>=stTime)
		document.getElementById("corpForm").submit();
		else
		alert("请选择2010-08-27以后的日期！");
	}else{
	return;
	}
	
}
</script>
<body>  
 
<form action="${contextPath }/prod/productAction.do?method=getProductJsq&assetProd=<%=assetProd %>" method="post" id="corpForm" name="corpForm">
	<table width="90%" align="center" class="lh28 fcenter">
	<tr>
    <td class="title">选择日期：</td>
    <td>
    <input type="text" name="startTime" id="startTime" onfocus="this.blur()" value="" readonly/>
    <input type="button" name="rq" value="选择日期" onClick="gfPop.fStartPop(document.corpForm.startTime,0);return false;"/>
    </td>
    <td>&nbsp;</td>
      <td><input type="button" value="查询" class="khfwbut" onclick="changeIframeSrc()"/></td>
       </tr>
	</table>
</form>
<table width="99%" border="1" bordercolor="#CCCCCC" class="lh25 mtb10 textcenter fcenter">
 <tr><td><%if(productNetValue!=null&&productNetValue.getProductNetValue()>0){ %>
拆分后单位净值:<%=productNetValue.getProductNetValue() %>
 <%} %>
 </td></tr>
 <tr><td><%if(productNetValue!=null&&productNetValue.getProductNetValue()>0){ %>
拆分复权单位净值:<%=percentFormat.format(productNetValue.getProductNetValue()*1.590238141)%>
 <%} %></td></tr>
</table>
	 </body> 
<iframe width=174 height=189 name="gToday:normal:agenda.js" id="gToday:normal:agenda.js"
			src="${ctx}/js/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; left:-500px; top:0px;"> 
    
</html>