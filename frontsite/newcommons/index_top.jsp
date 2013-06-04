<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
	<title>广发证券</title>
	<link rel="stylesheet" type="text/css" href="${contextPath }/css/basic_new.css" media="all" />
	<link rel="stylesheet" type="text/css" href="${contextPath }/css/index_new.css" media="all" />
	<script type="text/javascript" src="${contextPath }/js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="${contextPath }/js/common.js"></script>	
</head>
<body>
	 <div style="width:982px; margin:0 auto 0;">
		<div class="phd mb10">
			<div class="logoBar clearfix">
				<div class="logo fl"><a href="${contextPath }/default.html" title="logo">广发证券</a></div>
				
				<div class="toolMenu fl">
					<div class="topMsg mb10">
						<div class="weibo fl">
							<a class="sina db" href="http://weibo.com/gfsecurities/" target="_Blank" title="新浪微博">关注</a>
							<a class="tencent db" href="http://t.qq.com/gfsecurities" target="_Blank" title="腾讯微博">关注</a>
						</div> <!-- weibo -->

						<div class="xglink fl">
								<div class="FA_sel">
									<div class="FA_selVal"><span class="txt">-- 集团相关网站 --</span></div>
									<ul class="FA_selOpt xglink_sel">
										<li><a href="http://www.gfgroup.com.hk/index.shtml" target="_blank">广发控股(香港)</a></li>
										<li><a href="http://www.gfqh.com.cn/" target="_blank">广发期货</a></li>
										<li><a href="http://www.gffunds.com.cn/" target="_blank">广发基金</a></li>
										<li><a href="http://www.gfinvestment.cn/" target="_blank">广发信德</a></li>
									</ul>
								</div>
						 </div>						
					
						<div class="subLogo fl"><a href="${contextPath }/default.html">返回广发展</a></div>
					</div> <!-- topMsg -->
					<div class="clear"></div>
					<div class="site">
						<a href="${contextPath }/gyjj/index.jsp" target="_Blank" title="广发证券社会公益基金">广发证券社会公益基金</a>
						<a href="http://20.gf.com.cn/gf20/index.xhtml" target="_Blank" title="广发证券20周年网站">广发证券20周年网站</a>
					</div>
				</div> <!-- toolMenu -->
			</div>

			<ul class="phdNav" id="phdNav">
				<li class="nav1 hover">
					<a href="#" title="证券交易">证券交易</a>
					<ul>
						<li><a href="${contextPath}/about/aboutUs.html" title="关于广发">关于广发</a></li>
						<li><a href="${contexPath }/business/businessIntro.html" title="业务介绍">业务介绍</a></li>
						<li><a href="${contexPath }/job/index.html" title="人才招聘">人才招聘</a></li>
						<li><a href="${contexPath }/investorNexus/stockInfo.html" title="投资者关系">投资者关系</a></li>
						<li><a href="${contexPath }/gyjj/index.jsp" title="广发社会公益基金">广发社会公益基金</a></li>
						<li><a href="${contexPath }/infoCenter/fundCompany.html" title="基金超市">基金超市</a></li>
						<li><a href="${contexPath }/golden/index.html" title="金管家服务">金管家服务</a></li>
						<li><a href="${contexPath }/bussinesshall/iptv/iptv.html" title="财富频道">财富频道</a></li>
						<li><a href="${contexPath }/bussinesshall/95575.html" title="95575">95575</a></li>
					</ul>
				</li>
				<li class="nav2"><a href="${contextPath }/assetManage/index.html" title="资产管理">资产管理</a>
					<ul>
							<li><a href="${contextPath }/assetManage/assetInfo.html"><span>业务概况</span></a></li>
							<li><a href="${contextPath }/assetManage/gatherFinancing.html"><span>集合产品</span></a></li>
							<li><a href="${contextPath }/assetManage/bearingFinancing.html"><span>定向产品</span></a></li>
							<li><a href="${contextPath }/assetManage/gatherFinancingXjhcp.html"><span>小集合产品</span></a></li>
							<li><a href="${contextPath }/assetManage/starManage.html"><span>投资团队</span></a></li>
							<li><a href="${contextPath }/assetManage/specialFinancial.html"><span>专项产品</span></a></li>
							<li><a href="${contextPath }/assetManage/mtbd.jsp"><span>动态信息</span></a></li>
							<li><a href="${contextPath }/assetManage/fwnr.jsp"><span>客户服务</span></a></li>
							<li><a href="${contextPath }/assetManage/lczx.jsp"><span>理财资讯</span></a></li>
							<li><a href="${contextPath }/assetManage/spxx.jsp?code=spxx"><span>视频学习</span></a></li>
							<li><a href="${contextPath }/sunnyPOF/login.jsp"><span>阳光私募</span></a></li>
							<li><a href="${contextPath }/assetManage/contactUs.html"><span>联系我们</span></a></li>
						
					</ul>
				</li>
				
				<li class="nav3"><a href="${contextPath }/stockResearch/index.html" title="证券研究">证券研究</a>
				<ul>
							<li><a href="${contextPath}/stockResearch/departmentsInfo.jsp"><span>发展研究中心简介</span></a></li>
							<li><a href="${contextPath}/stockResearch/researchInfo.html"><span>研发动态</span></a></li>
							<li><a href="${contextPath}/stockResearch/researchSell.jsp"><span>销售服务</span></a></li>
							<li><a href="${contextPath}/stockResearch/resrarchReport.html"><span>研究资讯</span></a></li>
							<li><a href="${contextPath}/stockResearch/contactUs.jsp"><span>联系我们</span></a></li>
						
					</ul>
					</li>
				<li class="nav4"><a href="${contextPath }/investmentBank/index.html" title="投资银行">投资银行</a>
				<ul>
						<li><a href="${contextPath}/investmentBank/affiche.html"><span>发行公告</span></a></li>
						<li><a href="${contextPath}/investmentBank/teamConcept.html"><span>团队理念</span></a></li>
						<li><a href="${contextPath}/investmentBank/organise.html"><span>组织结构</span></a></li>
						<li><a href="${contextPath}/investmentBank/business.html"><span>业务概况</span></a></li>
						<li><a href="${contextPath}/investmentBank/feat.html"><span>辉煌业绩</span></a></li>
						<li><a href="${contextPath}/investmentBank/typicalCase.html"><span>典型案例</span></a></li>
						<li><a href="${contextPath}/investmentBank/contactUs.html"><span>联系我们</span></a></li>
						</ul>
						</li>
				<li class="nav5"><a href="${contextPath }/financing/index.html" title="融资融券">融资融券</a>
				<ul>
					<li><a href="${contextPath }/financing/basicKnowledge.html"><span>投资者学苑</span></a></li>
					<li><a href="${contextPath }/financing/rateNotice.html"><span>公告信息</span></a></li>
					<li><a href="${contextPath }/financing/businessProcess.html"><span>业务流程</span></a></li>
					<li><a href="${contextPath }/financing/lawsStatute.html"><span>法律法规</span></a></li>
					<li><a href="${contextPath }/financing/faq.html"><span>常见问题</span></a></li>
					<li><a href="${contextPath }/front/softInfo.do?method=getSoftListByCategoryId&tabtagsId=5&category_id=500"><span>软件下载</span></a></li>
				</ul>
				</li>
			</ul> <!-- phdNav -->
		</div>
	</div>
		</body>
