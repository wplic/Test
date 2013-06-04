<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<jsp:directive.page import="com.cssweb.theme.service.ThemeCategoryService"/>
<jsp:directive.page import="com.cssweb.theme.pojo.ThemeCategory"/>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="java.util.Date"/>
<jsp:directive.page import="java.text.SimpleDateFormat"/>
<%
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
ServletContext st = this.getServletConfig().getServletContext();
ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
ThemeCategoryService themeCategoryService = (ThemeCategoryService) ctx.getBean("themeCategoryService");
List list=themeCategoryService.getAllByGqisshow();
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<link href="/css/job/job.css" rel="stylesheet" type="text/css" />
<style>
.wrap_3left{width:920px; margin:0 auto; background:url(/pic/liability/wrap2left.gif) repeat-y;}
.wrap_3left .w210{ width:198px; padding:6px;}
.sidemenu3{ width:198px;}
.sidemenu3 .link{ background:url(/pic/liability/sidemnenua.gif) no-repeat; width:198px; height:30px; line-height:30px; text-indent:60px; display:block}
.sidemenu3 .active{ background:url(/pic/liability/sidemnenuh.gif); font-weight:bold; height:30px; line-height:30px; text-indent:60px; display:block}
.sidemenu3 .submenu{background:#FFF; line-height:28px; font-family:"宋体"; padding:6px 0px 6px 56px;}
.shzp_tt{background:url(/pic/liability/shzp_tt.jpg) repeat-x;border-left:1px solid #df97b8;border-right:1px solid #df97b8; height:29px;}
.w703{width:703px;}
.itempiclist li{float:left;text-align:center;position:relative;width:170px;height:135px;padding-right:6px;}
.itempiclist li p{line-height:25px;height:25px;background:#eee;width:170px;position:absolute;left:0;bottom:0;opacity:0.8;filter:alpha(opacity=80)}
.itempiclist img{width:170px;height:135px;margin:0;border:0;padding:0;}
.leftlink8{background:url(/pic/liability/llinkboxbg.gif) no-repeat 0 bottom;padding-bottom:60px;}
.leftlink8 p{line-height:40px;height:53px;text-align:center;font-family:"黑体","宋体",Arial; font-size:18px;font-weight:normal;color:#af5f5e;background:url(/pic/liability/llinkbg.gif) no-repeat;}
.leftlink8 p a{color:#fff;}
.zrinfobox{height:86px;width:530px;background:url(/pic/liability/infobg.jpg) no-repeat;padding:75px 10px 20px 165px;}
</style>
</head>
<body>
<jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="${ctx }/default.html">首页</a> - 企业社会责任</div>
</div>
<div class="wrap_3left">
  <!--左侧sied开始-->
  <div class="w210 fleft">
		<jsp:include page="/liability/lmenu.jsp" />
    <div class="blank5"></div>
   	

  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
 <div class="w706 fright">
<div class="fleft w706">
<div class="zrinfobox">
<marquee scrollamount="1" direction="up" scrolldelay="1" id="marquee_pmd_top" onMouseOver="marquee_pmd_top.stop()" onMouseOut="marquee_pmd_top.start()" style="width:530px;height:86px;">
<div>
<p style="line-height:25px;text-indent:2em;padding-top:10px;">
 <table><tr><td>
	  	<jsp:include page="/liability/indexTitle.jsp">
           <jsp:param name="whichCat" value="gfwqjbjs"/>
           <jsp:param name="state" value="1"/>
    	</jsp:include>
    </td></tr></table>	
    	</p></div>
      	</marquee>

</div>
</div>
<div class="clearfloat"></div><!--清除浮动--> 
<div class="clearfloat"></div>
<div class="fleft w706">
<div class="shzp_tt w703"><p class="shzp_bq bold fleft">新闻报道列表</p>
<a href="${ctx }/liability/liablility.jsp?whichCat=gfwqxwbd&nav2=xwbd">
<p class="fright lh29 mr5 font_st font_73">更多>></p>
</a>
</div>
<div class="blank10"></div>
<table width="95%" align="center" class="lh25 font_st">
  <jsp:include page="/liability/liabilList.jsp">
           <jsp:param name="whichCat" value="gfwqxwbd"/>
           <jsp:param name="showSize" value="5"/>
           <jsp:param name="titleWidth" value="56"/>
           <jsp:param name="state" value="1"/>
    	</jsp:include>
</table>
</div>
<div class="clearfloat h15"></div>
<div class="fleft w706">
<div class="shzp_tt w703"><p class="shzp_bq bold fleft">精彩专题图片</p></div>
<div class="blank10"></div>
<table width="96%" align="center"  border="0" cellspacing="0" cellpadding="0" >
<tr align="center">
 <%if(null!=list){
    	for(int i=0;i<list.size();i++){
    		ThemeCategory themeCategory = (ThemeCategory)list.get(i);%>
      <td>
      <%if(null!=themeCategory&&themeCategory.getPicidgq()>0){ %>
      <a href="${ctx }/about/theme.jsp?themeid=<%=themeCategory.getId()%>">
      <img src="${ctx}/share/showUploadImage.jsp?id=<%=themeCategory.getPicidgq()%>" width="162" height="105" />
      </a>
      <%} %>
     </td>
      <%}
      } %>
      </tr>
      </table>
</div>
<div class="clearfloat"></div>
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<div class="blank5"></div>
<jsp:include page="/commons/msbottom.jsp" />
</body>
</html>