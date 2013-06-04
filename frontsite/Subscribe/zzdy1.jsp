<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<jsp:directive.page import="com.cssweb.client.pojo.TsystemWebuser"/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
<style>
.side198{width:198px;}
.side707{width:707px;}
</style>
</head>
<%
TsystemWebuser tsystemWebuser=null;
	if(request.getSession().getAttribute("tsystemWebuser")!=null)
	{
	  %>
			  <script type="text/javascript">
			        var url = "/Subscribe/zzdy2.jsp?xkxx=1";
				  	document.location.href=url;
			       </script>
			 <%
	}
 %>
<body class="body_bg">
<jsp:include page="/share/top.jsp?nav=jgj&nav1=zzfwdypr" />
<div class="main">
  <div class="dqwz">当前位置：首页 > 网上营业厅 > 我的理财中心 &gt; <a href="${ctx }/tcsswebFwcpcxAction.do?method=getTcsswebFwcpcxListByAccount">我的管家资讯</a></div>
  
  <div class="blank10"></div>
</div>
<div class="wrap920">
  <!--左侧sied开始-->
  <div class="side198 fleft">
  
  		<div class="ltit1">
        	<iframe target="_blank" id="leftlogin" name="leftlogin"  marginWidth="0" marginHeight="0" src="${contextPath }/share/loginTemp.jsp"
						frameBorder="0" noresize width="100%" scrolling="no"></iframe>
        </div>
        
        <div class="blank10"></div>
    <div class="ltit1">
  <h5><span class="red">基础服务资讯</span>特色介绍</h5>
      		<div class="content lh21" style="min-height:200px; _height:200px">
				<p>
				快捷便利的交易通道，及时全面的市场资讯，温馨的亲情关怀，专业的呼叫服务，您可以在广发证券安心、放心、舒心地进行投资理财。
      		  </p>  
      	    </div>
        </div>
        <div class="blank10"></div>
  </div>
  <!--左侧sied结束-->
  
  
  
  
  <!--右侧sied开始-->
  <div class="side707 fright">
  		 <div class="dyTit1">为什么要升级我的套餐？</div>
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="ggtab">
          <tr>
            <td class="lh22"><p>定制更高级别的服务产品套餐，您可以获得：<br />
              1、更资深的高级理财顾问频度更高的一对一服务，让您获得更贴心、更具价值的团队服务；<br />
              2、更全面、更核心的金管家资讯产品，让您运筹帷幄，决胜千里；<br />
              3、金管家最新、更具特色的产品将优先配置到高级别的套餐之中，没有最好，只有更好，金管家将不断研发出更能满足客户需求的新型产品，补充道套餐之中。<br />
              <cite class="blue3">乐享套餐：</cite>金管家大众服务套餐，专人的跟踪服务，多元化的产品投资策略，简洁而又快捷。<br />
              <cite class="blue3">优享套餐：</cite>金管家高级服务套餐，资深理财顾问服务，总部投资顾问团队的产品支持，让您尽情体验优质服务。<br />
              <cite class="blue3">尊享套餐：</cite>金管家顶级服务套餐，最顶级的理财顾问服务，最详尽的资讯产品体系，最及时的研究报告，让您享受最尊贵的投资体验。 </p></td>
          </tr>
        </table>
        <div class="blank10"></div>    
    <div class="dyTit1">如何升级我的套餐产品?（订制方法）</div>
    <p><img src="/pic/xu0608/tips.gif" /></p>   
  </div>
  <!--右侧sied结束-->
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="/share/bottom.jsp" />
</body>
</html>