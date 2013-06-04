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
		subAdCode = "ad_index_t";
	}
	List adList = adMangerService.getAdListBySubAdCode(subAdCode);
//取得显示图片数量
 String counts = "0";
 if(adList!=null&&adList.size()>0)
   counts=String.valueOf(adList.size());
if(!counts.equals("0"))
{
//取得广告位编码
String widths = request.getParameter("widths");
if(widths == null || widths.length() == 0){
	widths = "492";
}

//取得广告位编码
String heights = request.getParameter("heights");
if(heights == null || heights.length() == 0){
	heights = "215";
}
%>
  <div class="cont">
<SCRIPT>
var widths=<%=widths%>;
var heights=<%=heights%>;
var counts=<%=counts%>;
var img=[];
var url=[];
</SCRIPT>

					
<% 
	if(adList!=null && adList.size()>0){
	AdManger adManger=null;
	%>
	<%
		//对取得的广告位进行处理
		for(int i=0;i<Integer.parseInt(counts);i++){
			adManger=(AdManger)adList.get(i);
			long picId = adManger.getPicId();
			String url = adManger.getUrl();
	%>
	<a href="<%=url%>" title="" target="_blank">
	<img src='/share/showUploadImage.jsp?id=<%=picId%>'/>
</a>
	
	<%
		}
	%> 
	<%

	}

%>
 </div>
 	<div class="nav">
						<div class="sprev"><a href="###" title="上一张">上一张</a></div>
						<div class="nav-box">
							<div class="nav-wrap" id="nav-wrap">
							<SCRIPT>
var widths=104;
var heights=50;
var counts=<%=counts%>;
var img=[];
</SCRIPT>

					
<% 
	if(adList!=null && adList.size()>0){
	AdManger adManger=null;
	%>
		
	<%
		//对取得的广告位进行处理
		for(int i=0;i<Integer.parseInt(counts);i++){
			adManger=(AdManger)adList.get(i);
			long picId = adManger.getPicId();
	%>
		
	<a href="###"><img src='/share/showUploadImage.jsp?id=<%=picId%>'/></a>
			
	<%
		}
	%> 
	
	<%

	}

%>
						  </div>
						</div>
						<div class="snext"><a href="###" title="下一张">下一张</a></div>
					</div>
<%}%>