<%@ page contentType="text/html; charset=utf-8" language="java"%>
<link href="${contextPath}/css/style.css" rel="stylesheet"
	type="text/css" />
<jsp:directive.page import="java.util.List" />
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page
	import="com.cssweb.business.product.service.ProductNetValueService"%>
<%@page import="com.cssweb.business.product.pojo.ProductNetValue"%>
<jsp:directive.page import="com.cssweb.business.product.pojo.Product" />
<jsp:directive.page
	import="com.cssweb.business.product.service.ProductService" />
<jsp:directive.page
	import="org.springframework.context.ApplicationContext" />
<jsp:directive.page
	import="org.springframework.web.context.support.WebApplicationContextUtils" />
<%
	ServletContext st = this.getServletConfig().getServletContext();
	ApplicationContext ctx = WebApplicationContextUtils
			.getRequiredWebApplicationContext(st);
	ProductService productService = (ProductService) ctx
			.getBean("productService");
	ProductNetValueService productNetValueService = (ProductNetValueService) ctx
			.getBean("productNetValueService");
	Map map = new HashMap();
	map.put("sortName", "PRODUCT_NAME");
	map.put("dir", "asc");
	map.put("productValidate", 0);
	List prodbList = productService.getProductsList(map, 0, 100);

	Date preDate = productNetValueService.getMaxProductNetValue();
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
%>
<div class="cont hover">
	<table>
		<thead>
			<th class="tb1">
				产品名称
			</th>
			<th class="tb2">
				单位净值
			</th>
			<th class="tb3">
				累计净值
			</th>
		</thead>

	</table>
				<img style="display: none;" id="leftwing2" src="${contextPath}/images/up_image.gif"></img>
	<div id="productInfoList">
	<ul width="100%" class="lh25 xuxian">
		<%
			if (prodbList != null && prodbList.size() > 0) {
				for (int i = 2; i < prodbList.size(); i++) {
					Product product = (Product) prodbList.get(i);
					double dwjz = 0.0;
					double ljjz = 0.0;
					if (preDate != null) {
						ProductNetValue productNetValue = productNetValueService
								.getNetValuesByCodeAndDate(
										product.getProductCode(), preDate);
						if (productNetValue != null) {
							dwjz = productNetValue.getProductNetValue();
							ljjz = productNetValue.getCumulateNetValue();
						}
					}
					//if(!product.getProductCode().equalsIgnoreCase("870008"))
		%>
			<li>
				<%if(product.getProductCode().equals("873001")) { %>
					<a href="${contextPath}/assetManage/lc2hIncome_yqsy.jsp?whichCat=syl&productCode=<%=product.getProductCode() %>&assetProd=<%=product.getProductId()%>">广发现金增利业绩比较标准</a>&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=dwjz%>&nbsp; &nbsp;<%=ljjz%>
	  	 		<%} else if(product.getProductCode().equals("878001")||product.getProductCode().equals("878002")||product.getProductCode().equals("878003")) {%>
	  	 			<a href="${contextPath}/assetManage/lc2hIncome.jsp?whichCat=syl&productCode=<%=product.getProductCode() %>&type=f&assetProd=<%=product.getProductId()%>"><%=product.getProductName()%></a>&nbsp; <%=dwjz%>&nbsp; &nbsp;<%=ljjz%>
	  	 		<%}else{ %>
	  	 			<a href="${contextPath}/assetManage/lc2hIncome.jsp?whichCat=syl&assetProd=<%=product.getProductId()%>"><%=product.getProductName()%></a>&nbsp; <%=dwjz%>&nbsp; &nbsp;<%=ljjz%>
	  	 		<%} %>
			</li>
		<%
				}
			}
		%>
	</ul>
	</div>
	<div style="TEXT-ALIGN: center;"><A href="###"><img id="rightwnimg2" src="${contextPath}/images/dowm_image.gif"></a></img></div>
	<script type="text/javascript">
		Effect.HtmlMove("productInfoList","ul/li","scrollTop",2,"leftwing2","rightwnimg2",4000,5);
	</script>
</div>