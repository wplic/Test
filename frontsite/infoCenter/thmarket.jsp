<%@ page contentType="text/html; charset=utf-8" language="java"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<%@ include file="/commons/taglibs.jsp"%>
<%@page import="com.css.cms.category.CategoryTree"%>
<%@page import="com.css.cms.category.*"%>
<%@page import="com.css.cms.document.*"%>
<jsp:directive.page import="com.cssweb.common.util.StringUtils"/>
<jsp:directive.page import="com.css.cms.document.util.DocumentHelper"/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
</head>
<%
String bt="三板新闻";
CategoryTree catTree= null;
if(request.getParameter("siteName")!=null){
		catTree = CategoryFactory.getCategoryTree(request.getParameter("siteName"));
	}else{
		catTree = CategoryFactory.getCategoryTree(DocumentManager.getCmsRootName());
		
	}
String whichCat="zxzx_sb_sbxw";
if(request.getParameter("whichCat")!=null&&!request.getParameter("whichCat").equals(""))
{
whichCat=request.getParameter("whichCat");
	CategoryNode catNode = catTree.getCategoryNode(whichCat);
	
	if(catNode!=null)
	bt=catNode.getDisplayName();
}

String nav2=whichCat;
if(request.getParameter("nav2")!=null&&!request.getParameter("nav2").equals(""))
 nav2=request.getParameter("nav2");

 String nav3="";
 if(request.getParameter("nav3")!=null&&!request.getParameter("nav3").equals(""))
 nav3=request.getParameter("nav3");
%>
<body class="body_bg">
<jsp:include page="/share/top.jsp?nav=zxzx&nav1=sb" />
<div class="wjdc_box">
  <p class="wjdc"><a href="/investorEdu/investorSurvey.html"><img src="/pic/index/wzdc.jpg"/></a></p>
</div>
<div class="main">
  <div class="dqwz">当前位置：<a href="${contextPath }/index.jsp?nav=index">首页</a> &gt; <a  href="/infoCenter/index.jsp?nav=zxzx"> 资讯中心 </a> &gt;<a href="${contextPath }/infoCenter/thmarket.jsp?nav=zxzx&nav1=sb"> 三板 </a> </div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">  
  <div class="iptvside_top"></div>
  <div class="iptvside_mid">
	  <jsp:include page="/infoCenter/thmarket_lmenu.jsp">
           <jsp:param name="nav2" value="<%=nav2%>"/>
           <jsp:param name="ipic" value="3"/>
           <jsp:param name="nav3" value="<%=nav3%>"/>
    	</jsp:include>
	  <jsp:include page="/infoCenter/Search.jsp"/>
  </div>
  <div class="iptvside_bot"></div>
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w706 fright">
    <div class="left_tit2"><%=bt %></div>
    <div class="blank10"></div>
    
    <jsp:include page="/infoCenter/tbbTitle.jsp">
           <jsp:param name="whichCat" value="<%=whichCat%>"/>
    	</jsp:include>
    
    <div class="blank10"></div>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td valign="top">
         <jsp:include page="/infoCenter/tbbList.jsp">
           <jsp:param name="whichCat" value="<%=whichCat%>"/>
           <jsp:param name="showSize" value="13"/>
           <jsp:param name="titleWidth" value="56"/>
    	</jsp:include>
        </td>
        <td width="236" valign="top" class="bg_ec">
        <div class="blank5"></div>
        <table width="95%" border="1" bgcolor="#ffffff" bordercolor="#cfcfcf" class="lh21 mt5" align="center">
        	<tr>
        	    <td width="94%" class="info_th01">代办转让提示</td>
      	    </tr>
            <tr>
        	    <td class="p10">　　代办股份转让投资风险大，投资者对此应有充分的了解。<br />
　　投资者在与营业部签订委托协议，进行股份代办转让前，应认真阅读《股份转让风险提示书》，理解所提示的风险，承诺自己承担投资风险，并签名确认。
</td>
      	    </tr>
      	  </table>
        <div class="blank5"></div>
        
        <table width="95%" align="center" class="lh21 mt5">
        	<tr>
        	    <td width="94%"> <%
  if(whichCat!=null&&whichCat.equals("zxzx_sb_sbgg")){
  %>
  <a href="http://bjzr.gfzr.com.cn/bjzr/index.html" target="_blank">
  <img src="/pic/index/gqzrbutton1.gif"/>
 </a>
  <%
  }
  if(whichCat!=null&&whichCat.equals("zxzx_sb_gfbg")){
  %>
   <a href="http://www.gfzr.com.cn/index2.htm" target="_blank">
   <img src="/pic/index/gqzrbutton2.gif"/>
  </a>
  <%
  }
   %>
     </td></tr></table>
    
		</td>
      </tr>
      
    </table>
     
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
  
 
  
</div>
<jsp:include page="/share/bottom.jsp" />
<iframe width=174 height=189 name="gToday:normal:agenda.js" id="gToday:normal:agenda.js"
			src="${ctx}/js/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; left:-500px; top:0px;"> 

</body>
</html>