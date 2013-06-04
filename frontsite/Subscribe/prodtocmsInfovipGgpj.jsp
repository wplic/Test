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
     <form action="${ctx }/vip.do?method=getJrsjGazxGgpjList2&productId=<%=productId %>" name="jrsjFrom" method="post">
      <table width="95%" align="center" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>时间：</td>
          <td><input type="text" id="StartDate" name="StartDate" onfocus="this.blur()" value="${StartDate }" style="width:86px; border:1px solid #c3c3c3;"  ><a href="javascript:void(0)" onclick="gfPop.fStartPop(document.jrsjFrom.StartDate,document.jrsjFrom.EndDate);return false;" HIDEFOCUS><img src="${ctx}/pic/share/selectTime.gif" name="popcal" width="19" height="18" border="0" align="absmiddle"></a></td>
          <td>到：</td>
          <td><input type="text" name="EndDate" id="EndDate" onfocus="this.blur()" value="${EndDate }" style="width:86px; border:1px solid #c3c3c3;" ><a href="javascript:void(0)" onClick="gfPop.fEndPop(document.jrsjFrom.StartDate,document.jrsjFrom.EndDate);return false;" HIDEFOCUS><img src="${ctx}/pic/share/selectTime.gif" name="popcal" width="19" height="18" border="0" align="absmiddle"></a></td>
          <td>标题：</td>
          <td><input type="text" name="title" id="title" value="" class="input108" /></td>
         </tr>
         <tr>       
           <td>证券代码：</td>
          <td><input type="text" name="gpdm" id="gpdm" value="${gpdm }" class="input108" onkeyup="value=value.replace(/[^0-9]/g,'')"/></td>
           <td>研究机构：</td>
          <td><input type="text" name="yjjgmc" id="yjjgmc" value="${yjjgmc }" class="input108" /></td>
          <td>评级：</td>
          <td>
          <%
          String selected="0";
          if(request.getAttribute("bzpjsz")!=null&&!request.getAttribute("bzpjsz").equals(""))
          {
            selected=(String)request.getAttribute("bzpjsz");
          }
          %>
           <select name="bzpjsz" id="bzpjsz"
			 class="input108">
				<option <%=selected.equals("0")?"selected='selected'":"" %>  value=0>
					请选择
				</option>
				<option <%=selected.equals("1")?"selected='selected'":"" %> value=1>
					买入
				</option>
				<option <%=selected.equals("2")?"selected='selected'":"" %>  value=2>
					增持
				</option>
				<option <%=selected.equals("3")?"selected='selected'":"" %>  value=3>
					中性
				</option>
				<option <%=selected.equals("4")?"selected='selected'":"" %>  value=4>
					减持
				</option>
				<option <%=selected.equals("5")?"selected='selected'":"" %>  value=5>
				     卖出
				</option>
			</select>	
          </td>
          <td class="red bold" align="center"><input type="image" src="/pic/wsyyt/but_cx1.jpg" /></td>
 
         </tr>
      </table>
     
      
    </div>
<table border="1" class="lh24 center" bordercolor="#cccccc" width="100%" id="tabs12">
              
           <tr class="wisdom_tab_title">
           <td width="12%" class="tab_th1 bold">证券代码</td>
           <td width="12%" class="tab_th1 bold">证券简称</td>
           <td width="13%" class="tab_th1 bold">评级</td>
           <td width="25%" class="tab_th1 bold">报告名称</td>
           <td width="23%" class="tab_th1 bold">研究机构</td>
           <td width="15%" class="tab_th1 bold">日期</td>
          </tr>
<%
  List list=null;
  if(request.getAttribute("ggpjList")!=null&&!request.getAttribute("ggpjList").equals(""))
  list=(List)request.getAttribute("ggpjList");
  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
  if(list!=null&&list.size()>0 )
  {
    for(int i=0;i<list.size();i++)
    {
       Vipgazx vipgazx = (Vipgazx)list.get(i);
 %>
 <tr>
					                <td>
					                 <a href="/bussinesshall/movetradehall/openggtzpjInfo.jsp?gpdm=<%=vipgazx.getGpdm() %>" target=\"_blank\" style="cursor:pointer;">
					                <%=vipgazx.getGpdm() %></a></td>
					                <td><%=vipgazx.getGpjc() %></td>
					                <td>
					               <%if(vipgazx.getBzpjsz()!=null&&vipgazx.getBzpjsz().equals("1")){
					                out.print("买入");
					                }if(vipgazx.getBzpjsz()!=null&&vipgazx.getBzpjsz().equals("2")){
					                out.print("增持");
					                }if(vipgazx.getBzpjsz()!=null&&vipgazx.getBzpjsz().equals("3")){
					                out.print("中性");
					                } if(vipgazx.getBzpjsz()!=null&&vipgazx.getBzpjsz().equals("4")){
					                out.print("减持");
					                } if(vipgazx.getBzpjsz()!=null&&vipgazx.getBzpjsz().equals("5")){
					                out.print("卖出");
					                }  %>
					               </td>
					                <%
					                		String bgmc = vipgazx.getBgmc();
					                		if (bgmc != null&& !"".equals(bgmc))
					                		{
					                			if (bgmc.length() > 13)
						                		{
						                				bgmc = bgmc.substring(0,13) + "...";
						                		}
					                		}
					                		
					                		
					                 %>
					                <td>
					              <a href="/bussinesshall/movetradehall/GGtzContent.jsp?tbgibxxbId=<%=vipgazx.getTbgibxxbId() %>" target=\"_blank\" style="cursor:pointer;">  <%=bgmc %></a>
					                </td>
					                <%
											String yjjg = (String)vipgazx.getYjjgmc();
											if (yjjg != null&& !"".equals(yjjg))
					                		{
					                			if (yjjg.length() > 10)
						                		{
						                				yjjg = yjjg.substring(0,10) + "...";
						                		}
					                		}else{
					                		yjjg="";
					                		}
					                		
									%>
					                <td><%=yjjg%></td>
					                <td><%=vipgazx.getZhxgrq()!=null?sdf.format(vipgazx.getZhxgrq()):"" %> </td>
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