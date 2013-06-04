<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.Date"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="com.cssweb.common.toDbLob.pojo.TextBlob"%>
<%@page import="com.cssweb.common.toDbLob.service.LobService"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<jsp:directive.page import="com.cssweb.admanger.service.AdMangerService"/>
<jsp:directive.page import="com.cssweb.admanger.pojo.AdManger"/>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link href="/css/front.css" rel="stylesheet" type="text/css"/>
</head>
<body leftmargin="0" topmargin="0">
	<% 
	AdManger adManger = null;
	String pciId = null;
	String content = null;
	String urlStr = null;
	String path = ((HttpServletRequest)pageContext.getRequest()).getContextPath()+"/";
	String adId = request.getParameter("adId");
	if(adId!=null&&StringUtils.isNumeric(adId)){
	ServletContext st = this.getServletConfig().getServletContext();
	ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
	AdMangerService adMangerService = (AdMangerService) ctx.getBean("adMangerService");
	LobService lobService = (LobService) ctx.getBean("lobService");
	adManger = adMangerService.getAdById(Long.parseLong(adId));
	Date date = new Date();
	if(adManger==null||!date.after(adManger.getKssj())||!date.before(adManger.getJssj())){
		adManger = null;
	}
	
	if(adManger!=null&&adManger.getPicId()!=null&&adManger.getPicId()!=0){
		pciId = adManger.getPicId().toString();
		urlStr = adManger.getUrl();
		if (urlStr == null || "".equals(urlStr)) {
		    urlStr = "#";
		}
	}
	if(adManger!=null&&StringUtils.isNotEmpty(adManger.getExt1())){
		TextBlob textBlob =  lobService.getTextBlobById(Long.parseLong(adManger.getExt1()));
		if(textBlob!=null){
			content = new String(textBlob.getSource(),"UTF-8");
		}
	 }
	 if(adManger.getMediaAdType()!=null&&!adManger.getMediaAdType().equals("")&&adManger.getMediaAdType().trim().equals("ggmtlx_flash") )
	 { //116 is falsh
	 int width=500;
	 int height=400;
	 long id=adManger.getPicId();
	 StringBuffer buffer = new StringBuffer();
		 buffer.append("<object classid='clsid:D27CDB6E-AE6D-11cf-96B8-444553540000' codebase='http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0' width='"+width+"' height='"+height+"'>");
		  buffer.append("<param name='movie' value='"+path+"share/showUploadImage.jsp?id="+id+"'>");
		  buffer.append("<param name='wmode' value='transparent'>");
		  buffer.append("<param name='quality' value='high'>");
		  buffer.append("<param name='LOOP' value='200'>");
		  buffer.append("<param name='allowScriptAccess' value='sameDomain'>");
		  buffer.append("<embed src='"+path+"share/showUploadImage.jsp?id="+id+"' width='"+width+"' height='"+height+"' loop='false' quality='high' pluginspage='http://www.macromedia.com/go/getflashplayer' type='application/x-shockwave-flash' wmode='transparent'></embed></object>");
	      pageContext.getOut().print(buffer.toString());
	 }else{
	 %>
	 <table width="100%" border="0" cellpadding="0" cellspacing="0">

          <%
          	if(pciId!=null){
          	%>
          		<tr><td align="center">
                <a target="_blank"><img src="/share/showUploadImage.jsp?id=<%=pciId %>" border="1" style="cursor:hand;" onclick="javascript:window.open('<%=urlStr %>')"/></a></td>
                </tr>
          	<%
          	}
           %>
           <%
          	if(content!=null){
          	%>
          		<tr><td align="center">
                <%=content %></td>
                </tr>
          	<%
          	}
           %>
          

                </table>
	 <%
	 }
	}
	%>
</body>
</html>
