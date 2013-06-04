<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page
	import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<jsp:directive.page
	import="com.cssweb.common.web.filter.SqlInjectValidate" />
<%@page import="com.cssweb.rzrq.service.AimadjustService"%>
<%@page import="com.cssweb.rzrq.pojo.Aimadjust"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Date"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@ include file="/commons/turnPage.jsp"%>
<%
	ServletContext st = this.getServletConfig().getServletContext();
	ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
	AimadjustService aimadjustService  = (AimadjustService)ctx.getBean("aimadjustService");
	Aimadjust aimadjust = aimadjustService.getAimadjustNewStartDate();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日");
	SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
	List<Aimadjust> aimadjustList1 = null;
	List<Aimadjust> aimadjustList2 = null;
	List<Aimadjust> aimadjustList3 = null;
	String startDate =request.getParameter("startDate");
	
	String startDate2 =request.getParameter("startDate2");
	
	String gpdm =request.getParameter("gpdm");
	String gpdm2 =request.getParameter("gpdm2");
	SqlInjectValidate sqlInjectValidate = SqlInjectValidate.getSqlInjectValidate();
	if(null!=request.getParameter("startDate") && sqlInjectValidate.validateSql2(request.getParameter("startDate")))
			response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
if(null!=request.getParameter("startDate2") && sqlInjectValidate.validateSql2(request.getParameter("startDate2")))
		response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
if(null!=request.getParameter("gpdm") && sqlInjectValidate.validateSql2(request.getParameter("gpdm")))
	response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
if(null!=request.getParameter("gpdm2") && sqlInjectValidate.validateSql2(request.getParameter("gpdm2")))
	response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
	
	int listSize = 0;
	if (aimadjust != null) {
		DecimalFormat mdf = new DecimalFormat("#0.00");
		Map map1 = new HashMap();
		map1.put("type","1");
		if (gpdm != null && !"".equals(gpdm))
		{
		map1.put("gpdm",gpdm);
		request.setAttribute("gpdm",gpdm);
		}
		if (startDate != null && !"".equals(startDate))
		{
		map1.put("startDate",startDate);
		request.setAttribute("startDate",startDate);
		}
		aimadjustList1 = aimadjustService.getAimadjustByTypeAndStartDate(map1);
		Map map2 = new HashMap();
		map2.put("type","2");
		if (gpdm2 != null && !"".equals(gpdm2))
		{
		map2.put("gpdm",gpdm2);
		request.setAttribute("gpdm2",gpdm2);
		}
		if (startDate2 != null && !"".equals(startDate2))
		{
		map2.put("startDate",startDate2);
		request.setAttribute("startDate2",startDate2);
		}
		aimadjustList2 = aimadjustService.getAimadjustByTypeAndStartDate(map2);
		//Map map3 = new HashMap();
		//map3.put("type","3");
		//map3.put("startDate",sdf1.format(aimadjust.getStartDate()));
		
		//aimadjustList3 = aimadjustService.getAimadjustByTypeAndStartDate(map3);
		if (aimadjustList1 != null && aimadjustList2 != null)
		{
			if (aimadjustList1.size() > aimadjustList2.size() )
			{
				listSize = aimadjustList1.size();
			}
			else
			{
				listSize = aimadjustList2.size();
			}
		
			//if (listSize < aimadjustList3.size())
			//{
			//	listSize = aimadjustList3.size();
			//}
		
		}
	}
	
 %>

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>广发证券</title>
		<link href="/css/style.css" rel="stylesheet" type="text/css" />
		<script src="${contextPath }/financing/My97DatePicker/WdatePicker.js"
			type="text/javascript"></script>

	</head>
	<body>
		<jsp:include page="/commons/mstop.jsp" />
		<FORM id=myForm method=post name=myForm
			onsubmit="return checkUser_Pass()" action="subjectNotice.jsp">
			<div class="main">
				<div class="dqwz">
					当前位置：
					<a href="/default.html">首页</a> -
					<a href="/financing/index.html"> 融资融券</a> -
					<a href="/financing/rateNoticeLl.html">公告信息</a> - 标的证券
				</div>
			</div>
			<div class="wrap_2left">
				<!--左侧sied开始-->
				<div class="w210 fleft">
					<jsp:include page="/financing/notice_lmenu.jsp" />
					<div class="blank5"></div>
				</div>
				<!--左侧sied结束-->

				<!--中侧sied开始-->
				<div class="w706 fright">
					<div class="comtit1">
						<h4>
							标的证券公告
						</h4>
					</div>
					<div class="blank10"></div>
					<table width="100%" align="center">
						<jsp:include page="/financing/indexTitles.jsp">
							<jsp:param name="whichCat" value="bdzqtzgg" />
						</jsp:include>

						<tr>
							<td>
								<table width="99%">
									<tr>
										<td valign="top">
											<table width="100%" border="1" bordercolor="#CCCCCC"
												class="lh25 mtb10 textcenter fcenter">
												<tr class="rrtab_top bold">
													<td colspan="3">
														融资标的证券名单
													</td>
												</tr>
												<tr>
													<td colspan="3">
														<table>
															<tr>
																<td></td>
																<td width="25%">
																	证券代码：
																</td>
																<td width="15%">
																	<c:choose>
																		<c:when test="${gpdm!=null }">
																			<input type="text" name="gpdm" id="gpdm"
																				value="${gpdm }" class="input108" maxlength="8"
																				onkeyup="value=value.replace(/[^0-9]/g,'')"
																				onkeydown="if(event.keyCode==13){return checkStock();}" />
																		</c:when>
																		<c:otherwise>
																			<input type="text" name="gpdm" id="gpdm"
																				class="input108" maxlength="8"
																				onkeyup="value=value.replace(/[^0-9]/g,'')"
																				onkeydown="if(event.keyCode==13){return checkStock();}" />
																		</c:otherwise>
																	</c:choose>

																</td>
																<td width="15%">
																	日期：
																</td>
																<td width="22%">
																	<c:choose>
																		<c:when test="${startDate!=null }">
																			<input class="Wdate" name="startDate" id="startDate"
																				value="${startDate }" type="text"
																				onClick="WdatePicker()">
																		</c:when>
																		<c:otherwise>
																			<input class="Wdate" name="startDate" id="startDate"
																				type="text" onClick="WdatePicker()">
																		</c:otherwise>
																	</c:choose>
																</td>
																<td width="20%">

																	<input type="submit" name="button1" id="button1"
																		value="查询" class="but_01" />

																</td>

															</tr>
														</table>

													</td>
												</tr>
												<tr class="rrtab_tt bold">
													<td>
														证券代码
													</td>
													<td>
														证券名称
													</td>
													<td>
														日 期
													</td>
												</tr>
												<%
        		         if (aimadjustList1 != null && aimadjustList1.size() > 0)		
        				      {
        						for (int i = 0; i < aimadjustList1.size() ; i ++)
        						{
        							Aimadjust  aimadjust1 =	(Aimadjust)aimadjustList1.get(i);
        							%>
												<tr class="zqpzzslb">
													<td width="8%" id="<%=aimadjust1.getCode()+"a" %>"><%=aimadjust1.getCode() %></td>
													<td width="15%"><%=aimadjust1.getName() %></td>
													<td width="15%"
														id="<%=sdf.format(aimadjust1.getStartDate())+"a" %>"><%=sdf.format(aimadjust1.getStartDate()) %></td>

												</tr>
												<%
        						}	
        				}
        		
         %>
											</table>
										</td>
										<td valign="top">
											<table width="100%" border="1" bordercolor="#CCCCCC"
												class="lh25 mtb10 textcenter fcenter">
												<tr class="rrtab_top bold">
													<td colspan="3">
														融券标的证券名单
													</td>
												</tr>
												<tr>
													<td colspan="3">
														<table>
															<tr>
																<td width="25%">
																	证券代码：
																</td>
																<td width="15%">
																	<c:choose>
																		<c:when test="${gpdm2!=null }">
																			<input type="text" name="gpdm2" id="gpdm2"
																				value="${gpdm2 }" class="input108" maxlength="8"
																				onkeyup="value=value.replace(/[^0-9]/g,'')"
																				onkeydown="if(event.keyCode==13){return checkStock();}" />
																		</c:when>
																		<c:otherwise>
																			<input type="text" name="gpdm2" id="gpdm2"
																				class="input108" maxlength="8"
																				onkeyup="value=value.replace(/[^0-9]/g,'')"
																				onkeydown="if(event.keyCode==13){return checkStock();}" />
																		</c:otherwise>
																	</c:choose>

																</td>
																<td width="15%">
																	日期：
																</td>
																<td width="25%"">
																	<c:choose>
																		<c:when test="${startDate2!=null }">
																			<input class="Wdate" name="startDate2"
																				id="startDate2" value="${startDate2 }" type="text"
																				onClick="WdatePicker()">
																		</c:when>
																		<c:otherwise>
																			<input class="Wdate" name="startDate2"
																				id="startDate2" type="text" onClick="WdatePicker()">
																		</c:otherwise>
																	</c:choose>
																</td>

																<td width="20%">

																	<input type="submit" name="button2" id="button2"
																		value="查询" class="but_01" />

																</td>

															</tr>
														</table>

													</td>
												</tr>
												<tr class="rrtab_tt bold">
													<td>
														证券代码
													</td>
													<td>
														证券名称
													</td>
													<td>
														日 期
													</td>
												</tr>
												<tr id="all" type="hidden">
													<td></td>
													<td></td>
													<td></td>
												</tr>

												<%
                            if (aimadjustList2 != null && aimadjustList2.size() > 0)
        				      {
        						 for (int i = 0; i < aimadjustList2.size() ; i ++)
        						{
        							Aimadjust  aimadjust2 =	(Aimadjust)aimadjustList2.get(i);
        							%>
												<tr class="zqpzzslb">
													<td width="8%" id="<%=aimadjust2.getCode()+"b" %>"><%=aimadjust2.getCode() %></td>
													<td width="15%"><%=aimadjust2.getName() %></td>
													<td width="15%"
														id="<%=sdf.format(aimadjust2.getStartDate())+"b" %>"><%=sdf.format(aimadjust2.getStartDate())%></td>
												</tr>

												<%
        						  }
        						}
         %>


											</table>
										</td>
									</tr>
								</table>
							</td>
						</tr>

						<tr>
							<td class="lh25">
								特此公告。
							</td>
						</tr>
						<tr>
							<td align="right" class="lh25">
								广发证券股份有限公司
								<br />
								<jsp:include page="/financing/indexTitleUpdateTime.jsp">
									<jsp:param name="whichCat" value="bdzqtzgg" />
								</jsp:include></td>
						</tr>
						<tr>
							<td class="cuxuxian lh25">
								&nbsp;
							</td>
						</tr>
						<tr>
							<td align="right">
							</td>
						</tr>
					</table>

					<div class="clearfloat h15"></div>
				</div>
				<!--中侧sied结束-->

				<div class="clearfloat"></div>
				<!--清除浮动-->
			</div>
			<div class="blank5"></div>
		</FORM>
		<jsp:include page="/commons/msbottom.jsp" />
	</body>

	<script language="javascript">
	function checkStock() {
		var stockId = document.getElementById("gpdm").value;
		var startDate = document.getElementById("startDate").value;

		if (document.getElementById(stockId + "a")) {
			document.location.href = "#" + stockId + "a";
		} else if (document.getElementById(startDate + "a")) {
			document.location.href = "#" + startDate + "a";
		} else {
			document.location.href = "#all";
		}
	}
	function checkStock2() {
		var stockId = document.getElementById("gpdm2").value;
		var startDate = document.getElementById("startDate2").value;

		if (document.getElementById(stockId + "b")) {
			document.location.href = "#" + stockId + "b";
		} else if (document.getElementById(startDate + "b")) {
			document.location.href = "#" + startDate + "b";
		} else {
			document.location.href = "#all";
		}
	}
</script>
</html>