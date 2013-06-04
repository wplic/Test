<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${ctx }/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx }/css/golden/golden.css" rel="stylesheet" type="text/css" />
</head>

<body class="body_bg" onload="MM_preloadImages('${ctx }/pic/golden/but_lczx2.jpg')">
<jsp:include page="/share/top.jsp?nav=jgj&nav1=zzfwdypr" />
<div class="main">
  <div class="dqwz">当前位置：首页 > 金管家服务 > 尊享套餐</div>
  <p align="center"><img src="${ctx }/pic/golden/banner3.jpg" title="金管家尊享套餐" /></p>
  <div class="blank10"></div>

<table width="100%" border="0" style="border-bottom:1px solid #ccc">
  <tr>
    <td width="19%" rowspan="2"><img src="${ctx }/pic/golden/jgj_zx.jpg" title="金管家尊享套餐" /></td>
    <td width="81%" align="right"></td>
  </tr>
  <tr>
    <td class="lh28"><span class="red bold font14 ">股海悠游，尊享财富人生</span><br />
      广发证券金管家顶级资讯套餐，荟集公司总部顶级分析师及投资顾问团队研究成果，提供最及时、最权威的研究报告，享受基金经理般的研究支持，助您尊享财富人生。</td>
  </tr>
</table>
  <div class="blank10"></div>
  <div class="mt10 font14 bold">尊享套餐产品列表</div>
  <div class="blank10"></div>
  <div class="goldenp2">
  <table width="100%" border="0" cellspacing="0" cellpadding="0" class="golTab1">
  <tr>
    <td class="tit1">管家资讯</td>
  </tr>
  <tr>
    <td class="cont1">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="22%" valign="top" class="bold"><img src="${ctx }/pic/Subscribe/gftvA.gif" style="padding-right:8px" />新闻资讯类</td>
            <td width="21%" valign="top">国内财经<br />
              国际财经<br />
              港澳台财经<br />
              地方财经<br />
              行业动态<br />
              环球市场<br />
              券商动态<br />
              专题聚焦<br />
              沪市特别提示<br />
              深市特别提示</td>
            <td width="22%" valign="top"><span class="bold"><img src="${ctx }/pic/Subscribe/gftvA.gif" style="padding-right:8px" />市场速递类</span></td>
            <td width="35%" valign="top">金管家投资速递<br />
              金管家盘中播报<br /></td>
          </tr>
        </table>
        <div class="line_bor1"></div>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="22%" valign="top" class="bold"><img src="${ctx }/pic/Subscribe/gftvA.gif" style="padding-right:8px" />产品策略类</td>
            <td width="21%" valign="top">管家A股策略报告<br />
              金管家基金投资策略<br />
              金管家低风险投资策略<br />
              金管家衍生品投资策略<br />
              金管家专题报告</td>
            <td width="22%" valign="top"><span class="bold"><img src="${ctx }/pic/Subscribe/gftvA.gif" style="padding-right:8px" />研究内参类</span></td>
            <td width="35%" valign="top">金管家内参</td>
          </tr>
        </table>
        
        <div class="line_bor1"></div>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="22%" valign="top" class="bold"><img src="${ctx }/pic/Subscribe/gftvA.gif" style="padding-right:8px" />研究报告类</td>
            <td width="21%" valign="top">广发证券晨会纪要<br />
广发期货报告<br />
广发研究报告目录<br />
广发研究报告摘要<br />
广发研究报告<br />
第三方研究报告目录<br />
第三方研究报告摘要<br />
第三方研究报告<br />
基金看市目录<br />
基金看市摘要<br />
基金看市<br /></td>
            <td width="22%" valign="top"><span class="bold"></span></td>
            <td width="35%" valign="top"></td>
          </tr>
        </table>
        
        <div class="line_bor1"></div>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="22%" valign="top" class="bold"><img src="${ctx }/pic/Subscribe/gftvA.gif" style="padding-right:8px" />财富频道</td>
            <td width="21%" valign="top">GFTV财富频道</td>
            <td width="22%" valign="top">&nbsp;</td>
            <td width="35%" valign="top">&nbsp;</td>
          </tr>
        </table>
        
        </td>
  </tr>
  
</table>


  </div>
<jsp:directive.page import="com.cssweb.common.web.filter.SqlInjectValidate"/>
<jsp:directive.page import="com.cssweb.client.pojo.TsystemWebuser"/>
<%
 SqlInjectValidate sqlInjectValidate = SqlInjectValidate.getSqlInjectValidate();
  String branchCode="";
  TsystemWebuser tsystemWebuser=null;
 if(request.getSession().getAttribute("tsystemWebuser")!=null)
	{
	tsystemWebuser=(TsystemWebuser)request.getSession().getAttribute("tsystemWebuser");
	branchCode=tsystemWebuser.getBranchCode();
	}
         String packageIdStr="";
	     long packageId=0l;
	     if(request.getSession().getAttribute("packageId")!=null)
	     packageIdStr=(String)request.getSession().getAttribute("packageId");
	     if(packageIdStr!=null&&!packageIdStr.equals(""))
	     packageId=Long.parseLong(packageIdStr);
	     
	     if(packageId<=10&&sqlInjectValidate.boolenanbranchCode(branchCode)){
   %>
  <p class="p10" align="center"><input name="" onclick="location.href='/Subscribe/zzdy2.jsp'" class="dybtn1" type="button" value="我要订阅" /></p>
 <%} %>

</div>
<script src="${ctx }/js/imge.js"></script>
<jsp:include page="${ctx }/share/bottom.jsp" />
</body>

</html>