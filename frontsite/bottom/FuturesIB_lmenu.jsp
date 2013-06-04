<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@ include file="/commons/taglibs.jsp"%>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<p><img src="/pic/about/siedban1.jpg" /></p>
<style>
.leftNav_s { width:163px; cursor:pointer; text-align:left; font-size:12px; color:#1E3D61; padding-left:10px; padding-right:25px; background:url(${ctx}/pic/futuresIB/leftNav_s.jpg) no-repeat top; background-color:#FFF; border-top:1px solid #CACDD2; padding-top:8px; padding-bottom:7px; line-height:16px; font-weight:bold;}
.leftNav { width:163px; cursor:pointer; text-align:left; font-size:12px; color:#2C3E52; padding-left:10px; padding-right:25px; background:url(${ctx}/pic/futuresIB/leftNav.jpg) no-repeat top; background-color:#FFF; border-top:1px solid #CACDD2; padding-top:8px; padding-bottom:7px; line-height:16px;}
.leftNav_s2{height:28px; line-height:28px; text-indent:17px;display:block;}
.leftNav2{height:28px; line-height:28px;text-indent:17px;display:block;}
</style>
<script type="text/javascript">
	function selectlMenu(obj1,obj2)
	{
		var obj1 = document.getElementById(obj1);
		var obj2 = document.getElementById(obj2);
		
		var temp = obj2.style.display;
		if(temp == "none")
		{
			obj2.style.display = "";
			obj1.className = "active sideblue";
		}
		else
		{
			obj2.style.display = "none";
			obj1.className = "link sideblue";
		}
	}
</script>
<% 
  String nav3="";
  if(request.getParameter("nav3")!=null&&!request.getParameter("nav3").equals(""))
  nav3=request.getParameter("nav3").trim();
   %>
<div class="sidemenu2">
  		<table>
  		  <tr>
            <td class="leftNav sideblue" id="lhsbf"><a href="${ctx}/bottom/FuturesIBlhssbf.jsp">联合实施办法</a></td>
          </tr>
          <tr>
            <td class="leftNav sideblue" id="ywfw"><a href="${ctx}/bottom/FuturesIB.html">期货IB业务范围</a></td>
          </tr>         
          <tr>
            <td class="leftNav sideblue" id="glryhywryjj"><a href="${ctx}/bottom/FuturesIBinfo.html">总部管理人员</a></td>
          </tr>
          <tr>
            <td class="leftNav sideblue" id="bzj"><a href="${ctx}/bottom/FuturesIBbzj.jsp">期货保证金帐户、安全存管方式</a></td>
          </tr>
          <tr>
            <td class="leftNav sideblue" id="kfjy"><a href="${ctx}/bottom/FuturesIBkfjy.jsp">开户和交易流程、出入金流程、交易结果查询方式</a></td>
          </tr>         
          <tr>
            <td class="leftNav sideblue" id="jyfx"><a href="${ctx}/bottom/FuturesIBjyfx.jsp">期货交易风险说明书</a></td>
          </tr>
          <tr>
            <td class="leftNav sideblue" id="kflc"><a href="${ctx}/bottom/FuturesIBkflc.jsp">交易结果查询方式、投诉及信访方式</a></td>
          </tr>
          <tr>
            <td class="leftNav sideblue" id="fxjs"><a href="${ctx}/bottom/FuturesIBfxjs.jsp">股指期货交易特别风险揭示</a></td>
          </tr>
          <tr>
            <td class="leftNav sideblue" id="tsdh"><a href="${ctx}/bottom/FuturesIBtstj.jsp">投诉电话及投诉处理流程</a></td>
          </tr>
           <tr>
            <td class="leftNav sideblue" id="gfqh"><a href="http://www.gfqh.com.cn/" target="_blank">广发期货</a></td>
          </tr>
          
          <tr>
            <td class="leftNav sideblue" id="ibwdhry"><a href="${ctx}/bottom/ibwdhry.jsp">IB营业网点和人员公示</a></td>
          </tr>
          <tr>
            <td class="leftNav sideblue" id="ibtzzjy" onclick="selectlMenu('ibtzzjy','board1')"><a href="${contextPath }/bottom/indexSchool.jsp">投资者教育园地</a></td>
          </tr>
          <tr>
		    <td id="board1" style=" display:none">
			 <ul class="menu4l">
			        <li class="<%=nav3.equals("ib_glgg")?"leftNav_s2 red":"leftNav2"  %>"><a href="${contextPath }/bottom/ibtzzjy.jsp?nav3=ib_glgg">法律法规</a></li>
		        	<li class="<%=nav3.equals("ib_ggxx")?"leftNav_s2 red":"leftNav2"  %>"><a href="${contextPath }/bottom/ibtzzjy.jsp?nav3=ib_ggxx">公告信息</a></li>
		            <li class="<%=nav3.equals("ib_cjwt")?"leftNav_s2 red":"leftNav2"  %>"><a href="${contextPath }/bottom/ibtzzjy.jsp?nav3=ib_cjwt">常见问题</a></li>
		            <li class="<%=nav3.equals("ib_spyj")?"leftNav_s2 red":"leftNav2"  %>"><a href="${contextPath }/bottom/investorVideo.jsp">股指期货基础知识</a></li>
		     </ul>
		    </td>
           </tr>
        </table>

  </div>
  <%
	String nav2 = request.getParameter("nav2");
	if (nav2 != null && !"".equals(nav2))
	{
			%>
			
					<script type="text/javascript">
						//document.getElementById('index').className = "font14 white topmenu_a";
						document.getElementById('<%= nav2 %>').className = "leftNav_s sideblue";
						//document.getElementById("wsyyt_con").style.display = "block";
					</script>
			<%
				if(nav2!=null&&!nav2.equals("")&&nav2.equals("ibtzzjy")){
				%>
				<script type="text/javascript">
				selectlMenu('ibtzzjy','board1');
				</script>
				<%
				}
	}
%>


