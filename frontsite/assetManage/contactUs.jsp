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
  <div class="dqwz">当前位置：<a href="${contextPath }/default.html"> 首页 </a>-<a href="${contextPath }/assetManage/index.jsp">资产管理</a> - 联系资管</div>
</div>
<div class="wrap_3c">
  <!--左侧sied开始-->
  <div class="w210 fleft">
	 <jsp:include page="${contextPath }/assetManage/assetInfo_index_lmenu.jsp?nav=lxwm" />
  </div>
  <!--左侧sied结束-->
  <!--中侧sied开始-->
  <div class="w492 fleft mlr4">
  	<div class="comtit1"><h4>联系广发资管</h4>
  	</div>
  	<div style="height:20px"></div>
  	<table width="93%" align="center" class="lh28 mt10">
  	  <tr>
  	    <td width="17"><img src="/pic/business/dot-jt.jpg" /></td>
  	    <td class="font14 blue bold">联系地址： </td>
      </tr>
  	  <tr>
  	    <td>&nbsp;</td>
  	    <td><ul>
  	      <li><span class="font_st font_8c">·</span>广州市天河北路183号大都会广场36楼 <span class="font_st font_8c ml20">·</span>电话：020—87555888　　　 </li>

	      </ul>
          </td>
      </tr>
    </table>
<div class="blank10"></div>
<table width="93%" align="center" class="lh28">
 <tr>
    <td width="17"><img src="/pic/business/dot-jt.jpg" /></td>
    <td class="font14 blue bold">联系人： </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><ul>
      <li><span class="font_st font_8c">·</span><span class="font14 blue">资产管理集合产品客户服务及投诉 </li>
      <li><span class="font_st font_8c">·</span>电话：020-87553576　　 </li>
      <li><span class="font_st font_8c">·</span>传真：020-87553569　 </li>
      <li><span class="font_st font_8c">·</span>邮箱：zcgl_service@gf.com.cn　</li>
    </ul></td>
  </tr>
<tr>
    <td>&nbsp;</td>
    <td><ul>
      <li><span class="font_st font_8c">·</span><span class="font14 blue">资产管理定向产品客户服务及投诉 </li>
      <li><span class="font_st font_8c">·</span>电话：020-87555959　　 </li>
      <li><span class="font_st font_8c">·</span>传真：020-87553569　 </li>
      <li><span class="font_st font_8c">·</span>邮箱：dxvip@gf.com.cn　</li>
    </ul></td>
  </tr>
</table>
  </div>  
  <!--中侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w210 fright">
  <script type="text/javascript" src="${contextPath }/js/jsIfUtils.js"></script>
	<iframe target="_blank" id="leftlogin" name="leftlogin"  marginWidth="0" marginHeight="0" src="${contextPath }/commons/loginTemp.jsp"
						frameBorder="0" noresize width="100%" scrolling="no"></iframe>
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