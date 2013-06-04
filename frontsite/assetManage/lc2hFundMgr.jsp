<%@ page contentType="text/html; charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<jsp:directive.page import="java.util.List"/>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page	import="java.text.SimpleDateFormat"%>
<%@page	import="java.util.Date"%>
<jsp:directive.page import="com.cssweb.assetManager.pojo.AssetManager"/>
<jsp:directive.page import="com.cssweb.assetManager.service.AssetManagerService"/>
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<jsp:directive.page import="org.apache.commons.lang.StringUtils"/>
<%
		String nav = request.getParameter("nav");
		if (nav == null || nav.length() < 1)
			nav = "tzlc";
		String nav2 = request.getParameter("nav2");
		if (nav2 == null)
			nav2 = "2";	
        String nav3 = request.getParameter("nav3");
		if (nav3 == null)
			nav3 = "cpzx_jhlc_cpjj";
			
		String assetProd = request.getParameter("assetProd");
		if(StringUtils.isEmpty(assetProd)){
			assetProd = "2";
		}
		String whichCat="cpzx_jhlc_cpjj";
		if(request.getParameter("whichCat")!=null&&!request.getParameter("whichCat").equals(""))
		{
		 whichCat=request.getParameter("whichCat").trim();
		}
		
	ServletContext st = this.getServletConfig().getServletContext();
	ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
	AssetManagerService assetManagerService=(AssetManagerService)ctx.getBean("assetManagerService");
	List managerList=null;
	if(!StringUtils.isEmpty(assetProd)){
		managerList=assetManagerService.getManagerInfoByProductId(Long.parseLong(assetProd));
	}
	%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<link href="/css/assetManage/assetManage.css" rel="stylesheet" type="text/css" />
</head>
<body>
<jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="${contextPath }/default.html"> 首页 </a>-<a href="${contextPath }/assetManage/index.jsp">资产管理</a> - 集合产品</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft">
	 	<jsp:include page="${contextPath }/assetManage/assetInfo_index_lmenu.jsp">
		    <jsp:param name="nav" value="jhcp" />
		    <jsp:param name="nav2" value="<%=assetProd %>" />
		    <jsp:param name="whichCat" value="<%=whichCat %>" />
			<jsp:param name="assetProd" value="<%=assetProd %>" />
		</jsp:include>
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w706 fright">
  		<jsp:include  page="/assetManage/assetManageTop.jsp">
			<jsp:param name="whichCat" value="<%=whichCat %>" />
		</jsp:include>
    <div class="blank10"></div>
    <%
     if(managerList!=null&&managerList.size()>0)
     {
       for(int i=0;i<managerList.size();i++)
       {
         AssetManager assetManager=(AssetManager)managerList.get(i);
         %>
             <div class="funmrgbg">
      <table width="95%" align="center" class="lh21 fcenter">
        <tr>
          <td width="22%" rowspan="4">
          <img src="${ctx}/share/showUploadImage.jsp?id=<%=assetManager.getPic() %>" width="106" height="131" alt="无相片"/>
          </td>
          <td width="12%" class="font14 bold"><%=assetManager.getName() %> ：</td>
          <td width="66%" class="font14"><%=assetManager.getSex()!=null&&assetManager.getSex().equals("0")?"男":"女" %> / <%=assetManager.getEduction() %> / <%=assetManager.getAge() %>岁 / <%=assetManager.getWorkyear() %>年证券从业经历</td>
        </tr>
        <tr>
          <td colspan="2" height="10"></td>
        </tr>
        <tr>
          <td valign="top"><strong class="bold">个人介绍：</strong></td>
          <td valign="top"><%=assetManager.getIntro() %></td>
        </tr>
        
      </table>
    </div>
         <%
       }
     }
     %>
    <jsp:include  page="/assetManage/includeForProdAll.jsp">
			<jsp:param name="whichCat" value="<%=whichCat %>" />
			<jsp:param name="assetProd" value="<%=assetProd %>" />
			<jsp:param name="showSize" value="5" />
		</jsp:include>
  </div>
  <!--右侧sied结束--> 
<div class="clearfloat"></div>
</div>  <div class="blank5"></div><!--清除浮动--> 
<jsp:include page="/commons/msbottom.jsp" />
</body>
</html>