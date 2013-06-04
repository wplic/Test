<%@ page contentType="text/html; charset=utf-8"%>
<%@page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/commons/taglibs.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>广发证券柜台交易产品首页</title>
		<link href="${ctx }/css/otc/common.css" rel="stylesheet" type="text/css" />
		<script>
			var msg = '${msg}';
			if(msg.length!=0){
				alert(msg);
			}
		</script>
	</head>
	<%
		Object obj = request.getAttribute("TID");
		if(obj==null)
			request.setAttribute("TID","0");
	%>
	<body>
		<br /><jsp:include page="${ctx}/commons/mstop.jsp" />
		<div class="main">
			<!--此处CLASS样式为原网站引用的-->
			<!--请从此处复制代码开始-->
			<!--banner图片引用js-->
			<script type="text/javascript" src="${ctx }/js/otc/jquery.pack.js"></script>
			<script type="text/javascript" src="${ctx }/js/otc/jquery.SuperSlide.js"></script>
			<script type="text/javascript" src="${ctx }/js/jobBbs/public.js"></script>
			<!--banner图片引用js结束-->
			<div id="gtjy" class="gtjy">
				<div class="gtjy_01">
					<div class="gtjy_01_l">
						<div class="banner">
							<div id="slideBox" class="slideBox">
								<div class="hd">
									<ul>
										<li>
											1
										</li>
										<li>
											2
										</li>
										<li>
											3
										</li>
									</ul>
								</div>
								<div class="bd">
									<ul>
										<li>
											<img src="${ctx }/images/otc/img_01.jpg" />
										</li>
										<li>
											<img src="${ctx }/images/otc/img_01.jpg" />
										</li>
										<li>
											<img src="${ctx }/images/otc/img_01.jpg" />
										</li>
									</ul>
								</div>
							</div>
							<script type="text/javascript">jQuery(".slideBox").slide( { mainCell:".bd ul",autoPlay:true} );</script>
						</div>
						<div class="ico_01">
							<img width="689" height="71" src="${ctx }/images/otc/ico_01.jpg" border="0"
								usemap="#Map" />
							<map name="Map" id="Map">
								<area shape="rect" coords="7,15,185,79" href="${ctx }/front/otcDocumentAction.do?method=getDocInfoMain&documentId=${liuchengId }"/>
								<area shape="rect" coords="200,14,451,78" href="${ctx }/front/otcDocumentAction.do?method=getDocInfoMain&documentId=${fengxianId }"/>
								<area shape="rect" coords="459,15,686,79" href="${ctx }/front/otcDocumentAction.do?method=getDocInfoMain&documentId=${yuedingId }"/>
							</map>
						</div>
					</div>
					<div class="gtjy_01_r">
						<div class="lm_1">
							<span>产品公告</span><a href="${ctx }/otc/action/OtcAction.go?function=GetOtcDocumentNotice&otcCode=-1" target="_blank">更多></a>
						</div>
						<div class="con_1" style="height: 302px;">
							<table align="center" class="lh25 font_st">
							 <logic:iterate id="data" name="noticeList" indexId="num">
							  	<tr class="xuxian">
								    <td width="73%"><span class="font_8c">·</span>
								      <a href="${ctx }/front/otcDocumentAction.do?method=getDocInfo3&documentId=${data.id }" alt="${data.title}" title="${data.title}" target=\"_blank\">
								         <c:set var="len" value="${fn:length(data.title)}"/>
										<c:if test="${len>12}">
											<c:set var="str" value="${fn:substring(data.title, 0, 12)}..."/>
										    ${str}
										</c:if>
										<c:if test="${len<=12}">
										    ${data.title}
										</c:if>
								      </a>
								    </td>
								    <td align="right"><span class="font_8c">${data.upddate }</span></td>
								  </tr>
							  </logic:iterate>
							</table>
						</div>
					</div>
				</div>
				<div class="gtjy_02">
					<div class="lm_2">
						<script language="javascript">
  		var TID = 0;
      function dis(ID){
	      /*if(TID!=ID){
	       document.getElementsByName("tit")[TID].className = "lm2_lt2";
	       document.getElementsByName("tit")[ID].className="lm2_lt";
	       TID = ID;
	      }*/
	      if(ID==0){
	      	window.location.href="${ctx}/otc/action/OtcAction.go?function=FrontGetOtcList";
	      }
	      if(ID==1){
	      	window.location.href="${ctx}/otc/action/OtcAction.go?function=FrontGetOtcList&state=1";
	      }
	      if(ID==2){
	      	window.location.href="${ctx}/otc/action/OtcAction.go?function=FrontGetOtcList&state=2";
	      }
	      if(ID==3){
	      	window.location.href="${ctx}/otc/action/OtcAction.go?function=FrontGetOtcList&state=3";
	      }
      }
      </script>
						<div class=<%=request.getAttribute("TID").equals("0")?"lm2_lt":"lm2_lt2" %> onclick="dis(0)" id=tit name=tit>
							全部
						</div>
						<div class=<%=request.getAttribute("TID").equals("1")?"lm2_lt":"lm2_lt2" %> onclick="dis(1)" id=tit name=tit>
							预发期
						</div>
						<div class=<%=request.getAttribute("TID").equals("2")?"lm2_lt":"lm2_lt2" %> onclick="dis(2)" id=tit name=tit>
							募集期
						</div>
						<div class=<%=request.getAttribute("TID").equals("3")?"lm2_lt":"lm2_lt2" %> onclick="dis(3)" id=tit name=tit>
							存续期
						</div>
					</div>

					<div class="con_2" id=sKey name=sKey style="display:">
					<form id="moderate"
						action="${ctx }/otc/action/OtcAction.go?function=FrontGetOtcList&state=${state }"
						name="moderate" method="post">
						<table width="100%" border="0" cellpadding="0" cellspacing="1" style="border-collapse:inherit;border-spacing: 1px;">
							<tbody>
								<tr class="color1">
									<td width="64">
										产品代码
									</td>
									<td width="100" height="38">
										产品名称
									</td>
									<td width="64">
										产品管理人
									</td>
									<td width="64">
										风险等级
									</td>
									<td width="64">
										产品期限
									</td>
									<td width="100">
										预期年化收益率
									</td>
									<td width="64">
										产品起息日
									</td>
									<td width="64">
										产品到期日
									</td>
									<td width="112">
										认购起点
									</td>
									<td width="64">
										产品状态
									</td>
									<td width="64">
										产品详细
									</td>
								</tr>
								<logic:empty name="otcList">
									<tr>
										<td align="center" colspan="11">
											暂无记录!
										</td>
									</tr>
								</logic:empty>
								<logic:notEmpty name="otcList" scope="request">
									<logic:iterate id="data" name="otcList">
										<tr>
											<td>
												${data.code }
											</td>
											<td title="${data.name }">
												${data.name }
											</td>
											<td title="${data.glr }">
												${data.glr }
											</td>
											<td title="${data.fxpj }">
												${data.fxpj }
											</td>
											<td title="${data.tzqx }">
												${data.tzqx }
											</td>
											<td title="${data.nhsy }%">
												${data.nhsy }%
											</td>
											<td>
												${data.startdate }
											</td>
											<td>
												${data.enddate }
											</td>
											<td>
												${data.rgqd }
											</td>
											<td>
												${data.state }
											</td>
											<td>
												<a href="${ctx }/otc/otc_detail.jsp?id=${data.id }"><img src="${ctx }/images/otc/ico_02.gif"
														width="69" height="23">
												</a>
											</td>
										</tr>
									</logic:iterate>
								</logic:notEmpty>
								<tr>
									<td height="40" colspan="11" class="fy">
										<c:out value="${linkStr}" escapeXml="false"></c:out>
									</td>
								</tr>
							</tbody>
						</table>
						</form>
					</div>
				</div>
			</div>
			<div class="gtjy_03">
				<div class="gtjy_03_l">
					<div class="lm_3">
						<span>投资者园地</span><a href="${ctx }/otc/action/OtcAction.go?function=GetDocSplitList&docType=7" target="_blank">更多></a>
					</div>
					<div class="con_3">
						<table align="center" class="lh25 font_st" width="100%">
							 <c:if test="${not empty tzzydList}">
							 <logic:iterate id="data" name="tzzydList" indexId="num">
							  	<tr class="xuxian">
								    <td width="80%"><span class="font_8c">·</span>
								      <a href="${ctx }/front/otcDocumentAction.do?method=getDocInfo3&documentId=${data.id }" target=\"_blank\">
								         <c:set var="len" value="${fn:length(data.title)}"/>
										<c:if test="${len>28}">
											<c:set var="str" value="${fn:substring(data.title, 0, 28)}..."/>
										    ${str}
										</c:if>
										<c:if test="${len<=28}">
										    ${data.title}
										</c:if>
								      </a>
								    </td>
								    <td align="right"><span class="font_8c">${data.upddate }</span></td>
								  </tr>
							  </logic:iterate>
							  </c:if>
							   <c:if test="${empty tzzydList}">
							 	<tr>
							 		<td colspan="2" align="center">暂无记录...</td>
							 	</tr>
							 </c:if>
							 <%
							 	List tzzydList = (List)request.getAttribute("tzzydList");
							 	if(tzzydList!=null && tzzydList.size()<15){ 
							  	for(int i=0;i<(8-tzzydList.size());i++){
							  %>
							  		<tr class="xuxian">
								    <td width="80%" align="left"><span class="font_8c">.</span>
								    </td>
								    <td align="right"><span class="font_8c"></span></td>
								  </tr>
							  <%} }%>
							</table>
					</div>
				</div>
				<div class="gtjy_03_r">
					<div class="lm_3">
						<span>常见问题</span><a href="${ctx }/otc/action/OtcAction.go?function=GetDocSplitList&docType=8" target="_blank">更多></a>
					</div>
					<div class="con_3">
						<table align="center" class="lh25 font_st" width="100%">
							 <c:if test="${not empty cjwtList}">
							 <logic:iterate id="data" name="cjwtList" indexId="num">
							  	<tr class="xuxian">
								    <td width="80%"><span class="font_8c">·</span>
								      <a href="${ctx }/front/otcDocumentAction.do?method=getDocInfo3&documentId=${data.id }" target=\"_blank\">
								         <c:set var="len" value="${fn:length(data.title)}"/>
										<c:if test="${len>28}">
											<c:set var="str" value="${fn:substring(data.title, 0, 28)}..."/>
										    ${str}
										</c:if>
										<c:if test="${len<=28}">
										    ${data.title}
										</c:if>
								      </a>
								    </td>
								    <td align="right"><span class="font_8c">${data.upddate }</span></td>
								  </tr>
							  </logic:iterate>
							  </c:if>
							  <c:if test="${empty cjwtList}">
							 	<tr>
							 		<td colspan="2" align="center">暂无记录...</td>
							 	</tr>
							 </c:if>
							  <%
							 	List cjwtList = (List)request.getAttribute("cjwtList");
							 	if(cjwtList!=null && cjwtList.size()<15){ 
							  	for(int i=0;i<(8-cjwtList.size());i++){
							  %>
							  		<tr class="xuxian">
								    <td width="70%" align="left"><span class="font_8c">.</span>
								    </td>
								    <td align="right"><span class="font_8c"></span></td>
								  </tr>
							  <%} }%>
							</table>
					</div>
				</div>
			</div>

			<!--请从此处复制代码结束-->
		</div>
		<div class="foot">
			<jsp:include page="${ctx }/commons/msbottom.jsp" />
		</div>
		<div style="text-align: center;">
		</div>
	</body>
</html>