<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<jsp:directive.page import="com.cssweb.client.pojo.TsystemWebuser"/>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page	import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page	import="com.cssweb.subscribe.service.TcsswebFwcpdyService"%>
<%@page import="com.cssweb.subscribe.pojo.TcsswebFwcpdy"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${ctx }/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx }/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />

</head>
<%
ServletContext st = this.getServletConfig().getServletContext();
ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
TcsswebFwcpdyService tcsswebFwcpdyService = (TcsswebFwcpdyService)ctx.getBean("tcsswebFwcpdyService");
TsystemWebuser tsystemWebuser=null;
		if(request.getSession().getAttribute("tsystemWebuser")!=null)
		tsystemWebuser=(TsystemWebuser)request.getSession().getAttribute("tsystemWebuser");
Long id=0l;
TcsswebFwcpdy tcsswebFwcpdy=null;
if(request.getParameter("id")!=null&&!request.getParameter("id").equals(""))
{
 id=Long.parseLong(request.getParameter("id"));
 tcsswebFwcpdy=tcsswebFwcpdyService.getAllTcsswebFwcpdyById(id);
}
if(id==0)
{
 %>
	<script type="text/javascript">
		alert ("对不起，您请求的产品不存在！") ;
		window.opener=null;
		window.open('','_self');
		window.close() ;
	</script>
<%
}
 %>
<body class="body_bg">
<jsp:include page="/share/top.jsp?nav=wsyyt&nav1=wdlczx" />
<div class="main">
  <div class="dqwz">当前位置：首页 > 网上营业厅 > 我的理财中心 > 我的管家资讯</div>
<jsp:include page="/bussinesshall/movetradehall/financing_submenu.jsp">
		<jsp:param name="nav3" value="zzdysy" />
	</jsp:include>
  <div class="zzmenu">
  <img src="${ctx }/pic/Subscribe/dot1.gif" align="absmiddle" /> 
  <span class="red"><a href="${ctx }/tcsswebFwtcdyAtion.do?method=getTcsswebFwtcdyAll">自助定阅首页</a></span>
  <img src="${ctx }/pic/Subscribe/dot1.gif" align="absmiddle" />
  <a href="${ctx }/tcsswebFwcpcxAction.do?method=getFwcpcxDyprodListByAccount">已定阅专属资讯产品表</a>
  <img src="${ctx }/pic/Subscribe/dot1.gif" align="absmiddle" />
  <a href="${ctx }/tcsswebFwtcdyAtion.do?method=getTcsswebProFwcptdByAccounList">申请进度查询</a></div>
  
</div>
<div class="wrap920">
    <p class="p10">尊敬的<%=tsystemWebuser!=null&&tsystemWebuser.getServiceName()!=null?tsystemWebuser.getServiceName():"" %>，您好</p>
  <p align="center" class="font16 bold p15">
  
  <%=tcsswebFwcpdy!=null?tcsswebFwcpdy.getProductName():"" %>
  </p>
    
    <ul class="dytag1">
   	  <li id="taglist1" class="cur"><a href="#">产品介绍<span></span></a></li>
    </ul>
  	
    <div class="dybox1">
    	<p class="lh22">
    	
    	<%
    	 if(tcsswebFwcpdy!=null)
    	 {
    	  %>
    	  <%=tcsswebFwcpdy.getIntroduce() %>
    	  <%
    	 }
    	 %>

    </div>
    <p class="p15" align="center">
    <input name="button" class="dybtn1" type="button" value="我要评价" onclick="openMainPj();"/></p>
    
  
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="/share/bottom.jsp" />
<script language="JavaScript" type="text/JavaScript">
    function openMainPj()
	{
	    var url="${ctx }/Subscribe/evaluation.jsp";
	    alert(url);
		url=url+"?productId="+<%=tcsswebFwcpdy!=null?tcsswebFwcpdy.getId():"" %>;
		window.open(url,'_blank','height=359,width=431,toolbar=no,location=no,directories=no,menubar=no,scrollbars=no,resizable=no,status=no,top=100,left=200');
	}
</script>
</body>
</html>