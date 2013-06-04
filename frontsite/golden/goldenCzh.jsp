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
  <div class="dqwz">当前位置：<a href="${contextPath }/index.jsp?nav=index">首页</a> &gt; <a href="${contextPath }/golden/index.jsp?nav=jgj">金管家服务</a> &gt; 财经汇</div>
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
    <td rowspan="2"><img src="/pic/golden/czh.jpg" title="广发证券财智汇" /></td>
    <td align="right"><a href="${contextPath }<%=wdlczxPathUrl %>"><img src="/pic/golden/but_lczx.jpg" id="Image1" title="广发证券理财中心" onmouseover="MM_swapImage('Image1','','/pic/golden/but_lczx2.jpg',1)" onmouseout="MM_swapImgRestore()" /></a></td>
  </tr>
  <tr>
    <td valign="bottom" class="font14 goldenzi lh28">　　选择“财智汇”服务级别的客户，可以免费享受广发证券核心团队提供的个性化投资理财咨询顾问服务，团队由营业部客户经理+营业部客户经理团队组成，同时可以享受广发提供的优质的咨询产品报告。</td>
  </tr>
</table>
    <div class="blank10"></div>
  <div class="goldenp1">
    <table width="100%" border="0">
  		<tr>
  				<td class="font14 goldenzi lh28">财智汇客户除了可以享受财经汇的所有服务内容以外，还可以享受下列尊贵服务。</td>
  		</tr>
  </table>
<table cellspacing="0" border="1" class="tab_cj" cellpadding="0" width="100%">
  <tr>
    <td class="xl66" width="69">客户类型 </td>
    <td class="xl70" width="144">服务类型 </td>
    <td class="xl70" width="328">服务项目 </td>
  </tr>
  <tr>
    <td rowspan="29" class="xl73">财智汇 </td>
    <td rowspan="4" class="xl73">管家交易 </td>
    <td class="xl67">现场专户室交易 </td>
  </tr>
  <tr>
    <td class="xl67">手机证券 </td>
  </tr>
  <tr>
    <td class="xl67">网上专用软件交易 </td>
  </tr>
  <tr>
    <td class="xl67">网站网页交易 </td>
  </tr>
  <tr>
    <td rowspan="16" class="xl76">管家资讯 </td>
    <td class="xl67">《广发投资内参》 </td>
  </tr>
  <tr>
    <td class="xl67">《广发分析师早报》 </td>
  </tr>
  <tr>
    <td class="xl67">《衍生品投资周刊》 </td>
  </tr>
  <tr>
    <td class="xl67">《低风险产品月报》 </td>
  </tr>
  <tr>
    <td class="xl67">《广发投资策略报告》（月报、季报） </td>
  </tr>
  <tr>
    <td class="xl67">《内参快讯）早间版、午间版 </td>
  </tr>
  <tr>
    <td class="xl67">《金管家示范组合》（激进型、稳健型） </td>
  </tr>
  <tr>
    <td class="xl67">《香港财经资讯》（广发香港） </td>
  </tr>
  <tr>
    <td class="xl67">《广发晨报》 </td>
  </tr>
  <tr>
    <td class="xl67">广发研究报告（摘要） </td>
  </tr>
  <tr>
    <td class="xl67">第三方研究报告（摘要） </td>
  </tr>
  <tr>
    <td class="xl67">财经内参（宏新资讯） </td>
  </tr>
  <tr>
    <td class="xl67">参考消息（宏新资讯） </td>
  </tr>
  <tr>
    <td class="xl67">机构股评（宏新资讯） </td>
  </tr>
  <tr>
    <td class="xl67">盘中速递（宏新资讯） </td>
  </tr>
  <tr>
    <td class="xl67">市场评论（宏新资讯） </td>
  </tr>
  <tr>
    <td rowspan="7" class="xl76">管家增值 </td>
    <td class="xl68">GFTV 财富频道 </td>
  </tr>
  <tr>
    <td class="xl67">区域投资策略报告会（不定期） </td>
  </tr>
  <tr>
    <td class="xl67">区域基金经理见面会（不定期） </td>
  </tr>
  <tr>
    <td class="xl67">财智大讲堂（不定期） </td>
  </tr>
  <tr>
    <td class="xl67">账户诊断服务 </td>
  </tr>
  <tr>
    <td class="xl67">资产管理服务★ </td>
  </tr>
  <tr>
    <td class="xl67">客户经理专人服务 </td>
  </tr>
  <tr>
    <td class="xl69">管家关怀 </td>
    <td class="xl67">投资跟踪（不定期） </td>
  </tr>
  <tr>
    <td class="xl69">管家团队 </td>
    <td class="xl67">客户经理团队 </td>
  </tr>
  <tr>
    <td colspan="3" class="xl71">注：　1 、账户诊断服务由营业部客户经理团队提供。</td>
  </tr>
  <tr>
    <td colspan="3" class="xl72">　　　2 、带★号服务由总部资产管理部提供。</td>
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
_aq.push(['_setSiteId', 10001]);_aq.push(['_setCatalogId', 60]); _aq.push(['_trackPageview']); (function() {
var ga = document.createElement( 'script'); ga.type = 'text/javascript'; ga.async = true; ga.src='http://121.8.153.59:8080/stat/stat.js'; var s = document.getElementsByTagName( 'script')[0]; s.parentNode.insertBefore(ga, s); })();
</script>
</html>