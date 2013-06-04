<%@ page contentType="text/html; charset=utf-8" language="java"%>
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
	
	//取时间  取最新的产品值的最后日期
	 Date preDate=productNetValueService.getMaxProductNetValue();
	 SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd"); 
	 
 %>
<div class="rtit1"><span class="fright font_normal red mr5"></span>广发理财产品</div>
 	 <div class="bg_ff ptb6 ribor3">
 	   <table width="98%" class="fcenter lh25 textcenter">
 	     <tr class="xuxian">
 	       <td bgcolor="#f2f2f2">集合产品名称</td> 	 	   
 	       <td bgcolor="#f2f2f2">单位净值</td>
 	       <td bgcolor="#f2f2f2">累计净值</td>
         </tr>
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
			if(product.getProductName().equals("广发理财3号")){
			%>
 	     <tr class="xuxian">
 	       <td><a href="${contextPath}/assetManage/lc2hIncome.jsp?whichCat=syl&assetProd=<%=product.getProductId()%>"><%=product.getProductName() %></a></td>
 	       <td><%=dwjz %></td>
 	       <td><%=ljjz %></td>
         </tr>
			<%
			}
			else if(product.getProductName().equals("广发理财4号")){
			%>
 	     <tr class="xuxian">
 	       <td><a href="${contextPath}/assetManage/lc2hIncome.jsp?whichCat=syl&assetProd=<%=product.getProductId()%>"><%=product.getProductName() %></a></td>
 	       <td><%=dwjz %></td>
 	       <td><%=ljjz %></td>
         </tr>
         <%
			}
			else if(product.getProductName().equals("广发理财5号")){
			%>
 	     <tr class="xuxian">
 	       <td><a href="${contextPath}/assetManage/lc2hIncome.jsp?whichCat=syl&assetProd=<%=product.getProductId()%>"><%=product.getProductName() %></a></td>
 	       <td><%=dwjz %></td>
 	       <td><%=ljjz %></td>
         </tr>
         <%
			}
			else if(product.getProductName().equals("广发理财6号")){
			%>
 	     <tr class="xuxian">
 	       <td><a href="${contextPath}/assetManage/lc2hIncome.jsp?whichCat=syl&assetProd=<%=product.getProductId()%>"><%=product.getProductName() %></a></td>
 	       <td><%=dwjz %></td>
 	       <td><%=ljjz %></td>
         </tr>
         <%
			}
         }
	     }
           %>
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
			if(product.getProductName().equals("广发策略1号 ")){
			%>
 	     <tr class="xuxian">
 	       <td><a href="${contextPath}/assetManage/lc2hIncome.jsp?whichCat=syl&assetProd=<%=product.getProductId()%>"><%=product.getProductName() %></a></td>
 	       <td><%=dwjz %></td>
 	       <td><%=ljjz %></td>
         </tr>
			<%
			}
			else if(product.getProductName().equals("广发策略2号")){
			%>
 	     <tr class="xuxian">
 	       <td><a href="${contextPath}/assetManage/lc2hIncome.jsp?whichCat=syl&assetProd=<%=product.getProductId()%>"><%=product.getProductName() %></a></td>
 	       <td><%=dwjz %></td>
 	       <td><%=ljjz %></td>
         </tr>
         <%
			}
			else if(product.getProductName().equals("广发弘利债券")){
			%>
 	     <tr class="xuxian">
 	       <td><a href="${contextPath}/assetManage/lc2hIncome.jsp?whichCat=syl&attm=1&assetProd=<%=product.getProductId()%>">广发弘利债券</a></td>
 	       <td><%=dwjz %></td>
 	       <td><%=ljjz %></td>
         </tr>
         <%
			}
			else if(product.getProductName().equals("广发量化避险")){
				%>
	 	     <tr class="xuxian">
	 	       <td><a href="${contextPath}/assetManage/lc2hIncome.jsp?whichCat=syl&attm=1&assetProd=<%=product.getProductId()%>">广发量化避险</a></td>
	 	       <td><%=dwjz %></td>
	 	       <td><%=ljjz %></td>
	         </tr>
	         <%
				}
			else if(product.getProductName().equals("广发弘利债券")){
				%>
	 	     <tr class="xuxian">
	 	       <td><a href="${contextPath}/assetManage/lc2hIncome.jsp?whichCat=syl&attm=1&assetProd=<%=product.getProductId()%>">广发弘利债券</a></td>
	 	       <td><%=dwjz %></td>
	 	       <td><%=ljjz %></td>
	         </tr>
	         <%
				}
         }
	     }
           %>
       </table>
    </div>
	<div class="blank5"></div>
<div class="rtit1"><span class="fright font_normal red mr5"></span>理财产品开放日查询</div>
 	 <div class="bg_ff ptb6 ribor3">
 	   <table width="98%" class="fcenter lh25 textcenter">
 	     <tr class="xuxian">
 	       <td bgcolor="#f2f2f2" colspan="3">
 	       	<jsp:include page="productOpenDayCalendar.jsp"></jsp:include>
 	       </td>
         </tr>
       </table>
    </div>
