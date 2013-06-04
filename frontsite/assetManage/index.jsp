<%@ page contentType="text/html; charset=utf-8" language="java"%>
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<jsp:directive.page import="com.cssweb.assetManager.service.AssetManagerService"/>
<jsp:directive.page import="com.cssweb.assetManager.pojo.AssetManager"/>
<jsp:directive.page import="com.cssweb.business.product.service.ProductService"/>
<%@page	import="com.cssweb.common.dictionary.service.DictionaryService"%>
<%@page	import="com.cssweb.common.dictionary.pojo.Dictionary"%>
<jsp:directive.page import="com.cssweb.business.product.pojo.Product"/>
<jsp:directive.page import="java.util.*"/>
<%@page import="com.css.cms.document.model.DocumentFrontListProvider"%>
<%@ include file="/commons/taglibs.jsp"%>
<%
	ServletContext st = this.getServletConfig().getServletContext();
	ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
	AssetManagerService assetManagerService = (AssetManagerService) ctx.getBean("assetManagerService");
	List managerlist =	assetManagerService.getNumAssetManager("0",100);
	
	//引入集合产品
	ProductService productService=(ProductService)ctx.getBean("productService");
	DictionaryService dictionaryService = (DictionaryService)ctx.getBean("dictionaryService");
	Map map=new HashMap();
	map.put("sortName", "product_id");
    map.put("dir", "asc");
    map.put("productValidate",0);
    //根据字典表来取集合理财的产品
    Dictionary dictionary = dictionaryService.getDictionaryByKeyCode("zcgl_cplb_jglc");
    if(dictionary!=null)
    map.put("productCat",dictionary.getId() );
    map.put("sortName","productName");
    
    List prodbList = productService.getProductsList(map,0,100);	
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${ctx}/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/csswebutf1.js"></script>
<!-- 下面cs用于为最下面的图片转换提供样式   -->
<style >
	#productInfoList{float:left;width:366px;overflow:hidden;}
	#productInfoList ul{width:2000px;}
	#productInfoList li{width:99px;float:left;padding:5px 11px 0 12px;}
	
	
	#productInfo {text-align: center;padding-left: 50px;}
	
	.leftrun{float:left;padding-top:30px;}
	.rightrun{float:left;padding-top:30px;}
</style>
</head>
<body>
<jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：
  	<a href="${ctx}/default.html"> 首页 </a>-
 	<a href="${ctx}/assetManage/index.jsp">资产管理</a>
 	<jsp:include page="/assetManage/zcgl_pmd.jsp">
				            <jsp:param name="catName" value="公告信息" />
				            <jsp:param name="whichCat" value="lmgg"/>
				            <jsp:param name="state" value="1"/>
				            <jsp:param name="showSize" value="3"/>
				    	</jsp:include>
			
  </div>
</div>
<div class="wrap_3c">
  <!--左侧sied开始-->
  <div class="w210 fleft">
	 <div class="blank5"></div>
	 <jsp:include page="/assetManage/assetInfo_index_lmenu.jsp" />	 
  </div>
  <!--左侧sied结束-->
   
  <!--中侧sied开始-->
  <div class="w492 fleft mlr4">
  		
    <table width="100%" align="center">
      <tr>
        <td class="ywfw_l">&nbsp;</td>
        <td class="ywfw_m bold"><span class="fright font_normal red"><a href="${ctx}/assetManage/mtbd.jsp">更多</a></span>动态信息</td>
        <td class="ywfw_r">&nbsp;</td>
      </tr>
    </table>
    <div class="blank10"></div>
     <jsp:include page="/assetManage/newsAssetList.jsp">
           <jsp:param name="catName" value="动态信息" />
           <jsp:param name="whichCat" value="mtpd"/>
           <jsp:param name="state" value="1"/>
           <jsp:param name="selectSize" value="1"/>
           <jsp:param name="showSize" value="4"/>
   	</jsp:include>
   	
   	<div class="blank10"></div>
   	
   	<!-- 最新公告  -->
	<table width="100%" align="center" class="mt5">
      <tr>
        <td class="ywfw_l">&nbsp;</td>
        <td class="ywfw_m bold"><span class="fright font_normal red"><a href="/assetManage/gatherFinancing.jsp">更多</a></span>产品公告</td>
        <td class="ywfw_r">&nbsp;</td>
      </tr>
    </table>
    <div class="blank10"></div>
    <jsp:include page="/assetManage/newIncludeForProdAll.jsp">
           <jsp:param name="whichCat" value="cpzx_jhlc_cpgg"/>
           <jsp:param name="state" value="1"/>
           <jsp:param name="selectSize" value="1"/>
           <jsp:param name="showSize" value="4"/>
   	</jsp:include>
   	
   	<!-- 2013-02-25 取消资产管理首页部门公告
   	<div class="blank10"></div>
   	<table width="100%" align="center">
      <tr>
        <td class="ywfw_l">&nbsp;</td>
        <td class="ywfw_m bold"><span class="fright font_normal red"><a href="${ctx}/assetManage/bmgg.jsp">更多</a></span>部门公告</td>
        <td class="ywfw_r">&nbsp;</td>
      </tr>
    </table>
    <div class="blank10"></div>
     <jsp:include page="/assetManage/newsAssetList.jsp">
           <jsp:param name="catName" value="部门公告" />
           <jsp:param name="whichCat" value="zcgl_bmgg"/>
           <jsp:param name="state" value="1"/>
           <jsp:param name="selectSize" value="1"/>
           <jsp:param name="showSize" value="4"/>
   	</jsp:include> -->
    <div class="blank10"></div>
    <!-- 理财资讯 -->
	<table width="100%" align="center" class="mt5">
      <tr>
        <td class="ywfw_l">&nbsp;</td>
        <td class="ywfw_m bold"><span class="fright font_normal red"><a href="/assetManage/lczx.jsp">更多</a></span>理财资讯</td>
        <td class="ywfw_r">&nbsp;</td>
      </tr>
    </table>
    <div class="blank10"></div>
    <jsp:include page="/assetManage/newAssetlist_lczx.jsp">
           <jsp:param name="whichCat" value="lczx"/>
           <jsp:param name="state" value="1"/>
           <jsp:param name="selectSize" value="1"/>
           <jsp:param name="showSize" value="55"/>
   	</jsp:include>
   	<jsp:include page="/assetManage/newAssetlist_lczx.jsp">
           <jsp:param name="whichCat" value="yjzt"/>
           <jsp:param name="state" value="1"/>
           <jsp:param name="selectSize" value="1"/>
           <jsp:param name="showSize" value="55"/>
   	</jsp:include>
    <!-- 明星经理  -->
    <div class="blank10"></div>
	<table width="100%" align="center" class="mt5">
      <tr>
        <td class="ywfw_l">&nbsp;</td>
        <td class="ywfw_m bold"><span class="fright font_normal red"><a href="/assetManage/gatherFinancing.html">更多</a></span>产品资讯</td>
        <td class="ywfw_r">&nbsp;</td>
      </tr>
    </table>
	<div class="blank5"></div>
	<!-- 下面为滚动显示产品图片    -->
	<div  id="productInfo" >
	<div class="leftrun"><a id="leftwing2" href="###"><img  src="/pic/assetManage/leftico1.gif" /></a></div>
	<div id="productInfoList">
      <ul >
      	<%
	      	if(prodbList!=null && prodbList.size()>0){
				for(int i=2;i<prodbList.size();i++){
					Product product=(Product)prodbList.get(i);
					%>
					
					<li>
						<%if(product.getProductCode().equals("873001")) { %>
							<a href="/assetManage/lc2hInfo_yqsy.jsp?whichCat=cpzx_jhlc_cpjj&nav=xjhcp&assetProd=<%=product.getProductId() %>"><img src="/pic/assetManage/lc<%=product.getProductCode() %>.jpg"  width="84" height="84"/><p class="lh25"><%=product.getProductName() %></p></a>
			  	 		<%} else if(product.getProductCode().equals("878001")||product.getProductCode().equals("878002")||product.getProductCode().equals("878003")) {%>
			  	 			<a href="/assetManage/lc2hInfo.jsp?whichCat=cpzx_jhlc_cpjj&nav=xjhcp&productCode=<%=product.getProductCode() %>&assetProd=<%=product.getProductId() %>"><img src="/pic/assetManage/lc<%=product.getProductCode() %>.jpg"  width="84" height="84"/><p class="lh25"><%=product.getProductName() %></p></a>
			  	 		<%}else{ %>
			  	 			<a href="/assetManage/lc2hInfo.jsp?whichCat=cpzx_jhlc_cpjj&nav=xjhcp&assetProd=<%=product.getProductId() %>"><img src="/pic/assetManage/lc<%=product.getProductCode() %>.jpg"  width="84" height="84"/><p class="lh25"><%=product.getProductName() %></p></a>
			  	 		<%} %>
					</li>
		<%
				}
				for(int i=0;i<2;i++){
					Product product=(Product)prodbList.get(i);
				%>
					<li>
						<%if(product.getProductCode().equals("873001")) { %>
							<a href="/assetManage/lc2hInfo_yqsy.jsp?whichCat=cpzx_jhlc_cpjj&nav=xjhcp&assetProd=<%=product.getProductId() %>"><img src="/pic/assetManage/lc<%=product.getProductCode() %>.jpg"  width="84" height="84"/><p class="lh25"><%=product.getProductName() %></p></a>
			  	 		<%} else if(product.getProductCode().equals("878001")||product.getProductCode().equals("878002")||product.getProductCode().equals("878003")) {%>
			  	 			<a href="/assetManage/lc2hInfo.jsp?whichCat=cpzx_jhlc_cpjj&nav=xjhcp&productCode=<%=product.getProductCode() %>&assetProd=<%=product.getProductId() %>"><img src="/pic/assetManage/lc<%=product.getProductCode() %>.jpg"  width="84" height="84"/><p class="lh25"><%=product.getProductName() %></p></a>
			  	 		<%}else{ %>
			  	 			<a href="/assetManage/lc2hInfo.jsp?whichCat=cpzx_jhlc_cpjj&nav=xjhcp&assetProd=<%=product.getProductId() %>"><img src="/pic/assetManage/lc<%=product.getProductCode() %>.jpg"  width="84" height="84"/><p class="lh25"><%=product.getProductName() %></p></a>
			  	 		<%} %>
					</li>
				<%
				}
			}
		%>
      	
      </ul>
	</div>
	<div class="rightrun"><a id="rightwnimg2" href="###"><img  src="/pic/assetManage/rightico1.gif" /></a></div>
    <script type="text/javascript">
		Effect.HtmlMove("productInfoList","ul/li","scrollLeft",5,"leftwing2","rightwnimg2",5000,1);
	</script>
    </div>
  </div>
  <!--中侧sied结束--> 
    <!--右侧sied开始-->
  <div class="w210 fright" style="vertical-align:top">
	<script type="text/javascript" src="${ctx}/js/jsIfUtils.js"></script>
	<iframe target="_blank" id="leftlogin" name="leftlogin"  marginWidth="0" marginHeight="0" src="${ctx}/commons/loginTemp.jsp"
						frameBorder="0" noresize width="100%" scrolling="no"></iframe>
	<jsp:include page="${ctx}/assetManage/mmts.jsp" />
    <div class="blank5"></div>
	 <jsp:include page="lc3h.jsp" />
  
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
    <div class="blank5"></div>
<jsp:include page="/commons/msbottom.jsp" />
</body>
</html>