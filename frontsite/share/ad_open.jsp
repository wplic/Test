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
	ServletContext st = this.getServletConfig().getServletContext();
	ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
	AdMangerService adMangerService = (AdMangerService) ctx.getBean("adMangerService");
	String subAdCode = request.getParameter("subAdCode");
	if(subAdCode == null || subAdCode.length() == 0){
		subAdCode = "ad_open";
	}
	List adList = adMangerService.getAdListBySubAdCode(subAdCode);
	if(adList==null||adList.size()==0){
		return;
	}
	int row = adList.size();
	for(int i=0;i<row;i++){
		adManger = (AdManger)adList.get(i);
		Date date = new Date();
		if(adManger!=null&&date.after(adManger.getKssj())&&date.before(adManger.getJssj())){
		adOpenUrl="/share/ad_open_page.jsp?adId="+adManger.getId();
		int width=500;
		int height=400;
		if(adManger.getExt3()!=null&&!adManger.getExt3().equals("")&&!adManger.getExt3().equals("null"))
		 width=Integer.parseInt(adManger.getExt3());
		 if(adManger.getExt4()!=null&&!adManger.getExt4().equals("")&&!adManger.getExt4().equals("null"))
		 height=Integer.parseInt(adManger.getExt4());
		%>
		<script>
		    //var screenWidth = screen.width - 10;
			//var screenHeight = screen.height - 25;
		    window.open('<%=adOpenUrl %>', '_blank', 'width=<%=width %>,height=<%=height %>,top=0,left=0,toolbar=no,menubar=no, scrollbars=no, resizable=yes, location=no, status=no');  
		</script>
		<%
		}
	}
 %>

