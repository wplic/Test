<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
	<title>资料下载</title>
	<link rel="stylesheet" type="text/css" href="${ctx }/infoCenter/goldmoney/css/inner.css" media="all" />
	<link href="css/basic.css" rel="stylesheet" type="text/css" />

<link href="${ctx}/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
<script src="${ctx}/js/setTab.js"></script>
<link href="${ctx }/infoCenter/goldmoney/css/basic.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx }/infoCenter/goldmoney/js/topmenu.js"></script>
	
</head>
<body>
<jsp:include page="${contextPath}/share/top.jsp" />
	<div class="wrap">
	<div class="wjdc_box">
			<p class="wjdc">
				<a href="${ctx }/investorEdu/investorSurvey.html"><img
						src="${ctx }/pic/index/wzdc.jpg" />
				</a>
			</p>
		</div>
		<div class="pbd clearfix">
			<div class="pt-main-column">
			<div class="gmlocation">当前位置：<a href="/default.jsp">首页</a> > <a href="/goldMoney.do?method=showMainGoldPage">金快线</a> >资料下载   </div>
				<div class="mod mod-cpxljs">
					<div class="mhd">
						<h3><a href="#">资料下载</a></h3>
						<b></b>
					</div> <!-- mhd -->
					
					<div class="mbd">
						<table class="gmtable03" cellpadding="0" cellspacing="0">					
					<tbody>
						<tr>
							<jsp:include page="stockList.jsp">
								<jsp:param value="jkx_zlxz" name="whichCat"/>
								<jsp:param value="16" name="showSize"/>
							</jsp:include>
						</tr>
					</tbody>
				</table>			
					</div> <!-- mbd -->
					
					<div class="mft"><b></b></div>
				</div> <!-- mod-cpxljs -->
				
			
				
			<!-- mod -->
			</div><!-- pt-main -->
		
			<!--左侧side开始-->
			<div class="pt-second-column">
				 <jsp:include page="${contextPath }/infoCenter/goldmoney/siteMenu.jsp" />
			</div> 
            <!--左侧side结束-->
		</div> <!-- 底部图标 -->
		<div class="clear"></div>
<div class="blank10"></div>
<table align="center" style="margin:0 auto;">
	<tbody>
	<tr>
		<td><a href="###"><img src="${ctx }/infoCenter/goldmoney/pic/botban1.jpg"></a></td>
		<td><a href="###"><img src="${ctx }/infoCenter/goldmoney/pic/botban2.jpg"></a></td>
		<td><a href="###"><img src="${ctx }/infoCenter/goldmoney/pic/botban3.jpg"></a></td>
		<td><a href="###"><img src="${ctx }/infoCenter/goldmoney/pic/botban4.jpg"></a></td>
		<td><a href="###"><img src="${ctx }/infoCenter/goldmoney/pic/botban5.jpg"></a></td>
	</tr>
	</tbody>
</table>
<div class="blank10"></div>
			<!--底部-->
			<jsp:include page="${ctx }/share/bottom.jsp" />
			<!--底部end-->
			
	</div>
	
	
	
<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>	
<script type="text/javascript" src="js/common.js"></script>	
<script type="text/javascript">
$("#pcont").pcont({snum:4, isH:false});
$(".tableBar").tabs({meth:"click"});

$("#picShow").picshow();
</script>	
</body>
</html>