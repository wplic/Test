<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<%@page import="java.util.List"%>
<%@page import="com.cssweb.subscribe.pojo.TcsswebFwtcdy"%>
<jsp:directive.page import="com.cssweb.client.pojo.TsystemWebuser"/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${ctx }/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx }/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
</head>
<%
TcsswebFwtcdy tcsswebFwtcdy=null;
if(request.getAttribute("tcsswebFwtcdy")!=null&&!request.getAttribute("tcsswebFwtcdy").equals(""))
tcsswebFwtcdy=(TcsswebFwtcdy)request.getAttribute("tcsswebFwtcdy");

TsystemWebuser tsystemWebuser=null;
		if(request.getSession().getAttribute("tsystemWebuser")!=null)
		tsystemWebuser=(TsystemWebuser)request.getSession().getAttribute("tsystemWebuser");

 %>
<body class="body_bg">
<jsp:include page="/share/top.jsp?nav=jgj&nav1=zzfwdypr" />
<div class="main">
  <div class="dqwz">当前位置：首页 > 网上营业厅 > 我的理财中心 &gt; <a href="${ctx }/tcsswebFwcpcxAction.do?method=getTcsswebFwcpcxListByAccount">我的管家资讯</a></div> 
<div class="wrap920">

	<P><img src="${ctx }/pic/Subscribe/dylc.jpg"  /></P>
  <div class="dybox1" id="list1">
    
    
    <div class="blank10"></div>
    <p class="p10 lh22">
    
    尊敬的<%=tsystemWebuser!=null&&tsystemWebuser.getServiceName()!=null?tsystemWebuser.getServiceName():"" %>，您好：<br />
      感谢您的定制，您定阅的套餐为
<%=tcsswebFwtcdy!=null&&tcsswebFwtcdy.getPackageName()!=null?tcsswebFwtcdy.getPackageName():"" %>
，本次申请结果将在T+1内得到回复，请您继续关注，详情请咨询开户营业部。<br />
您可以在我的理财中心-我的管家资讯看到定阅后的资讯服务产品。
    <p style="height:200px"></p>
    <p class="p10" align="center"><input name="dyxyb" class="dybtn1" type="button" value="确认" onclick="checkLogin();" />
    </p>
    <p style="height:100px"></p>
  </div>
  
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="/share/bottom.jsp" />
</body>
<script type="text/javascript">
 function checkLogin(){
	   document.location.href="${ctx}/tcsswebFwcpyslAtion.do?method=getTcsswebFwcpyslListByAccount";
     }
</script>
</html>