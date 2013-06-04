<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<style>
.ibtab1{ border-collapse:collapse; border-spacing:0; font-size:12px; text-align:center}
.ibtab1 td{ height:20px; line-height:20px; border:1px solid #ccc}
</style>
</head>
<body>
<jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：首页 - 期货IB业务 - IB营业网点和人员公示</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft">
		<jsp:include page="FuturesIB_lmenu.jsp?nav2=ibwdhry" />
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w706 fright">
  		<div class="comtit1"><h4>广发证券IB网点及人员公示</h4></div>
    <div class="clearfloat h25"></div>
	<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="ibtab1">
      <tbody>
        <tr valign="middle"> 
          <td width="37"> <div align="center">序号</div></td>
          <td width="361"> <div align="center">网点名称</div></td>
          <td width="85"> <div align="center">负责人</div></td>
          <td width="95"> <div align="center">IB培训合格证号</div></td>
          <td width="77"> <div align="center">IB专职人员<span>1</span></div></td>
          <td width="104"> <div align="center">期货从业资格证号</div></td>
          <td width="93"> <div align="center">IB培训合格证号</div></td>
          <td width="77"> <div align="center">IB专职人员<span>2</span></div></td>
          <td width="104"> <div align="center">期货从业资格证号</div></td>
          <td width="107"> <div align="center">IB培训合格证号</div></td>
        </tr>
          <tr valign="middle">
		    <td> <div align="center">1</div></td>
		    <td> <div align="center">保定恒祥南大街营业部</div></td>
		    <td> <div align="center">孙开昆</div></td>
		    <td> <div align="center">2010-IB02556</div></td>
		    <td> <div align="center">蒋东云</div></td>
		    <td> <div align="center">F0233463</div></td>
		    <td> <div align="center">2010-IB01488</div></td>
		    <td> <div align="center">李庆铮</div></td>
		    <td> <div align="center">F0233464</div></td>
		    <td> <div align="center">2010-IB00793</div></td>
		</tr>
		<tr valign="middle">
		    <td> <div align="center">2</div></td>
		    <td> <div align="center">北京朝阳门北大街营业部</div></td>
		    <td> <div align="center">张艳容</div></td>
		    <td> <div align="center">2010-IB10602</div></td>
		    <td> <div align="center">周霁</div></td>
		    <td> <div align="center">F0233727</div></td>
		    <td> <div align="center">2010-IB09972</div></td>
		    <td> <div align="center">陈剑文</div></td>
		    <td> <div align="center">F0233725</div></td>
		    <td> <div align="center">2010-IB09068</div></td>
		</tr>
		<tr valign="middle">
		    <td> <div align="center">3</div></td>
		    <td> <div align="center">北京阜成门南大街营业部</div></td>
		    <td> <div align="center">游海洋</div></td>
		    <td> <div align="center">2010-IB08616</div></td>
		    <td> <div align="center">王晨岑鸟</div></td>
		    <td> <div align="center">F0234180</div></td>
		    <td> <div align="center">2010-IB01624</div></td>
		    <td> <div align="center">张琳</div></td>
		    <td> <div align="center">F0233723</div></td>
		    <td> <div align="center">2010-IB01753</div></td>
		</tr>
		<tr valign="middle">
		    <td> <div align="center">4</div></td>
		    <td> <div align="center">北京广安门内大街营业部</div></td>
		    <td> <div align="center">杨宝军</div></td>
		    <td> <div align="center">2010-IB08324</div></td>
		    <td> <div align="center">史更新</div></td>
		    <td> <div align="center">F0233729</div></td>
		    <td> <div align="center">2010-IB07057</div></td>
		    <td> <div align="center">刘捷</div></td>
		    <td> <div align="center">F0233730</div></td>
		    <td> <div align="center">2010-IB07181</div></td>
		</tr>
		<tr valign="middle">
		    <td> <div align="center">5</div></td>
		    <td> <div align="center">长春民康路营业部</div></td>
		    <td> <div align="center">李超</div></td>
		    <td> <div align="center">2010-IB02675</div></td>
		    <td> <div align="center">秦旭</div></td>
		    <td> <div align="center">F0251381</div></td>
		    <td> <div align="center">2010-IB01929</div></td>
		    <td> <div align="center">栗景顺</div></td>
		    <td> <div align="center">F0233346</div></td>
		    <td> <div align="center">2010-IB07796</div></td>
		</tr>
		<tr valign="middle">
		    <td> <div align="center">6</div></td>
		    <td> <div align="center">成都新光路营业部</div></td>
		    <td> <div align="center">李勤</div></td>
		    <td> <div align="center">2010-IB03756</div></td>
		    <td> <div align="center">杨威</div></td>
		    <td> <div align="center">F0233830</div></td>
		    <td> <div align="center">2010-IB01234</div></td>
		    <td> <div align="center">刘娟</div></td>
		    <td> <div align="center">F0235419</div></td>
		    <td> <div align="center">2010-IB07514</div></td>
		</tr>
		<tr valign="middle">
		    <td> <div align="center">7</div></td>
		    <td> <div align="center">东莞虎门营业部</div></td>
		    <td> <div align="center">李志文</div></td>
		    <td> <div align="center">2010-IB02439</div></td>
		    <td> <div align="center">杨煦林</div></td>
		    <td> <div align="center">F0233133</div></td>
		    <td> <div align="center">2010-IB01309</div></td>
		    <td> <div align="center">卢靖琳</div></td>
		    <td> <div align="center">F0233138</div></td>
		    <td> <div align="center">2010-IB04374</div></td>
		</tr>
		<tr valign="middle">
		    <td> <div align="center">8</div></td>
		    <td> <div align="center">东营济南路营业部</div></td>
		    <td> <div align="center">徐超平</div></td>
		    <td> <div align="center">2010-IB02064</div></td>
		    <td> <div align="center">夏抢友</div></td>
		    <td> <div align="center">F0233650</div></td>
		    <td> <div align="center">2010-IB00317</div></td>
		    <td> <div align="center">朱颖</div></td>
		    <td> <div align="center">F0250982</div></td>
		    <td> <div align="center">2010-IB00637</div></td>
		</tr>
		<tr valign="middle">
		    <td> <div align="center">9</div></td>
		    <td> <div align="center">广州环市东路营业部</div></td>
		    <td> <div align="center">左铸强</div></td>
		    <td> <div align="center">2010-IB08684</div></td>
		    <td> <div align="center">肖庆祥</div></td>
		    <td> <div align="center">F0235050</div></td>
		    <td> <div align="center">2010-IB07136</div></td>
		    <td> <div align="center">廖远军</div></td>
		    <td> <div align="center">F0235061</div></td>
		    <td> <div align="center">2010-IB06770</div></td>
		</tr>
		<tr valign="middle">
		    <td> <div align="center">10</div></td>
		    <td> <div align="center">广州黄埔大道营业部</div></td>
		    <td> <div align="center">韩昶</div></td>
		    <td> <div align="center">2010-IB02197</div></td>
		    <td> <div align="center">蔡雪辉</div></td>
		    <td> <div align="center">F0235047</div></td>
		    <td> <div align="center">2010-IB06665</div></td>
		    <td> <div align="center">谢志宇</div></td>
		    <td> <div align="center">F0235046</div></td>
		    <td> <div align="center">2010-IB01626</div></td>
		</tr>
		<tr valign="middle">
		    <td> <div align="center">11</div></td>
		    <td> <div align="center">广州农林下路营业部</div></td>
		    <td> <div align="center">刘炳锋</div></td>
		    <td> <div align="center">2010-IB02560</div></td>
		    <td> <div align="center">石伟平</div></td>
		    <td> <div align="center">F0237027</div></td>
		    <td> <div align="center">2010-IB07892</div></td>
		    <td> <div align="center">何子鹏</div></td>
		    <td> <div align="center">F0235064</div></td>
		    <td> <div align="center">2010-IB00710</div></td>
		</tr>
		<tr valign="middle">
		    <td> <div align="center">12</div></td>
		    <td> <div align="center">广州中山三路中华广场营业部</div></td>
		    <td> <div align="center">黄世平</div></td>
		    <td> <div align="center">2010-IB02170</div></td>
		    <td> <div align="center">吴婧</div></td>
		    <td> <div align="center">F0256943</div></td>
		    <td> <div align="center">2010-IB07842</div></td>
		    <td> <div align="center">陈樱</div></td>
		    <td> <div align="center">F0254358</div></td>
		    <td> <div align="center">2010-IB00879</div></td>
		</tr>
		<tr valign="middle">
		    <td> <div align="center">13</div></td>
		    <td> <div align="center">贵阳延安中路营业部</div></td>
		    <td> <div align="center">苏亚萍</div></td>
		    <td> <div align="center">2010-IB02497</div></td>
		    <td> <div align="center">吴克兢</div></td>
		    <td> <div align="center">F0233832</div></td>
		    <td> <div align="center">2010-IB03308</div></td>
		    <td> <div align="center">杨涛</div></td>
		    <td> <div align="center">F0233826</div></td>
		    <td> <div align="center">2010-IB00638</div></td>
		</tr>
		<tr valign="middle">
		    <td> <div align="center">14</div></td>
		    <td> <div align="center">哈尔滨清滨路营业部</div></td>
		    <td> <div align="center">金力</div></td>
		    <td> <div align="center">2010-IB02319</div></td>
		    <td> <div align="center">张长勇</div></td>
		    <td> <div align="center">F0233366</div></td>
		    <td> <div align="center">2010-IB07930</div></td>
		    <td> <div align="center">李笑容</div></td>
		    <td> <div align="center">F0233364</div></td>
		    <td> <div align="center">2010-IB07734</div></td>
		</tr>
		<tr valign="middle">
		    <td> <div align="center">15</div></td>
		    <td> <div align="center">海口和平大道营业部</div></td>
		    <td> <div align="center">陈卫红</div></td>
		    <td> <div align="center">2010-IB08708</div></td>
		    <td> <div align="center">顾冬琴</div></td>
		    <td> <div align="center">F0250995</div></td>
		    <td> <div align="center">2010-IB04387</div></td>
		    <td> <div align="center">周红菊</div></td>
		    <td> <div align="center">F0233114</div></td>
		    <td> <div align="center">2010－IB04386</div></td>
		</tr>
		<tr valign="middle">
		    <td> <div align="center">16</div></td>
		    <td> <div align="center">海口龙昆北路营业部</div></td>
		    <td> <div align="center">李君华</div></td>
		    <td> <div align="center">2010-IB03488</div></td>
		    <td> <div align="center">陈 玲</div></td>
		    <td> <div align="center">F0251000</div></td>
		    <td> <div align="center">2010-IB07406</div></td>
		    <td> <div align="center">黄雪花</div></td>
		    <td> <div align="center">F0250999</div></td>
		    <td> <div align="center">2010-IB07285</div></td>
		</tr>
		<tr valign="middle">
		    <td> <div align="center">17</div></td>
		    <td> <div align="center">杭州凤起路营业部</div></td>
		    <td> <div align="center">孙二召</div></td>
		    <td> <div align="center">2010-IB02113</div></td>
		    <td> <div align="center">谢德仙</div></td>
		    <td> <div align="center">F0233689</div></td>
		    <td> <div align="center">2010-IB04356</div></td>
		    <td> <div align="center">应晓琴</div></td>
		    <td> <div align="center">F0233691</div></td>
		    <td> <div align="center">2010-IB06683</div></td>
		</tr>
		<tr valign="middle">
		    <td> <div align="center">18</div></td>
		    <td> <div align="center">合肥长江中路营业部</div></td>
		    <td> <div align="center">刘正一</div></td>
		    <td> <div align="center">2010-IB03688</div></td>
		    <td> <div align="center">陈寅</div></td>
		    <td> <div align="center">F0234843</div></td>
		    <td> <div align="center">2010-IB03508</div></td>
		    <td> <div align="center">眭健</div></td>
		    <td> <div align="center">F0234844</div></td>
		    <td> <div align="center">2010-IB03042</div></td>
		</tr>
		<tr valign="middle">
		    <td> <div align="center">19</div></td>
		    <td> <div align="center">惠州下埔路营业部</div></td>
		    <td> <div align="center">郑文育</div></td>
		    <td> <div align="center">2010-IB02151</div></td>
		    <td> <div align="center">黄燕婷</div></td>
		    <td> <div align="center">F0233048</div></td>
		    <td> <div align="center">2010-IB00570</div></td>
		    <td> <div align="center">周家立</div></td>
		    <td> <div align="center">F0233126</div></td>
		    <td> <div align="center">2010-IB07515</div></td>
		</tr>
		<tr valign="middle">
		    <td> <div align="center">20</div></td>
		    <td> <div align="center">吉林市吉林大街营业部</div></td>
		    <td> <div align="center">冉煜</div></td>
		    <td> <div align="center">2010-IB08505</div></td>
		    <td> <div align="center">何颖</div></td>
		    <td> <div align="center">F0233330</div></td>
		    <td> <div align="center">2010-IB06775</div></td>
		    <td> <div align="center">张旗</div></td>
		    <td> <div align="center">F0233652</div></td>
		    <td> <div align="center">2010-IB06872</div></td>
		</tr>
		<tr valign="middle">
		    <td> <div align="center">21</div></td>
		    <td> <div align="center">锦州解放路营业部</div></td>
		    <td> <div align="center">郝战</div></td>
		    <td> <div align="center">2010-IB02524</div></td>
		    <td> <div align="center">朱丽红</div></td>
		    <td> <div align="center">F0233377</div></td>
		    <td> <div align="center">2010-IB04329</div></td>
		    <td> <div align="center">陈子衿</div></td>
		    <td> <div align="center">F0250596</div></td>
		    <td> <div align="center">2010-IB04055</div></td>
		</tr>
		<tr valign="middle">
		    <td> <div align="center">22</div></td>
		    <td> <div align="center">荆州北京路营业部</div></td>
		    <td> <div align="center">胡波</div></td>
		    <td> <div align="center">2010-IB08559</div></td>
		    <td> <div align="center">杜姗俐</div></td>
		    <td> <div align="center">F0235239</div></td>
		    <td> <div align="center">2010-IB06802</div></td>
		    <td> <div align="center">秦伟</div></td>
		    <td> <div align="center">F0234148</div></td>
		    <td> <div align="center">2010-IB06896</div></td>
		</tr>
		<tr valign="middle">
		    <td> <div align="center">23</div></td>
		    <td> <div align="center">开平曙光西路营业部</div></td>
		    <td> <div align="center">林琼笑</div></td>
		    <td> <div align="center">2010-IB08734</div></td>
		    <td> <div align="center">司徒翠花</div></td>
		    <td> <div align="center">F0250718</div></td>
		    <td> <div align="center">2010-IB07378</div></td>
		    <td> <div align="center">吴晓滨</div></td>
		    <td> <div align="center">F0233107</div></td>
		    <td> <div align="center">2010-IB01905</div></td>
		</tr>
		<tr valign="middle">
		    <td> <div align="center">24</div></td>
		    <td> <div align="center">兰州甘南路营业部</div></td>
		    <td> <div align="center">江涌</div></td>
		    <td> <div align="center">2010-IB02747</div></td>
		    <td> <div align="center">徐莹</div></td>
		    <td> <div align="center">F0234118</div></td>
		    <td> <div align="center">2010-IB04334</div></td>
		    <td> <div align="center">朱凌云</div></td>
		    <td> <div align="center">F0234119</div></td>
		    <td> <div align="center">2010-IB01235</div></td>
		</tr>
		<tr valign="middle">
		    <td> <div align="center">25</div></td>
		    <td> <div align="center">辽阳民主路营业部</div></td>
		    <td> <div align="center">陈德明</div></td>
		    <td> <div align="center">2010-IB02404</div></td>
		    <td> <div align="center">王东来</div></td>
		    <td> <div align="center">F0268824</div></td>
		    <td> <div align="center">2010-IB11171</div></td>
		    <td> <div align="center">孟祥月</div></td>
		    <td> <div align="center">F0233341</div></td>
		    <td> <div align="center">2010-IB01551</div></td>
		</tr>
		<tr valign="middle">
		    <td> <div align="center">26</div></td>
		    <td> <div align="center">梅州梅江二路营业部</div></td>
		    <td> <div align="center">晁广华</div></td>
		    <td> <div align="center">2010-IB04793</div></td>
		    <td> <div align="center">李敬浩</div></td>
		    <td> <div align="center">F0233902</div></td>
		    <td> <div align="center">2010-IB01936</div></td>
		    <td> <div align="center">吴勇辉</div></td>
		    <td> <div align="center">F0233910</div></td>
		    <td> <div align="center">2010-IB01843</div></td>
		</tr>
		<tr valign="middle">
		    <td> <div align="center">27</div></td>
		    <td> <div align="center">南京北京东路营业部</div></td>
		    <td> <div align="center">黄波</div></td>
		    <td> <div align="center">2010-IB01969</div></td>
		    <td> <div align="center">左婧</div></td>
		    <td> <div align="center">F0250989</div></td>
		    <td> <div align="center">2010-IB01755</div></td>
		    <td> <div align="center">周承军</div></td>
		    <td> <div align="center">F0234097</div></td>
		    <td> <div align="center">2010-IB04493</div></td>
		</tr>
		<tr valign="middle">
		    <td> <div align="center">28</div></td>
		    <td> <div align="center">南宁星湖路营业部</div></td>
		    <td> <div align="center">钱忠胜</div></td>
		    <td> <div align="center">2010-IB04814</div></td>
		    <td> <div align="center">李力</div></td>
		    <td> <div align="center">F0233145</div></td>
		    <td> <div align="center">2010-IB04422</div></td>
		    <td> <div align="center">赵军</div></td>
		    <td> <div align="center">F0233143</div></td>
		    <td> <div align="center">2010-IB04423</div></td>
		</tr>
		<tr valign="middle">
		    <td> <div align="center">29</div></td>
		    <td> <div align="center">宁波环城西路营业部</div></td>
		    <td> <div align="center">罗建维</div></td>
		    <td> <div align="center">2010-IB05116</div></td>
		    <td> <div align="center">朱文杰</div></td>
		    <td> <div align="center">F0233678</div></td>
		    <td> <div align="center">2010-IB05955</div></td>
		    <td> <div align="center">卢烈萍</div></td>
		    <td> <div align="center">F0233675</div></td>
		    <td> <div align="center">2010-IB06346</div></td>
		</tr>
		<tr valign="middle">
		    <td> <div align="center">30</div></td>
		    <td> <div align="center">清远新城中心市场营业部</div></td>
		    <td> <div align="center">何海波</div></td>
		    <td> <div align="center">2010-IB08300</div></td>
		    <td> <div align="center">张曼西</div></td>
		    <td> <div align="center">F0233112</div></td>
		    <td> <div align="center">2010-IB01908</div></td>
		    <td> <div align="center">黑晓林</div></td>
		    <td> <div align="center">F0233061</div></td>
		    <td> <div align="center">2010-IB00991</div></td>
		</tr>
		<tr valign="middle">
		    <td> <div align="center">31</div></td>
		    <td> <div align="center">泉州温陵路营业部</div></td>
		    <td> <div align="center">苏晖</div></td>
		    <td> <div align="center">2010-IB03675</div></td>
		    <td> <div align="center">郭慧兰</div></td>
		    <td> <div align="center">F0233646</div></td>
		    <td> <div align="center">2010-IB03109</div></td>
		    <td> <div align="center">李金火</div></td>
		    <td> <div align="center">F0233645</div></td>
		    <td> <div align="center">2010-IB02822</div></td>
		</tr>
		<tr valign="middle">
		    <td> <div align="center">32</div></td>
		    <td> <div align="center">汕头梅溪东路营业部</div></td>
		    <td> <div align="center">蔡泽愉</div></td>
		    <td> <div align="center">2010-IB02335</div></td>
		    <td> <div align="center">陈瑞瑜</div></td>
		    <td> <div align="center">F0234496</div></td>
		    <td> <div align="center">2010-IB00901</div></td>
		    <td> <div align="center">李志宏</div></td>
		    <td> <div align="center">F0234501</div></td>
		    <td> <div align="center">2010-IB01714</div></td>
		</tr>
		<tr valign="middle">
		    <td> <div align="center">33</div></td>
		    <td> <div align="center">上海西藏南路营业部</div></td>
		    <td> <div align="center">狄妮</div></td>
		    <td> <div align="center">2010-IB02557</div></td>
		    <td> <div align="center">刘佳</div></td>
		    <td> <div align="center">F0234521</div></td>
		    <td> <div align="center">2010-IB01410</div></td>
		    <td> <div align="center">陶晓明</div></td>
		    <td> <div align="center">F0234525</div></td>
		    <td> <div align="center">2010-IB01063</div></td>
		</tr>
		<tr valign="middle">
		    <td> <div align="center">34</div></td>
		    <td> <div align="center">韶关解放路营业部</div></td>
		    <td> <div align="center">钟国文</div></td>
		    <td> <div align="center">2010-IB02155</div></td>
		    <td> <div align="center">叶北京</div></td>
		    <td> <div align="center">F0258911</div></td>
		    <td> <div align="center">2010-IB07587</div></td>
		    <td> <div align="center">朱文华</div></td>
		    <td> <div align="center">F0253682</div></td>
		    <td> <div align="center">2010-IB00583</div></td>
		</tr>
		<tr valign="middle">
		    <td> <div align="center">35</div></td>
		    <td> <div align="center">沈阳建设东路营业部</div></td>
		    <td> <div align="center">乔恒顺</div></td>
		    <td> <div align="center">2010-IB02320</div></td>
		    <td> <div align="center">王越</div></td>
		    <td> <div align="center">F0233363</div></td>
		    <td> <div align="center">2010-IB01236</div></td>
		    <td> <div align="center">孙静</div></td>
		    <td> <div align="center">F0233361</div></td>
		    <td> <div align="center">2010-IB01552</div></td>
		</tr>
		<tr valign="middle">
		    <td> <div align="center">36</div></td>
		    <td> <div align="center">石家庄裕华西路裕园营业部</div></td>
		    <td> <div align="center">问颖辉</div></td>
		    <td> <div align="center">2010-IB02065</div></td>
		    <td> <div align="center">王亚托</div></td>
		    <td> <div align="center">F0233477</div></td>
		    <td> <div align="center">2010-IB00318</div></td>
		    <td> <div align="center">夏永春</div></td>
		    <td> <div align="center">F0233478</div></td>
		    <td> <div align="center">2010-IB00950</div></td>
		</tr>
		<tr valign="middle">
		    <td> <div align="center">37</div></td>
		    <td> <div align="center">苏州干将东路营业部</div></td>
		    <td> <div align="center">方强</div></td>
		    <td> <div align="center">2010-IB02224</div></td>
		    <td> <div align="center">陆维德</div></td>
		    <td> <div align="center">F0234095</div></td>
		    <td> <div align="center">2010-IB04340</div></td>
		    <td> <div align="center">姜海刚</div></td>
		    <td> <div align="center">F0253029</div></td>
		    <td> <div align="center">2010-IB01489</div></td>
		</tr>
		<tr valign="middle">
		    <td> <div align="center">38</div></td>
		    <td> <div align="center">太原新建北路营业部</div></td>
		    <td> <div align="center">李家莹</div></td>
		    <td> <div align="center">2010-IB02443</div></td>
		    <td> <div align="center">张雪梅</div></td>
		    <td> <div align="center">F0234840</div></td>
		    <td> <div align="center">2010-IB00157</div></td>
		    <td> <div align="center">杨跃江</div></td>
		    <td> <div align="center">F0252529</div></td>
		    <td> <div align="center">2010-IB00794</div></td>
		</tr>
		<tr valign="middle">
		    <td> <div align="center">39</div></td>
		    <td> <div align="center">天津湖北路营业部</div></td>
		    <td> <div align="center">孙立新</div></td>
		    <td> <div align="center">2010-IB08407</div></td>
		    <td> <div align="center">赵凯</div></td>
		    <td> <div align="center">F0233543</div></td>
		    <td> <div align="center">2010-IB04349</div></td>
		    <td> <div align="center">周一宏</div></td>
		    <td> <div align="center">F0233542</div></td>
		    <td> <div align="center">2010-IB06793</div></td>
		</tr>
		<tr valign="middle">
		    <td> <div align="center">40</div></td>
		    <td> <div align="center">温州欧洲城营业部</div></td>
		    <td> <div align="center">王大乐</div></td>
		    <td> <div align="center">2010-IB05229</div></td>
		    <td> <div align="center">柯玲智</div></td>
		    <td> <div align="center">F0251420</div></td>
		    <td> <div align="center">2010-IB06342</div></td>
		    <td> <div align="center">项剑赛</div></td>
		    <td> <div align="center">F0233687</div></td>
		    <td> <div align="center">2010-IB06631</div></td>
		</tr>
		<tr valign="middle">
		    <td> <div align="center">41</div></td>
		    <td> <div align="center">武汉和平大道营业部</div></td>
		    <td> <div align="center">金燕来</div></td>
		    <td> <div align="center">2010-IB02114</div></td>
		    <td> <div align="center">曹雯</div></td>
		    <td> <div align="center">F0234113</div></td>
		    <td> <div align="center">2010-IB01757</div></td>
		    <td> <div align="center">吴玲</div></td>
		    <td> <div align="center">F0234124</div></td>
		    <td> <div align="center">2010-IB01830</div></td>
		</tr>
		<tr valign="middle">
		    <td> <div align="center">42</div></td>
		    <td> <div align="center">武汉珞瑜路营业部</div></td>
		    <td> <div align="center">杨敏</div></td>
		    <td> <div align="center">2010-IB02689</div></td>
		    <td> <div align="center">杨桂英</div></td>
		    <td> <div align="center">F0234160</div></td>
		    <td> <div align="center">2010-IB01237</div></td>
		    <td> <div align="center">吴涛</div></td>
		    <td> <div align="center">F0234159</div></td>
		    <td> <div align="center">2010-IB01625</div></td>
		</tr>
		<tr valign="middle">
		    <td> <div align="center">43</div></td>
		    <td> <div align="center">武汉万松园路营业部</div></td>
		    <td> <div align="center">江珊</div></td>
		    <td> <div align="center">2010-IB02471</div></td>
		    <td> <div align="center">胡浩</div></td>
		    <td> <div align="center">F0234163</div></td>
		    <td> <div align="center">2010-IB01318</div></td>
		    <td> <div align="center">付斌</div></td>
		    <td> <div align="center">F0234162</div></td>
		    <td> <div align="center">2010-IB00100</div></td>
		</tr>
		<tr valign="middle">
		    <td> <div align="center">44</div></td>
		    <td> <div align="center">厦门湖滨南路营业部</div></td>
		    <td> <div align="center">李辉龙</div></td>
		    <td> <div align="center">2010-IB02558</div></td>
		    <td> <div align="center">廖水容</div></td>
		    <td> <div align="center">F0253488</div></td>
		    <td> <div align="center">2010-IB00878</div></td>
		    <td> <div align="center">沈娜娟</div></td>
		    <td> <div align="center">F0233703</div></td>
		    <td> <div align="center">2010-IB03067</div></td>
		</tr>
		<tr valign="middle">
		    <td> <div align="center">45</div></td>
		    <td> <div align="center">宜昌东山大道营业部</div></td>
		    <td> <div align="center">李志会</div></td>
		    <td> <div align="center">2010-IB03800</div></td>
		    <td> <div align="center">王恬恬</div></td>
		    <td> <div align="center">F0251417</div></td>
		    <td> <div align="center">2010-IB03225</div></td>
		    <td> <div align="center">欧阳莹</div></td>
		    <td> <div align="center">F0234178</div></td>
		    <td> <div align="center">2010-IB03136</div></td>
		</tr>
		<tr valign="middle">
		    <td> <div align="center">46</div></td>
		    <td> <div align="center">云浮星岩路营业部</div></td>
		    <td> <div align="center">彭文艺</div></td>
		    <td> <div align="center">2010-IB02069</div></td>
		    <td> <div align="center">刘卓锋</div></td>
		    <td> <div align="center">F0234865</div></td>
		    <td> <div align="center">2010-IB00918</div></td>
		    <td> <div align="center">张群容</div></td>
		    <td> <div align="center">F0234866</div></td>
		    <td> <div align="center">2010-IB01369</div></td>
		</tr>
		<tr valign="middle">
		    <td> <div align="center">47</div></td>
		    <td> <div align="center">湛江海滨大道营业部</div></td>
		    <td> <div align="center">胡康</div></td>
		    <td> <div align="center">2010-IB08824</div></td>
		    <td> <div align="center">王榜</div></td>
		    <td> <div align="center">F0233132</div></td>
		    <td> <div align="center">2010-IB00919</div></td>
		    <td> <div align="center">李宇辉</div></td>
		    <td> <div align="center">F0233080</div></td>
		    <td> <div align="center">2010-IB01521</div></td>
		</tr>
		<tr valign="middle">
		    <td> <div align="center">48</div></td>
		    <td> <div align="center">张家口建设东街营业部</div></td>
		    <td> <div align="center">刘向东</div></td>
		    <td> <div align="center">2010-IB02403</div></td>
		    <td> <div align="center">张风林</div></td>
		    <td> <div align="center">F0233469</div></td>
		    <td> <div align="center">2010-IB00277</div></td>
		    <td> <div align="center">李红樱</div></td>
		    <td> <div align="center">F0233466</div></td>
		    <td> <div align="center">2010-IB00795</div></td>
		</tr>
		<tr valign="middle">
		    <td> <div align="center">49</div></td>
		    <td> <div align="center">中山兴中道营业部</div></td>
		    <td> <div align="center">董耘</div></td>
		    <td> <div align="center">2010-IB02489</div></td>
		    <td> <div align="center">刘振华</div></td>
		    <td> <div align="center">F0250623</div></td>
		    <td> <div align="center">2010-IB01213</div></td>
		    <td> <div align="center">翁时民</div></td>
		    <td> <div align="center">F0265398</div></td>
		    <td> <div align="center">2010-IB01857</div></td>
		</tr>
		<tr valign="middle">
		    <td> <div align="center">50</div></td>
		    <td> <div align="center">重庆凤天大道营业部</div></td>
		    <td> <div align="center">任雪涛</div></td>
		    <td> <div align="center">2010-IB02559</div></td>
		    <td> <div align="center">李芸芸</div></td>
		    <td> <div align="center">F0233829</div></td>
		    <td> <div align="center">2010-IB01901</div></td>
		    <td> <div align="center">杨慧鹏</div></td>
		    <td> <div align="center">F0233827</div></td>
		    <td> <div align="center">2010-IB00797</div></td>
		</tr>
		<tr valign="middle">
		    <td> <div align="center">51</div></td>
		    <td> <div align="center">珠海柠溪营业部</div></td>
		    <td> <div align="center">王乐民</div></td>
		    <td> <div align="center">2010-IB02550</div></td>
		    <td> <div align="center">徐晓东</div></td>
		    <td> <div align="center">F0234833</div></td>
		    <td> <div align="center">2010-IB00688</div></td>
		    <td> <div align="center">吴俊玲</div></td>
		    <td> <div align="center">F0234831</div></td>
		    <td> <div align="center">2010-IB01222</div></td>
		</tr>
		<tr valign="middle">
		    <td> <div align="center">52</div></td>
		    <td> <div align="center">珠海情侣南路营业部</div></td>
		    <td> <div align="center">钟雄鹰</div></td>
		    <td> <div align="center">2010-IB02673</div></td>
		    <td> <div align="center">白海蛟</div></td>
		    <td> <div align="center">F0255802</div></td>
		    <td> <div align="center">2010-IB04372</div></td>
		    <td> <div align="center">刘芳</div></td>
		    <td> <div align="center">F0234817</div></td>
		    <td> <div align="center">2010-IB01475</div></td>
		</tr>


      </tbody>
    </table>
    <div class="clearfloat h25"></div>
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<div class="blank5"></div>
<jsp:include page="/commons/msbottom.jsp" />
</body>
</html>