<%@ page contentType="text/html; charset=utf-8" language="java"%>
<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
<jsp:directive.page import="java.util.List"/>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page	import="java.text.SimpleDateFormat"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@page	import="java.util.Date"%>
<jsp:directive.page import="org.apache.commons.lang.StringUtils"/>
<%@page	import="com.cssweb.common.dictionary.service.DictionaryService"%>
<%@page	import="com.cssweb.common.dictionary.pojo.Dictionary"%>
<jsp:directive.page import="com.cssweb.business.product.pojo.Product"/>
<jsp:directive.page import="com.cssweb.business.product.service.ProductService"/>
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<%
    ServletContext st = this.getServletConfig().getServletContext();
	ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
	ProductService productService=(ProductService)ctx.getBean("productService");
	DictionaryService dictionaryService = (DictionaryService)ctx.getBean("dictionaryService");
	Map map=new HashMap();
	map.put("sortName", "PRODUCT_CODE");
    map.put("dir", "asc");
    map.put("productValidate",0);
    //根据字典表来取集合理财的产品
    Dictionary dictionary = dictionaryService.getDictionaryByKeyCode("zcgl_cplb_jglc");
    if(dictionary!=null)
    map.put("productCat",dictionary.getId() );
    List prodbList = productService.getProductsList(map,0,100);
    Map mapProd=new HashMap();
	 if(prodbList!=null && prodbList.size()>0){
		    for(int i=0;i<prodbList.size();i++){
			   Product product=(Product)prodbList.get(i);
		       mapProd.put(product.getProductId(),product.getProductName() );
			}
	}
	
	String assetProd = request.getParameter("assetProd");
		if(StringUtils.isEmpty(assetProd)){
			assetProd = "2";
		}
		String whichCat="cpzx_jhlc_cpjj";
		if(request.getParameter("whichCat")!=null&&!request.getParameter("whichCat").equals(""))
		{
		 whichCat=request.getParameter("whichCat").trim();
		}
		String nav = request.getParameter("nav");
		if (nav == null || nav.length() < 1)
			nav = "jhcp";
 %>

<div class="comtit1"><h4><%=mapProd.get(Long.parseLong(assetProd) ) %></h4>
  		</div>
    <div class="blank10"></div>
    <table width="100%" align="center">
      <tr>
        <td class="jhlctit1"><%=mapProd.get(Long.parseLong(assetProd) ) %></td>
        <td class="jhlctit2 "><a href="${contextPath}/assetManage/lc2hInfo_yqsy.jsp?whichCat=cpzx_jhlc_cpjj&nav=<%=nav %>&assetProd=<%=assetProd %>" <%="cpzx_jhlc_cpjj".equals(whichCat)?"class='red'":"" %>>产品简介</a>
        <span class="font_8c"> |&nbsp; </span>
        <a href="${contextPath}/assetManage/lc2hIncome_yqsy.jsp?whichCat=syl&nav=<%=nav %>&assetProd=<%=assetProd %>" <%="syl".equals(whichCat)?"class='red'":"" %>>预期收益</a> <span class="font_8c">| &nbsp;</span>
        <a href="${contextPath}/assetManage/lc2hAffiche_yqsy.jsp?whichCat=cpzx_jhlc_cpgg&nav=<%=nav %>&assetProd=<%=assetProd %>" <%="cpzx_jhlc_cpgg".equals(whichCat)?"class='red'":"" %>>产品公告</a><span class="font_8c"> |&nbsp;</span>
        <a href="${contextPath}/assetManage/lc2hAffiche_yqsy.jsp?whichCat=cpzx_jhlc_flwj&nav=<%=nav %>&assetProd=<%=assetProd %>" <%="cpzx_jhlc_flwj".equals(whichCat)?"class='red'":"" %>>法律文件</a><span class="font_8c"> |&nbsp;</span> 
        <a href="${contextPath}/assetManage/lc2hAffiche_yqsy.jsp?whichCat=cpzx_jhlc_fhxx&nav=<%=nav %>&assetProd=<%=assetProd %>" <%="cpzx_jhlc_fhxx".equals(whichCat)?"class='red'":"" %>>分红信息</a><span class="font_8c"> |&nbsp;</span> 
        <a href="${contextPath}/assetManage/lc2hAffiche_yqsy.jsp?whichCat=cpzx_jhlc_jyzn&nav=<%=nav %>&assetProd=<%=assetProd %>" <%="cpzx_jhlc_jyzn".equals(whichCat)?"class='red'":"" %>>交易指南</a><span class="font_8c"> |&nbsp;</span> 
        <a href="${contextPath}/assetManage/lc2hAffiche_yqsy.jsp?whichCat=cpzx_jhlc_djxz&nav=<%=nav %>&assetProd=<%=assetProd %>" <%="cpzx_jhlc_djxz".equals(whichCat)?"class='red'":"" %>>单据下载</a><span class="font_8c"> |&nbsp;</span>  
        
        <td class="jhlctit3">&nbsp;</td>
      </tr>
    </table>






