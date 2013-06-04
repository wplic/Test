<%request.setCharacterEncoding("UTF-8");%>
<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<jsp:directive.page import="java.util.*"/>
<jsp:directive.page import="com.cssweb.client.pojo.TsystemWebuser"/>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page	import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="com.cssweb.subscribe.service.TcsswebProductidCatidService"%>
<%@page import="com.cssweb.subscribe.pojo.TcsswebProductidCatid"%>
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
	TcsswebProductidCatidService tcsswebProductidCatidService = (TcsswebProductidCatidService)ctx.getBean("tcsswebProductidCatidService");
	
   
	List list=null;
	String productId="";
	String whichCat="";
	String productName="";
	if(request.getParameter("productId")!=null&&!request.getParameter("productId").equals(""))
	{
	 productId=request.getParameter("productId");
		 if(productId.equals("224")){
		 //新闻资讯
		  //224 GFTV财富频道
		  %>
		  <script type="text/javascript">
		  //window.parent.window.document.location.href="${ctx }/Subscribe/gftv.jsp";
		  window.document.location.href="${ctx }/Subscribe/prodgftv.jsp";
		  </script>
		  <%
		  return;
		 }
	 
	 list=tcsswebProductidCatidService.getProductidCatidListByProductid(Long.valueOf(productId));
		if(list!=null&&list.size()>0){
		for(int i=0;i<list.size();i++)
		{
		TcsswebProductidCatid tcsswebProductidCatid=(TcsswebProductidCatid)list.get(i);
		whichCat=whichCat+tcsswebProductidCatid.getCatName()+"|";
		productName=tcsswebProductidCatid.getProductName();
		}
		//whichCat.substring(0,whichCat.length()-1);
	  }
	}
	System.out.println("   whichCat="+whichCat);
 %>
<body>

<div class="left_tit2 left_tit007">交易公告</div>
    <div class="blank10"></div>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="ggtab">
      <tr>
        <td><span>·</span><a href="${ctx }/infoCenter/stockjyggHstbts.html" target="_blank" >沪市特别提示</a></td>
        <td><span>·</span><a href="${ctx }/infoCenter/stockjyggSstbts.html" target="_blank">深市特别提示</a></td>
        <td><span>·</span><a href="${ctx }/infoCenter/stockjyggJrxgts.html" target="_blank">今日新股提示</a></td>
        <td><span>·</span><a href="${ctx }/infoCenter/stockjyggZfpgts.html" target="_blank">增发配股提示</a></td>
        </tr>
      <tr>
        <td><span>·</span><a href="${ctx }/infoCenter/stockjyggZqfxssts.html" target="_blank">债券发行与上市提示</a></td>
        <td><span>·</span><a href="${ctx }/infoCenter/stockjyggJjfxzmts.html" target="_blank">基金发行扩募提示</a></td>
        <td><span>·</span><a href="${ctx }/infoCenter/stockjyggSjsgg.html" target="_blank">上交所公告</a></td>
        <td><span>·</span><a href="${ctx }/infoCenter/stockjyggSzjsgg.html" target="_blank">深交所公告</a></td>
        </tr>
    </table>

    <div class="blank10"></div>
    
    
<div class="left_tit2 left_tit007"><%if(productName!=null&&!productName.equals("")){ %><span class="pjcp">
<a href="${ctx }/Subscribe/evaluation.jsp?productId=<%=productId %>" target="_blank">
我要评价此产品</a></span><%} %> 
<a href="${ctx }/Subscribe/dyFull.jsp?id=<%=productId %>" target="_blank">
<%=productName %></a></div>
 <%if(whichCat!=null&&!whichCat.equals("")) {%>
 <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td>
 <jsp:include page="/Subscribe/cmsList.jsp">
           <jsp:param name="whichCat" value="<%=whichCat%>"/>
           <jsp:param name="productId" value="<%=productId%>"/>
           <jsp:param name="state" value="1"/>
           <jsp:param name="is_delete" value="0"/>
           <jsp:param name="showSize" value="20"/>
           <jsp:param name="titleWidth" value="56"/>
    	</jsp:include>
  </td>
      </tr>
    </table>
 <%}else{ %>
	<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="28" align="right">
        <p align="right">
        <p>  </p>
        </td>
      </tr>
    </table>
    <%} %>
      <div style="height:5px; overflow:hidden"></div>
</body>
</html>