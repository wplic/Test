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
<link href="${ctx}/css/assetManage/assetManage.css" rel="stylesheet" type="text/css" />
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
 	<a href="${ctx}/assetManage/index.jsp">资产管理 </a> - 安心之旅
 	<jsp:include page="/assetManage/zcgl_pmd.jsp">
				            <jsp:param name="catName" value="公告信息" />
				            <jsp:param name="whichCat" value="lmgg"/>
				            <jsp:param name="state" value="1"/>
				            <jsp:param name="showSize" value="3"/>
				    	</jsp:include>
			<!--   &nbsp;&nbsp;<a href="${ctx}/assetManage/zcgl_lmgg.jsp">更多...</a> -->
  </div>
</div>
<div class="wrap_3c wrap_3c_newBG">
  <!--左侧sied开始-->
  <div class="w210 fleft">
	 <div class="blank5"></div>
	 <jsp:include page="/assetManage/assetInfo_index_lmenu.jsp" />
	 
  </div>
  <!--左侧sied结束-->
   
  <!--中侧sied开始-->
			<div class="mainCont fleft">
				<div class="axzlbanner">
					<img src="../pic/assetManage/axzl_banner.jpg" />
				</div>
				<div class="axzlIntro">
					<p>
						在过去的一年里，证券市场行情跌宕起伏，西方主要经济体广泛遭遇债务危机，中国经济和政策备受外围经济小衰退周期和内部经济小滞涨周期的双重困绕，股票证券市场则走了一个与2004年和2008年堪比的单边下跌行情，无论是机构投资者还是个人投资者投资业绩遭遇滑铁卢。在这样的市场背景下，您是否感到迷惑？怎样进行投资研究？价值投资的意义何在？广发证券资产管理部邀您一起走进上市公司，见证上市公司的生产流程、经营状况、战略布局，了解广发理财的投资理念、投资研究体系、选股的研究流程，亲身实践价值投资！
					</p>
				</div>
				<div class="twoStep">
					<div class="firstStep">
						<div class="imageLink">
							<a href="${contextPath }/about/theme.jsp?themeid=12"
								title="安心之旅—走进上市公司.广州"></a>
						</div>
						<p>
							广发金管家理财安心之旅――走进上市公司“系列活动近日正式启动，活动希望增加投资者对上市公司和广发证券资产管理业务运作的了解，亲身实践价值发现，做明明白白的投资人。
							<a href="${contextPath }/about/theme.jsp?themeid=12"
								title="安心之旅—走进上市公司.广州">>>详细</a>
						</P>
					</div>
					<div class="secondStep">
						<div class="imageLink">
							<a href="${contextPath }/about/theme.jsp?themeid=13"
								title="安心之旅—走进上市公司.上海"></a>
						</div>
						<p>
							据记者了解，广发证券资产管理业务去年获得较大发展，集合理财产品数量由2只增加到6只，托管资产规模近90亿元。不断膨胀的客户队伍让广发证券资产管理部更重视客户的服务体验。
							<a href="${contextPath }/about/theme.jsp?themeid=13"
								title="安心之旅—走进上市公司.上海">>>详细</a>
						</p>
					</div>
					<div class="thirdStep">
						<div class="imageLink">
							<a href="${contextPath }/about/theme.jsp?themeid=14"
								title="安心之旅—走进上市公司.獐子岛"></a>
						</div>
						<p>
							证券市场行情跌宕起伏，西方主要经济体广泛遭遇债务危机，中国经济和政策备受外围经济小衰退周期和内部经济小滞涨周期的双重困绕，无论是机构投资者还是个人投资者投资业绩遭遇
							.....
							<a href="${contextPath }/about/theme.jsp?themeid=14"
								title="安心之旅—走进上市公司.獐子岛">>>详细</a>
						</P>
					</div>
					<div class="forthStep">
						<div class="imageLink">
							<a href="${contextPath }/about/theme.jsp?themeid=15"
								title="安心之旅—走进上市公司.南京"></a>
						</div>
						<p>
							活动内容由资产管理部的投资研究人员及上市公司高管人员带领，详细了解上市公司的生产流程、经营状况、战略布局等方面，向投资人讲述了投资理念、投资研究体系、选股的研究流程等等
							<a href="${contextPath }/about/theme.jsp?themeid=15"
								title="安心之旅—走进上市公司.南京">>>详细</a>
						</P>
					</div>
					<div class="fiveStep">
						<div class="imageLink">
							<a href="${contextPath }/about/theme.jsp?themeid=16"
								title="安心之旅—走进上市公司.南京"></a>
						</div>
						<p>
							在过去的一年里，证券市场行情跌宕起伏，西方主要经济体广泛遭遇债务危机，中国经济和政策备受外围经济小衰退周期和内部经济小滞涨周期的双重困绕股票证券市场则走了一个与2004
							.....
							<a href="${contextPath }/about/theme.jsp?themeid=16"
								title="安心之旅—走进上市公司.南京">>>详细</a>
						</P>
					</div>
				</div>
			</div>
			<!--中侧sied结束--> 
    
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
    <div class="blank5"></div>
<jsp:include page="/commons/msbottom.jsp" />
</body>
</html>