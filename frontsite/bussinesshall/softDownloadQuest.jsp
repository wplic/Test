<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
<script src="/js/setTab.js"></script>
</head>

<body class="body_bg">
<jsp:include page="${ctx }/share/top.jsp" />
<div class="wjdc_box">
  <p class="wjdc"><a href="/investorEdu/investorSurvey.html"><img src="/pic/index/wzdc.jpg"/></a></p>
</div>
<div class="main">
  <div class="dqwz">当前位置：<a href="${ctx }/index.jsp?nav=index">首页</a> &gt; <a href="${ctx }/bussinesshall/index.jsp?nav=wsyyt">网上营业厅</a>  &gt; 软件下载</div>
  <div class="w262 fleft bg_ec ptb13">
  		<div class="side_top"></div>
    <jsp:include page="${ctx}/bussinesshall/newsSoftList.jsp">
            <jsp:param name="catName" value="软件下载公告" />
            <jsp:param name="whichCat" value="wsyyt_xzgg"/>
            <jsp:param name="state" value="1"/>
            <jsp:param name="showSize" value="5"/>
    </jsp:include>
    <div class="side_bot"></div>
    <div style="height:40px; overflow:hidden"></div>
        <p align="center"><a href="${ctx }/bussinesshall/investorEdu/webtradeRisk.html"><img src="/pic/wsyyt/softDownload/ban_fxjs.jpg"/></a></p>
    <p align="center" class="mt10"><a href="${ctx }/bussinesshall/softDownloadQuest.jsp"><img src="/pic/wsyyt/softDownload/ban_rjxz.jpg"/></a></p>
  </div>
  <div class="w650 fright">
  		<div class="left_tit2" >软件下载常见问题</div>
  		<p class="mt10" align="center"><a href="#">
    <img src="/pic/wsyyt/mobileDeal/a0.jpg" width="99%" /></a></p><br />
  		<table width="100%">
  		<tr>
  			<td  align="right">
  		<iframe id="ifm" name="" src="${ctx }/bussinesshall/movetradehall/schoolQueryNewsList.jsp?state=1&whichCat=wsyyt_jszc&is_delete=0"   frameborder="0" marginheight="0"  marginwidth="0"  width="95%" scrolling="no">
                   </iframe>
                   </td>
  		</tr>
  </table>	
		
   </div>
<div class="clearfloat"></div>
<jsp:include page="${ctx }/share/bottom.jsp" />
</body>
</html>