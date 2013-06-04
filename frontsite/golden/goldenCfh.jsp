<%@ page contentType="text/html; charset=utf-8" language="java"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/golden/golden.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.tab_cj{ border:1px solid #ece9d8;}
</style>
</head>

<body class="" onload="MM_preloadImages('/pic/golden/but_lczx2.jpg')">
<jsp:include page="/share/top.jsp" />
<div class="body_bg">
<div class="main">
  <div class="dqwz">当前位置：<a href="${contextPath }/index.jsp?nav=index">首页</a> &gt; <a href="${contextPath }/golden/index.jsp?nav=jgj">金管家服务</a> &gt; 财富汇</div>
  <p align="center"><img src="/pic/golden/banner.jpg" title="广发证券经纪业务介绍" /></p>
  <div class="blank10"></div>

<table width="100%" border="0">
<%
                  String wdlczxPathUrl="/bussinesshall/movetradehall/financingCenter.jsp?nav=wsyyt&nav1=wdlczx";
                  if(session.getAttribute("tsystemWebuser")!=null)
                  {
                   wdlczxPathUrl="/bussinesshall/financingCzh.jsp";
                  }
                 %>
  <tr>
    <td rowspan="2"><img src="/pic/golden/cfh.jpg" title="广发证券财富汇" /></td>
    <td align="right"><a href="${contextPath }<%=wdlczxPathUrl %>"><img src="/pic/golden/but_lczx.jpg" id="Image1" title="广发证券理财中心" onmouseover="MM_swapImage('Image1','','/pic/golden/but_lczx2.jpg',1)" onmouseout="MM_swapImgRestore()" /></a></td>
  </tr>
  <tr>
    <td valign="bottom" class="font14 goldenzi lh28">　　选择“财富汇”服务级别的客户，可以享受广发证券核心团队提供的个性化投资理财咨询顾问服务，团队由总部专业团队组成.包括研发人员、资产管理人员、分析师和合作机构聘请的银行和保险方面的专家组成，同时可以享受广发提供的优质的咨询产品报告。</td>
  </tr>
</table>
    <div class="blank10"></div>
    
<div class="goldenp1">
 <table width="100%" border="0">
  		<tr>
  				<td class="font14 goldenzi lh28">财富汇客户除了可以享受财经汇、财智汇的所有服务内容以外，还可以享受下列VIP服务。</td>
  		</tr>
  </table>
<table cellspacing="0" border="1" class="tab_cj" cellpadding="0" width="100%">
  <tr>
    <td class="xl66" width="69">客户类型 </td>
    <td class="xl70" width="144">服务类型 </td>
    <td class="xl70" width="328">服务项目 </td>
  </tr>
  <tr>
    <td rowspan="18" class="xl73">财富汇 </td>
    <td rowspan="3" class="xl73">管家交易 </td>
    <td class="xl67">现场 VIP 室交易 </td>
  </tr>
  <tr>
    <td class="xl68">VIP 客户优先接入电话 </td>
  </tr>
  <tr>
    <td class="xl68">VIP 专用交易通道 </td>
  </tr>
  <tr>
    <td rowspan="2" class="xl76">管家资讯 </td>
    <td class="xl67">广发研究报告（全文） </td>
  </tr>
  <tr>
    <td class="xl67">第三方研究报告（全文） </td>
  </tr>
  <tr>
    <td rowspan="11" class="xl73">管家增值 </td>
    <td class="xl67">投资组合建议 </td>
  </tr>
  <tr>
    <td class="xl67">研究报告定制★ </td>
  </tr>
  <tr>
    <td class="xl67">上市公司调研（不定期） </td>
  </tr>
  <tr>
    <td class="xl67">基金公司调研（不定期） </td>
  </tr>
  <tr>
    <td class="xl68">VIP 客户年会 </td>
  </tr>
  <tr>
    <td class="xl67">上市公司路演★ </td>
  </tr>
  <tr>
    <td class="xl67">研究员一对一沟通★ </td>
  </tr>
  <tr>
    <td class="xl67">二级市场增减持方案定制★ </td>
  </tr>
  <tr>
    <td class="xl67">大宗交易摄合★ </td>
  </tr>
  <tr>
    <td class="xl67">优质 PE 项目推荐、实地调研和介入安排★ </td>
  </tr>
  <tr>
    <td class="xl67">为公募、私募基金产品设计、销售提供服务★ </td>
  </tr>
  <tr>
    <td class="xl69">管家关怀 </td>
    <td class="xl67">客户联谊（不定期） </td>
  </tr>
  <tr>
    <td class="xl69">管家团队 </td>
    <td class="xl67">高级客户经理 + 营业部负责人 + 高级分析师团队 </td>
  </tr>
  <tr>
    <td colspan="3" class="xl71">注:　 1 、投资组合建议由高级客户经理或营业部负责人理根据客户所属的风险承受类型，依据总部提供的风险适配模型向客户提供服务。 </td>
  </tr>
  <tr>
    <td colspan="3" class="xl72"> 　　　2 、带★号项目由总部其他部门提供服务。 </td>
  </tr>
</table>
  </div>
    <div class="blank10"></div>

</div>
<script src="/js/imge.js"></script>
<jsp:include page="/share/bottom.jsp" />
</div>
</body>
<script type="text/javascript"> 
var _aq = _aq || [];
_aq.push(['_setSiteId', 10001]);_aq.push(['_setCatalogId', 61]); _aq.push(['_trackPageview']); (function() {
var ga = document.createElement( 'script'); ga.type = 'text/javascript'; ga.async = true; ga.src='http://121.8.153.59:8080/stat/stat.js'; var s = document.getElementsByTagName( 'script')[0]; s.parentNode.insertBefore(ga, s); })();
</script>
</html>