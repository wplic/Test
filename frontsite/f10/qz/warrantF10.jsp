<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<jsp:directive.page import="com.cssweb.F10.gazx.qz.pojo.QzInfo"/>
<jsp:directive.page import="java.text.SimpleDateFormat"/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
<% 
	// 如果url传了股票代码，则用url的股票代码，否则用session中的股票代码
	String zqdm=request.getParameter("zqdm")==null?"":request.getParameter("zqdm");
	if(!zqdm.equals("")) session.setAttribute("zqdm", zqdm);
	
	if(session.getAttribute("qzdm")==null||session.getAttribute("qzdm").equals("")) session.setAttribute("qzdm", "580018");

	zqdm=(String)session.getAttribute("qzdm");
	QzInfo qzInfo = (QzInfo)session.getAttribute("qzInfo");
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
%>
</head>

<body class="body_bg">
<jsp:include page="/share/top.jsp" />
<div class="main">
  <div class="dqwz">当前位置：首页 > 资讯中心 > 权证个股</div>
  <div class="ggxx">
 <div class="left_tit2">权证个股资料</div> 
<div class="blank5"></div>
<div class="f10_tab03">
	<span class="red font14 bold ml32"><%=qzInfo.getQzjc()%>（<%=qzInfo.getQzdm()%>）</span>
    <span class="font14 ml10">权证类别：<%=qzInfo.getQzlb()%></span>
</div>
<div class="blank5"></div>
<div class="kline">
  <div class="qiebg">
    <iframe src="http://121.14.21.4/_gfflash.php?code=<%=zqdm%>" id="fundIframe" marginheight="0" marginwidth="0" frameborder="0" scrolling="auto" width="95%" style="height: 492px" ></iframe>
    
  </div>
</div>
<div class="blank10"></div>
<%if(null!=qzInfo){%>
<table border="1" width="100%" bordercolor="#cccccc" align="center" class="lh24">
  <tr>
    <td width="143" align="center" class="tab_th1 bold"><p align="center"><strong>项目 </strong></p></td>
    <td width="359" align="center" class="tab_th1 bold"><p align="center"><strong>内容 </strong></p></td>
    <td class="tab_th1 bold" align="center"><p align="center"><strong>项目 </strong></p></td>
    <td width="258" align="center" class="tab_th1 bold"><p align="center"><strong>内容 </strong></p></td>
  </tr>
  <tr>
    <td><p align="center">权证代码 </p></td>
    <td><p><%=qzInfo.getQzdm()%></p></td>
    <td width="132"><p align="center">行权代码 </p></td>
    <td><p><%=qzInfo.getXqdm()%></p></td>
  </tr>
  <tr>
    <td><p align="center">权证简称 </p></td>
    <td><p><%=qzInfo.getQzjc()%></p></td>
    <td width="132"><p align="center">行权简称 </p></td>
    <td><p><%=qzInfo.getXqjc()%></p></td>
  </tr>
  <tr>
    <td><p align="center">权证性质 </p></td>
    <td><p> --</p></td>
    <td width="132"><p align="center">权证类别 </p></td>
    <td><p><%=qzInfo.getQzlb()%></p></td>
  </tr>
  <tr>
    <td><p align="center">发行起始日 </p></td>
    <td><p>--</p></td>
    <td width="132"><p align="center">行权方式 </p></td>
    <td><p><%=qzInfo.getXqfs()%></p></td>
  </tr>
  <tr>
    <td><p align="center">发行截至日 </p></td>
    <td><p>--</p></td>
    <td width="132"><p align="center">行权价格 </p></td>
    <td><p><%=qzInfo.getJxxqj()%></p></td>
  </tr>
  <tr>
    <td><p align="center">发行对象 </p></td>
    <td><p><%=qzInfo.getFxdx()%></p></td>
    <td width="132"><p align="center">行权比例 </p></td>
    <td><p><%=qzInfo.getJxxqbl()%></p></td>
  </tr>
  <tr>
    <td><p align="center">发行价格 </p></td>
    <td><p><%=qzInfo.getFxjg()%></p></td>
    <td width="132"><p align="center">行权起始日 </p></td>
    <td><p><%=sdf.format(qzInfo.getXqr())%></p></td>
  </tr>
  <tr>
    <td><p align="center">上市总量 </p></td>
    <td><p><%=qzInfo.getFxsl()%></p></td>
    <td width="132"><p align="center">行权终止日 </p></td>
    <td><p><%=sdf.format(qzInfo.getXqzzr())%></p></td>
  </tr>
  <tr>
    <td><p align="center">上市地点 </p></td>
    <td><p><%=qzInfo.getSsdd()%></p></td>
    <td width="132"><p align="center">最后交易日 </p></td>
    <td><p><%=sdf.format(qzInfo.getZhjyr())%></p></td>
  </tr>
  <tr>
    <td><p align="center">上市状态 </p></td>
    <td><p>--</p></td>
    <td width="132"><p align="center">成功行权的股份 </p></td>
    <td><p>--</p></td>
  </tr>
  <tr>
    <td><p align="center">终止上市日 </p></td>
    <td><p>--</p></td>
    <td width="132"><p align="center">行权股份上市流通日 </p></td>
    <td><p>--</p></td>
  </tr>
</table>
<%}%>
<div class="blank10"></div>
<iframe id="f10Frame" name="f10Frame" src="/qzInfo.do?method=getQzGsgg&qzdm=<%=zqdm%>" width="100%" height="196" frameborder="0" marginheight="0" marginwidth="0" scrolling="no"></iframe>
  </div> 
</div>
<jsp:include page="/share/bottom.jsp" />
<script src="/js/setTab.js"></script>
</body>
</html>