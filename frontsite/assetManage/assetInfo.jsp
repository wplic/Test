<%@ page contentType="text/html; charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${contextPath }/css/style.css" rel="stylesheet" type="text/css" />

</head>
<body>
<jsp:include page="${contextPath}/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="${contextPath }/default.html"> 首页 </a>-<a href="${contextPath }/assetManage/index.jsp">资产管理</a> - 业务概况</div>
</div>
<div class="wrap_3c">
  <!--左侧sied开始-->
  <div class="w210 fleft">
	 <jsp:include page="${contextPath }/assetManage/assetInfo_index_lmenu.jsp?nav=ywgk&nav1=zgjj" />
     <div class="blank5"></div>
    
  </div>
  <!--左侧sied结束-->
   
  <!--中侧sied开始-->
  <div class="w492 fleft mlr4">
  <div class="comtit1">
    <h4>资管简介</h4></div>
  <div class="blank10"></div>		
    <table width="95%" align="center" class="lh28 fcenter">
      <tr>
        <td class="font16 bold" align="center">广发证券资产管理业务</td>
      </tr>
      <tr>
		<td class="font16 bold" align="center">致力于客户资产的长期稳定增值</td>
	  </tr>
	  <tr>
		<td><ul>
			<li><span class="font_st font_8c">◆ </span>国内首批获得资产管理业务资格的证券公司
			<li><span class="font_st font_8c">◆ </span>国内首个成立的集合资产管理计划“广发集合资产管理计划（2 号）”的管理人
			<li><span class="font_st font_8c">◆ </span>国内首个专门投资于股权分置改革上市公司的集合资产管理集合“广发集合资产管理计划（3 号）”的管理人
			<li><span class="font_st font_8c">◆ </span>国内首个在深圳证券交易所可转让的专项资产管理计划“莞深高速公路收费收益权专项资产管理计划”的管理人
			<li><span class="font_st font_8c">◆ </span>资产管理业务规模和业绩多年以来在国内证券公司中名 列前茅
			<li><span class="font_st font_8c">◆ </span>专注于为高端个人客户提供一对一投资理财服务
			<li><span class="font_st font_8c">◆ </span>业务运作规范始终把客户利益放在首位。
		</ul></td>
      </tr>
    </table>
  	
    <div class="blank10"></div>
    <table width="100%" align="center">
      <tr>
        <td class="ywfw_l">&nbsp;</td>
        <td class="ywfw_m bold">业务特点</td>
        <td class="ywfw_r">&nbsp;</td>
      </tr>
    </table>
    <div class="blank10"></div>
    <table width="95%" align="center" class="lh28 fcenter">
      <tr>
        <td width="17"><img src="${contextPath }/pic/business/dot-jt.jpg" /></td>
        <td class="font14 red bold">规范的经营管理</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>　　广发证券资产管理部始终坚持“客户至上、专业服务”的经营理念，在合法合规的前提下进行业务开拓与创新，把客户利益放在首位，以规范的经营管理、优秀的投资能力和严格风险控制，在业内享有良好的口碑。</td>
      </tr>
    </table>
    <div class="blank10"></div>
    
    <table width="95%" align="center" class="lh28 fcenter">
      <tr>
        <td width="17"><img src="${contextPath }/pic/business/dot-jt.jpg" /></td>
        <td class="font14 red bold">高素质、富有经验的专业团队</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>　　资产管理部投资经理与研究员绝大多数具有研究生以上学历，投资经理从事证券业务的平均年限为6 年，具有较强的对上市公司经营管理的研究与判断能力。</td>
      </tr>
    </table>
    <div class="blank10"></div>
  
    <table width="95%" align="center" class="lh28 fcenter">
      <tr>
        <td width="17"><img src="${contextPath }/pic/business/dot-jt.jpg" /></td>
        <td class="font14 red bold">以研究为主导的投资研究体系</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        
        <td>　　倡导研究为主导的投资文化，资产管理部建立了“以公司研究为依托、外部研究为补充、自主应用研究为核心”的研究模式。</td>
      </tr>
    </table>
    <div class="blank10"></div>
	<p align="center"><img src="${contextPath }/pic/assetManage/zgjj03.jpg" /></p>
	<div class="blank10"></div>

  </div>
  <!--中侧sied结束--> 
    <!--右侧sied开始-->
  <div class="w210 fright" style="vertical-align:top">
	<script type="text/javascript" src="${contextPath }/js/jsIfUtils.js"></script>
	<iframe target="_blank" id="leftlogin" name="leftlogin"  marginWidth="0" marginHeight="0" src="${contextPath }/commons/loginTemp.jsp"
						frameBorder="0" noresize width="100%" scrolling="no"></iframe>
	<jsp:include page="${contextPath}/assetManage/mmts.jsp" />
    <div class=" blank5"></div>
    <jsp:include page="${contextPath }/assetManage/lc3h.jsp" />    
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
    <div class="blank5"></div>
<jsp:include page="${contextPath }/commons/msbottom.jsp" />
</body>
</html>