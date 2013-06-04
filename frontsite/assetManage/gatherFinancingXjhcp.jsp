<%@ page contentType="text/html; charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<jsp:directive.page import="java.util.List"/>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page	import="java.text.SimpleDateFormat"%>
<%@page	import="java.util.Date"%>
<%@page	import="com.cssweb.common.dictionary.service.DictionaryService"%>
<%@page	import="com.cssweb.common.dictionary.pojo.Dictionary"%>
<jsp:directive.page import="com.cssweb.business.product.pojo.Product"/>
<jsp:directive.page import="com.cssweb.business.product.service.ProductService"/>
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<jsp:directive.page import="org.apache.commons.lang.StringUtils"/>
<%
    ServletContext st = this.getServletConfig().getServletContext();
	ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
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
    
    List prodbList = productService.getProductsList(map,0,100);	
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
<div class="wrap_3c">
  <!--左侧sied开始-->
  <div class="w210 fleft">
	 <jsp:include page="${contextPath }/assetManage/assetInfo_index_lmenu.jsp?nav=xjhcp&nav1=14" />
     
  </div>
  <!--左侧sied结束-->
   
  <!--中侧sied开始-->
  <div class="w492 fleft" style="overflow:hidden; margin-left:4px;">
  <div class="comtit1">
    <h4>小集合产品</h4>
  </div>
  <%
          if(prodbList!=null && prodbList.size()>0){
		    for(int i=0;i<prodbList.size();i++){
			Product product=(Product)prodbList.get(i);
			if(product.getProductCode().indexOf("872")==0 || 
					product.getProductCode().equals("870011") ||
					product.getProductCode().equals("879001")){
			%>
			<div class="blank10"></div>		
    <table width="100%" align="center">
      <tr>
        <td style="background:url(/pic/assetManage/jhlctit1.jpg) no-repeat; width:83px; height:29px; line-height:29px; text-align:center; font-size:12px; color:#ffffff" ><%=product.getProductName() %></td>
        <td class="jhlctit2 ">
        <a href="${contextPath}/assetManage/lc2hInfo.jsp?whichCat=cpzx_jhlc_cpjj&nav=xjhcp&assetProd=<%=product.getProductId() %>">产品简介</a><span class="font_8c">|</span>
        <a href="${contextPath}/assetManage/lc2hIncome.jsp?whichCat=syl&nav=xjhcp&assetProd=<%=product.getProductId() %>">集合净值</a><span class="font_8c">|</span>
        <a href="${contextPath}/assetManage/lc2hAffiche.jsp?whichCat=cpzx_jhlc_cpgg&nav=xjhcp&assetProd=<%=product.getProductId() %>">产品公告</a><span class="font_8c">|</span> 
        <a href="${contextPath}/assetManage/lc2hAffiche.jsp?whichCat=cpzx_jhlc_flwj&nav=xjhcp&assetProd=<%=product.getProductId() %>">法律文件</a><span class="font_8c">|</span>
        <a href="${contextPath}/assetManage/lc2hAffiche.jsp?whichCat=cpzx_jhlc_fhxx&nav=xjhcp&assetProd=<%=product.getProductId() %>">分红信息</a><span class="font_8c">|</span>
        <a href="${contextPath}/assetManage/lc2hAffiche.jsp?whichCat=cpzx_jhlc_jyzn&nav=xjhcp&assetProd=<%=product.getProductId() %>">交易指南</a><span class="font_8c">|</span>
        <a href="${contextPath}/assetManage/lc2hAffiche.jsp?whichCat=cpzx_jhlc_djxz&nav=xjhcp&assetProd=<%=product.getProductId() %>">单据下载</a><span class="font_8c"></span>
         
        <td class="jhlctit3">&nbsp;</td>
      </tr>
    </table>
    <div class="blank5"></div>
    <table width="98%" align="center">
      <tr>
        <td align="left" width="60%"><img src="/pic/assetManage/lc<%=i+3 %>h.jpg" /></td>
        <td width="5%"></td>
        <td class="lh24" align="left">
        <%=product.getProductDesc()  %>
        </td>
      </tr>
    </table>
			<%}
			}
		}
		%>
  </div>
  <!--中侧sied结束--> 
    <!--右侧sied开始-->
  <div class="w210 fright" style="vertical-align:top">
  <script type="text/javascript" src="${contextPath }/js/jsIfUtils.js"></script>
	<iframe target="_blank" id="leftlogin" name="leftlogin"  marginWidth="0" marginHeight="0" src="${contextPath }/commons/loginTemp.jsp"
						frameBorder="0" noresize width="100%" scrolling="no"></iframe>
	<jsp:include page="${contextPath}/assetManage/mmts.jsp" />
    <div class=" blank5"></div>
    <jsp:include page="lc3h.jsp" />    
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
    <div class="blank5"></div>
<jsp:include page="/commons/msbottom.jsp" />
</body>
</html>