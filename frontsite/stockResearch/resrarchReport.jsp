<%@page import="com.css.cms.document.util.DocumentHelper"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@ page contentType="text/html; charset=UTF-8" language="java"    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<jsp:directive.page import="com.cssweb.common.util.StringUtils"/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<link href="/css/stockResearch/stockResearch.css" rel="stylesheet" type="text/css" />
</head>
<body>
<jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="/default.html">首页</a>  -  <a href="/stockResearch/index.html">证券研究</a>  - 研究资讯</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft">
		<jsp:include page="/stockResearch/report_lmenu.jsp" />
  </div>
  <!--左侧sied结束-->
   
  <!--中侧sied开始-->
  <div class="w706 fright">
  		<div class="comtit1"><h4>研究报告</h4></div>
    <div class="clearfloat h25"></div>

<div class="fleft pl20 w314">
<table>
  <tr>
    <td class="gfpt"><p class="fleft indent42 bold">晨会纪要</p><p class="fright font_st">
    <a href="${ctx }/stockResearch/companyResearchChyj.html">
    更多>>&nbsp;&nbsp;
    </a></p>
    </td>
  </tr>
 </table>
   <jsp:include page="/stockResearch/yjbgTbbTitle.jsp">
           <jsp:param name="whichCat" value="zqyj_yjbg_ch"/>
           <jsp:param name="showSize" value="5"/>
           <jsp:param name="titleWidth" value="20"/>
    	</jsp:include>
</div>    

<div class="fleft ml25 w314">
<table>
  <tr>
    <td class="gfpt"><p class="fleft indent42 bold">宏观研究</p><p class="fright font_st">
    <a href="${ctx }/stockResearch/companyResearchHgyj.html">
    更多>>&nbsp;&nbsp;
    </a></p>
    </td>
  </tr>
 </table>
   <jsp:include page="/stockResearch/yjbgTbbTitle.jsp">
           <jsp:param name="whichCat" value="zqyj_yjbg_hgyj"/>
           <jsp:param name="showSize" value="5"/>
           <jsp:param name="titleWidth" value="20"/>
    	</jsp:include>
</div>
<div class="blank10"></div>

<div class="fleft pl20 w314">
<table>
  <tr>
    <td class="gfpt"><p class="fleft indent42 bold">市场策略研究</p><p class="fright font_st">
    <a href="${ctx }/stockResearch/companyResearchTzcl.html">
    更多>>&nbsp;&nbsp;
    </a></p>
    </td>
  </tr>
   </table>
 <jsp:include page="/stockResearch/yjbgTbbTitle.jsp">
           <jsp:param name="whichCat" value="zqyj_yjbg_scyj"/>
           <jsp:param name="showSize" value="5"/>
           <jsp:param name="titleWidth" value="20"/>
    	</jsp:include>
</div>

<div class="fleft ml25 w314">
<table>
  <tr>
    <td class="gfpt"><p class="fleft indent42 bold">固定收益策略</p><p class="fright font_st">
    <a href="${ctx }/stockResearch/companyResearchGdsy.html">
    更多>>&nbsp;&nbsp;
    </a></p>
    </td>
  </tr>
   </table>
   <jsp:include page="/stockResearch/yjbgTbbTitle.jsp">
           <jsp:param name="whichCat" value="zqyj_yjbg_gdsycy"/>
           <jsp:param name="showSize" value="5"/>
           <jsp:param name="titleWidth" value="20"/>
    	</jsp:include>
</div>
<div class="blank10"></div>
<div class="fleft pl20 w314">
<table>
  <tr>
    <td class="gfpt"><p class="fleft indent42 bold">行业研究</p><p class="fright font_st">
    <a href="${ctx }/stockResearch/companyResearchHyyj.html">
    更多>>&nbsp;&nbsp;
    </a></p>
    </td>
  </tr>
   </table>
   <jsp:include page="/stockResearch/yjbgTbbTitle.jsp">
           <jsp:param name="whichCat" value="zqyj_yjbg_hyyj"/>
           <jsp:param name="showSize" value="5"/>
           <jsp:param name="titleWidth" value="20"/>
    	</jsp:include>
</div>

<div class="fleft ml25 w314">
<table>
  <tr>
    <td class="gfpt"><p class="fleft indent42 bold">公司研究</p><p class="fright font_st">
    <a href="${ctx }/stockResearch/companyResearch.html">
    更多>>&nbsp;&nbsp;
    </a></p>
    </td>
  </tr>
   </table>
     <jsp:include page="/stockResearch/yjbgTbbTitle.jsp">
           <jsp:param name="whichCat" value="zqyj_yjbg_gsyj"/>
           <jsp:param name="showSize" value="5"/>
           <jsp:param name="titleWidth" value="20"/>
    	</jsp:include>
</div>
<div class="blank10"></div>
<div class="fleft pl20 w314">
<table>
  <tr>
    <td class="gfpt"><p class="fleft indent42 bold">衍生品研究</p><p class="fright font_st">
    <a href="${ctx }/stockResearch/companyResearchYsp.html">
    更多>>&nbsp;&nbsp;
    </a></p>
    </td>
  </tr>
   </table>
        <jsp:include page="/stockResearch/yjbgTbbTitle.jsp">
           <jsp:param name="whichCat" value="zqyj_yjbg_yspyj"/>
           <jsp:param name="showSize" value="5"/>
           <jsp:param name="titleWidth" value="20"/>
    	</jsp:include>
</div>

<div class="fleft ml25 w314">
<table>
  <tr>
    <td class="gfpt"><p class="fleft indent42 bold">基金研究</p>
    <p class="fright font_st">
    <a href="${ctx }/stockResearch/companyResearchJj.html">
    更多>>&nbsp;&nbsp;
    </a></p>
    </td>
  </tr>
   </table>
 <jsp:include page="/stockResearch/yjbgTbbTitle.jsp">
           <jsp:param name="whichCat" value="zqyj_yjbg_jjyj"/>
           <jsp:param name="showSize" value="5"/>
           <jsp:param name="titleWidth" value="20"/>
    	</jsp:include>
</div>
<div class="blank10"></div>
<div class="fleft pl20 w314">
<table>
  <tr>
    <td class="gfpt"><p class="fleft indent42 bold">其它专题</p>
    <p class="fright font_st">
    <a href="${ctx }/stockResearch/companyResearchQtzt.html">
    更多>>&nbsp;&nbsp;
    </a></p>
    </td>
  </tr>
   </table>
 <jsp:include page="/stockResearch/yjbgTbbTitle.jsp">
           <jsp:param name="whichCat" value="zqyj_yjbg_qtzt"/>
           <jsp:param name="showSize" value="5"/>
           <jsp:param name="titleWidth" value="20"/>
    	</jsp:include>
</div>
</div>
    <div class="clearfloat h25"></div>
  </div>
  <!--中侧sied结束--> 
   
  <div class="clearfloat"></div><!--清除浮动--> 
    <div class="blank5"></div>
<jsp:include page="/commons/msbottom.jsp" />
</body>
	<script type="text/javascript"> 
var _aq = _aq || [];
_aq.push(['_setSiteId', 10001]);_aq.push(['_setCatalogId', 37]); _aq.push(['_trackPageview']); (function() {
var ga = document.createElement( 'script'); ga.type = 'text/javascript'; ga.async = true; ga.src='http://121.8.153.59:8080/stat/stat.js'; var s = document.getElementsByTagName( 'script')[0]; s.parentNode.insertBefore(ga, s); })();
</script>
</html>