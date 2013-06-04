<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${ctx }/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx }/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx }/js/csswebutf.js"></script>
<script type="text/javascript">
function checkLoginTo(){
	document.loginForm.submit();
}
</script>
</head>

<body class="body_bg">
<jsp:include page="/share/top.jsp?nav=jgj&nav1=dcxdz" />
<div class="main">
  <div class="dqwz">当前位置：首页 > 我的理财中心 > 金管家短彩信定制</div>
  <div class="left_tit2"><span class="dqwz">金管家短彩信定制</span></div>
  <form name="loginForm" action="${ctx }/tcsswebDcxdzAction.do?method=getTcsswebDcxdzListByAccount" method="post" id="loginForm">
  <div class="blank10"></div>
	<div class="popCon" >
	<br/><p class="red2 font14 bold" align="center">恭喜您，短彩信定制完成!</p><br />
	 <p class="lh28 font14">　　定制情况请点击【确认】按钮查看。</p>
     <p class="lh28 font14">　　如定制成功，您的短彩信服务产品，会在两个工作日内，为您开通，请您耐心等待，谢谢！具体您订阅的短彩信情况，请点击
     <span class="red2" style="text-decoration:underline"><a href="${ctx }/tcsswebDcxdzAction.do?method=getTcsswebDcxdzListByAccount">短彩信定制情况</a></span>
     进行查询</p>
	</div>
    <div>
    <p align="center">
    	<!--<input name="" type="button" value="确认" onclick="location.href='/golden/dcxdz/Smsdzqk.jsp'" class="popBtn1" />-->
    	<input name="" type="button" value="确认" onclick="checkLoginTo()" class="popBtn1" />
    </p>
    </div>
   </form>
</div>

</body>
<jsp:include page="/commons/bottom.jsp" />


</html>