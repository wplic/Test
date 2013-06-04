<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<div class="mod mod-jkxcpxl mod-type1">
					<div class="mhd">
						<h3><a href="/goldMoney.do?method=showMainGoldPage">金快线产品系列</a></h3>
						<b></b>
					</div> 
				
					<div class="mbd">
						<ul class="column-list">
							<!-- 先判断后台返回的数据是否为空，不为空就开始遍历出来 -->
							<img src="${contextPath }/infoCenter/goldmoney/images/goldenline.jpg"/>
								<c:choose>
									<c:when test="${empty goldMoneyList}">
										<li>
											暂时没有数据
										</li>
									</c:when>
									<c:otherwise>
										<c:forEach items="${goldMoneyList}" var="goldMoneyValue">
											<li>
												<a href="/goldMoney.do?method=showGoldMoney&pid=${goldMoneyValue.pid}">${goldMoneyValue.sotname}</a>
											</li>
										</c:forEach>
									</c:otherwise>
								</c:choose>
						</ul>
					</div>
					
					<div class="mft"><b></b></div>
				</div> <!-- mod -->
				
				<div class="mod mod-jkxcpxl mod-type1">
					<div class="mhd">
						<h3>客户服务</h3>
						<b></b>
					</div> 
				
					<div class="mbd">
						<ul class="column-list">
							<li>
									<a href="/goldMoney.do?method=showGoldMoneyGuide">参与指南</a>
								</li>
								<li>
									<a href="/goldMoney.do?method=showGoldMoneyDownload">资料下载</a>
								</li>
								<li>
									<a href="/goldMoney.do?method=showFaq">常见问题解答</a>
								</li>
						</ul>
					</div>
					
					<div class="mft"><b></b></div>
				</div> 
				
				<!-- mod -->
				
				<div class="mod mod-phoneCol">
					
				</div>
