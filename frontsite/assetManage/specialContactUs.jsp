<%@ page contentType="text/html; charset=utf-8" language="java"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<link href="/css/assetManage/assetManage.css" rel="stylesheet" type="text/css" />
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
  	<div class="comtit1"><h4>专项产品</h4></div>
  	<div class="blank10"></div>
  	
    <table width="100%" align="center">
      <tr>
        <td class="jhlctit1">专项产品</td>
        <td class="jhlctit2 "><a href="specialFinancial.jsp">情况简介</a><span class="font_8c"> |&nbsp; </span><a href="salesAgencies.jsp">销售机构</a> <span class="font_8c">| &nbsp;</span><a href="speciaAffiche.jsp">专项公告</a><span class="font_8c"> |&nbsp;</span> <a href="speciaLawFile.jsp">法律文件</a><span class="font_8c"> |&nbsp;</span> <a href="specialContactUs.jsp" class="red">联系我们</a></td>
        <td class="jhlctit3">&nbsp;</td>
      </tr>
    </table>
    <div class="blank10"></div>
    
    
    <table width="100%" align="center" class="mt10">
      <tr>
        <td class="ywfw_l">&nbsp;</td>
        <td class="ywfw_m bold">联系我们 </td>
        <td class="ywfw_r">&nbsp;</td>
      </tr>
    </table>
    <div class="blank10"></div>
    <table width="98%" align="center" class="lh30 mt5 fcenter">
      <tr>
        <td width="17"><img src="/pic/business/dot-jt.jpg" /></td>
        <td class="font14 red bold">广发证券资产管理部：          <br /></td>
      </tr>
      <tr>
        <td></td>
        <td><span class="font_st font_8c">·</span>联  系  人：满莉 <br />
          <span class="font_st font_8c">·</span>垂询电话：020-87555888-602<br />
          <span class="font_st font_8c">·</span>传　　真：020-87553569 <br />
        <span class="font_st font_8c">·</span>地　　址：广州市天河北路183号大都会广场38楼<br /></td>
      </tr>
    </table>
    
  </div>  
  <!--中侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w210 fright">
 <script type="text/javascript" src="${contextPath }/js/jsIfUtils.js"></script>
	<iframe target="_blank" id="leftlogin" name="leftlogin"  marginWidth="0" marginHeight="0" src="${contextPath }/commons/loginTemp.jsp"
						frameBorder="0" noresize width="100%" scrolling="no" onload="frameFitSelfHeight('leftlogin')"></iframe>
	<jsp:include page="${contextPath}/assetManage/mmts.jsp" />
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