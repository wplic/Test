<%request.setCharacterEncoding("UTF-8");%>
<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<jsp:directive.page import="java.util.*"/>
<jsp:directive.page import="com.cssweb.client.pojo.TsystemWebuser"/>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page	import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="com.cssweb.subscribe.service.TcsswebProductidCatidService"%>
<%@page import="com.cssweb.subscribe.pojo.TcsswebProductidCatid"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${ctx }/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx }/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
 <SCRIPT LANGUAGE="JavaScript">
function frameFitSelfHeight1(frameId,countNum){
	myFrameId=frameId;
	myCountNum=countNum;
	
	if(myCountNum==null || myCountNum==undefined || myCountNum<0){
		myCountNum=0;
	}
	myCountNum++;
	if(myCountNum<=20){
		window.parent.window.document.getElementById(myFrameId).height = 903;
		//setTimeout('frameFitSelfHeight1(myFrameId,myCountNum)',600);
	}
}
frameFitSelfHeight1('prodCmsList',null);
</SCRIPT>
</head>
<%
   ServletContext st = this.getServletConfig().getServletContext();
	ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
	TcsswebProductidCatidService tcsswebProductidCatidService = (TcsswebProductidCatidService)ctx.getBean("tcsswebProductidCatidService");
	
   
	List list=null;
	String productId="";
	String whichCat="";
	String productName="";
	if(request.getParameter("productId")!=null&&!request.getParameter("productId").equals(""))
	{
	 productId=request.getParameter("productId");
		 if(productId.equals("224")){
		 //新闻资讯
		  //224 GFTV财富频道
		  %>
		  <script type="text/javascript">
		  window.parent.window.document.location.href="${ctx }/Subscribe/gftv.jsp";
		  </script>
		  <%
		  return;
		 }
	 
	 list=tcsswebProductidCatidService.getProductidCatidListByProductid(Long.valueOf(productId));
		if(list!=null&&list.size()>0){
		for(int i=0;i<list.size();i++)
		{
		TcsswebProductidCatid tcsswebProductidCatid=(TcsswebProductidCatid)list.get(i);
		whichCat=whichCat+tcsswebProductidCatid.getCatName()+"|";
		productName=tcsswebProductidCatid.getProductName();
		}
		//whichCat.substring(0,whichCat.length()-1);
	  }
	}
	System.out.println("   whichCat="+whichCat);
 %>
<body>

<div class="gftv">
        	<ul>
            	<li><a href="${ctx}/bussinesshall/iptv/iptvCszn.jsp" target="_blank">收视指南</a></li>
				<li><a href="${ctx}/tvideo.do?method=getWeekTvideo&amp;nav=wsyyt&amp;nav1=iptvsp&amp;nav2=sszn" target="_blank">一周导视</a></li>
                <li><a href="${ctx}/tvideo.do?method=getNewDateTimeTvideoObject&amp;nav=wsyyt&amp;nav1=iptvsp&amp;nav2=spzb" target="_blank">视频直播</a></li>
                <li><a href="${ctx}/bussinesshall/iptv/iptvDplay.html" target="_blank">视频点播</a></li>
                <li><a href="${ctx}/bussinesshall/iptv/iptvChannel.html" target="_blank">频道介绍</a></li>
                <li><a href="${ctx}/bussinesshall/iptv/iptvIntro.html" target="_blank">栏目介绍</a></li>
                <li><a href="${ctx}/bussinesshall/iptv/iptvAnalyst.html" target="_blank">投资顾问风采</a></li>
                <li><a href="${ctx}/bussinesshall/iptv/iptvWxfg.html" target="_blank">卫星覆盖</a></li>
                <li><a href="${ctx}/bussinesshall/iptv/iptvJrhf.jsp?nav=wsyyt&nav1=iptvsp&nav2=jrhf" target="_blank">今日回放</a></li>
                <li><a href="${ctx}/bussinesshall/iptv/iptvLxwm.jsp" target="_blank">联系我们</a></li>
            </ul>
        </div>
        <div class="blank5"></div>
        
  		 <!--中间内容开始-->
    <div class="w443 fleft" style="_margin:0"> 
      <div class="left_tit2">最新公告</div>
              <p align="center" class="mt5">
              
              <a href="${ctx}/bussinesshall/iptv/iptvzxgg.jsp" target="_blank">
              <img src="${ctx }/pic/wsyyt/iptv/banner1.jpg"/></a></p>
              <p align="center" class="lh21 mt5">
               
              </p>
              <ul class="iptv_marq">
                    <li><a href="${ctx}/bussinesshall/iptv/iptvzxgg.jsp" onclick="this.blur()" target="_blank"><img id="xjimg1" onclick="selectImg(this.id)" src="${ctx }/pic/wsyyt/iptv/marq01.jpg" /></a></li>
                    <li><a href="${ctx}/bussinesshall/iptv/iptvzxgg.jsp" onclick="this.blur()" target="_blank"><img id="xjimg2" onclick="selectImg(this.id)" src="${ctx }/pic/wsyyt/iptv/marq02.jpg" /></a></li>
                    <li><a href="${ctx}/bussinesshall/iptv/iptvzxgg.jsp" onclick="this.blur()" target="_blank"><img id="xjimg3" onclick="selectImg(this.id)" src="${ctx }/pic/wsyyt/iptv/marq03.jpg" /></a></li>
                    <li><a href="${ctx}/bussinesshall/iptv/iptvzxgg.jsp" onclick="this.blur()" target="_blank"><img id="xjimg4" onclick="selectImg(this.id)" src="${ctx }/pic/wsyyt/iptv/marq04.jpg" /></a></li>
              </ul>
            <div class="iptabbox mt10">
               <table>
		          <tr>
		            <td align="center" width="30"><img src="${ctx}/pic/wsyyt/iptv/list_01.jpg"/></td>
		            <td class="iptabhov red bold" width="150" align="center" id="tagtabs1" onmouseover="SwitchNews('tabs', 1, 2,'iptabhov red bold','')"><a href="javascript:void(0)"><a href="${ctx}/bussinesshall/iptv/iptvChannel.html" target="_blank">金管家财富频道特点介绍</a></td>
		            <td width="10"></td>
		            <td width="130" align="center" id="tagtabs2"></td>
		          </tr>
		        </table>
            </div>
             <p align="center" id="tabs1"><img src="${ctx }/pic/Subscribe/banner2.jpg"/></p>
             
             
    </div>
   <!--右侧sied开始--> 
<div class="w260 fright ptb9">
             <jsp:include page="/Subscribe/iptv_week.jsp"/>
                
               </div>
                   
          </div>
   <!--右侧sied结束--> 
    <div class="clearfloat"></div><!--清除浮动--> 
</body>
</html>