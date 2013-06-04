<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<jsp:directive.page import="com.css.cms.document.util.DocumentHelper"/>
<%@ include file="/commons/taglibs.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%
		
		String category1 = "iptv_lxwm";
 %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${ctx}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />

</head>

<body class="body_bg">
<jsp:include page="/share/top.jsp?nav=wsyyt&nav1=iptvsp" />
<div class="wjdc_box">
  <p class="wjdc"><a href="/investorEdu/investorSurvey.html"><img src="/pic/index/wzdc.jpg"/></a></p>
</div>
<div class="main">
  <div class="dqwz">当前位置：<a href="${ctx }/index.jsp?nav=index">首页</a> &gt; <a href="${ctx }/bussinesshall/index.jsp?nav=wsyyt">网上营业厅</a> &gt; <a href="${ctx }/bussinesshall/iptv/iptv.jsp?nav=wsyyt&nav1=iptvsp">GFTV</a> &gt;  频道介绍</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">  
  <div class="iptvside_top"></div>
    <div class="iptvside_mid">
        <jsp:include page="iptv_lmenu.jsp?nav2=lxwm" />
    </div>
    <div class="iptvside_bot"></div>
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始--> 
  <div class="w706 fright">
  		<div class="left_tit2">联系我们</div>

 <table width="709" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td> 
    <paging:page count="false" row="1" provider="<%= new com.css.cms.document.model.DocumentFrontListProvider(category1,request)%>" tableId="doclist">
  		    	<paging:pageRow id="doc" type="com.css.cms.document.Document"> 
		          	 <%=DocumentHelper.getContent(doc)%>
		          </paging:pageRow>
      </paging:page>
          
    </td> </tr>
    
</table>


  </div>
   <!--右侧sied结束--> 
    <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="/share/bottom.jsp" />

</body>
</html>