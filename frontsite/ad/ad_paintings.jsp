<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=utf-8" language="java" %>
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<jsp:directive.page import="com.cssweb.admanger.service.AdMangerService"/>
<jsp:directive.page import="com.cssweb.admanger.pojo.AdManger"/>
<%@page import="java.util.List"%>
<%
    String path = ((HttpServletRequest)pageContext.getRequest()).getContextPath()+"/";
	ServletContext st = this.getServletConfig().getServletContext();
	ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
	AdMangerService adMangerService = (AdMangerService) ctx.getBean("adMangerService");
	//取得广告位编码
	String subAdCode = request.getParameter("subAdCode");
	if(subAdCode == null || subAdCode.length() == 0){
		subAdCode = "ad_paintings";
	}
	List adList = adMangerService.getAdListBySubAdCode(subAdCode);
	AdManger adManger0 = null;
	AdManger adManger1 = null;
	//取得显示图片数量
	 String counts = "0";
	 if(adList!=null&&adList.size()>0)
	 {
	   counts=String.valueOf(adList.size());
	   adManger0=(AdManger)adList.get(0);
	   if(adList.size()>1)
	   adManger1=(AdManger)adList.get(1);
	  }

	//取得广告位编码
	String widths = request.getParameter("widths");
	if(widths == null || widths.length() == 0){
		widths = "120";
	}
	
	//取得广告位编码
	String heights = request.getParameter("heights");
	if(heights == null || heights.length() == 0){
		heights = "250";
}
%>
<style type="text/css">
<!--
.STYLE1 {color: #006600}
-->
#lovexin12,#lovexin14{
width:<%=widths%>px;
height:<%=heights %>px;
}
</style>

<script type="text/javascript">
				    		
							lastScrollY=60; 
							function heartBeat(){ 
							var diffY; 
							if (document.documentElement && document.documentElement.scrollTop) 
							diffY = document.documentElement.scrollTop; 
							else if (document.body) 
							diffY = document.body.scrollTop 
							else 
							{/*Netscape stuff*/} 
							
							//alert(diffY); 
							percent=.1*(diffY-lastScrollY); 
							if(percent>0)percent=Math.ceil(percent); 
							else percent=Math.floor(percent); 
							document.getElementById("lovexin12").style.top=parseInt(document.getElementById ("lovexin12").style.top)+percent+"px"; 
							document.getElementById("lovexin14").style.top=parseInt(document.getElementById ("lovexin12").style.top)+percent+"px"; 
							
							lastScrollY=lastScrollY+percent; 
							//alert(lastScrollY); 
							}
							
							<%
									if (adManger0 != null && adManger0.getPicId() != null)
									{
										if (adManger0.getUrl() != null && !"".equals(adManger0.getUrl()))
										{
											//http://www.secutimes.com/vote/toupiao.html
											%>
										
												suspendcode12="<DIV id=\"lovexin12\" style='z-index:1000;left:2px;POSITION:absolute;TOP:120px;'><a href='javascript:;'  onclick='this.parentNode.style.display=\"none\"'><img src='${contextPath}/pic/icon/Close.png' style='padding-left:70px' border='0' height='10px' /></a><a href='<%= adManger0.getUrl() %>' target='_blank'><img src='${contextPath}/share/showUploadImage.jsp?&id=<%=adManger0.getPicId() %>'  border='0'/></a></div>" ;
												
											<%
										}
										else
										{
											%>
										
												suspendcode12="<DIV id=\"lovexin12\" style='z-index:1000;left:2px;POSITION:absolute;TOP:120px;'><a href='javascript:;'  onclick='this.parentNode.style.display=\"none\"'><img src='${contextPath}/pic/icon/Close.png' style='padding-left:70px' border='0' height='10px' /></a><img src='${contextPath}/share/showUploadImage.jsp?&id=<%=adManger0.getPicId() %>' border='0'/></div>" ;
												
											<%
										}
										
									}
									else
									{
										%>
												suspendcode12="<DIV id=\"lovexin12\" style='z-index:1000;left:2px;POSITION:absolute;TOP:120px;'></div>" 
												
										<%
									}
									
									if (adManger1 != null && adManger1.getPicId() != null)
									{
										if (adManger1.getUrl() != null && !"".equals(adManger1.getUrl()) )
										{
											%>
												suspendcode14="<DIV id=\"lovexin14\" style='z-index:1000;right:2px;POSITION:absolute;TOP:120px;'><a href='javascript:;'  onclick='this.parentNode.style.display=\"none\"'><img src='${contextPath}/pic/icon/Close.png' style='padding-left:70px' border='0' height='10px' /></a><a href='<%= adManger1.getUrl() %>' target='_blank'><img src='${contextPath}/share/showUploadImage.jsp?&id=<%=adManger1.getPicId() %>' border='0'  /></a></div>"; 
												
											<%
										}
										else
										{
											%>
												suspendcode14="<DIV id=\"lovexin14\" style='z-index:1000;right:2px;POSITION:absolute;TOP:120px;'><a href='javascript:;'  onclick='this.parentNode.style.display=\"none\"'><img src='${contextPath}/pic/icon/Close.png' style='padding-left:70px' border='0' height='10px' /></a><img src='${contextPath}/share/showUploadImage.jsp?&id=<%=adManger1.getPicId() %>' border='0'  /></div>"; 
												
											<%
										}
										
									}
									else
									{
										%>
												suspendcode14="<DIV id=\"lovexin14\" style='z-index:1000;right:2px;POSITION:absolute;TOP:120px;'></div>" 
												
										<%
									}
							%>
							 
							document.write(suspendcode12); 
							document.write(suspendcode14); 
							window.setInterval("heartBeat()",1); 
</script>