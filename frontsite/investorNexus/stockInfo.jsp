<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@include file="/commons/taglibs.jsp"%>
<jsp:directive.page import="java.util.List"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<link href="/css/investorNexus/investorNexus.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx }/js/ofc2/json/json2.js"></script>
<script type="text/javascript" src="${ctx }/js/ofc2/swfobject.js"></script>
<script type="text/javascript">
			function doSubmit(){
			document.getElementById("f2").submit();
			}
		</script>
</head>
<body>
<jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="/default.html">首页</a> - <a href="/investorNexus/index.html">投资者关系</a> - 股票信息</div>
</div>
<div class="wrap_3c">
  <!--左侧sied开始-->
  <div class="w210 fleft">
		<jsp:include page="/investorNexus/index_lmenu.jsp?nav=gpxx" />
  </div>
  <!--左侧sied结束-->
   
  <!--中侧sied开始-->
  <div class="w492 fleft mlr4">
  		<div class="comtit1"><h4>股票信息</h4>
  		</div>
    <div class="blank10"></div>
    
    
    <table width="486" align="center" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="bold font14 white" height="30" bgcolor="#cbcbcb" align="center">2010年度、2011年度分红情况</td>
      </tr>
    </table>
    
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="3" class="lh25 fenhong">
      <tr >
        <th class="bold">报告期</th>
        <td class="bold">2011年度</td>
        <td class="bold">2010年度</td>            
      </tr>    
	  <tr >
        <th class="bold">方案进度</th>
        <td class="bold">已实施</td>
        <td class="bold">已实施</td>            
      </tr> 
      <tr >
        <th class="bold">分红送转</th>
        <td class="bold">是</td>
        <td class="bold">是</td>            
      </tr> 		
		<tr >
        <th  class="bold">每股送股比例</th>
        <td class="bold">0</td>
        <td class="bold">0</td>            
      </tr>			
		<tr >
        <th  class="bold">每股转增比例</th>
        <td class="bold">1</td>
        <td class="bold">0</td>            
      </tr>
	 <tr >
        <th  class="bold">每股派息（税前）（元）</th>
        <td class="bold">0.5</td>
        <td class="bold">0.5</td>            
      </tr>
	  <tr >
        <th  class="bold">预案公告日</th>
        <td class="bold">2012.4.17</td>
        <td class="bold">2011.4.7</td>            
      </tr>
		<tr >
        <th  class="bold">股东大会公告日</th>
        <td class="bold">2012.5.8</td>
        <td class="bold">2011.4.28</td>            
      </tr>
		<tr >
        <th  class="bold">实施公告日</th>
        <td class="bold">2012.6.29</td>
        <td class="bold">2011.6.14</td>            
      </tr>
		
			
    </table>
  </div>
  <!--中侧sied结束--> 
    <!--右侧sied开始-->
   <jsp:include page="/investorNexus/include_right.jsp" />
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
    <div class="blank5"></div>
<jsp:include page="/commons/msbottom.jsp" />
</body>
<script type="text/javascript"> 
var _aq = _aq || [];
_aq.push(['_setSiteId', 10001]);_aq.push(['_setCatalogId', 19]); _aq.push(['_trackPageview']); (function() {
var ga = document.createElement( 'script'); ga.type = 'text/javascript'; ga.async = true; ga.src='http://121.8.153.59:8080/stat/stat.js'; var s = document.getElementsByTagName( 'script')[0]; s.parentNode.insertBefore(ga, s); })();
</script>
</html>