<%@ page contentType="text/html; charset=utf-8" language="java"  import="java.sql.*"%>
<jsp:directive.page
	import="com.cssweb.common.web.filter.SqlInjectValidate" />
<jsp:directive.page import="java.util.*" />
<jsp:directive.page import="java.text.SimpleDateFormat" />
<jsp:directive.page import="com.css.cms.document.util.DocumentHelper"/>
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<jsp:directive.page import="com.cssweb.common.util.CsswebServiceUtil"/>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="java.util.Map"/>
<jsp:directive.page import="java.util.HashMap"/>
<jsp:directive.page import="org.apache.commons.lang.StringUtils"/>

<%@page import="com.cssweb.client.pojo.TsystemWebuser"%>
<%@page import="com.cssweb.assetManager.pojo.AssetUser"%>
<%@page import="com.cssweb.rzrq.pojo.CustRegister"%>
<%@page import="com.cssweb.rzrq.service.CustRegisterService"%>


<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<%@page import="org.apache.struts.action.ActionForm"%>
<%@page import="org.apache.struts.action.ActionForward"%>
<%@page import="org.apache.struts.action.ActionMapping"%>
<%@page import="org.apache.struts.actions.DispatchAction"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
%>


<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证劵_2012年广发证券“融智杯”融资融券仿真交易竞赛</title>
<link href="${contextPath }/css/community.css" rel="stylesheet" type="text/css" />
<link href="${contextPath }/css/financing/rongzhi/rongzhi.css" rel="stylesheet" type="text/css" />
<link href="${contextPath }/infoCenter/goldmoney/css/inner.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/js/prototype.js"></script>
<script type="text/javascript" src="${ctx}/js/jsUtils.js"></script>
</head>
<%
 ServletContext st = this.getServletConfig().getServletContext();
  ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
  CustRegisterService custRegisterService = (CustRegisterService) ctx.getBean("custRegisterService");
  
		if (request.getAttribute("loginErrorMessage") != null)
		{
			String loginErrorMessage =(String)	request.getAttribute("loginErrorMessage");
				%><script type="text/javascript">
				
						alert('<%=loginErrorMessage%>');
				</script> <%
		}
 %>
<%
	SqlInjectValidate sqlInjectValidate = SqlInjectValidate
			.getSqlInjectValidate();
	if (request.getParameter("nav1") != null
			&& !request.getParameter("nav1").equals("")) {
		if (sqlInjectValidate.vakidateSqlStringForLength(
				request.getParameter("nav1"), 10)) {
			response.sendRedirect(request.getContextPath()
					+ "/commons/error2.jsp");
			return;
		}
	}
	if (request.getParameter("nav") != null
			&& !request.getParameter("nav").equals("")) {
		if (sqlInjectValidate.vakidateSqlStringForLength(
				request.getParameter("nav"), 10)) {
			response.sendRedirect(request.getContextPath()
					+ "/commons/error2.jsp");
			return;
		}
	}
%>
<body>
	<jsp:include page="/share/top.jsp" />
	<!-- header end -->
	<div id="subbanner">
		<img src="${contextPath }/pic/financing/rongzhi/rongzhi_banner.jpg" />
	</div>
	<div class="subMainconter">
		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			class="layout">
			<tr>
				<th valign="top" class="wrapleft">
					<div class="navLeft">
						<h3>
							<img src="${contextPath }/images/rongzhi/rongzhi_btn.jpg" style="margin-left: 10px;" />
						</h3>
						<jsp:include page="sideMenu.jsp" />
					</div></th>
				<td valign="top" class="wrapright">
					<div class="columnOut">								
								<div class="columnTitle">	
								<h3>客户报名</h3>
							<span><b>首页</b>><b>2012年广发证券“融智杯”融资融券仿真交易竞赛</b>><strong>客户报名</strong>
							</span>						
						     </div>
						     
						 <div class="columnMain summary system">
						  <h3>“融智杯”融资融券仿真交易竞赛报名</h3>							
						</div>							
						<div class="matchApply system">
						   
						<h2>(一)	报名时间：2012年6月11日至2012年6月27日</h2>
						<h2>(二)	报名条件：符合以下条件的客户均可报名</h2>
						<p>1.	已在我司开立信用账户的客户。</p>
						<p>2.	满足融资融券开户条件的客户：截止至上一自然日客户已在我司开户满18个月且普通证券账户资产不少于50万元（资产数取上一日收盘后数据）。</p>
						<h2>(三)	报名方式</h2>
						<p>步骤一：点击本页面下方“我要报名”按钮或广发网首页“2012年融资融券仿真交易竞赛报名”游标，进入登录页面。</p>
						<p>步骤二：未注册网站用户的广发客户，勾选“首次登录”，“用户名”处输入12位客户编号，“服务密码”处输入交易密码，注册网站用户名和登录密码后，登录进入报名页面。
已注册网站用户的广发客户，请使用用户名和登录密码后进入报名页面。</p>
						<p>步骤三：在报名页面输入参赛昵称（系统自动校验昵称是否可用），确认所留号码是否正确，点击“确认报名”即可。</p>
						<h2>(四)	报名注意事项：</h2>
						<p>1.	客户在广发网进行报名时，系统自动判断客户是否符合报名要求。若不符合要求，将弹出相应提示不接受报名。</p>						
						<p>2.	只要在报名期内满足报名条件的，均可报名。</p>
						<p>3.	一个客户编号只能报名一次，成功报名后，不允许再次报名。</p>
						<p>4.	报名成功后，可在竞赛页面“个人信息”中查询相应信息。</p>	
						<p>5.	客户报名时请务必设置参赛昵称，以作竞赛榜单排名之用，并请确认联系电话正确无误，我们按此电话进行获奖通知。</p>	
						<input type="button" name="" value="我要报名" onclick="gobuck()" class="but_02" style="width:90px; height:23px; font-size:14px; display:block; margin:0 auto;"/>				     
						     </div>
						<div class="columnButtom">
							<img src="${contextPath }/gyjj/images/columnButtom.jpg" />
						</div>
					</div></td>
			</tr>
		</table>
	</div>
	<div class="clear"></div>
	<script type="text/javascript" src="../../js/common.js"></script>	
<script type="text/javascript">
$(".tableBar").tabs({meth:"click"});

function gobuck(){
	var dd=new Date();
	var intYear2=dd.getFullYear();
	intYear2 = (intYear2<1900?(1900+intYear2):intYear2);
	var intMonth=dd.getMonth()+1;
	var intDay=dd.getDate();
	var d = intYear2 * 10000 + intMonth * 100 + intDay;
	if(d<20120611)
	{
		alert("本系统于6月11日起接受报名，请见谅");
		return;
	}
	if(d>20120627)
	{
		alert("本系统于6月27日截止接受报名，请见谅");
		return;
	}
	window.location.href = "${contextPath }/financing/rongzhi/apply2.jsp";
}
</script>
	<jsp:include page="${ctx }/share/bottom.jsp" />
</body>
</html>
