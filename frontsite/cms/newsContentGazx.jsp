<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
request.setCharacterEncoding("UTF-8");
%>
<%@ include file="/commons/taglibs.jsp"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page	import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<jsp:directive.page import="com.cssweb.common.util.StringUtils"/>
<%@page	import="com.cssweb.gpdmGazx.service.GazxObjectService"%>
<%@page	import="com.cssweb.gpdmGazx.pojo.GazxObject"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<title>广发证券</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<link href="${contextPath}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${contextPath}/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />

<%
     SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	 ServletContext st = this.getServletConfig().getServletContext();
	 ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
	 GazxObjectService gazxObjectService = (GazxObjectService)ctx.getBean("gazxObjectService");
   //取多少条记录
    String guid ="";
    if(request.getParameter("guid")!=null&&!request.getParameter("guid").equals(""))
      guid =request.getParameter("guid").trim();
    String table="gsgg";
    if(request.getParameter("table")!=null&&!request.getParameter("table").equals(""))
    {
     table=request.getParameter("table");
    }
    if(guid.equals(""))
    {
    %>
	<script type="text/javascript">
		alert ("对不起，您请求的文章不存在！") ;
		window.opener=null;
		window.open('','_self');
		window.close() ;
	</script>
	<%
    }
	GazxObject gazxObject=gazxObjectService.getByIdAndTableObject(guid,table);
%>       

<script language="JavaScript" type="text/JavaScript">
var size=14;            //字体大小
function fontZoom(fontsize){    //设置字体
    size=fontsize;
    document.getElementById('ShowContent').style.fontSize=size+'px';
    document.getElementById('zhong').className='red';
    document.getElementById('da').className='';
    document.getElementById('xiao').className='';
}
function fontMax(){    //字体放大
    
    size=16
    document.getElementById('ShowContent').style.fontSize=size+'px';
    document.getElementById('zhong').className='';
    document.getElementById('da').className='red';
    document.getElementById('xiao').className='';
}
function fontMin(){    //字体缩小
    size=12;
    document.getElementById('ShowContent').style.fontSize=size+'px';
    document.getElementById('zhong').className='';
    document.getElementById('da').className='';
    document.getElementById('xiao').className='red';
}
</SCRIPT>
</head>

<body class="body_bg">
<jsp:include page="/share/top.jsp" />
<div class="wjdc_box">
  <p class="wjdc"><a href="/investorEdu/investorSurvey.html"><img src="/pic/index/wzdc.jpg"/></a></p>
</div>
<div class="main">
   <div class="left_tit2">文章信息</div>
   <p class="textTitle1" align="center"><%=gazxObject.getZt()!=null&&gazxObject.getZt().length()>150?gazxObject.getZt().subSequence(0,150)+"...":gazxObject.getZt() %></p>
   <p class="textTitle2" align="center">信息来源：港澳资讯 日期：<%=gazxObject.getZhxgrq()!=null?sdf.format(gazxObject.getZhxgrq()):""%> </p>
   <div class="newstextArea">
   <p class="newstextAreatop"></p>
   <div style="word-wrap:break-word;">
                           <%  
								String content=new String(gazxObject.getNr(), "GBK");
								content=content.replaceAll("\\</?(?!(input)|(img)).*?\\>","");
								content=content.replaceAll("    "," ");
								content=content.replaceAll("   "," ");
								content=content.replaceAll("  "," ");
								content=content.replaceAll("　","");
								content=content.replaceAll("	","");
								content=content.replaceAll("&nbsp;","");
								content=content.replaceAll("\r\n\r\n\r\n\r\n\r\n","\r\n");
								content=content.replaceAll("\r\n\r\n\r\n\r\n","\r\n");
								content=content.replaceAll("\r\n\r\n\r\n","\r\n");
								content=content.replaceAll("\r\n\r\n","\r\n");
								content=content.replace("\r\n","<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
								content="&nbsp;&nbsp;&nbsp;&nbsp;"+content;
								
								out.println(content);
						   %> 
                           <br />

                           </div>

			 
<p class="newstextAreabottom"></p>

</div>

</div>

<jsp:include page="/share/bottom.jsp" />
</body>
</html>
