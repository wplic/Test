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
<%@ page import="com.cssweb.common.util.PageUtil"%>
<%@ include file="/commons/turnPage.jsp"%>
<jsp:directive.page import="com.cssweb.gazx.jrsj.pojo.Zxtzpj "/>
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
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
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
<form action="${ctx }/zxtzpj.do?method=getZxtzpjList2&productId=<%=productId %>" name="jrsjFrom" method="post">
    <div class=" bg_ec mt5" style=" height:60px;">
      <div style=" height:10px; overflow:hidden"></div>
      <table width="95%" align="center" border="0" cellspacing="0" cellpadding="0">
        <tr>  
          <td width="15%">证券代码：</td>
          <td width="20%"><input type="text" name="gpdm" id="gpdm" value="${gpdm }" class="input108" onkeyup="value=value.replace(/[^0-9]/g,'')"/></td>
          <td width="15%">证券名称：</td>
          <td width="20%"><input type="text" name="gpjc" id="gpjc" value="${gpjc }" class="input108" /></td>
          <td colspan="2">&nbsp;
          	<input type="hidden" name="orderby" id="orderby" value="${orderby }"/>
          	<input type="hidden" name="desc" id="desc" value="<%=desc %>"/></td>
         </tr>
        <tr>  
          <td width="15%">研究机构：</td>
          <td width="20%"><input type="text" name="yjjgmc" id="yjjgmc" value="${yjjgmc }" class="input108"/></td>
          <td width="15%">标准评级：</td>
          <td width="20%">
          	<select name="bzpjsz" id="bzpjsz" class="input108">
          		<option value="">请选择</option>
          		<option value="1" <c:if test="${bzpjsz eq '1' }">selected</c:if>>买入</option>
          		<option value="2" <c:if test="${bzpjsz eq '2' }">selected</c:if>>增持</option>
          		<option value="3" <c:if test="${bzpjsz eq '3' }">selected</c:if>>中性</option>
          		<option value="4" <c:if test="${bzpjsz eq '4' }">selected</c:if>>减持</option>
          		<option value="5" <c:if test="${bzpjsz eq '5' }">selected</c:if>>卖出</option>
          	</select></td>
          <td width="15%" class="red bold" align="center">
          	<span onclick="onSubmit()" style="cursor:pointer"><img src="/pic/wsyyt/but_cx1.jpg"/></span></td>
          <td>&nbsp;</td>
         </tr>
      </table>
    </div>
		<table border="1" class="lh24 center" bordercolor="#cccccc" width="100%" id="tabs12">
		              
           <tr class="wisdom_tab_title">
	           <td width="10%" class="tab_th1 bold">证券代码</td>
	           <td width="10%" class="tab_th1 bold">证券简称</td>
	           <td width="12%" class="tab_th1 bold"><span onclick="onOrderby('bzpjsz')" style="cursor:pointer">标准评级<img src="/pic/share/top/list_03.jpg" border="0"/></span></td>
	           <td class="tab_th1 bold">报告名称</td>
	           <td width="12%" class="tab_th1 bold"><span onclick="onOrderby('bgzxrq')" style="cursor:pointer">评级日期<img src="/pic/share/top/list_03.jpg" border="0"/></span></td>
	           <td width="15%" class="tab_th1 bold">研究机构</td>
	           <td width="10%" class="tab_th1 bold">研究员</td>
          </tr>
			<%
			if(null != list){
				for(int i=0;i<list.size();i++){
					Zxtzpj zxtzpj = (Zxtzpj)list.get(i);
					String bzpj = "";
					String yjjgmc = zxtzpj.getYjjgmc();
					if(null!=yjjgmc){
						yjjgmc = yjjgmc.replaceAll("股份有限公司","");
						yjjgmc = yjjgmc.replaceAll("有限责任公司","");
						yjjgmc = yjjgmc.replaceAll("有限公司","");
					}
               		String bgmc = zxtzpj.getBgmc();
               		if (bgmc != null && bgmc.length() > 13)
               		{
                		bgmc = bgmc.substring(0,13) + "...";
               		}
					if(null!=zxtzpj.getBzpjsz()){
						if(1==zxtzpj.getBzpjsz().longValue())
							bzpj = "买入";
						else if(2==zxtzpj.getBzpjsz().longValue())
							bzpj = "增持";
						else if(3==zxtzpj.getBzpjsz().longValue())
							bzpj = "中性";
						else if(4==zxtzpj.getBzpjsz().longValue())
							bzpj = "减持";
						else if(5==zxtzpj.getBzpjsz().longValue())
							bzpj = "卖出";
					}%>
					<tr>
						<td>
		                 <a href="/stock.do?method=getStockBaseInfo&code=<%=zxtzpj.getGpdm() %>" target=\"_blank\" style="cursor:pointer;">
		                 <%=zxtzpj.getGpdm() %></a></td>
						<td><%=zxtzpj.getGpjc() %></td>
						<td><%=bzpj %></td>
						<td><a href="/bussinesshall/movetradehall/GGtzContent.jsp?tbgibxxbId=<%=zxtzpj.getBgjbxxbid()%>" target=\"_blank\" style="cursor:pointer;"><%=bgmc %></a></td>
						<td><%=null==zxtzpj.getBgzxrq()?"":sdf.format(zxtzpj.getBgzxrq()) %></td>
						<td><%=yjjgmc %></td>
						<td><%=null==zxtzpj.getYjyxm()?"":zxtzpj.getYjyxm() %></td>
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
function onSubmit(){
		var gpdm = document.getElementById("gpdm").value;
		var gpjc = document.getElementById("gpjc").value;
		var yjjgmc = document.getElementById("yjjgmc").value;
		var bzpjsz = document.getElementById("bzpjsz").value;
		if(''==gpdm && ''==gpjc && ''==yjjgmc && ''==bzpjsz){
			alert("请输入查询条件！");
			return false;
		}
		document.jrsjFrom.submit();
	}
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