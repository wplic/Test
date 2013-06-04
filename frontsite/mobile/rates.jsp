<%@ page contentType="text/html; charset=utf-8" language="java" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/mobile.css" rel="stylesheet" type="text/css" />
<script src="/js/setTab.js" type="text/javascript"></script>
</head>
<jsp:directive.page import="com.cssweb.common.web.filter.SqlInjectValidate"/>
<%
 SqlInjectValidate sqlInjectValidate = SqlInjectValidate.getSqlInjectValidate();
	if(request.getParameter("nav1")!=null&&!request.getParameter("nav1").equals("")){
				if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("nav1"),10)){
					response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
				 }
			}
	if(request.getParameter("nav")!=null&&!request.getParameter("nav").equals("")){
				if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("nav"),10)){
					response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
				 }
			}
	if(request.getParameter("nav2")!=null&&!request.getParameter("nav2").equals("")){
		if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("nav2"),10)){
			response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
		 }
	}
%>
<body>
<jsp:include page="/share/top.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="${ctx }/index.jsp?nav=index">首页</a> &gt; <a href="${ctx }/bussinesshall/index.jsp?nav=wsyyt">网上营业厅</a>  &gt; <a href="${ctx }/mobile/index.jsp?nav=wsyyt&nav1=gfydjyt">金管家手机证券</a> 
   <jsp:include page="/mobile/pmdList.jsp">
				            <jsp:param name="catName" value="最新动态" />
				            <jsp:param name="whichCat" value="wsyyt_sjzq_hdxw"/>
				            <jsp:param name="state" value="1"/>
				            <jsp:param name="showSize" value="2"/>
				    	</jsp:include></div>
  <div class="blank5"></div>
</div>
<div class="mobox">
  
  <div class="moleft">
  		<jsp:include page="leftMenu.jsp?leftnav=management3&leftnav2=null"/>
  </div>
  
  
<div class="moright">
  		<p><jsp:include page="/ad/ad_index.jsp">
		    	      <jsp:param name="width" value="696"/>
					  <jsp:param name="height" value="174"/>
					  <jsp:param name="subAdCode" value="ad_default_phone"/>
		     </jsp:include></p>
        <div class="blank10"></div>
		<div class="rtit2">“金管家”手机证券资费说明</div>
        <div class="yxsm" style="padding-top:10px; padding-bottom:15px">	
<p style="padding:15px 15px 0px 0px; line-height:25px; text-indent:2em; ">手机上网费包括：软件功能费和上网流量费，软件功能费由提供软件服务的公司制定，广发证券免收这部分费用；上网流量费是指手机上网所发生的信息数据流量费用，由各运营商收取，与广发证券无关。<br />
　　由于各地上网通信费标准不同，具体请拨打当地各运营商的客服电话（中国移动10086、中国联通10010、中国电信10000）咨询。</p> 
    	<div class="blank0"></div>
		</div>
			<br />
            <div class="blank10"></div>
            <p class="blue3">具体收费情况见下表：</p>
    <div class="blank10"></div>
            <table width="100%" align="center" border="1" bordercolor="#d1d7e3" cellspacing="0" cellpadding="0" class="zctab1">
              <tr class="blue3">
                <th width="20%" class="bold">系统名称</th>
                <th width="25%" class="bold">软件使用费</th>
                <th width="55%" class="bold">上网费（仅供参考）</th>
              </tr>
              <tr>
                <td align="center" style="padding:20px 0">金管家至强版</td>
                <td align="center">免费 </td>
                <td align="center">如中国移动按流量按1元/M收取，建议开通包月套餐</td>
              </tr>
              <tr>
                <td align="center" style="padding:20px 0">金管家至诚版 </td>
                <td align="center">免费</td>
                <td align="center">如中国移动按流量按1元/M收取，建议开通包月套餐</td>
              </tr>
            </table>
</div>
  <div class="blank0"></div>

</div>
<jsp:include page="/share/bottom.jsp" />
</body>
</html>