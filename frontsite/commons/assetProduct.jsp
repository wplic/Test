<%@ page contentType="text/html; charset=utf-8" language="java" %>
<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
<jsp:directive.page import="java.util.List"/>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page	import="java.text.SimpleDateFormat"%>
<%@page	import="java.util.Date"%>
<%@page	import="com.cssweb.business.product.service.ProductNetValueService"%>
<%@page	import="com.cssweb.business.product.pojo.ProductNetValue"%>
<jsp:directive.page import="com.cssweb.business.product.pojo.Product"/>
<jsp:directive.page import="com.cssweb.business.product.service.ProductService"/>
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<%
    ServletContext st = this.getServletConfig().getServletContext();
	ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
	ProductService productService=(ProductService)ctx.getBean("productService");
	ProductNetValueService productNetValueService = (ProductNetValueService)ctx.getBean("productNetValueService");
	Map map=new HashMap();
	map.put("sortName", "product_id");
    map.put("dir", "asc");
    map.put("productValidate",0);
    List prodbList = productService.getProductsList(map,0,100);
	
	//ȡʱ��  ȡ���µĲ�Ʒֵ���������
	 Date preDate=productNetValueService.getMaxProductNetValue();
	 SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd"); 
	 
 %>
         <div class="ritagt1">
    	  <table width="93%" align="center">
    	    <tr>
              <td width="3"></td>
    	      <td class="font12">产品名称</td>
    	      <td class="font12">产品净值</td>
    	      <td class="font12">累积净值</td>
  	      </tr>
  	    </table>
   	</div>
     <div class="ritagm1">
          <table width="100%" class="lh25">
          <%
          if(prodbList!=null && prodbList.size()>0){
		    for(int i=0;i<prodbList.size();i++){
			Product product=(Product)prodbList.get(i);
			double dwjz=0.0;
			double ljjz=0.0;
			if(preDate!=null)
			{
			  ProductNetValue productNetValue=productNetValueService.getNetValuesByCodeAndDate(product.getProductCode(),preDate);
			  if(productNetValue!=null)
			  {
				  dwjz=productNetValue.getProductNetValue();
				  ljjz=productNetValue.getCumulateNetValue();
			  }
			}
			%>
			 <tr>
              <td>
              <a href="${contextPath}/assetManage/lc2hInfo.jsp?whichCat=cpzx_jhlc_cpjj&assetProd=<%=product.getProductId() %>">
              <%=product.getProductName() %></a></td>
              <td><%=dwjz %></td>
              <td><%=ljjz %></td>
            </tr>
			<%
		   }
	     }
           %>
          </table>
          <p align="right"><a href="${contextPath}/assetManage/gatherFinancing.html"><img src="pic/msindex/more.gif"/></a></p>
	</div>
      <div class="ritagb1"></div>