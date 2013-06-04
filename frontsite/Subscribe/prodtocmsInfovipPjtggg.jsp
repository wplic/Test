<%request.setCharacterEncoding("UTF-8");%>
<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<%@page import="java.text.SimpleDateFormat"%>
<jsp:directive.page import="java.util.*"/>
<jsp:directive.page import="com.cssweb.client.pojo.TsystemWebuser"/>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page	import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="com.cssweb.subscribe.service.TcsswebFwcpdyService"%>
<%@page import="com.cssweb.subscribe.pojo.TcsswebFwcpdy"%>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="com.cssweb.gazx.jrsj.pojo.Pjtggg "/>
<%@ page import="com.cssweb.common.util.PageUtil"%>
<%@ include file="/commons/turnPage.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${ctx }/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx }/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
 <SCRIPT LANGUAGE="JavaScript">
function frameFitSelfHeight1(frameId,countNum){
	myFrameId=frameId;
	myCountNum=countNum;
	
	if(myCountNum==null || myCountNum==undefined || myCountNum<0){
		myCountNum=0;
	}
	
	myCountNum++;
	if(myCountNum<=20){
		window.parent.window.document.getElementById(myFrameId).height = window.parent.window.document.getElementById(myFrameId).contentWindow.document.body.scrollHeight;
		setTimeout('frameFitSelfHeight1(myFrameId,myCountNum)',600);
	}
}
frameFitSelfHeight1('prodCmsList',null);
</SCRIPT>
</head>
<%
    ServletContext st = this.getServletConfig().getServletContext();
	ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
	TcsswebFwcpdyService tcsswebFwcpdyService = (TcsswebFwcpdyService)ctx.getBean("tcsswebFwcpdyService");
	
	TcsswebFwcpdy tcsswebFwcpdy=null;
	String productId="";
	String whichCat="";
	String productName="";
	if(request.getParameter("productId")!=null&&!request.getParameter("productId").equals(""))
	{
	 productId=request.getParameter("productId");
	 tcsswebFwcpdy=tcsswebFwcpdyService.getAllTcsswebFwcpdyById(Long.parseLong(productId));
	}
	if(request.getParameter("whichCat")!=null&&!request.getParameter("whichCat").equals(""))
	{
	 whichCat=request.getParameter("whichCat");
	}
    if(tcsswebFwcpdy!=null)
    productName=tcsswebFwcpdy.getProductName();
	System.out.println("   whichCat="+whichCat);
	
	List list = null;
if(null!=request.getAttribute("ggpjList"))
	list = (List)request.getAttribute("ggpjList");
String desc = "desc";
if(null!=request.getAttribute("desc"))
	desc = (String)request.getAttribute("desc");
 %>
<body>
<div class="left_tit2"><%if(productName!=null&&!productName.equals("")){ %><span class="pjcp">
<a href="${ctx }/Subscribe/evaluation.jsp?productId=<%=productId %>" target="_blank">
我要评价此产品</a></span><%} %> 
<a href="${ctx }/Subscribe/dyFull.jsp?id=<%=productId %>" target="_blank">
<%=productName %></a></div>
 <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td>
<div class=" bg_ec mt5" style=" height:60px;">
      <div style=" height:10px; overflow:hidden"></div>
<form action="${ctx }/pjtggg.do?method=getPjtgggList2&productId=<%=productId %>" name="jrsjFrom" method="post">
	<table border="1" class="lh24 center" bordercolor="#cccccc" width="100%" id="tabs12">
	              
		<tr class="wisdom_tab_title">
		 <td colspan="2">
          	<input type="hidden" name="orderby" id="orderby" value="${orderby }"/>
          	<input type="hidden" name="desc" id="desc" value="<%=desc %>"/></td>
		 <td colspan="2"><span onclick="onOrderby('bzpjsz1')" style="cursor:pointer">一月内<img src="/pic/share/top/list_03.jpg" border="0"/></span></td>
		 <td colspan="2"><span onclick="onOrderby('bzpjsz2')" style="cursor:pointer">一月前<img src="/pic/share/top/list_03.jpg" border="0"/></span></td>
		 <td colspan="2"><span onclick="onOrderby('bzpjsz3')" style="cursor:pointer">二月前<img src="/pic/share/top/list_03.jpg" border="0"/></span></td>
		</tr>
    
		 <tr class="wisdom_tab_title">
		  <td width="12%" class="tab_th1 bold"><span onclick="onOrderby('gpdm')" style="cursor:pointer">证券代码<img src="/pic/share/top/list_03.jpg" border="0"/></span></td>
		  <td width="13%" class="tab_th1 bold">证券简称</td>
		  <td width="12%" class="tab_th1 bold">综合评级指数</td>
		  <td width="13%" class="tab_th1 bold">综合评级</td>
		  <td width="12%" class="tab_th1 bold">综合评级指数</td>
		  <td width="13%" class="tab_th1 bold">综合评级</td>
		  <td width="12%" class="tab_th1 bold">综合评级指数</td>
		  <td class="tab_th1 bold">综合评级</td>
		</tr>
		<%
		if(null != list){
			for(int i=0;i<list.size();i++){
				Pjtggg pjtggg = (Pjtggg)list.get(i);%>
				<tr>
					<td>
		                 <a href="/stock.do?method=getStockBaseInfo&code=<%=pjtggg.getGpdm() %>" target=\"_blank\" style="cursor:pointer;">
		                 <%=pjtggg.getGpdm() %></a></td>
					<td><%=pjtggg.getGpjc() %></td>
					<td><%=pjtggg.getZhpjzs1() %></td>
					<td><%=pjtggg.getZhpj1() %></td>
					<td><%=pjtggg.getZhpjzs2() %></td>
					<td><%=pjtggg.getZhpj2() %></td>
					<td><%=pjtggg.getZhpjzs3() %></td>
					<td><%=pjtggg.getZhpj3() %></td>
				</tr>
		<%}}%>
	</table>
	<table width="75%" border="0" cellspacing="0" cellpadding="0" align="center">
	     <tr>
	       <td height="35" class="tdr"><%=PageUtil.pagination("jrsjFrom",totleCount, currentPage, pagesize)%></td>
	     </tr>
	</table>
	</form>
  </td>
      </tr>
    </table>
      <div style="height:5px; overflow:hidden"></div>
<iframe width="174" height="189" name="gToday:normal:agenda.js" id="gToday:normal:agenda.js"
			src="${ctx}/js/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; left:-500px; top:0px;"> </iframe>

</body>
<script type="text/javascript">
function onOrderby(obj){
		document.getElementById("orderby").value=obj;
		var desc = '<%=desc%>';
		if('desc'==desc)
			document.getElementById("desc").value = 'asc';
		else
			document.getElementById("desc").value = 'desc';
		document.jrsjFrom.submit();
	}
</script>
</html>