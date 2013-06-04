<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/commons/taglibs.jsp"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.cssweb.handset.pojo.TfinanceCommendHandset"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${ctx}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
<script src="${ctx}/js/setTab.js"></script>
</head>
<%
Map dicMap=new HashMap();//字典表数据
List dicList=null;//品牌列表
List list=null;//手机全部列表
if(request.getAttribute("dicMap")!=null)
	dicMap=(Map)request.getAttribute("dicMap");
if(request.getAttribute("dicList")!=null)
	dicList=(List)request.getAttribute("dicList");
if(request.getAttribute("list")!=null)
	list=(List)request.getAttribute("list");

%>
<body class="body_bg">
<jsp:include page="/share/top.jsp" />
<div class="wjdc_box">
  <p class="wjdc"><a href="/investorEdu/investorSurvey.html"><img src="/pic/index/wzdc.jpg"/></a></p>
</div>
<div class="main">
  <div class="dqwz">当前位置：<a href="${ctx }/index.jsp?nav=index">首页</a> &gt; <a href="${ctx }/bussinesshall/index.jsp?nav=wsyyt">网上营业厅</a>  &gt; <a href="${ctx }/bussinesshall/movetradehall/mobileDeal.jsp?nav=wsyyt&nav1=gfydjyt">金管家手机证券</a>&gt;推荐机型 </div>
  <div class="blank5"></div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">  
  <div class="iptvside_top"></div>
  <div class="iptvside_mid">
	  <jsp:include page="mobileDeal_lmenu.jsp" />
      <table width="93%" class="mt10" align="center">
          <tr>
            <td class="right_tit1">金管家手机证券公告</td>
          </tr>
        </table>

     <jsp:include page="${contextPath}/bussinesshall/movetradehall/newsListNotify.jsp?nav2=ywktlc">
            <jsp:param name="catName" value="金管家手机证券公告" />
            <jsp:param name="whichCat" value="wsyyt_ydjyt_ydjytgg"/>
            <jsp:param name="state" value="1"/>
            <jsp:param name="showSize" value="5"/>
    </jsp:include>

       	
  </div>
  <div class="iptvside_bot"></div>
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始--> 
  <div class="w706 fright">
  <div class="left_tit2">推荐机型</div>
    <div id="recInro">
    <h4>为了让您更好地体验移动证券服务，我们推荐原则如下：</h4>
    <ul>
    <li>操作系统支持广发证券手机炒股软件；</li>
    <li>大显示屏，能使您清晰地查看行情与数据；</li>
    <li>能支持GPRS，满足网络频率要求； </li>
    <li>内存足够大 系统处理速度快，程序运行足够快；</li>
    <li>最好支持手写输入，防止在输入账号和密码时出错。</li>
    </ul>
    </div>
    <form action="${ctx}/handset.do?method=getMobileTypeList" method="post">
    <div class="pagett1 clearboth"><span>
    选择品牌 <select name="cardsId">
    <option value="0">-所有品牌-</option>
    <%
      Iterator iterator = dicMap.keySet().iterator();
      while(iterator.hasNext()){
        Long cid=(Long)iterator.next();
       %>
          <option value="<%=cid%>">
          -<%=dicMap.get(cid)%>-
          </option>
       <%
       }
     %>
     
           </select>
       价格 <select name="price">
         <option value="0">-所有价格-</option>
         <option value="1">1000以下</option>
         <option value="2">1000-2000</option>
         <option value="3">2000-3000</option>
         <option value="4">3000-4000</option>
         <option value="5">4000-5000</option>
         <option value="6">5000以上</option>
       </select>
         <input type="submit" class="btn_search" value="搜索"/>
         </span>
       </form>
         <b>推荐机型</b></div>
         <!--列表一-->
         <%
         		if (dicList != null) {
         		for (int i = 0; i < dicList.size(); i++) {
         			Long cardsId = (Long) dicList.get(i);
         			%>
				          <ul class="motab1">
				            <li style="float:right;"> <!--我们还有更多支持机型，点击详细查看<a href="#" class="red">支持机型</a>--></li>
				       	   <li class="active red"><%=dicMap.get(cardsId) %></li>
				        </ul>
				         
				         <div id="tabs1" class="mobileList">
				         <ul>
				         <marquee scrollamount="2" scrolldelay="5" behavior=alternate loop="-1" onmouseover="javascript:this.stop();" onmouseout="javascript:this.start();">
				         <%
				         if(list!=null&&list.size()>0)
				         {
				           for(int j=0;j<list.size();j++)
				           {
				            TfinanceCommendHandset tch=(TfinanceCommendHandset)list.get(j);
				            if(tch.getCardsId()==cardsId) 
				            {
				            %>
				             <li><a href="${ctx}/bussinesshall/movetradehall/mobileDeal_Recommend_open.jsp?id=<%=tch.getId()%>" target="_blank">
				              <img src="${ctx}/share/showUploadImage.jsp?id=<%=tch.getPhotoId()%>" width="88" height="135" alt="无图片"/>
				             </a>
				             </li>
				            <%
				            }
				           }
				         }
				         %>
				         </marquee>
				         </ul>
				         </div>
         			<%
         		}
         	}
         %>
  </div>
  
  
   <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="/share/bottom.jsp" />

</body>
</html>