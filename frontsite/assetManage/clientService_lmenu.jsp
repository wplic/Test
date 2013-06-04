<%@ page contentType="text/html; charset=utf-8" language="java"%>
<jsp:directive.page import="com.cssweb.assetManager.pojo.AssetUser"/>
<%
String nav = request.getParameter("nav");
String nav1=request.getParameter("nav1");
String fundAccount = "";
if(null!=request.getSession().getAttribute("assetUser")){
	AssetUser assetUser = (AssetUser)request.getSession().getAttribute("assetUser");
	fundAccount = assetUser.getFundAccount();
}else{%>
		<script language="javascript">
			window.location="/commons/loginms.jsp";
		</script>
	<%}
%>
<script type="text/javascript">
function longOutAfter(){
    url="${ctx}/assetManage/clientServiceLogout.jsp?url=/commons/loginms.jsp"
    window.location.href=url;
}
function showtd1()
{
	document.getElementById("tb1").style.display="block";
}
</script>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<p><img src="/pic/assetManage/khfwleft.jpg" /></p>
<table width="198" class="zhcx_mbox">
  <tr>
    <td  <%="zhxx".equals(nav)?"class='active white'":"class='link'"%> onclick="showtd1();"><a href="#" >帐户信息查询</a></td>
  </tr>
  <tr>
    <td class="bg_ff" style="border-bottom:1px solid #cad3ce" id="tb1">
    <div class="blank10"></div>
    <table width="100%" class="lh25"  >
      <tr>
        <td width="16%">&nbsp;</td>
        <td width="84%" <%="1".equals(nav1)?"class='red'":""%>><span class="font_st font_73">·</span><a href="/assetManage/clientService.jsp">资产概览</a></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td <%="2".equals(nav1)?"class='red'":""%>><span class="font_st font_73">·</span><a href="/clientservice/tradeNote.do?method=getAssetManagerList&fundaccount=<%=fundAccount%>">交易记录及资金明细</a></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td <%="3".equals(nav1)?"class='red'":""%>><span class="font_st font_73">·</span><a href="/assetManage/clientServiceGpcc.jsp">证券持仓信息</a></td>
      </tr>
    </table>
    <div class="blank10"></div>
    </td>
  </tr>
  <%if(fundAccount.equals("030800000480") || fundAccount.equals("30800000480")) {%>
  <tr>
    <td <%="ycyh".equals(nav)?"class='active white'":"class='link'"%>><a href="${contextPath }/valueSysAction.do?method=listValueSys">广发中行粤财1号__专用表</a></td>
  </tr>
  <%} %>
  <tr>
    <td <%="gzxt".equals(nav)?"class='active white'":"class='link'"%>><a href="${contextPath }/valueSys/web/YyxtAction.go?function=GetYyxtList">每日净值</a></td>
  </tr>
  <!--
  <tr>
    <td <%="tzcl".equals(nav)?"class='active white'":"class='link'"%>><a href="${contextPath }/assetManage/clientServiceTzcl.jsp">投资策略报告</a></td>
  </tr>
  -->
  <tr>

    <td <%="ydbg".equals(nav)?"class='active white'":"class='link'"%>><a href="${contextPath }/tclientYdbgAction.do?method=getClientServiceMap">最新市场分析及投资策略</a></td>
  </tr>
   <tr>
    <td <%="khtz".equals(nav)?"class='active white'":"class='link'"%>><a href="${contextPath }/tclientYdbgAction.do?method=getKhtzById">文件查询及帐户通知</a></td>
  </tr>
  <tr>
    <td <%="zgsy".equals(nav)?"class='active white'":"class='link'"%>><a href="/assetManage/index.html">资管首页</a></td>
  </tr>
  <tr>
    <td <%="mmxg".equals(nav)?"class='active white'":"class='link'"%>><a href="/assetManage/clientServiceMmxg.jsp">密码修改</a></td>
  </tr>
  <tr>
    <td <%="zxdl".equals(nav)?"class='active white'":"class='link'"%>><a href="#"><span onclick="longOutAfter();" style="cursor:hand">重新登录</span></a></td>
  </tr>
</table>
<%
		//display:none
		if (nav != null && !"".equals(nav))
		{
				if ("zhxx".equals(nav))
				{
					%>
							<script type="text/javascript">
									document.getElementById("tb1").style.display="block";
							</script>
					<%
				}
				else
				{
					%>
							<script type="text/javascript">
									document.getElementById("tb1").style.display="none";
							</script>
					<%
				}
		}
%>