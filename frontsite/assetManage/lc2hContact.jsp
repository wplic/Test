<%@ page contentType="text/html; charset=utf-8" language="java" %>
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
  <div class="dqwz">当前位置：<a href="${contextPath }/default.html"> 首页 </a>-<a href="${contextPath }/assetManage/index.jsp">资产管理</a> - 集合产品</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft">
		<jsp:include page="gatherFinancing_lmenu.jsp" />
    
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w706 fright">
  		<div class="comtit1"><h4>广发理财2号</h4>
  		</div>
    <div class="blank10"></div>
    <table width="100%" align="center">
      <tr>
        <td class="jhlctit1">广发理财2号</td>
        <td class="jhlctit2 "><a href="lc2hInfo.jsp">产品简介</a><span class="font_8c"> |&nbsp; </span><a href="">收益率</a> <span class="font_8c">| &nbsp;</span><a href="lc2hAffiche.jsp">公告</a><span class="font_8c"> |&nbsp;</span> <a href="lc2hFaq.jsp">常见问题</a><span class="font_8c"> |&nbsp; </span><a href="lc2hContact.jsp" class="red">联系方式</a><span class="font_8c"> |&nbsp; </span><a href="lc2hFundMgr.jsp">基金经理观点</a></td>
        <td class="jhlctit3">&nbsp;</td>
      </tr>
    </table>
    <table border="1" bordercolor="#cccccc" width="98%" align="center" class="lh24 mt10">
      <tr class="rrtab_tt bold">
        <td width="19%" align="center">联系人</td>
        <td width="19%" align="center">职位</td>
        <td width="21%" align="center">电话</td>
        <td width="19%" align="center">手机</td>
      </tr>
      <tr>
        <td width="19%" align="center">钟鸣</td>
        <td width="19%" class="pl10">集合营销业务负责人</td>
        <td width="21%" class="pl10">020-87555888-516</td>
        <td width="19%" class="pl10">&nbsp;</td>
      </tr>
      <tr>
        <td width="19%" align="center">黄旺达</td>
        <td width="19%" class="pl10">集合营销业务经理</td>
        <td width="21%" class="pl10">020-87555888-603</td>
        <td width="19%" class="pl10">13609723372</td>
      </tr>
    </table>
  </div>
  <!--右侧sied结束--> 
<div class="clearfloat"></div>
</div>  <div class="blank5"></div><!--清除浮动--> 
<jsp:include page="/commons/msbottom.jsp" />
</body>
</html>