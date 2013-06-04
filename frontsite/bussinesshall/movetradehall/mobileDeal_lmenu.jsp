<script type="text/javascript" src="${ctx }/js/mobile_lmenu.js"></script>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
<%@ include file="/commons/taglibs.jsp"%>

<script type="text/ecmascript">
function selectlMenu(obj1,obj2)
{
	var obj1 = document.getElementById(obj1);
	var obj2 = document.getElementById(obj2);
	
	var temp = obj2.style.display;
	if(temp == "none")
	{
		obj2.style.display = "";
		obj1.className = "wdlc_ltag1 white";
	}
	else
	{
		obj2.style.display = "none";
		obj1.className = "wdlc_ltag2";
	}
}
</script>

<table width="189" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
  <tr>
    <td class="wdlc_ltag1 white" id="ydjydgg"><a href="${ctx}/bussinesshall/movetradehall/mobileDeal_Notice.html">金管家手机证券公告</a></td>
  </tr>
  <tr>
    <td class="wdlc_ltag2" id="ywktlc"><a href="${ctx}/bussinesshall/movetradehall/mobileDeal_Process.html">业务开通流程</a></td>
  </tr>
  <tr>
    <td class="wdlc_ltag2" id="yhzc"><a href="${ctx}/bussinesshall/movetradehall/mobileLogin.html">用户注册</a></td>
  </tr>
  <tr>
    <td class="wdlc_ltag2" id="rjxzs"><a href="${ctx}/bussinesshall/movetradehall/mobileDownload.html">软件下载</a></td>
  </tr>
  <tr>
    <td class="wdlc_ltag2" id="czzn"><a href="${ctx}/bussinesshall/movetradehall/mobileDeal_Demo.html">操作指南</a></td>
  </tr>
  <tr>
    <td class="wdlc_ltag2" id="tjjx"><a href="${ctx}/bussinesshall/movetradehall/mobileDeal_Recommend.html">推荐机型</a></td>
  </tr>
  <tr>
    <td class="wdlc_ltag2" id="zcjx"><a href="${ctx }/bussinesshall/movetradehall/mobileDeal_Zcjx.html">支持机型</a></td>
  </tr>
  <tr>
    <td class="wdlc_ltag2" id="zfsm"><a href="${ctx}/bussinesshall/movetradehall/mobileDeal_Charges.html">资费说明</a></td>
  </tr>
  <tr>
    <td class="wdlc_ltag2"  id="ydzqxx" onclick="selectlMenu('ydzqxx','board1')">
    <a href="${ctx}/bussinesshall/movetradehall/mobileDeal_School.html" onclick="selectlMenu('ydzqxx','board1')">移动证券学校</a>
    </td>
  </tr>
  <tr id="board1" style=" display:none">
    <td class="font_st welc_subtxt"><p><a href="${ctx}/bussinesshall/movetradehall/mobileDeal_School_jczs.html">·手机炒股基础知识</a></p>
      <p><a href="${ctx}/bussinesshall/movetradehall/mobileDeal_School_cjwt.html">·常见问题</a></p></td>
  </tr>
  <tr>
    <td class="wdlc_ltag2" id="sjzq" onclick="selectlMenu('sjzq','board2')"><a href="#">手机证券</a></td>
  </tr>
  <tr id="board2" style=" display:none">
    <td class="font_st welc_subtxt"><p><a href="${ctx }/bussinesshall/movetradehall/mobileSecu_Intro.html">·业务介绍</a></p>
      <p><a href="${ctx }/bussinesshall/movetradehall/mobileSecu_For.html">·业务办理</a></p>
      <p><a href="${ctx }/bussinesshall/movetradehall/mobileSecu_Models.html">·支持机型</a></p>
      <p><a href="${ctx }/bussinesshall/movetradehall/mobileSecu_Charges.html">·资费说明</a></p>
      <p><a href="${ctx }/bussinesshall/movetradehall/yd_flash.exe">·手机证券flash</a></p></td>
  </tr>
   <tr>
    <td class="wdlc_ltag2" id="zsgs" onclick="selectlMenu('zsgs','board3')"><a href="#">掌上股市</a></td>
  </tr>
  <tr id="board3" style=" display:none">
    <td class="font_st welc_subtxt"><p><a href="${ctx }/bussinesshall/movetradehall/mobileHand_Intro.html">·业务介绍</a></p>
      <p><a href="${ctx }/bussinesshall/movetradehall/mobileHand_Open.html">·开通、退订方式</a></p>
      <p><a href="${ctx }/bussinesshall/movetradehall/mobileHand_Zcjx.html">·支持机型</a></p>
      <p><a href="${ctx }/bussinesshall/movetradehall/mobileHand_Charges.html">·资费</a></p>
    </td>    
  </tr>
  <tr>
    <td class="wdlc_ltag2" id="jszx" onclick="selectlMenu('jszx','board4')"><a href="${ctx}/front/finance.do?method=selectAllFinanceQuestion&category=4&type_js=2&webuser_id=1&is_answer=1" onclick="selectlMenu('jszx','board4')">技术咨询</a></td>
  </tr>
  <tr id="board4" style=" display:none">
  </tr>
</table>


<%
		String menuobj1 =	request.getParameter("menuobj1");
		String menuobj2 = request.getParameter("menuobj2");
		String nav2 = 	request.getParameter("nav2");
		
		if (menuobj1 != null && menuobj2 !=null)
		{
				
				%>
					<script type="text/javascript">
						var obj1 = document.getElementById('<%=menuobj1%>');
						var obj2 = document.getElementById('<%=menuobj2%>');
						
						var temp = obj2.style.display;
						if(temp == "none")
						{
							obj2.style.display = "";
							obj1.className = "wdlc_ltag1 white";
						}
						else
						{
							obj2.style.display = "none";
							obj1.className = "wdlc_ltag2";
						}
					</script>
				<%
		}
		%>
				<script type="text/javascript">
					document.getElementById('ydjydgg').className = "wdlc_ltag2";
					document.getElementById('<%=nav2%>').className = "wdlc_ltag1 white";
				
				</script>
		<%
 %>