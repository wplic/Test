<%@ page contentType="text/html; charset=utf-8" language="java"  %>
<%@ taglib uri="/WEB-INF/tlds/adTag.tld" prefix="adTag"%>
<%@ include file="/commons/taglibs.jsp"%>
<%
String menustr="基础知识介绍";
String menu = request.getParameter("menu");
String flashUrl="/pic/financing/basicKnow1.swf";
if(menu!=null&&!menu.equals("")&&menu.equals("2")){
flashUrl="/pic/financing/basicKnow3.swf";
menustr="业务办理流程";
}else if(menu!=null&&!menu.equals("")&&menu.equals("3")){
flashUrl="/pic/financing/basicKnow4.swf";
menustr="业务交易与注意事项";
}else if(menu!=null&&!menu.equals("")&&menu.equals("4")){
flashUrl="/pic/financing/basicKnow.swf";
menustr="风险与收益";
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
<link href="${contextPath}/css/financing/financing.css" rel="stylesheet" type="text/css" />
<script src="../Scripts/swfobject_modified.js" type="text/javascript"></script>
</head>
<body>
<jsp:include page="${contextPath}/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="/default.html">首页</a> - <a href="/financing/index.html"> 融资融券</a> - <a href="/financing/basicKnowledge.html">投资者学苑</a> - <%=menustr %></div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft">
		<jsp:include page="${contextPath}/financing/flash_lmenu.jsp?menu=<%=menu%>" />
  </div>
  <!--左侧sied结束-->
   
  <!--中侧sied开始-->
  <div class="w706 fright">
  		<div class="comtit1"><h4><%=menustr %></h4></div>
    <div class="clearfloat h25"></div>
    <table width="94%" class="fcenter">
      <tr>
        <td class="flash_l">&nbsp;</td>
        <td class="flash_m">
        <object id="FlashID" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="533" height="380">
          <param name="movie" value="${contextPath }<%=flashUrl %>" />
          <param name="quality" value="high" />
          <param name="wmode" value="transparent" />
          <param name="swfversion" value="9.0.45.0" />
          <!-- 此 param 标签提示使用 Flash Player 6.0 r65 和更高版本的用户下载最新版本的 Flash Player。如果您不想让用户看到该提示，请将其删除。 -->
          <param name="expressinstall" value="/Scripts/expressInstall.swf" />
          <!-- 下一个对象标签用于非 IE 浏览器。所以使用 IECC 将其从 IE 隐藏。 -->
          <!--[if !IE]>-->
          <object type="application/x-shockwave-flash" data="${contextPath }<%=flashUrl %>" width="533" height="380">
            <!--<![endif]-->
            <param name="quality" value="high" />
            <param name="wmode" value="transparent" />
            <param name="swfversion" value="9.0.45.0" />
            <param name="expressinstall" value="/Scripts/expressInstall.swf" />
            <!-- 浏览器将以下替代内容显示给使用 Flash Player 6.0 和更低版本的用户。 -->
            <div>
              <h4>此页面上的内容需要较新版本的 Adobe Flash Player。</h4>
              <p><a href="http://www.adobe.com/go/getflashplayer"><img src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif" alt="获取 Adobe Flash Player" width="112" height="33" /></a></p>
            </div>
            <!--[if !IE]>-->
          </object>
          <!--<![endif]-->
        </object>	
		</td>
        <td class="flash_r">&nbsp;</td>
      </tr>
    </table>
<div class="clearfloat h15"></div>
  </div>
  <!--中侧sied结束--> 
   
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
    <div class="blank5"></div>
<jsp:include page="${contextPath}/commons/msbottom.jsp" />

</body>
</html>