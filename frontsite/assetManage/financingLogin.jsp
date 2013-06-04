<%@ page contentType="text/html; charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${contextPath }/css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<jsp:include page="${contextPath }/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="${contextPath }/default.html"> 首页 </a>-<a href="${contextPath }/assetManage/index.jsp">资产管理</a> - 理财帐户查询</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft">
		<jsp:include page="lc3h.jsp" />
        <div class=" blank5"></div>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td><a href="financingLogin.jsp"><img src="${contextPath }/pic/assetManage/sideban1.jpg" /></a></td>
      </tr>
      <tr>
        <td height="5"></td>
      </tr>
      <tr>
        <td><a href="#"><img src="${contextPath }/pic/assetManage/sideban3.jpg" /></a></td>
      </tr>
      <tr>
        <td height="5"></td>
      </tr>
    </table>
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w706 fright">
  	<div class="comtit1"><h4>理财帐户查询</h4></div>
  	<div style="height:40px"></div>
  	<div class="lccxtop">资产管理客户登录</div>
    <div class="lccxmid">
   	  <div style="height:35px"></div>
        <table width="230" align="center" class="lh30">
          <tr>
            <td>帐号类别：</td>
            <td><label>
              <select name="select2" id="select2">
                <option>--集合资产管理帐户--</option>
              </select>
            </label></td>
          </tr>
          <tr>
            <td>　账　号：</td>
            <td><input name="textfield3" type="text" class="inpu" id="textfield3" style="width:135px" /></td>
          </tr>
          <tr>
            <td>　密　码：</td>
            <td><input name="textfield" type="text" class="inpu" id="textfield" style="width:135px" /></td>
          </tr>
          <tr>
            <td>　验证码：</td>
            <td><input name="textfield5" type="text" id="textfield5" size="6" />
            <img src="${contextPath }/pic/msindex/sbm.gif" align="absmiddle"/></td>
          </tr>
        </table>
        <div class="clearfloat h25"></div>
      <p align="center" class="mt10"><input type="button" value="登录" class="but01" /> <input type="button" value="注册"  class="but01"/></p>
        <div style="height:35px"></div>
        <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td class="font_73 lh20">提示：初始密码是身份证数字后六位，请登陆后到“账户资料修改－> 密码修改”处进行密码修改！ </td>
          </tr>
      </table>

    </div>
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<div class="blank5"></div>
<jsp:include page="${contextPath }/commons/msbottom.jsp" />
</body>
</html>