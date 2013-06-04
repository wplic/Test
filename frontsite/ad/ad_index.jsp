<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<jsp:directive.page import="com.cssweb.admanger.service.AdMangerService"/>
<jsp:directive.page import="com.cssweb.admanger.pojo.AdManger"/>

<%
	String adOpenUrl = null;
	AdManger adManger = null;
	String path = ((HttpServletRequest)pageContext.getRequest()).getContextPath()+"/";
	ServletContext st = this.getServletConfig().getServletContext();
	ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
	AdMangerService adMangerService = (AdMangerService) ctx.getBean("adMangerService");
	List adFlashList = adMangerService.getAdListBySubAdCode("ad_index_f");
	if(adFlashList!=null&&adFlashList.size()>0)
	{
	//flash 存在
	 adManger = (AdManger)adFlashList.get(0);
	 if(adManger.getMediaAdType()!=null&&!adManger.getMediaAdType().equals("")&&adManger.getMediaAdType().trim().equals("ggmtlx_flash") )
	 { //116 is falsh
	 int width=492;
	 int height=215;
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
	   }
	}else{
		%>
		<jsp:include page="ad_pic.jsp">
			<jsp:param value="696" name="widths"/>
		</jsp:include>
		<%
	}
%>