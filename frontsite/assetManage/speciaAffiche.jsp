<%@ page contentType="text/html; charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<link href="/css/assetManage/assetManage.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${contextPath }/js/jsIfUtils.js"></script>
</head>
<body>
<jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="${contextPath }/default.html"> 首页 </a>-<a href="${contextPath }/assetManage/index.jsp">资产管理</a> - 专项产品</div>
</div>
<div class="wrap_3c">
  <!--左侧sied开始-->
  <div class="w210 fleft">
	 <jsp:include page="${contextPath }/assetManage/assetInfo_index_lmenu.jsp?nav=zxcp" />
     <div class="blank5"></div>
  </div>
  <!--左侧sied结束-->
  <!--中侧sied开始-->
  <div class="w492 fleft mlr4">
  	<div class="comtit1"><h4>专项产品</h4>
  	</div>
  	<div class="blank10"></div>
  	
    <table width="100%" align="center">
      <tr>
        <td class="jhlctit1">专项产品</td>
        <td class="jhlctit2 "><a href="specialFinancial.jsp">情况简介</a><span class="font_8c"> |&nbsp; </span><a href="salesAgencies.jsp">销售机构</a> <span class="font_8c">| &nbsp;</span><a href="speciaAffiche.jsp" class="red">专项公告</a><span class="font_8c"> |&nbsp;</span> <a href="speciaLawFile.jsp">法律文件</a><span class="font_8c"> |&nbsp;</span> <a href="specialContactUs.jsp">联系我们</a></td>
        <td class="jhlctit3">&nbsp;</td>
      </tr>
    </table>
    <div class="blank10"></div>
  	 <iframe width="100%"  src="${contextPath}/assetManage/assetlist.jsp?whichCat=tzlc_zxlc_zxgg&showSize=50&buttonName=1" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" id="fundNews" name="fundNews" onload="frameFitSelfHeight('fundNews')"></iframe>
  </div>
  <!--中侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w210 fright">
  <script type="text/javascript" src="${contextPath }/js/jsIfUtils.js"></script>
	<iframe target="_blank" id="leftlogin" name="leftlogin"  marginWidth="0" marginHeight="0" src="${contextPath }/commons/loginTemp.jsp"
						frameBorder="0" noresize width="100%" scrolling="no" onload="frameFitSelfHeight('leftlogin')"></iframe>
	<jsp:include page="${contextPath}/assetManage/mmts.jsp" />
    <div class=" blank5"></div>
    <p><a href="#"><img src="/pic/assetManage/pdfxz.gif" /></a></p>
    <div class=" blank5"></div>
    <jsp:include page="lc3h.jsp" /> 
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<div class="blank5"></div>
<jsp:include page="/commons/msbottom.jsp" />

</body>
</html>