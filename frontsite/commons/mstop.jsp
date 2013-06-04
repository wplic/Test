<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
	<title>广发证券</title>
	<link rel="stylesheet" type="text/css" href="${contextPath }/css/basic_new.css" media="all" />
	<link rel="stylesheet" type="text/css" href="${contextPath }/css/index_new.css" media="all" />
	<script type="text/javascript" src="${contextPath }/js/jquery-1.3.2.min.js"></script>
	<script type="text/javascript" src="${contextPath }/js/common.js"></script>
	<script type="text/javascript">
		function changeLoginLj(){
		  var loginType=document.getElementById("selectLj").value;
		  window.open(loginType);
		}
</script>	
	<!-- 4月21日为全国哀悼日，将网站变灰。
	为方便站点哀悼，特提供css滤镜代码，以表哀悼。以下为全站CSS代码。 -->
<!-- <style>
html{filter:progid:DXImageTransform.Microsoft.BasicImage(grayscale=1);}
</style>
 -->
</head>
<body>
	 <div style="width:982px; margin:0 auto 0;">
		<div class="phd mb10">
			<div class="logoBar clearfix">
				<div class="logo fl"><a href="${contextPath }/default.html" title="广发证券">广发证券</a></div>
				
				<div class="toolMenu fl">
						<div class="topMsg mb10">
							<div class="weibo fl">
								<a class="sina db" href="http://weibo.com/gfsecurities/"
									target="_Blank" title="新浪微博">关注</a>
								<a class="tencent db" href="http://t.qq.com/gfsecurities"
									target="_Blank" title="腾讯微博">关注</a>
							</div>
							<!-- weibo -->

							<div class="xglink fl">
								<p class="tr par15">
									<select name="selectLj" id="selectLj"
										onchange="changeLoginLj();">
										<option value="#">
											子公司网站
										</option>
										<option value="http://www.gfgroup.com.hk/index.shtml">
											广发控股(香港)
										</option>
										<option value="http://www.gfqh.com.cn/">
											广发期货
										</option>
										<option value="http://www.gffunds.com.cn/">
											广发基金
										</option>
										<option value="http://www.gfinvestment.cn">
											广发信德
										</option>
									</select>
								</p>
							</div>
							<div class="en fl">
								<a href="${contextPath }/en/index.html"><font color="#225C85">English</font></a>
							</div>
							<div class="subLogo fl" title="返回广发网">
								<a href="${contextPath }/default.html">返回广发网</a>
							</div>
						</div>
						<!-- topMsg -->
						<div class="clear"></div>
						<div class="site" style="padding-left: 0px;">
							<a href="http://store.gf.com.cn/" style="background: url('../pic/gf_store.png') no-repeat;margin-top: -12px;width: 140px;height: 35px;" target="_blank" 
								title="广发证券金融超市">
							</a>
							<a href="${contextPath }/gyjj/index.jsp" target="_Blank"
								title="广发证券社会公益基金">广发证券社会公益基金</a>
							<a href="http://20.gf.com.cn/gf20/index.xhtml" target="_Blank"
								title="广发证券20周年网站">广发证券20周年网站</a>
						</div>
					</div> <!-- toolMenu -->
			</div>

			<ul class="phdNav" id="phdNav">
				<li class="nav1">
					<a href="http://www.gf.com.cn/index.html" title="证券交易">证券交易</a>
					
				</li>
				<li class="nav2"><a href="${contextPath }/assetManage/index.html" title="资产管理">资产管理</a>
					<div class="subNav">
						<ul class="clearfix">
							<li><a href="${contextPath }/assetManage/assetInfo.html"><span>业务概况</span></a></li>
							<li><a href="${contextPath }/assetManage/gatherFinancing.html"><span>集合产品</span></a></li>
							<li><a href="${contextPath }/assetManage/bearingFinancing.html"><span>定向产品</span></a></li>
							<li><a href="${contextPath }/assetManage/starManage.html"><span>投资团队</span></a></li>
							<li><a href="${contextPath }/assetManage/specialFinancial.html"><span>专项产品</span></a></li>
							<li><a href="${contextPath }/assetManage/mtbd.jsp"><span>动态信息</span></a></li>
							<li><a href="${contextPath }/assetManage/fwnr.jsp"><span>客户服务</span></a></li>
							<li><a href="${contextPath }/assetManage/lczx.jsp"><span>理财资讯</span></a></li>
							<li><a href="${contextPath }/assetManage/spxx.jsp?code=spxx"><span>视频学习</span></a></li>
							<li><a href="${contextPath }/sunnyPOF/login.jsp"><span>阳光私募</span></a></li>
							<li><a href="${contextPath }/assetManage/contactUs.html"><span>联系我们</span></a></li>
							<li><a href="${contextPath }/goldMoney.do?method=showMainGold"><span>金&nbsp;快&nbsp;线&nbsp;&nbsp;&nbsp;</span></a></li>
							<!--<li><a href="${contextPath }/assetManage/gatherFinancingXjhcp.html"><span>小集合产品</span></a></li>-->
				</ul>
						<div class="bottom"></div>
					</div>
				</li>
				
				<li class="nav3"><a href="${contextPath }/stockResearch/index.html" title="证券研究">证券研究</a>
				<div class="subNav">
						<ul class="clearfix">
							
							<li><a href="${contextPath}/stockResearch/researchInfo.html"><span>研发动态</span></a></li>
							<li><a href="${contextPath}/stockResearch/researchSell.jsp"><span>销售服务</span></a></li>
							<li><a href="${contextPath}/stockResearch/resrarchReport.html"><span>研究资讯</span></a></li>
							<li><a href="${contextPath}/stockResearch/contactUs.jsp"><span>联系我们</span></a></li>
							<li><a href="${contextPath}/stockResearch/departmentsInfo.jsp"><span>发展研究中心简介</span></a></li>
						
					</ul>
						<div class="bottom"></div>
					</div>		
					</li>
				<li class="nav4"><a href="${contextPath }/investmentBank/index.html" title="投资银行">投资银行</a>
				<div class="subNav">
						<ul class="clearfix">
						<li><a href="${contextPath}/investmentBank/affiche.html"><span>发行公告</span></a></li>
						<li><a href="${contextPath}/investmentBank/teamConcept.html"><span>团队理念</span></a></li>
						<li><a href="${contextPath}/investmentBank/organise.html"><span>组织结构</span></a></li>
						<li><a href="${contextPath}/investmentBank/business.html"><span>业务概况</span></a></li>
						<li><a href="${contextPath}/investmentBank/feat.html"><span>辉煌业绩</span></a></li>
						<li><a href="${contextPath}/investmentBank/typicalCase.html"><span>典型案例</span></a></li>
						<li><a href="${contextPath}/investmentBank/contactUs.html"><span>联系我们</span></a></li>
						</ul>
						<div class="bottom"></div>
					</div>					
						</li>
				<li class="nav5"><a href="${contextPath }/financing/index.html" title="融资融券">融资融券</a>
				<div class="subNav">
						<ul class="clearfix">
					<li><a href="${contextPath }/financing/basicKnowledge.html"><span>投资者学苑</span></a></li>
					<li><a href="${contextPath }/financing/rateNotice.html"><span>公告信息</span></a></li>
					<li><a href="${contextPath }/financing/businessProcess.html"><span>业务流程</span></a></li>
					<li><a href="${contextPath }/financing/lawsStatute.html"><span>法律法规</span></a></li>
					<li><a href="${contextPath }/financing/faq.html"><span>常见问题</span></a></li>
					<li><a href="${contextPath }/front/softInfo.do?method=getSoftListByCategoryId&tabtagsId=5&category_id=500"><span>软件下载</span></a></li>
					<li><a href="${contextPath }/financing/zqhg/zqhg.jsp"><span>债券回购</span></a></li>
				</ul>
						<div class="bottom"></div>
						</div>
				</li>
			</ul> <!-- phdNav -->
			<div class="phdsubNav">
						<a href="${contextPath}/about/aboutUs.html" title="关于广发">关于广发</a>
						<a href="${contexPath }/business/businessIntro.html" title="业务介绍">业务介绍</a>
						<a href="${contexPath }/job/index.html" title="人才招聘">人才招聘</a>
						<a href="${contexPath }/investorNexus/stockInfo.jsp" title="投资者关系">投资者关系</a>
						<a href="${contexPath }/gyjj/index.jsp" title="广发社会公益基金">广发社会公益基金</a>
						<a href="${contexPath }/infoCenter/fundCompany.html" title="基金超市">基金超市</a>
						<a href="${contexPath }/golden/index.html" title="金管家服务">金管家服务</a>
						<a href="${contexPath }/bussinesshall/iptv/iptv.html" title="财富频道">财富频道</a>
						<a href="${contexPath }/bussinesshall/95575.html" title="95575">95575</a>
				
			</div>
		</div>
	</div>
		</body>
