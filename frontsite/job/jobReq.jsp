<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*"%>
<jsp:directive.page
	import="org.springframework.context.ApplicationContext" />
<jsp:directive.page
	import="org.springframework.web.context.support.WebApplicationContextUtils" />
<jsp:directive.page import="com.cssweb.hr.service.ThrPostInfoService" />
<jsp:directive.page import="com.cssweb.hr.pojo.HrUser" />
<jsp:directive.page import="java.util.List" />
<jsp:directive.page import="com.cssweb.hr.pojo.ThrPostInfo" />
<jsp:directive.page import="org.apache.commons.lang.StringUtils" />
<%@page import="com.cssweb.common.toDbLob.service.LobService"%>
<%@page import="com.cssweb.common.toDbLob.pojo.FileBlob"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<%@ include file="/commons/taglibs.jsp"%>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>广发证券</title>
		<link href="/css/style.css" rel="stylesheet" type="text/css" />
		<link href="/css/job/job.css" rel="stylesheet" type="text/css" />

	</head>
	<%
		ServletContext sc = this.getServletConfig().getServletContext();
		ApplicationContext ctx = WebApplicationContextUtils
				.getRequiredWebApplicationContext(sc);
		ThrPostInfoService thrPostInfoService = (ThrPostInfoService) ctx
				.getBean("thrPostInfoService");
		LobService lobService = (LobService) ctx.getBean("lobService");
		HrUser hrUser = (HrUser) request.getSession()
				.getAttribute("hrUser");
		String jobId = request.getParameter("jobId");
		if (StringUtils.isEmpty(jobId)) {
			out.print("参数传输错误");
			return;
		}

		ThrPostInfo bean = thrPostInfoService.getThrPostInfoById(Long
				.parseLong(jobId));
		String postdetail = bean.getPostDetail().replaceAll("<STRONG>",
				"<B>");
		postdetail = postdetail.replaceAll("</STRONG>", "</B>");
		bean.setPostDetail(postdetail);
		String postduty = bean.getPostDuty().replaceAll("<STRONG>", "<B>");
		postduty = postduty.replaceAll("</STRONG>", "</B>");
		bean.setPostDuty(postduty);

		pageContext.setAttribute("bean", bean);
	%>
	<body class="ggjs_bg">
		<div class="ggjs_box">
			<div class="jobtcy_tt">
				<p>
					<a href="/default.jsp"><img src="${contextPath }/pic/logo.png" />
					</a>
				</p>
			</div>
			<div class="ggjs_line"></div>

			<div class="dqwz">
				<span class=" mr10 ml10">当前位置：首页 - 人才招聘 - 职位描述</span>
			</div>
			<div class="p15" align="center">
				<form action="${ctx }/hrUserAction.do?method=hrUserApply"
					method="post" name="hrForm">
					<input type="hidden" name="jobId" value="<%=jobId%>" />
					<table width="95%" border="0" class="lh25 textleft">
						<tr>
							<td width="13%" class="bold">
								岗位名称：
							</td>
							<td>
								<div id="postNameDiv">${bean.postName }（${bean.category }）</div>
							</td>
						</tr>
						<%if(bean.getCount()>0) {%>
							<tr>
								<td class="bold">
									空缺人数：
								</td>
								<td>
									<div id="countDiv">${bean.count }人</div>
								</td>
							</tr>
						<%} %>
						<tr>
							<td class="bold">
								工作地点：
							</td>
							<td>
								<div id="workPlaceDiv">${bean.workPlace }</div>
							</td>
						</tr>
						<tr>
							<td class="bold">
								岗位归属：
							</td>
							<td>
								${bean.type }-${bean.branchName }
							</td>
						</tr>
						<tr>
							<td class="bold">
								简历接收时间：
							</td>
							<td>
								<bean:write name="bean" property="startDate" format="yyyy-MM-dd" />
								至
								<bean:write name="bean" property="endDate" format="yyyy-MM-dd" />
							</td>
						</tr>
						<tr>
							<td valign="top" class="bold">
								岗位职责：
							</td>
							<td style="word-break: break-all">
								${bean.postDuty }
							</td>
						</tr>
						<tr>
							<td valign="top" class="bold">
								任职资格：
							</td>
							<td style="word-break: break-all">
								${bean.postDetail }
							</td>
						</tr>

						<tr>
							<td colspan="2">
								&nbsp;
							</td>
						</tr>
						<tr>
							<td valign="top" colspan="bold">
								岗位附件:
							</td>
							<td style="word-break: break-all">
								<%
									if (bean != null && bean.getFileId() != null) {

										FileBlob file = lobService.getFileBlobById(bean.getFileId());
										String fileName = "";
										if (file != null && file.getFileName() != null) {
											fileName = file.getFileName();
										}
								%>
								<a
									href="${ctx}/commons/showDocumentFile.jsp?id=<%=bean.getFileId()%>"><%=fileName%></a>

								<%
									} else {
								%>
								【无附件】
								<%
									}
								%>
							</td>
						</tr>
						<tr>
							<td colspan="2" style="padding-left: 100px" align="center">
								作为第一志愿申请&nbsp;
								<input type="radio" name="wish" id="wish1" value="1"
									checked="checked" />
								&nbsp;&nbsp;&nbsp;&nbsp; 作为第二志愿申请&nbsp;
								<input type="radio" name="wish" id="wish2" value="2" />
							</td>
						</tr>
						<tr>
							<td colspan="2" style="padding-left: 100px">
								<!-- JiaThis Button BEGIN -->
								<div class="jiathis_style">
									<span class="jiathis_txt">分享到：</span>
									<a class="jiathis_button_qzone"></a>
									<a class="jiathis_button_tsina"></a>
									<a class="jiathis_button_tqq"></a>
									<a class="jiathis_button_renren"></a>
									<a class="jiathis_button_kaixin001"></a>
									<a href="http://www.jiathis.com/share" class="jiathis jiathis_txt jtico jtico_jiathis" target="_blank"></a>
									<a class="jiathis_counter_style"></a>
								</div>
								<script type="text/javascript" src="http://v3.jiathis.com/code/jia.js?uid=1344011707407568" charset="utf-8"></script>
								<script>
									var str = "【广发证券】"+document.getElementById("postNameDiv").innerHTML+
												document.getElementById("countDiv").innerHTML+"，工作地点："+
												document.getElementById("workPlaceDiv").innerHTML;
									var jiathis_config = {
									 	title:str
									 }
								</script>
								<!-- JiaThis Button END -->
							</td>
						</tr>
					</table>

					<div align="center" class="mt10">
						<input name="input2" type="submit" class="but02 blue"
							value="应聘该职位" />
						&nbsp;&nbsp;
						<input name="input" type="button" class="but02 blue" value="关闭此页"
							onclick="javascript:window.opener=null;window.close();" />
					</div>
				</form>
			</div>
			<jsp:include page="/commons/msbottom2.jsp" />
		</div>

	</body>
</html>