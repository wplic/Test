<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<jsp:directive.page import="com.cssweb.admanger.service.AdMangerService"/>
<jsp:directive.page import="com.cssweb.admanger.pojo.AdManger"/>
<body>
<%
	String adOpenUrl = null;
	AdManger adManger = null;
	ServletContext st = this.getServletConfig().getServletContext();
	ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
	AdMangerService adMangerService = (AdMangerService) ctx.getBean("adMangerService");
	String subAdCode = request.getParameter("subAdCode");
	if(subAdCode == null || subAdCode.length() == 0){
		subAdCode = "ad_news_";
	}
	//取得广告位编码
	String widths = request.getParameter("widths");
	if(widths == null || widths.length() == 0){
		widths = "200";
	}
	
	//取得广告位编码
	String heights = request.getParameter("heights");
	if(heights == null || heights.length() == 0){
		heights = "120";
	}
	List adList = adMangerService.getAdListBySubAdCode(subAdCode);
	if(adList==null||adList.size()==0){
		return;
	}
	int row = adList.size();
	if(row>0){
		adManger = (AdManger)adList.get(0);
		Date date = new Date();
		if(adManger!=null&&date.after(adManger.getKssj())&&date.before(adManger.getJssj())){
				if (adManger != null && adManger.getPicId() != null)
				{
					if (adManger.getUrl() != null && !"".equals(adManger.getUrl()) )
					{
						%>
					<a href="<%=adManger.getUrl() %>" target="_blank"><img src="${contextPath}/share/showUploadImage.jsp?&id=<%=adManger.getPicId() %>" alt="" class="fl" /></a>
					<%
					}
					else
					{%>
					<a href="<%=adManger.getUrl() %>" target="_blank"><img src="${contextPath}/share/showUploadImage.jsp?&id=<%=adManger.getPicId() %>" alt="" class="fl" /></a>
					<%}
				 	
				}else{
					%><img src="${contextPath}/pic/pic3.png" alt="" class="fl" /> <%
				}
	
		}
	}
 %>
</body>
