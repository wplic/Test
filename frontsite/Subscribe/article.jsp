<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<jsp:directive.page import="com.css.cms.document.util.DocumentHelper"/>
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<jsp:directive.page import="com.cssweb.common.util.CsswebServiceUtil"/>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="java.util.Map"/>
<%@page import="com.cssweb.subscribe.pojo.TcsswebFwcpdy"%>
<%@page import="com.cssweb.subscribe.service.TcsswebFwcpdyService"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<%@page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<title>广发证券</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<link href="${contextPath}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${contextPath}/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
<%
 String productId="";
	if(request.getParameter("productId")!=null&&!request.getParameter("productId").equals(""))
	{
	 productId=request.getParameter("productId");
	}else{
	%>
		<script type="text/javascript">
			alert ("对不起，您请求的数据有误！") ;
			window.opener=null;
			window.open('','_self');
			window.close() ;
		</script>
	<%
}
    ServletContext st = this.getServletConfig().getServletContext();
	ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st); 
    TcsswebFwcpdyService tcsswebFwcpdyService = (TcsswebFwcpdyService)ctx.getBean("tcsswebFwcpdyService");
     TcsswebFwcpdy tcsswebFwcpdy=null;
    if(productId!=null&&!productId.equals(""))
    tcsswebFwcpdy=tcsswebFwcpdyService.getAllTcsswebFwcpdyById(Long.valueOf(productId));
    
 %>
</head>

<body class="body_bg">
<jsp:include page="/share/top.jsp" />
<div class="wjdc_box">
  <p class="wjdc"><a href="/investorEdu/investorSurvey.html"><img src="/pic/index/wzdc.jpg"/></a></p>
</div>
<div class="main">
   <div class="left_tit2">栏目信息</div>
   <p class="textTitle1" align="center"><%=tcsswebFwcpdy!=null?tcsswebFwcpdy.getProductName():"" %></p>
   <%if(tcsswebFwcpdy!=null&&!tcsswebFwcpdy.getIntroduce().equals("")) {%>
   <div class="newstextArea">
   <p class="newstextAreatop"></p>
   <strong >【产品简介】</strong><br/>
   <div>
  <%=tcsswebFwcpdy.getIntroduce()%>
  </div>
    <p class="newstextAreabottom"></p></div>
  <%} %>
   <div class="newstextArea">
    
   <p class="newstextAreatop"></p>
   <strong >【产品描述】</strong><br/>
   <div style="word-wrap:break-word;">
      <%=tcsswebFwcpdy.getNote() %>
  </div>

<p class="newstextAreabottom"></p>
</div>
</div>

<jsp:include page="/share/bottom.jsp" />
</body>
</html>
