<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
	<%@ include file="/commons/taglibs.jsp"%>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>广发证券</title>
		<link href="${ctx }/css/global.css" rel="stylesheet" type="text/css" />
		<link href="${ctx }/css/wsyyt/wsyyt.css" rel="stylesheet"
			type="text/css" />
		<script src="${ctx }/js/setTab.js"></script>
		<script src="${ctx }/js/csswebutf.js"></script>
	</head>
	<style type="text/css">
		.product_ml {
			height:22px; 
			line-height:22px; 
			margin-bottom:5px; 
			text-indent:21px;
		}
		.product_ml_red {
			height:22px; 
			line-height:22px; 
			margin-bottom:5px; 
			text-indent:21px;
		}
		.dym_tmp{
			font-weight: bold;
    		padding: 2px;
    		width: 189px;
		}
		.product_ml a {color:#999; cursor:default;}
		.product_ml img{filter:gray; -moz-opacity:.1;opacity:0.1;}
	</style>
	<body class="">
		<jsp:include page="/share/top.jsp?nav=wsyyt&nav1=wdlczx"/>
		<div class="body_bg">
			<jsp:include page="/share/pdLogin.jsp" />
			<div class="main">
				<div class="dqwz">
					当前位置：<a href="/index.html">首页</a> > <a href="/bussinesshall/index.jsp?nav=wsyyt">网上营业厅</a> > <a href="/bussinesshall/financingCzh.jsp">我的理财中心</a> >
					<a href="${ctx }/tcsswebFwcpcxAction.do?method=getTcsswebFwcpcxListByAccount">我的管家资讯</a>
				</div>
				<jsp:include
					page="/bussinesshall/movetradehall/financing_submenu.jsp">
					<jsp:param name="nav3" value="gdgjzx" />
				</jsp:include>
				<div class="blank5"></div>
			</div>
			<div class="wrap_2left">
				<!--左侧sied开始-->
				<div class="w210 fleft ptb9">
					<div class="iptvside_top"></div>
					<div class="iptvside_mid">
						<table width="189" align="center" border="0" cellpadding="0"
							cellspacing="0" bgcolor="#ffffff">
							<tr>
								<td align="center">
									<img src="${ctx }/pic/Subscribe/lban1.jpg" />
								</td>
							</tr>
							<tr>
								<td class="dyInfo">
									尊敬的==${data.service_name }==：
									<br />
									您好，您目前的级别为
									<span class="red">${data.level_name }</span> 客户，享受的套餐为${data.package_name }。
									<p>
										<img src="${ctx }/pic/Subscribe/dot4.gif" align="absmiddle" />
										<span class="red"><a
											href="${ctx }/Subscribe/jgjInfo.jsp" target="_blank">金管家资讯套餐服务介绍</a>
										</span>
									</p>
								</td>
							</tr>
							<tr>
								<td class="wdlc_ltag1 white">
									<a href="#">您的专属管家资讯</a>
								</td>
							</tr>
							<tr>
								<td>
									<div class="blank5"></div>
									<div class="dym1">
										==${data.package_name }==
									</div>
									<!-- 对栏目进行遍历 -->
									<c:forEach var="item" items="${menuList}" varStatus="status">
										<div class="blank10"></div>
										<div id="fd${status.index}" class="dym_tmp" onclick="wdycp('fd${status.index}', 1, '','','');">
											<img id="imgfd${status.index }1" align="absmiddle" src="/pic/Subscribe/sidep2.jpg"/>
											<a href="#">${item.name }</a>
										</div>
										<ul id="fd${status.index }ss1" class="dym3" style="display: none">
											<!-- 对产品进行遍历 -->
											<c:forEach var="pitem" items="${productList}">
												
												<c:if test="${pitem.cpml == item.id}" >
													<c:choose>
														<c:when test="${fn:contains(pitem.package_ids, data.package_id)}">
															<p class="product_ml_red">
																<img src="/pic/msindex/list_01.gif">
																<a onclick="openlistcms(${pitem.product_id});" href="#">${pitem.product_name }</a>
															</p>
														</c:when>
														<c:otherwise>
															<p class="product_ml">
																<img src="/pic/msindex/list_01.gif">
																<a  style="cursor:default;" onclick="nopt();" href="#">${pitem.product_name }</a>
															</p>
														</c:otherwise>
													</c:choose>
												</c:if>
											</c:forEach>
										</ul>
									</c:forEach>
																			
									<!-- 广发研究报告  由于分目录、摘要、内容，以最大的权限去处理product_id -->
									<div class="blank10"></div>
									<div id="fd100" class="dym_tmp" onclick="wdycp('fd100', 1, '','','');">
										<img id="imgfd1001" align="absmiddle" src="/pic/Subscribe/sidep2.jpg"/>
										<a href="#">广发研究报告</a>
									</div>
									<ul id="fd100ss1" class="dym3" style="display: none">
										<c:choose>
											<c:when test="${fn:length(data.gfyjbg_prodcutid) == 0}">
												<p class="product_ml"><img src="/pic/msindex/list_01.gif"><a href="#" onclick="nopt();" >公司类研究报告</a></p>
												<p class="product_ml"><img src="/pic/msindex/list_01.gif"><a href="#" onclick="nopt();" >宏观类研究报告</a></p>
												<p class="product_ml"><img src="/pic/msindex/list_01.gif"><a href="#" onclick="nopt();" >市场策略研究<</a></p>
												<p class="product_ml"><img src="/pic/msindex/list_01.gif"><a href="#" onclick="nopt();" >行业研究报告</a></p>
												<p class="product_ml"><img src="/pic/msindex/list_01.gif"><a href="#" onclick="nopt();" >债券研究报告</a></p>
												<p class="product_ml"><img src="/pic/msindex/list_01.gif"><a href="#" onclick="nopt();" >衍生品市场报告</a></p>
												<p class="product_ml"><img src="/pic/msindex/list_01.gif"><a href="#" onclick="nopt();" >香港财经资讯</a></p>													
											</c:when>
											<c:otherwise>
												<p class="product_ml_red"><img src="/pic/msindex/list_01.gif"><a href="#" onclick="resetCartName(${data.gfyjbg_prodcutid},'zqyj_yjbg_gsyj','公司类研究报告','');" >公司类研究报告</a></p>
												<p class="product_ml_red"><img src="/pic/msindex/list_01.gif"><a href="#" onclick="resetCartName(${data.gfyjbg_prodcutid},'zqyj_yjbg_hgyj','宏观类研究报告','');" >宏观类研究报告</a></p>
												<p class="product_ml_red"><img src="/pic/msindex/list_01.gif"><a href="#" onclick="resetCartName(${data.gfyjbg_prodcutid},'zqyj_yjbg_scyj','市场策略研究','');" >市场策略研究<</a></p>
												<p class="product_ml_red"><img src="/pic/msindex/list_01.gif"><a href="#" onclick="resetCartName(${data.gfyjbg_prodcutid},'zqyj_yjbg_hyyj','行业研究报告','');" >行业研究报告</a></p>
												<p class="product_ml_red"><img src="/pic/msindex/list_01.gif"><a href="#" onclick="resetCartName(${data.gfyjbg_prodcutid},'zqyj_yjbg_gdsycy','债券研究报告','');" >债券研究报告</a></p>
												<p class="product_ml_red"><img src="/pic/msindex/list_01.gif"><a href="#" onclick="resetCartName(${data.gfyjbg_prodcutid},'zqyj_yjbg_yspyj','衍生品市场报告','');" >衍生品市场报告</a></p>
												<p class="product_ml_red"><img src="/pic/msindex/list_01.gif"><a href="#" onclick="resetCartName(${data.gfyjbg_prodcutid},'nbzx_xgcjzx','香港财经资讯','');" >香港财经资讯</a></p>													
											</c:otherwise>
										</c:choose>
									</ul>
									<!-- 基金看市 -->
									<div class="blank10"></div>
									<div id="fd600" class="dym_tmp" onclick="wdycp('fd600', 1, '','','');">
										<img id="imgfd6001" align="absmiddle" src="/pic/Subscribe/sidep2.jpg"/>
										<a href="#">基金看市</a>
									</div>
									<ul id="fd600ss1" class="dym3" style="display: none">
										<c:choose>
											<c:when test="${fn:length(data.jjks_prodcutid) == 0}">
												<p class="product_ml"><img src="/pic/msindex/list_01.gif"><a href="#" onclick="nopt();" >基金看市</a></p>
											</c:when>
											<c:otherwise>
												<p class="product_ml_red"><img src="/pic/msindex/list_01.gif"><a href="#" onclick="openlistcms(${data.jjks_prodcutid});" >基金看市</a></p>
											</c:otherwise>
										</c:choose>
									</ul>
									<!-- 第三方研究报告 -->
									<div class="blank10"></div>
									<div id="fd200" class="dym_tmp" onclick="wdycp('fd200', 1, '','','');">
										<img id="imgfd2001" align="absmiddle" src="/pic/Subscribe/sidep2.jpg"/>
										<a href="#">第三方研究报告</a>
									</div>
									<ul id="fd200ss1" class="dym3" style="display: none">
										<c:choose>
											<c:when test="${fn:length(data.dsfyjbg_prodcutid) == 0}">
												<p class="product_ml"><img src="/pic/msindex/list_01.gif"><a href="#" onclick="nopt();">公司研究</a></p>
												<p class="product_ml"><img src="/pic/msindex/list_01.gif"><a href="#" onclick="nopt();">行业研究</a></p>
												<p class="product_ml"><img src="/pic/msindex/list_01.gif"><a href="#" onclick="nopt();">股票市场</a></p>
												<p class="product_ml"><img src="/pic/msindex/list_01.gif"><a href="#" onclick="nopt();">基金市场</a></p>
												<p class="product_ml"><img src="/pic/msindex/list_01.gif"><a href="#" onclick="nopt();">债券市场</a></p>
												<p class="product_ml"><img src="/pic/msindex/list_01.gif"><a href="#" onclick="nopt();">金融工程</a></p>
												<p class="product_ml"><img src="/pic/msindex/list_01.gif"><a href="#" onclick="nopt();">宏观研究</a></p>
												<p class="product_ml"><img src="/pic/msindex/list_01.gif"><a href="#" onclick="nopt();">专题研究</a></p>
												<p class="product_ml"><img src="/pic/msindex/list_01.gif"><a href="#" onclick="nopt();">个股评级</a></p>
												<p class="product_ml"><img src="/pic/msindex/list_01.gif"><a href="#" onclick="nopt();">盈利预测</a></p>
												<p class="product_ml"><img src="/pic/msindex/list_01.gif"><a href="#" onclick="nopt();">最新投资评级</a></p>
												<p class="product_ml"><img src="/pic/msindex/list_01.gif"><a href="#" onclick="nopt();">机构股票池</a></p>
												<p class="product_ml"><img src="/pic/msindex/list_01.gif"><a href="#" onclick="nopt();" >评级调高个股</a></p>
												<p class="product_ml"><img src="/pic/msindex/list_01.gif"><a href="#" onclick="nopt();" >中国首席财经<</a></p>
												<p class="product_ml"><img src="/pic/msindex/list_01.gif"><a href="#" onclick="nopt();" >首席证券内参</a></p>
												<p class="product_ml"><img src="/pic/msindex/list_01.gif"><a href="#" onclick="nopt();" >高层决策参考</a></p>
												<p class="product_ml"><img src="/pic/msindex/list_01.gif"><a href="#" onclick="nopt();" >创业板</a></p>	
											</c:when>
											<c:otherwise>
												<p class="product_ml_red"><img src="/pic/msindex/list_01.gif"><a href="#" onclick="resetCartNameVip(${data.dsfyjbg_prodcutid},'01','公司研究','');">公司研究</a></p>
												<p class="product_ml_red"><img src="/pic/msindex/list_01.gif"><a href="#" onclick="resetCartNameVip(${data.dsfyjbg_prodcutid},'02','公司研究','');">行业研究</a></p>
												<p class="product_ml_red"><img src="/pic/msindex/list_01.gif"><a href="#" onclick="resetCartNameVip(${data.dsfyjbg_prodcutid},'03','策略研究','');">策略研究</a></p>
												<p class="product_ml_red"><img src="/pic/msindex/list_01.gif"><a href="#" onclick="resetCartNameVip(${data.dsfyjbg_prodcutid},'04','公司研究','');">股票市场</a></p>
												<p class="product_ml_red"><img src="/pic/msindex/list_01.gif"><a href="#" onclick="resetCartNameVip(${data.dsfyjbg_prodcutid},'05','基金市场','');">基金市场</a></p>
												<p class="product_ml_red"><img src="/pic/msindex/list_01.gif"><a href="#" onclick="resetCartNameVip(${data.dsfyjbg_prodcutid},'06','债券市场','');">债券市场</a></p>
												<p class="product_ml_red"><img src="/pic/msindex/list_01.gif"><a href="#" onclick="resetCartNameVip(${data.dsfyjbg_prodcutid},'07','金融工程','');">金融工程</a></p>
												<p class="product_ml_red"><img src="/pic/msindex/list_01.gif"><a href="#" onclick="resetCartNameVip(${data.dsfyjbg_prodcutid},'08','宏观研究','');">宏观研究</a></p>
												<p class="product_ml_red"><img src="/pic/msindex/list_01.gif"><a href="#" onclick="resetCartNameVip(${data.dsfyjbg_prodcutid},'09','专题研究','');">专题研究</a></p>
												<p class="product_ml_red"><img src="/pic/msindex/list_01.gif"><a href="#" onclick="resetCartNameVipGgpj(${data.dsfyjbg_prodcutid},'','个股评级','');">个股评级</a></p>
												<p class="product_ml_red"><img src="/pic/msindex/list_01.gif"><a href="#" onclick="resetCartNameVipYlyc(${data.dsfyjbg_prodcutid},'','盈利预测','');;">盈利预测</a></p>
												<p class="product_ml_red"><img src="/pic/msindex/list_01.gif"><a href="#" onclick="resetCartNameVipZxtzpj(${data.dsfyjbg_prodcutid},'','最新投资评级','');">最新投资评级</a></p>
												<p class="product_ml_red"><img src="/pic/msindex/list_01.gif"><a href="#" onclick="resetCartNameVipJggpc(${data.dsfyjbg_prodcutid},'','最新投资评级','');">机构股票池</a></p>
												<p class="product_ml_red"><img src="/pic/msindex/list_01.gif"><a href="#" onclick="resetCartNameVipPjtggg(${data.dsfyjbg_prodcutid},'','最新投资评级','');" >评级调高个股</a></p>
												<p class="product_ml_red"><img src="/pic/msindex/list_01.gif"><a href="#" onclick="resetCartName(${data.dsfyjbg_prodcutid},'blcj_nbzx_zgsxcj','中国首席财经','');" >中国首席财经<</a></p>
												<p class="product_ml_red"><img src="/pic/msindex/list_01.gif"><a href="#" onclick="resetCartName(${data.dsfyjbg_prodcutid},'blcj_nbzx_sxzqcc','首席证券内参','');" >首席证券内参</a></p>
												<p class="product_ml_red"><img src="/pic/msindex/list_01.gif"><a href="#" onclick="resetCartName(${data.dsfyjbg_prodcutid},'blcj_nbzx_sxzqcc','高层决策参考','');" >高层决策参考</a></p>
												<p class="product_ml_red"><img src="/pic/msindex/list_01.gif"><a href="#" onclick="resetCartName(${data.dsfyjbg_prodcutid},'blcj_nbzx_cyb','创业板','');" >创业板</a></p>	
											</c:otherwise>
										</c:choose>
									</ul>
									
									<!-- 单独栏目的   ('广发期货报告','广发研究晨会纪要', '金管家专题报告', '金管家A股策略报告') -->
									<c:forEach var="item" items="${specialList}" varStatus="status">
										<div class="blank10"></div>
										<div id="fd500${status.index}" class="dym_tmp" onclick="wdycp('fd500${status.index}', 1, '','','');">
											<img id="imgfd500${status.index }1" align="absmiddle" src="/pic/Subscribe/sidep2.jpg"/>
											<a href="#">${item.product_name }</a>
										</div>
										<ul id="fd500${status.index }ss1" class="dym3" style="display: none">
											<!-- 对产品进行遍历 -->
											<c:forEach var="pitem" items="${spProductList}">
												<c:if test="${pitem.product_id == item.id}" >
													<c:choose>
														<c:when test="${fn:contains(pitem.package_ids, data.package_id)}">
															<p class="product_ml_red">
																<img src="/pic/msindex/list_01.gif">
																<a onclick="openlistcms(${pitem.product_id});" href="#">${pitem.product_name }</a>
															</p>
														</c:when>
														<c:otherwise>
															<p class="product_ml">
																<img src="/pic/msindex/list_01.gif">
																<a onclick="nopt();" href="#">${pitem.product_name }</a>
															</p>
														</c:otherwise>
													</c:choose>
												</c:if>
											</c:forEach>
										</ul>
									</c:forEach>
								</td>

							</tr>
						</table>


					</div>
					<div class="iptvside_bot"></div>
					<div class="blank10"></div>

				</div>
				<!--左侧sied结束-->

				<!--右侧sied开始-->
				<div class="w706 fright">
					<iframe id="prodCmsList" name="prodCmsList"
						src="${ctx }/Subscribe/prodtocmslist.jsp?productId=234"
						marginheight="0" marginwidth="0" frameborder="0" scrolling="no"
						width="100%" height="100%"></iframe>
				</div>
				<!--右侧sied结束-->
				<div class="clearfloat"></div>
				<!--清除浮动-->
			</div>
			<jsp:include page="/share/bottom.jsp" />

			<div class="winfix" id="msgview" style="display: none">
				<iframe src=""
					style="width: 345px; height: 0; top: 0px; left: 0px; position: absolute; visibility: inherit; z-index: -1;"
					frameborder=0></iframe>
				<div class="popTit" onmousedown="Effect.Mdrag('msgview',event)">
					<em><a href="#" onclick="Effect.openwin('msgview')"><img
								src="${ctx }/pic/Subscribe/dot4.jpg" /> </a> </em>公告
				</div>
				<div class="popCon">
					尊敬的金管家客户：
					<br />
					为了向您提供更全面、更精细的理财服务，广发证券于2011年8月隆重推出金管家资讯服务套餐（乐享套餐、优享套餐及尊享套餐）。您可以根据您的需求选择合适的资讯服务套餐。敬请关注。
					<br />
					金管家资讯服务套餐的推出，使客户您有机会获得金管家更高级别、更有价值的投资理财服务。具体套餐介绍、定制规则及方法请见金管家资讯套餐介绍（此处应将“金管家资讯套餐介绍”字体设置为链接状态）。为答谢您对金管家一直以来的支持与厚爱，广发证券已在广发网“网上营业厅——>我的管家资讯”栏目及网上交易软件资讯栏目根据您的级别为您自动匹配了对应的资讯套餐，若要获取更高级别的资讯套餐服务，您可以根据套餐定制规则选择升级定制套餐，并通过广发网“网上营业厅——>套餐定制查询”栏目查看套餐定制进度情况。详情请垂询开户营业部或拨打金管家专线95575。
					<br />
					感谢您的支持，让金管家与您共创美好未来。
					<br />

					<table width="97%" align="center">
						<tr>

							<td width="50%">
								&nbsp;
							</td>
							<td align="center">
								广发证券
								<br />
								2011年8月
							</td>
						</tr>

					</table>

				</div>
				<div class="popBot">
					<input name="" onclick="Effect.openwin('msgview');checktipsTo();" type="button" value="我知道了" class="popBtn1" />
						<input id="checktips" name="checktips" type="checkbox" value="1" />
						下次不再提示
					<iframe id="checktipsifra" name="checktipsifra" marginheight="0"
						marginwidth="0" frameborder="0" scrolling="no" width="0"
						height="0"></iframe>
				</div>
			</div>
			<div id="winmask" style="display: none"></div>
			<!-- 遮罩层 -->
				<script type="text/javascript">
					//广发研究报告
					function resetCartName(productId, whichCat, titleName, dv) {
						var url = "${ctx }/Subscribe/yjprodtocmslist.jsp";
						url = url + "?productId=" + productId;
						url = url + "&whichCat=" + whichCat + "&titleName="
								+ encodeURI(encodeURI(titleName));
						document.getElementById("prodCmsList").src = url;
					}
					//第三方研究报告
					function resetCartNameVip(productId, whichCat, titleName, dv) {
						var url = "${ctx }/vip.do?method=getJrsjGazxList2";
						url = url + "&productId=" + productId;
						url = url + "&whichCat=" + whichCat + "&titleName="
								+ encodeURI(titleName);
						document.getElementById("prodCmsList").src = url;
					}
					
					//第三方研究报告  个股评级
					function resetCartNameVipGgpj(productId, whichCat, titleName, dv) {
						var url = "${ctx }/vip.do?method=getJrsjGazxGgpjList2";
						url = url + "&productId=" + productId;
						document.getElementById("prodCmsList").src = url;
					}
					//第三方研究报告  盈利预测
					function resetCartNameVipYlyc(productId, whichCat, titleName, dv) {
						var url = "${ctx }/vip.do?method=getJrsjBgylycbList2";
						url = url + "&productId=" + productId;
						document.getElementById("prodCmsList").src = url;
					}
					
					//第三方研究报告  最新投资评级
					function resetCartNameVipZxtzpj(productId, whichCat, titleName, dv) {
						var url = "${ctx }/zxtzpj.do?method=getZxtzpjList2";
						url = url + "&productId=" + productId;
						document.getElementById("prodCmsList").src = url;
					}
					
					//第三方研究报告  机构股票池
					function resetCartNameVipJggpc(productId, whichCat, titleName, dv) {
						var url = "${ctx }/jggpc.do?method=getJggpcList2";
						url = url + "&productId=" + productId;
						document.getElementById("prodCmsList").src = url;
					}
					
					//评级最高个股
					function resetCartNameVipPjtggg(productId, whichCat, titleName, dv) {
						var url = "${ctx }/pjtggg.do?method=getPjtgggList2";
						url = url + "&productId=" + productId;
						document.getElementById("prodCmsList").src = url;
					}
					
					//最通用的（默认）
					function openlistcms(productId) {
						var url = "${ctx }/Subscribe/prodtocmslist.jsp";
						url = url + "?productId=" + productId;
						document.getElementById("prodCmsList").src = url;
					}
				
					function wdycp(obj, num, sum, class1, class2) {
						var str = obj + "ss" + num;
						if (document.getElementById(obj + "ss" + num) != null) {
							if (document.getElementById(obj + "ss" + num).style.display == "block") {
								document.getElementById("img" + obj + num).src = "${ctx }/pic/Subscribe/sidep2.jpg";
								document.getElementById(obj + "ss" + num).style.display = "none";
							} else {
								document.getElementById("img" + obj + num).src = "${ctx }/pic/Subscribe/sidep1.jpg";
								document.getElementById(obj + "ss" + num).style.display = "block";
							}
						}
				
					}
				
					function checktipsTo() {
						if (document.getElementById("checktips").checked) {
							var url = "${ctx }/Subscribe/tips.jsp";
							document.getElementById("checktipsifra").src = url;
						}
					}
				
					function nopt() {
						alert("您没有权限查看该栏目下面的产品，请尽快升级。如有疑问可以咨询您所在的营业部！");
					}
				</script>
		</div>
	</body>
	<script type="text/javascript"> 
var _aq = _aq || [];
_aq.push(['_setSiteId', 10001]);_aq.push(['_setCatalogId', 36]); _aq.push(['_trackPageview']); (function() {
var ga = document.createElement( 'script'); ga.type = 'text/javascript'; ga.async = true; ga.src='http://121.8.153.59:8080/stat/stat.js'; var s = document.getElementsByTagName( 'script')[0]; s.parentNode.insertBefore(ga, s); })();
</script>
</html>