<%@ page contentType="text/html; charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<jsp:directive.page import="org.apache.commons.lang.StringUtils"/>
<%
		String productCode = request.getParameter("productCode");
		if(productCode==null || "".equals(productCode)){
			productCode="";
		}
		String type = request.getParameter("type");
		if(type==null || "".equals(type)){
			type="";
		}
		String navName="";
		String nav = request.getParameter("nav");
		if (nav == null || nav.length() < 1)
			nav = "tzlc";
		if(nav.equals("xjhcp"))
		navName="小";
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
	%>
	
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<link href="/css/assetManage/assetManage.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${contextPath }/js/jsIfUtils.js"></script>
</head>
<body>
<jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="${contextPath }/default.html"> 首页 </a>-<a href="${contextPath }/assetManage/index.jsp">资产管理</a> - <%=navName %>集合产品</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft">
	 	<jsp:include page="${contextPath }/assetManage/assetInfo_index_lmenu.jsp">
		    <jsp:param name="nav" value="<%=nav %>" />
		    <jsp:param name="nav2" value="<%=assetProd %>" />
			<jsp:param name="assetProd" value="<%=assetProd %>" />
		</jsp:include>
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w706 fright">
  		<jsp:include  page="/assetManage/assetManageTop.jsp">
  		    <jsp:param name="nav" value="<%=nav %>" />
			<jsp:param name="assetProd" value="<%=assetProd %>" />
			<jsp:param name="productCode" value="<%=productCode %>" />
		</jsp:include>
		<%if(productCode==null || "".equals(productCode)){ 
			if(assetProd!=null && assetProd.equals("28")){
			//睿利债券1号，分级净值查询
		%>
		 	<iframe width="100%"  src="${contextPath }/prod/productAction.do?method=getProductNetValuetList_rlfj1" frameborder="0" scrolling="no"" marginheight="0" marginwidth="0" id="qzz" name="qzz" onload="frameFitSelfHeight('qzz')"></iframe>		
 		<%  }else{
			//非分级公共集合产品净值查询 		
 		%>
 			<iframe width="100%"  src="${contextPath }/prod/productAction.do?method=getProductNetValuetList&assetProd=<%=assetProd %>" frameborder="0" scrolling="no"" marginheight="0" marginwidth="0" id="qzz" name="qzz" onload="frameFitSelfHeight('qzz')"></iframe>
 		<%  }
 		}else{ %>
 			<%if(type.equals("f")){ %>
 				<iframe width="100%"  src="${contextPath }/prod/productAction.do?method=getProductNetValuetList_gkgg_f" frameborder="0" scrolling="no"" marginheight="0" marginwidth="0" id="qzz" name="qzz" onload="frameFitSelfHeight('qzz')"></iframe>		
 			<%} %>
 			<%if(type.equals("s")){ %>
 				<iframe width="100%"  src="${contextPath }/prod/productAction.do?method=getProductNetValuetList_gkgg_s" frameborder="0" scrolling="no"" marginheight="0" marginwidth="0" id="qzz" name="qzz" onload="frameFitSelfHeight('qzz')"></iframe>		
 			<%} %>
 		<%} %>
  </div>
  <!--右侧sied结束--> 
<div class="clearfloat"></div>
</div>  <div class="blank5"></div><!--清除浮动--> 
<jsp:include page="/commons/msbottom.jsp" />
</body>
</html>