<%@ page contentType="text/html; charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<link href="/css/investorNexus/investorNexus.css" rel="stylesheet" type="text/css" />

</head>
<body>
<jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="/default.html">首页</a> - <a href="/about/aboutUs.html">关于广发</a> - 企业社会责任</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft">
		<jsp:include page="/about/about_lmenu.jsp?meun=qyshzr" />
  </div>
  <!--左侧sied结束-->
     <div class="w706 fright">
  		<div class="comtit1"><h4>企业社会责任</h4></div>
    <div class="clearfloat"></div>
 
  		
    <div class="blank10"></div>
    <table width="95%" align="center" border="0" cellspacing="0" cellpadding="0" >
      <tr>
        <td>
         
        </td>
      </tr>
    </table>
    <div class="blank5"></div>
    <table width="100%" align="center" border="0" cellspacing="0" cellpadding="0" >
      <tr>
        <td>
        <jsp:include page="${ctx }/investorNexus/list.jsp">
          		<jsp:param name="whichCat" value="tzzgx_qyshzr"/>
          		<jsp:param name="showSize" value="60"/>
          </jsp:include>
        </td>
      </tr>
    </table>
<div class="blank10"></div>
  </div>
  <!--中侧sied结束--> 
 <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<div class="blank5"></div>
<jsp:include page="/commons/msbottom.jsp" />
</body>
</html>