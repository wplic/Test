<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<div class="mod mod-jkxcpxl mod-type1">
					<div class="mhd">
						<h3><a href="/goldMoney.do?method=showMainGoldPage">����߲�Ʒϵ��</a></h3>
						<b></b>
					</div> 
				
					<div class="mbd">
						<ul class="column-list">
							<!-- ���жϺ�̨���ص������Ƿ�Ϊ�գ���Ϊ�վͿ�ʼ�������� -->
							<img src="${contextPath }/infoCenter/goldmoney/images/goldenline.jpg"/>
								<c:choose>
									<c:when test="${empty goldMoneyList}">
										<li>
											��ʱû������
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
						<h3>�ͻ�����</h3>
						<b></b>
					</div> 
				
					<div class="mbd">
						<ul class="column-list">
							<li>
									<a href="/goldMoney.do?method=showGoldMoneyGuide">����ָ��</a>
								</li>
								<li>
									<a href="/goldMoney.do?method=showGoldMoneyDownload">��������</a>
								</li>
								<li>
									<a href="/goldMoney.do?method=showFaq">����������</a>
								</li>
						</ul>
					</div>
					
					<div class="mft"><b></b></div>
				</div> 
				
				<!-- mod -->
				
				<div class="mod mod-phoneCol">
					
				</div>
