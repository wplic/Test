<%request.setCharacterEncoding("UTF-8");%>
<%@ page contentType="text/html; charset=UTF-8"  %>
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<jsp:directive.page import="com.cssweb.theme.service.ThemeCategoryService"/>
<jsp:directive.page import="com.cssweb.theme.pojo.ThemeCategory"/>
<jsp:directive.page import="com.cssweb.theme.service.ThemeIntroService"/>
<jsp:directive.page import="com.cssweb.theme.pojo.ThemeIntro"/>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="java.util.Date"/>
<jsp:directive.page import="java.text.SimpleDateFormat"/>
<%
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
ServletContext st = this.getServletConfig().getServletContext();
ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
ThemeCategoryService themeCategoryService = (ThemeCategoryService) ctx.getBean("themeCategoryService");
ThemeIntroService themeIntroService = (ThemeIntroService) ctx.getBean("themeIntroService");
List list=themeCategoryService.getAllByGyjjshow();
String path = ((HttpServletRequest)pageContext.getRequest()).getContextPath()+"/";
//取得显示图片数量
 String counts = "0";
 if(list!=null&&list.size()>0)
   counts=String.valueOf(list.size());
if(!counts.equals("0"))
{
//取得广告位编码
String widths = request.getParameter("widths");
if(widths == null || widths.length() == 0){
	widths = "387";
}
//取得广告位编码
String heights = request.getParameter("heights");
if(heights == null || heights.length() == 0){
	heights = "236";
}
%>
<table width="<%=widths%>" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr> 
    <td height="30"> 
      <!-- 图片广告切换 Start -->
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td>
<SCRIPT>
var widths=<%=widths%>;
var heights=<%=heights%>;
var counts=<%=counts%>;
var img=[];
var url=[];
</SCRIPT>
<% 
	if(list!=null && list.size()>0){
	ThemeCategory themeCategory=null;
	%>
		<SCRIPT>
	<%
		//对取得的广告位进行处理
		for(int i=0;i<Integer.parseInt(counts);i++){
			themeCategory=(ThemeCategory)list.get(i);
			ThemeIntro themeIntro=themeIntroService.getByCategoryId(themeCategory.getId());
			//System.out.println(" themeCategory.getId()="+themeCategory.getId());
			if(themeIntro!=null&&themeIntro.getPicid()>0){
			long picId = themeIntro.getPicid();
			String url = path+"gyjj/owed.jsp?themeid="+themeCategory.getId();
	%>
			img[<%=i+1%>]=new Image();
			img[<%=i+1%>].src='/share/showUploadImage.jsp?id=<%=picId%>';
			url[<%=i+1%>]=new Image();
			url[<%=i+1%>].src='<%=url%>';
<%}}%></SCRIPT><%}%><SCRIPT src="/js/focus.js"></SCRIPT></td></tr></table></td></tr></table>
<%}%>