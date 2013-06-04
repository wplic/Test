<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*"%>
<jsp:directive.page import="com.css.cms.document.util.DocumentHelper" />
<jsp:directive.page import="com.css.cms.document.DocumentManager" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<%@ include file="/commons/taglibs.jsp"%>
 
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>广发证券</title>
		<link href="/css/jobBbs/common.css" rel="stylesheet" type="text/css" />
		<link href="/css/jobBbs/forumdisplay.css" rel="stylesheet"
			type="text/css" />
		<script type="text/javascript" src="${contextPath }/js/jsIfUtils.js"></script>
		<script type="text/javascript" src="/js/jobBbs/common.js"></script>
		<script type="text/javascript" src="/js/jobBbs/public.js"></script>
		<script src="/js/jquery.js" type="text/javascript"></script>
		<script src="/js/jquery.form.js" type="text/javascript"></script>
	</head>
	<%
		String category = "rczp_zpgg";
		int index = 1;
	%>
	<body>
		<br /><jsp:include page="/commons/mstop.jsp" />
		<div class="main">
			<div class="dqwz">
				当前位置：
				<a href="/default.html">首页 </a> -
				<a href="${contextPath }/job/index.jsp">人才招聘</a> - 招聘BBS
			</div>
		</div>
		<div class="wrap_2left">
			<!--左侧sied开始-->
			<div class="w210 fleft">
				<jsp:include page="/job/job_lmenu.jsp" />
				<div class="blank5"></div>
				<iframe target="_blank" id="leftlogin" name="leftlogin"
					marginWidth="0" marginHeight="0"
					src="${contextPath }/job/job_login.jsp" frameBorder="0" noresize
					width="100%" height="198" scrolling="no"></iframe>
				<div class="blank5"></div>
				<jsp:include page="faq.jsp" />
			</div>
			<!--左侧sied结束-->

			<!--右侧sied开始-->

			<div class="w706 fright">
				<form id="moderate"
					action="${ctx }/hrBbsAction.do?method=list&postSection=${postSection }"
					name="moderate" method="post">
					<div class="bm bml pbn">
						<div class="bm_h cl" style="display: block;">
							<span class="y"> <span class="pipe"></span> </span>
							<h1 class="xs2">
								<h4>
									广发证券招聘交流区
								</h4>
								<!--  <span class="xs1 xw0 i">
								今日:
								<strong class="xi1">17</strong>
								<span class="pipe">|</span>
								主题:
								<strong class="xi1">1412</strong>
								</span>-->
							</h1>

						</div>
						<div class="bm_c cl pbn">
							<div>
								温馨提示:
								<span class="xi2"></span>
							</div>
							<div id="forum_rules_39" style="">
								<div class="ptn xg2">
									<c:forEach items="${noticelist}" var="item">
								${item.nocontext}
								<c:if test="${item.attachmentid!=null and item.attachmentid!=0 and item.attachmentid!=''}">
											<a href="${ctx }/job/jobBbsfileout.jsp?id=${item.attachmentid}" class="regular">
												<img src="${ctx }/images/jobBbs/file.png" width="24" height="20"  title="点击下载附件"/>
												${item.filename} </a>
										</c:if>
										</br>
									</c:forEach>


								</div>
							</div>
						</div>
					</div>
					<div id="pgt" class="bm bw0 pgs cl" style="height: 37px;">
						<span class="pgb y"> <a href="#"
							onclick="javascript:history.go(-1);">返 回</a> </span>
						<a id="newspecial" title="发新帖" href="${ctx }/job/jobBbs_posts.jsp">
							<img alt="发新帖" src="${ctx }/images/jobBbs/pn_post.png"> </a>
					</div>

					<ul id="thread_types" class="ttp bm cl" style="height: 37px;">
						<li id="ttp_all" class="xw1 a">
							<a href="${ctx }/hrBbsAction.do?method=list">全部</a>
						</li>
						<li>
							<a href="${ctx }/hrBbsAction.do?method=list&postSection=1">问答</a>
						</li>
						<li>
							<a href="${ctx }/hrBbsAction.do?method=list&postSection=2">笔试</a>
						</li>
						<li>
							<a href="${ctx }/hrBbsAction.do?method=list&postSection=3">面试</a>
						</li>
						<li>
							<a href="${ctx }/hrBbsAction.do?method=list&postSection=4">网申</a>
						</li>
						<li>
							<a href="${ctx }/hrBbsAction.do?method=list&postSection=5">其他</a>
						</li>
					</ul>
					<div id="threadlist" class="tl bm bmw"
						style="position: relative; display: block;">
						<div class="th">
							<table cellspacing="0" cellpadding="0">
								<tbody>
									<tr>
										<th colspan="2">
											<div class="tf">
												<a id="filter_special" class="showmenu xi2"> 主题列表</a>
											</div>
										</th>
										<td class="by_">
											查看
										</td>
										<td class="num">
											回复
										</td>
										<td class="by">
											发布人
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="bm_c">
							<div id="forumnew" style="display: none"></div>
							<input type="hidden" value="7d9159fc" name="formhash">
							<input type="hidden" value="page%3D1" name="listextra">
							<table cellspacing="0" cellpadding="0" summary="forum_39">
								<logic:empty name="postsList">
									<tr>
										<td align="center">
											暂无记录!
										</td>
									</tr>
								</logic:empty>
								<logic:notEmpty name="postsList" scope="request">
									<logic:iterate id="data" name="postsList" indexId="indexid">
										<tbody id="stickthread_10855">
											<tr>
												<td class="icn">
													<c:choose>
														<c:when test="${data.postIssticky eq '0'}">
															<img alt="管理员置顶" title="管理员置顶"
																src="${ctx }/images/jobBbs/ding.gif">
														</c:when>
														<c:otherwise>
															<c:if test="${data.postReadcount > 500}">
																<div id="threadstamp">
																	<img alt="热帖" title="热帖" src="/images/jobBbs/huo.gif" />
																</div>
															</c:if>
														</c:otherwise>
													</c:choose>
												</td>
												<th class="common">
													<c:set var="bk" value="${data.postSection}"></c:set>
													<c:if test="${bk eq '1'}">
														<font color="#0066FF"
															style="font-family: Arial; font-size: 13px;">[问答]</font>
													</c:if>
													<c:if test="${bk eq '2'}">
														<font color="#0066FF"
															style="font-family: Arial; font-size: 13px;">[笔试]</font>
													</c:if>
													<c:if test="${bk eq '3'}">
														<font color="#0066FF"
															style="font-family: Arial; font-size: 13px;">[面试]</font>
													</c:if>
													<c:if test="${bk eq '4'}">
														<font color="#0066FF"
															style="font-family: Arial; font-size: 13px;">[网申]</font>
													</c:if>
													<c:if test="${bk eq '5'}">
														<font color="#0066FF"
															style="font-family: Arial; font-size: 13px;">[其他]</font>
													</c:if>
													<a class="xst"
														href="${ctx }/hrBbsAction.do?method=info&postId=${data.postId }">
														${data.postTitle } 
														<c:if test="${data.fjId != null && data.fjId != ''}">
															<img src="${ctx }/images/jobBbs/file.png" width="24" height="18" title="含附件"/>
														</c:if>
													</a>
												</th>
												<td class="by_">
													<em>${data.postReadcount }</em>
												</td>
												<td class="num">
													${data.postReplycount }
												</td>
												<td class="by">
													<cite> <c:choose>
															<c:when test="${fn:contains(data.postAdminname,'@')}">
															${fn:split(data.postAdminname,'@')[0]}
														</c:when>
															<c:otherwise>
															HR
														</c:otherwise>
														</c:choose> </cite>
													<em> <span><bean:write name="data"
																property="postCreatetime" format="yyyy-MM-dd" />
													</span> </em>
												</td>
											</tr>
										</tbody>
									</logic:iterate>
								</logic:notEmpty>
							</table>
						</div>
					</div>

					<div class="bm bw0 pgs cl">
						<a id="newspecialtmp" title="发新帖"
							href="${ctx }/job/jobBbs_posts.jsp"> <img alt="发新帖"
								src="${ctx }/images/jobBbs/pn_post.png"> </a>
						<p class="pg11" style="float: right;">
							<!-- 分页区 -->
							${toolsMenu }
						</p>
					</div>
				</form>
			</div>

			<!--右侧sied结束-->
			<div class="clearfloat"></div>
			<!--清除浮动-->
		</div>
		<jsp:include page="/commons/msbottom.jsp" />
	</body>
</html>