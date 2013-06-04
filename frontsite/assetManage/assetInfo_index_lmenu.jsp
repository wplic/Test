<%@ page contentType="text/html; charset=utf-8" language="java"%>
<link href="${contextPath }/css/style.css" rel="stylesheet" type="text/css" />
<%@ include file="/commons/taglibs.jsp"%>
<%@page import="java.util.*"%>
<%@page	import="com.cssweb.common.dictionary.service.DictionaryService"%>
<%@page	import="com.cssweb.common.dictionary.pojo.Dictionary"%>
<jsp:directive.page import="com.cssweb.business.product.pojo.Product"/>
<jsp:directive.page import="com.cssweb.business.product.service.ProductService"/>
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<jsp:directive.page import="org.apache.commons.lang.StringUtils"/>
<bean:parameter name="nav" id="nav" value="index"/>
<bean:parameter name="nav1" id="nav1" value="index"/>
<%
    ServletContext st = this.getServletConfig().getServletContext();
	ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
	ProductService productService=(ProductService)ctx.getBean("productService");
	DictionaryService dictionaryService = (DictionaryService)ctx.getBean("dictionaryService");
	Map map=new HashMap();
	map.put("sortName", "product_style,product_id");
    map.put("dir", "asc");
    map.put("productValidate",0);
    //根据字典表来取集合理财的产品
    Dictionary dictionary = dictionaryService.getDictionaryByKeyCode("zcgl_cplb_jglc");
    if(dictionary!=null)
    map.put("productCat",dictionary.getId() );
    
    List prodbList = productService.getProductsList(map,0,100);
    Map map2=new HashMap();
	map2.put("sortName", "product_style");
    List productStyleList = productService.getProductStyle(map2,0,100);
	//根据字典表来取产品类型
    List dicCplxList = dictionaryService.getDictionaryByParentKeyCode("zcgl_cplx");
    Map cplxMap=new HashMap();
    if(dicCplxList!=null&&dicCplxList.size()>0){
		for(int i=0;i<dicCplxList.size();i++){
			Dictionary d1=(Dictionary)dicCplxList.get(i);
			cplxMap.put(d1.getId().toString(), d1.getKeyName());
		}
	}
    List prodbList4group = new ArrayList();
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
<div class="sidemenu">
	<table>
        <tr>
         <td class="<%="ywgk".equals(nav)?"active":"link"%> sideblue"><a href="${contextPath }/assetManage/assetInfo.html">业务概况</a></td>
       </tr>         
       <tr>
         <td class="submenu" <%if(!"ywgk".equals(nav)){ %> style="display:none"<%} %>>
         	<ul>
             	<li><a href="${contextPath }/assetManage/assetInfo.html">&nbsp;&nbsp;&nbsp;&nbsp;· <span <%="zgjj".equals(nav1)?"class='red'":""%>>资管简介</span></a></li>
                 <li><a href="${contextPath }/assetManage/investManage.html">&nbsp;&nbsp;&nbsp;&nbsp;· <span <%="tzgl".equals(nav1)?"class='red'":""%>>投资管理</span></a></li>
                 <li><a href="${contextPath }/assetManage/riskControl.html">&nbsp;&nbsp;&nbsp;&nbsp;· <span <%="fxkz".equals(nav1)?"class='red'":""%>>风险控制</span></a></li>
             </ul>
         </td>
        </tr>
      <tr>
         <td class="<%="jhcp".equals(nav)?"active":"link"%> sideblue"><a href="${contextPath }/assetManage/gatherFinancing.html">集合产品</a></td>
       </tr>
  		<tr>
       	 <td class="submenu" <%if(!"jhcp".equals(nav)){ %> style="display:none"<%} %>>
        	<ul>
			<%
			if(prodbList!=null && prodbList.size()>0){
				String cplx = "";
				for(int s=0;s<productStyleList.size();s++){
					Product product1=(Product)productStyleList.get(s);
					cplx=(String)cplxMap.get(product1.getProductStyle());
					%>
						<li><span><%=cplx %></span></li>
					<%
//				prodbList4group 
				   	for(int i=0;i<prodbList.size();i++){
						Product product=(Product)prodbList.get(i);
						if(product1.getProductStyle().equals(product.getProductStyle())){
						//2013-3-21 870004 属于小集合产品
						//if(product.getProductCode().indexOf("872")!=0 && !product.getProductCode().equals("870011")){
						if(true){
				%>
				  	 	<li>
				  	 		<%if(product.getProductCode().equals("873001")) { %>
				  	 			&nbsp;&nbsp;&nbsp;&nbsp;<a href="${contextPath}/assetManage/lc2hInfo_yqsy.jsp?whichCat=cpzx_jhlc_cpjj&nav=jhcp&assetProd=<%=product.getProductId() %>">· <span <%=nav2.equals(String.valueOf(product.getProductId()))?"class='red'":"" %>><%=product.getProductName() %></span></a>
				  	 		<%}else if(product.getProductCode().equals("878001")){ %>
				  	 			&nbsp;&nbsp;&nbsp;&nbsp;<a href="${contextPath}/assetManage/lc2hInfo.jsp?whichCat=cpzx_jhlc_cpjj&productCode=<%=product.getProductCode() %>&nav=jhcp&assetProd=<%=product.getProductId() %>">· <span <%=nav2.equals(String.valueOf(product.getProductId()))?"class='red'":"" %>><%=product.getProductName() %></span></a>
				  	 		<%}else{ %>
				  	 			&nbsp;&nbsp;&nbsp;&nbsp;<a href="${contextPath}/assetManage/lc2hInfo.jsp?whichCat=cpzx_jhlc_cpjj&nav=jhcp&assetProd=<%=product.getProductId() %>">· <span <%=nav2.equals(String.valueOf(product.getProductId()))?"class='red'":"" %>><%=product.getProductName() %></span></a>
				  	 		<%} %>
				  	 	</li>
				<%		}
						}
					 }
				}
			}
			%>
       	 	</ul>
       	 </td>
        </tr> 
<!--   <tr>
         <td class="<%="xjhcp".equals(nav)?"active":"link"%> sideblue"><a href="${contextPath }/assetManage/gatherFinancingXjhcp.html">小集合产品</a></td>
       </tr> --> 
  		<tr>
       	 <td class="submenu" <%if(!"xjhcp".equals(nav)){ %> style="display:none"<%} %>>
        	<ul>
			<%
			if(prodbList!=null && prodbList.size()>0){
			   for(int i=0;i<prodbList.size();i++){
					Product product=(Product)prodbList.get(i);
					if(product.getProductCode().indexOf("872")==0 || product.getProductCode().equals("870011")){
			%>
			  	 	&nbsp;&nbsp;&nbsp;&nbsp;<li><a href="${contextPath}/assetManage/lc2hInfo.jsp?whichCat=cpzx_jhlc_cpjj&nav=xjhcp&assetProd=<%=product.getProductId() %>">· <span <%=nav2.equals(String.valueOf(product.getProductId()))?"class='red'":"" %>><%=product.getProductName() %></span></a></li>
			<%
			     }
				}
			}
			%>
       	 	</ul>
       	 </td>
        </tr> 
       <tr>
         <td class="<%="dxcp".equals(nav)?"active":"link"%> sideblue"><a href="${contextPath }/assetManage/bearingFinancing.html">定向产品</a></td>
       </tr>   
       <tr>
         <td class="<%="zxcp".equals(nav)?"active":"link"%> sideblue"><a href="${contextPath }/assetManage/specialFinancial.html">专项产品</a></td>
       </tr>         
       <tr>
         <td class="<%="gold".equals(nav)?"active":"link"%> sideblue"><a href="${contextPath }/goldMoney.do?method=showMainGold">金快线</a></td>
       </tr> 
       <tr>
       	 <td class="submenu" <%if(!"gold".equals(nav)){ %> style="display:none"<%} %>>
       	 <ul>
							<!-- 先判断后台返回的数据是否为空，不为空就开始遍历出来 -->
								<c:choose>
									<c:when test="${empty goldMoneyList}">
										<li>
											暂时没有数据
										</li>
									</c:when>
									<c:otherwise>
										<c:forEach items="${goldMoneyList}" var="goldMoneyValue">
											<li>                                                                                                                                          
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/goldMoney.do?method=showGoldMoney2&pid=${goldMoneyValue.pid}">·${goldMoneyValue.sotname}</a>
											</li>
										</c:forEach>
									</c:otherwise>
								</c:choose>
						</ul>
        	
       	 </td>
        </tr>   
         <tr>
         <td class="link sideblue"><a href="${contextPath }/sunnyPOF/login.jsp">阳光私募</a></td>
       </tr>
       <tr>
         <td class="<%="tztd".equals(nav)?"active":"link"%> sideblue"><a href="${contextPath }/assetManage/starManage.html">投资团队</a></td>
       </tr>
       
       <tr>
         <td class="submenu" <%if(!"tztd".equals(nav)){ %> style="display:none"<%} %>>
         	<ul>
                 <li><a href="${contextPath }/assetManage/starManage.html">&nbsp;&nbsp;&nbsp;&nbsp;· <span <%="tzjljs".equals(nav1)?"class='red'":""%>>投资经理介绍</span></a></li>
                
             </ul>
         </td>
        </tr>
       <tr>
         <td class="<%="khfw".equals(nav)?"active":"link"%> sideblue"><a href="${contextPath }/assetManage/fwnr.jsp">客户服务</a></td>
       </tr>
       <tr>
         <td class="submenu" <%if(!"khfw".equals(nav)){ %> style="display:none"<%} %>>
         	<ul>
             	<li><a href="${contextPath }/commons/loginms.jsp">&nbsp;&nbsp;&nbsp;&nbsp;· <span <%="yhdl".equals(nav1)?"class='red'":""%>>用户登陆</span></a></li>
                 <li><a href="${contextPath }/assetManage/fwnr.jsp">&nbsp;&nbsp;&nbsp;&nbsp;· <span <%="fwnr".equals(nav1)?"class='red'":""%>>服务内容</span></a></li>
                 
             </ul>
         </td>
        </tr>
        
        <tr>
         <td class="<%="dtxx".equals(nav)?"active":"link"%> sideblue"><a href="/assetManage/mtbd.jsp">动态信息</a></td>
       </tr>
       
       <!-- 
        <tr>
         <td class="<%="bmgg".equals(nav)?"active":"link"%> sideblue"><a href="/assetManage/bmgg.jsp">部门公告</a></td>
       </tr>  -->
       
       <tr>
       		<td class="<%="lczx".equals(nav)?"active":"link"%> sideblue"><a href="${contextPath }/assetManage/lczx.jsp">理财资讯</a></td>
       </tr>
        <tr>
         <td class="submenu" <%if(!"lczx".equals(nav)){ %> style="display:none"<%} %>>
         	<ul>
                 <li><a href="${contextPath }/assetManage/lczx.jsp">&nbsp;&nbsp;&nbsp;&nbsp;· <span <%="lczx".equals(nav1)?"class='red'":""%>>投资观点</span></a></li>
                 <li><a href="${contextPath }/assetManage/yjzt.jsp">&nbsp;&nbsp;&nbsp;&nbsp;· <span <%="yjzt".equals(nav1)?"class='red'":""%>>研究专题</span></a></li>
                
             </ul>
         </td>
        </tr>
       <tr>
       	<td class="<%="spxx".equals(nav)?"active":"link"%> sideblue"><a href="${contextPath }/assetManage/starManagesd.jsp">视频资讯</a></td>
       	
       </tr> 
       <tr>
         <td class="<%="lxwm".equals(nav)?"active":"link"%> sideblue"><a href="${contextPath }/assetManage/contactUs.html">联系我们</a></td>
       </tr>
     </table>
     <a href="${contextPath }/assetManage/axzl.jsp">
	 	<img src="/images/axzl.jpg" />
	 </a>
	 <a href="${contextPath }/commons/infoList.jsp?docId=1300341">
	 	<img src="/images/eactive.jpg" style="margin-top:10px;" />
	 </a>
  </div>

