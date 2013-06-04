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
<jsp:directive.page import="com.cssweb.gazx.jrsj.pojo.Vipgazx "/>
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
 <form action="${ctx }/vip.do?method=getJrsjGazxList2&productId=<%=productId %>&whichCat=${whichCat }" name="jrsjFrom" method="post">
      <table width="95%" align="center" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>时间：</td>
          <td><input type="text" id="StartDate" name="StartDate" onfocus="this.blur()" value="${StartDate }" style="width:86px; border:1px solid #c3c3c3;"  ><a href="javascript:void(0)" onclick="gfPop.fStartPop(document.jrsjFrom.StartDate,document.jrsjFrom.EndDate);return false;" HIDEFOCUS><img src="${ctx}/pic/share/selectTime.gif" name="popcal" width="19" height="18" border="0" align="absmiddle"></a></td>
          <td>到：</td>
          <td><input type="text" name="EndDate" id="EndDate" onfocus="this.blur()" value="${EndDate }" style="width:86px; border:1px solid #c3c3c3;" ><a href="javascript:void(0)" onClick="gfPop.fEndPop(document.jrsjFrom.StartDate,document.jrsjFrom.EndDate);return false;" HIDEFOCUS><img src="${ctx}/pic/share/selectTime.gif" name="popcal" width="19" height="18" border="0" align="absmiddle"></a></td>
          
          <td>证券代码：</td>
          <td><input type="text" name="gpdm" id="gpdm" value="${gpdm }" class="input108" onkeyup="value=value.replace(/[^0-9]/g,'')"/></td>
          </tr>
          <tr>
           <td>研究机构：</td>
          <td><input type="text" name="yjjgmc" id="yjjgmc" value="${yjjgmc }" class="input108" /></td>
           <td>作者：</td>
          <td><input type="text" name="yjyxm" id="yjyxm" value="${yjyxm }" class="input108" /></td>
          <td>标题：</td>
          <td><input type="text" name="title" id="title" value="${title }" class="input108" /></td>
          
          <td class="red bold" align="center"><input type="image" src="/pic/wsyyt/but_cx1.jpg" /></td>
        </tr>
      </table>
     
      
    </div>
 <table width="98%" align="center" class="lh28 mt20  font_st list_bline1">
<%
  List list=null;
  if(request.getAttribute("jrsjList")!=null&&!request.getAttribute("jrsjList").equals(""))
  list=(List)request.getAttribute("jrsjList");
  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
  if(list!=null&&list.size()>0 )
  {
    for(int i=0;i<list.size();i++)
    {
       Vipgazx vipgazx = (Vipgazx)list.get(i);
       
 
 %>
          <tr>
            <td width="50%"><a href="/bussinesshall/movetradehall/GGtzVipContent.jsp?tbgibxxbId=<%=vipgazx.getTbgibxxbId() %>" target=\"_blank\" style="cursor:pointer;">
             <%=vipgazx.getBgmc()!=null&&!vipgazx.getBgmc().equals("")&&vipgazx.getBgmc().length()>26?vipgazx.getBgmc().substring(0,26)+"...":vipgazx.getBgmc() %>
              </a></td>
             <td width="20%"><%=vipgazx.getYjjgmc()!=null?vipgazx.getYjjgmc().replace("股份有限公司","").replace("有限责任公司","").replace("有限公司",""):""%></td>
             <td width="20%"><%=vipgazx.getYjyxm()!=null?vipgazx.getYjyxm():"" %></td>
            <td width="10%" align="right"><%=vipgazx.getZhxgrq()!=null?sdf.format(vipgazx.getZhxgrq()):"" %></td>
          </tr>
   <%
     }
  }
  %>
    
             
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
</html>