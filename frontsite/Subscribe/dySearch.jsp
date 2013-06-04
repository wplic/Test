<%request.setCharacterEncoding("UTF-8");%>
<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<%@ include file="/commons/turnPage.jsp"%>
<jsp:directive.page import="com.cssweb.common.util.PageUtil"/>
<jsp:directive.page import="java.util.*"/>
<%@page import="java.text.SimpleDateFormat"%>
<jsp:directive.page import="com.cssweb.subscribe.pojo.TcsswebProFwcptd"/>
<jsp:directive.page import="com.cssweb.client.pojo.TsystemWebuser"/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${ctx }/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx }/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
</head>
<%
System.out.println("  yyemian  ");
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	List list=null;
	if(request.getAttribute("list")!=null)
	list=(List)request.getAttribute("list");
TsystemWebuser tsystemWebuser=null;
		if(request.getSession().getAttribute("tsystemWebuser")!=null)
		tsystemWebuser=(TsystemWebuser)request.getSession().getAttribute("tsystemWebuser");

%>
<body class="body_bg">
<jsp:include page="/share/top.jsp?nav=wsyyt&nav1=wdlczx" />
<div class="main">
  <div class="dqwz">当前位置：首页 > 网上营业厅 > 我的理财中心 > 我的管家资讯</div>
  <jsp:include page="/bussinesshall/movetradehall/financing_submenu.jsp">
		<jsp:param name="nav3" value="zzdysy" />
	</jsp:include>
   <div class="zzmenu">
  <img src="${ctx }/pic/Subscribe/dot1.gif" align="absmiddle" /> 
  <a href="${ctx }/tcsswebFwtcdyAtion.do?method=getTcsswebFwtcdyAll">自助定阅首页</a>
  <img src="${ctx }/pic/Subscribe/dot1.gif" align="absmiddle" />
  <a href="${ctx }/tcsswebFwcpcxAction.do?method=getFwcpcxDyprodListByAccount">
  已定阅专属资讯产品表</a>
  <img src="${ctx }/pic/Subscribe/dot1.gif" align="absmiddle" />
  <a href="${ctx }/tcsswebFwtcdyAtion.do?method=getTcsswebProFwcptdByAccounList">
  <span class="red">申请进度查询</span></a></div>
  <div class="blank10"></div>
</div>
<div class="wrap920">
  	<P><img src="${ctx }/pic/Subscribe/banner4.jpg"  /></P>
    <p class="p10">尊敬的<%=tsystemWebuser!=null&&tsystemWebuser.getServiceName()!=null?tsystemWebuser.getServiceName():"" %>，您好</p>
    
    <ul class="dytag1">
   	  <li id="taglist1" class="cur"><a href="#">您的申请进度查询<span></span></a></li>
    </ul>
  	
    <div class="dybox1">
     <form name="qForm" id="qForm" action="${ctx }/tcsswebFwtcdyAtion.do?method=getTcsswebProFwcptdByAccounList" method="post">
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="dytab1">
        <tr>
          <th class="bold">申请产品名称</th>
          <th class="txtc bold">申请日期</th>
          <th class="txtc bold">申请类别 </th>
        </tr>
          <%if(list!=null&&list.size()>0) {
		for(int i=0;i<list.size();i++){
			TcsswebProFwcptd tcsswebProFwcptd=(TcsswebProFwcptd)list.get(i);	
	%>
	<tr>
          <td align="left" class="blue"><%=tcsswebProFwcptd.getProductName()%></td>
          <td>
          <%=tcsswebProFwcptd.getProTome()!=null&&!tcsswebProFwcptd.getProTome().equals("")?sdf.format(tcsswebProFwcptd.getProTome()):"" %>
          </td>
          <td>
          <%
           if(tcsswebProFwcptd.getOret()>=0)
           {
              //O_RET 0|申请定阅 ，2|申请退定 3|定阅成功，4|退定成功 5|体验
              long or=tcsswebProFwcptd.getOret();
              if(or==0)
              out.print(" 申请定阅");
              else if(or==2)
              out.print(" 申请退定");
              else if(or==3)
              out.print(" 定阅成功");
              else if(or==4)
              out.print(" 退定成功");
              else if(or==5)
              out.print(" 体验(体验期一个月)");
           }
           %>
          </td>
        </tr>
	<%}
	} %>
        
      </table>
      <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="28" align="right"><p align="right"> <%=PageUtil.pagination("window.qForm",totleCount, currentPage, pagesize)%></p></td>
      </tr>
    </table>
    </form>
    </div>
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="/share/bottom.jsp" />
</body>
</html>