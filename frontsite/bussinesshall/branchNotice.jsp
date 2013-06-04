<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<jsp:directive.page import="com.css.cms.document.Document"/>
<jsp:directive.page import="com.css.cms.document.DocumentManager"/>
<jsp:directive.page import="com.css.cms.document.util.DocumentHelper"/>
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<%@page import="com.cssweb.systemset.service.BranchNoticeService"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="com.cssweb.systemset.pojo.BranchNotice"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.cssweb.common.toDbLob.service.LobService"%>
<%@page import="com.cssweb.common.toDbLob.pojo.TextBlob"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<%@page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>广发证券</title>
<link href="${contextPath}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${contextPath}/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />

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

<%
  	ServletContext st = this.getServletConfig().getServletContext();
	ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
	BranchNoticeService branchNoticeService=(BranchNoticeService)ctx.getBean("branchNoticeService");
	LobService lobService = (LobService)ctx.getBean("lobService");
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String idStr = request.getParameter("id");
	Long id = null;
	
	BranchNotice branchNotice=null;
	if(StringUtils.isNumeric(idStr)){
		id = new Long(idStr);
		branchNotice = branchNoticeService.getBranchNoticeInfoById(id);
	}
	if(branchNotice==null)
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
	String dateStr = "";
	if(branchNotice.getCreateDate()!=null){
		dateStr ="日期:" +  sdf.format(branchNotice.getCreateDate());
	}
	TextBlob textBlob =lobService.getTextBlobById(branchNotice.getContent());
	if(textBlob==null){
%>
	<script type="text/javascript">
		alert ("对不起，您请求的文章不存在！") ;
		window.opener=null;
		window.open('','_self');
		window.close() ;
	</script>
<%
	}
	String text = new String(textBlob.getSource(),"UTF-8");

%>

<body class="body_bg">
<jsp:include page="/share/top.jsp" />
<div class="wjdc_box">
  <p class="wjdc"><a href="/investorEdu/investorSurvey.html"><img src="/pic/index/wzdc.jpg"/></a></p>
</div>
<div class="main">
   <div class="left_tit2">文章信息</div>
   <p class="textTitle1" align="center"><%=branchNotice.getTitle()%></p>
   <p class="textTitle2" align="center"> 作者：<%= branchNotice.getCreatorName() %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%=dateStr %> </p>
   <div class="newstextArea">
   <p class="newstextAreatop"></p>
   <div style="word-wrap:break-word;">
                           <%  
								String content=text;
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
								content="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+content;
								
								//content=HTMLutils.TextToHtml(content);
								out.println(content);
						   %> 
                           <br />
                           <table width="92%"  border="0" align="center" cellpadding="0" cellspacing="0">
					 <tr>
                      <td height="48" align="center" style="padding:10px 15px; "><input type="submit" name="Submit2" value="关闭窗口" class="button4" onClick="javascript:window.opener=null;window.close();"/></td>
                     </tr>
		          </table>

                           </div>

			 
<p class="newstextAreabottom"></p>

</div>

</div>

<jsp:include page="/share/bottom.jsp" />
</body>
</html>
