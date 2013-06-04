<%@ page contentType="text/html; charset=utf-8" language="java" %>
<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
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
    String assetProd = request.getParameter("assetProd");
		if(StringUtils.isEmpty(assetProd)){
			assetProd = "2";
		}
		String whichCat="cpzx_jhlc_cpjj";
		if(request.getParameter("whichCat")!=null&&!request.getParameter("whichCat").equals(""))
		{
		 whichCat=request.getParameter("whichCat").trim();
		}
		String nav2 = "";
		if(request.getParameter("nav2")!=null&&!request.getParameter("nav2").equals(""))
		{
		 nav2=request.getParameter("nav2").trim();
		}	
 %>
<p><img src="/pic/about/siedban1.jpg" /></p>
<div class="sidemenu">
  		<table>
  		<%
          if(prodbList!=null && prodbList.size()>0){
		    for(int i=0;i<prodbList.size();i++){
			Product product=(Product)prodbList.get(i);
			%>
		   <tr>
             <td <%=nav2.equals(String.valueOf(product.getProductId()))?"class='active sideblue'":"class='link sideblue'" %>><a href="${contextPath}/assetManage/lc2hInfo.jsp?whichCat=cpzx_jhlc_cpjj&assetProd=<%=product.getProductId() %>"><%=product.getProductName() %></a></td>
           </tr> 
			<%
			}
		}
		%>
        
        </table>

  </div>
<div class="blank5"></div>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td><a href="${contextPath }/assetManage/clientService.jsp"><img src="/pic/assetManage/sideban1.jpg" /></a></td>
      </tr>
      <tr>
        <td height="5"></td>
      </tr>
      <tr>
        <td><a href="${contextPath }/assetManage/survey.jsp"><img src="${contextPath }/pic/assetManage/sideban3.jpg" /></a></td>
      </tr>
      <tr>
        <td height="5"></td>
      </tr>
    </table>

