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
	widths = "502";
}

//取得广告位编码
String heights = request.getParameter("heights");
if(heights == null || heights.length() == 0){
	heights = "310";
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
	if(adList!=null && adList.size()>0){
	AdManger adManger=null;
	%>
		<SCRIPT>
	<%
		//对取得的广告位进行处理
		for(int i=0;i<Integer.parseInt(counts);i++){
			adManger=(AdManger)adList.get(i);
			long picId = adManger.getPicId();
			String url = adManger.getUrl();
	%>
			img[<%=i+1%>]=new Image();
			img[<%=i+1%>].src='/share/showUploadImage.jsp?id=<%=picId%>';
			url[<%=i+1%>]=new Image();
			url[<%=i+1%>].src='<%=url%>';
	<%
		}
	%>
		</SCRIPT>
	<%

	}

%>
 <SCRIPT src="/js/focusTop.js"></SCRIPT> </td>
        </tr>
      </table>
      <!-- 图片广告切换 End -->
    </td>
  </tr>
</table>
<%}%>