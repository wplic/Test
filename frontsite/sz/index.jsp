<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>广发证券分公司</title>
		<script type="text/javascript" src="${ctx}/js/jsIfUtils.js"></script>

		<link href="${ctx}/css/branchcomp/index.css" rel="stylesheet"
			type="text/css" />
		<link href="${ctx}/css/branchcomp/socroll.css" rel="stylesheet"
			type="text/css" />
		<script src="${ctx}/js/branchcomp/socroll.js" type="text/javascript"></script>
		<script src="${ctx}/js/branchcomp/public.js" type="text/javascript"></script>
		<script src="${ctx }/js/jquery.js" type="text/javascript"></script>
		<script src="${ctx }/js/jquery.form.js" type="text/javascript"></script>
	</head>

	<body>
		<div id="top">
			<div class="logo_box">
				<div class="lit_logo">
					<img src="${ctx}/images/branchcomp/lit_logo.jpg" width="104"
						height="33" />
				</div>
				<a href="http://www.gf.com.cn"><img src="${ctx}/images/branchcomp/big_logo.jpg"
						width="165" height="44" />
				</a>
			</div>
		</div>

		<div id="dh_box">
			<div class="dh_lt"></div>
			<div class="dh_mid">
				<div class="dh_one" id="index">
					<a href="${ctx}/sz/index.html">首页</a>
				</div>
				<div class="dh_shu"></div>
				<div class="dh_unone" id="yingye" onmouseover="className='dh_one'"
					onmouseout="className='dh_unone'" >
					<a href="${ctx}/sz/yingye.jsp">营业部信息</a>
				</div>
				<div class="dh_shu"></div>
				<div class="dh_unone" id="yuye" onmouseover="className='dh_one'"
					onmouseout="className='dh_unone'">
					<a href="${ctx}/sz/yuye.jsp">预约开户</a>
				</div>

			</div>
			<div class="dh_rt"></div>

		</div>
		
		<div id="main_box">
			<table>
			<tr>
			<td>
			<div class="main_left">

				<div class="mnl_adbox">
					<div class="play" id="play">
						<ol>
							<li class="active">
								1
							</li>
							<li>
								2
							</li>
						</ol>
						<ul>
							<li>
								<a href="#"><img src="${ctx}/images/branchcomp/ad_1.jpg"
										alt="广发证券广告图1" /> </a>
							</li>
							<li>
								<a href="#"><img src="${ctx}/images/branchcomp/ad_2.jpg"
										alt="广发证券广告图2" /> </a>
							</li>
						</ul>
					</div>
					<!--<img src="imgs/ad_1.jpg" width="680" height="287" /><img src="imgs/ad_2.jpg" width="680" height="287" style="display:none;" />-->
				</div>
				<div class="mnl_news">
			
					<div class="mnl_newtit">
						<div class="mnl_selone" onmouseover="pdis(0)" name=ptit id=ptit>
							营业部动态
						</div>
						<div class="mnl_unselone" onmouseover="pdis(1)" name=ptit id=ptit>
							广发动态
						</div>
						<div class="mnl_unselone" onmouseover="pdis(2)" name=ptit id=ptit>
							财经要闻
						</div>
					</div>

					<div class="mnl_conlist" id=psKey name=psKey style="display: ;">
						<div id="div_yingyedt">
						<jsp:include page='${ctx}/sz/yingyedt.jsp'></jsp:include>
						</div>
					</div>

					<div class="mnl_conlist" id=psKey name=psKey style="display: none;">
						<div id="div_gfdt">
							<jsp:include page='${ctx}/sz/gfdt.jsp'></jsp:include>
						</div>
					</div>


					<div class="mnl_conlist" id=psKey name=psKey style="display: none;">
						<div id="div_gncj">
							<jsp:include page='${ctx}/sz/gncj.jsp'></jsp:include>
						</div>
					</div>
				</div>

				<div class="mnl_yingyebox">

					<div class="mnl_yytit">
						营业部信息
					</div>
					<div class="mnl_yycontent">

						<c:forEach var="department" items="${departments}" varStatus="status">
							<c:if test="${status.index % 2 == 0}">
								<div class="mnl_yyone" style="border-bottom: none;">
							</c:if>

							<dl style="float: right;">
								<dt>
									<a href="${contextPath }/sz/yingye.jsp?indexp=${status.index }&departmentId=<c:out value="${department.id }" />"
										title="<c:out value="${department.deptName }" />"><c:out value="${department.deptName }" /></a>
								</dt>
								<dd>
									<img src="${ctx}/images/branchcomp/yy_piao.jpg" width="14"
										height="14" align="absmiddle" />
									咨询电话：
									<c:out value="${department.deptPhone }" />
								</dd>
							</dl>
							<c:if test="${status.index % 2 != 0}">
								</div>
							</c:if>
							
					    </c:forEach>
				    </div>
			</div>
		</div>
		</td>
		
		<td>
		<div class="main_right">

			<div class="mnr_jiao">
				<div style="background:url(${contextPath }/images/branchcomp/jl_img1.jpg) no-repeat;height:83px;width:208px;">
					<div id="BDBridgeFixedWrap"></div>				
				</div>
				<a href="${ctx}/sz/yuye.jsp"><img
						src="${contextPath }/images/branchcomp/yuyo_img.jpg" width="208"
						height="83" />
				</a>
				<jsp:include page="${ctx}/sz/dmangers.jsp"></jsp:include>
			</div>
			
			

			<div class="mnr_gupiao">

				<!--外部数据 -->
				<table border="0" cellspacing="0" cellpadding="0" width="185">
					<tr>
						<td class="hq_hov red bold" width="62">
							大盘行情
						</td>
						<td class="hq_a">
							&nbsp;
						</td>
					</tr>
				</table>
				<div class="blank5"></div>

				<table border="0" cellspacing="0" cellpadding="0" width="185">
					<tr>
						<td width="185">

							<iframe
								src="http://flash.gf.com.cn/indexes/indexes.php?width=180&height=141"
								id="hqIframes" name="hqIframes" marginWidth="0" marginHeight="0"
								frameBorder="0" noresize width="100%" scrolling="no"></iframe>
						</td>
					</tr>
				</table>
				<div class="blank5"></div>
				<table border="0" cellspacing="0" cellpadding="0" width="185">
					<tr>
						<td class="hq_hov red bold" width="62" id="tagdp1"
							onmouseover="SwitchNews('dp', 1, 2,'hq_hov red bold','hq_a bold')">
							<a href="${contextPath }/infoCenter/future.jsp?nav=zxzx&nav1=qh">全球股指</a>
						</td>
						<td class="hq_a bold" width="62" id="tagdp2"
							onmouseover="SwitchNews('dp', 2, 2,'hq_hov red bold','hq_a bold')">
							<a href="${contextPath }/infoCenter/future.jsp?nav=zxzx&nav1=qh">全球期货</a>
						</td>
						<td class="hq_a">
							&nbsp;
						</td>
					</tr>
				</table>
				<div class="blank5"></div>
				<div id="dp1">
					<jsp:include page="/share/indexHqgz.jsp" />
				</div>
				<div id="dp2" style="display: none">
					<jsp:include page="/share/tbbList.jsp">
						<jsp:param name="whichCat" value="cjzx_qh_gzqhxw" />
						<jsp:param name="showSize" value="4" />
						<jsp:param name="titleWidth" value="20" />
					</jsp:include>
				</div>


				<!--end外部数据 -->


			</div>

		</div>
		</td></tr></table>
		</div>
		<div id="bottom_bg">
   <div class="bottomfont">[ICP 备案登记证编号：粤ICP备11070729号] 　广发证券股份有限公司版权所有 Copyright © 2000-2012 All Rights Reserved.</div>
   <div class="btm_web"><img src="${contextPath }/images/branchcomp/depend_wet.jpg" width="128" height="47" style="float:right;" /><img src="${contextPath }/images/branchcomp/police.jpg" width="39" height="47" /></div>
</div>
		<script type="text/javascript">
var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F82dc9bf3206b62ad7a8e0de3597a5409' type='text/javascript'%3E%3C/script%3E"));
</script>
	</body>
</html>
