
<%@page import="java.util.Map"%>
<%@page import="java.util.Date"%><%request.setCharacterEncoding("UTF-8");%>
<jsp:directive.page import="java.text.SimpleDateFormat"/>
<jsp:directive.page import="com.cssweb.business.product.pojo.ProductNetValue"/>
<jsp:directive.page import="com.cssweb.common.web.filter.SqlInjectValidate"/>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.cssweb.common.util.PageUtil"%>
<%@ include file="/commons/turnPage.jsp"%>
<jsp:directive.page import="java.util.List"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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

function openJsq()
	{
	var ah = 280;
	var aw = 500;
	var jsqurl= "${contextPath }/assetManage/prodJsq.jsp?assetProd=${assetProd }";
	//window.open('', 'newwindow', 'height='+ah +', width='+aw+', top=100, left=260, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no');
    document.location.href=jsqurl;
    }
</script>
<body>  
<%
List productNetValueList=(List)request.getAttribute("productNetValueList");
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");

SqlInjectValidate sqlInjectValidate = SqlInjectValidate.getSqlInjectValidate();
if(null!=request.getParameter("assetProd") && sqlInjectValidate.vakidateSqlIfIngter(request.getParameter("assetProd")))
		response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
if(null!=request.getParameter("assetProd") && sqlInjectValidate.validateSql2(request.getParameter("assetProd")))
		response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
%>
 
 
<form action="${contextPath }/prod/productAction.do?method=getProductNetValuetList_gkgg_s" method="post" id="corpForm" name="form1">
	<table width="95%" align="center" class="lh28 fcenter">
       <tr>
         <td width="60">开始日期：</td>
         <td width="85"><input name="startTime" type="text" id="startTime" value="${startTime }" onfocus="this.blur()" class="khfwinput" style=" width:80px" /></td>
         <td width="30"><a href="javascript:void(0)" onclick="gfPop.fStartPop(document.form1.startTime,document.form1.endTime);return false;" HIDEFOCUS><img src="${ctx}/pic/assetManage/date.gif" name="popcal" width="19" height="18" border="0" align="middle"></a></td>
         <td width="60">结束日期：</td>
         <td width="87"><input name="endTime" type="text" id="endTime" onpropertychange="calculate(this.value);" value="${endTime }" onfocus="this.blur()" class="khfwinput" onchange="" style=" width:80px" /></td>
         <td width="30">
         <a href="javascript:void(0)" on onclick="gfPop.fEndPop(document.form1.startTime,document.form1.endTime);return false;" HIDEFOCUS><img src="${ctx}/pic/assetManage/date.gif" name="popcal" width="19" height="18" border="0" align="middle"></a>
        </td>
         <td width="85"><input type="submit" value="查询" class="khfwbut" /></td>
         <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
         <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
       </tr>
	</table>
	<table border="1" bordercolor="#cccccc" width="98%" align="center" class="lh24 mt10">
          <tr class="rrtab_tt bold">
          <td width="19%" valign="top"><p align="center">日期 </p></td>
          <td width="19%" valign="top"><p align="center">份额代码</p></td>
          <td width="19%" valign="top"><p align="center">份额名称</p></td>
          <td width="19%" valign="top"><p align="center">份额净值</p></td>
              </tr>	
			<%if(productNetValueList!=null && productNetValueList.size()>0){
				for (Object object : productNetValueList) {
					Map map = (Map)object;		
			%>
              <tr>
                <td width="19%" valign="top"><p align="center"><%=sdf.format((Date)map.get("net_value_date")) %></p></td>
                <td width="19%" valign="top"><p align="center"><%=map.get("product_code") %></p></td>
                <%if(map.get("product_code").equals("878001")){ %>
                	<td width="19%" valign="top"><p align="center">广发多空杠杆母份额</p></td>
                <%} %>
                <%if(map.get("product_code").equals("878002")){ %>
                	<td width="19%" valign="top"><p align="center">广发多空杠杆看涨份额</p></td>
                <%} %>
                <%if(map.get("product_code").equals("878003")){ %>
                	<td width="19%" valign="top"><p align="center">广发多空杠杆看跌份额</p></td>
                <%} %>
                <td width="19%" valign="top"><p align="center"><%=map.get("product_net_value") %></p></td>
              </tr>
            <%} }%>  
    </table>  
	          				
	<table width="65%" border="0" cellspacing="0" cellpadding="0" align="center">
		<tr>
		  <td height="35" class="tdr"><%=PageUtil.pagination("corpForm",totleCount, currentPage, pagesize)%></td>
		</tr>
	</table>
</form>
    </body> 
<iframe width=174 height=189 name="gToday:normal:agenda.js" id="gToday:normal:agenda.js"
			src="${ctx}/js/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; left:-500px; top:0px;"> 
    
</html>