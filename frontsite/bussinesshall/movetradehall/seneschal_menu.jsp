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
		obj1.className = "wdlc_ltag1";
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
        <td class="wdlc_ltag1" id="hor1" onclick="selectlMenu('hor1','board1')">
     <a href="seneschalInfoNbzx.jsp">内部资讯</a></td>
      </tr>
      <tr id="board1" >
        <td class="font_st welc_subtxt" >
        	<p><a href="${ctx }/bussinesshall/movetradehall/noticeQueryNewsListGfmrtznc.html" target="ifm">·广发每日投资内参</a></p>
            <p><a href="${ctx }/bussinesshall/movetradehall/noticeQueryNewsListScclbg.html" target="ifm">·市场策略报告</a></p>
            <p><a href="${ctx }/bussinesshall/movetradehall/noticeQueryNewsListGfcb.html" target="ifm">·广发晨报</a></p>
            <p><a href="${ctx }/bussinesshall/movetradehall/noticeQueryNewsListGffxszb.html" target="ifm">·广发分析师早报</a></p>
            <p><a href="${ctx }/bussinesshall/movetradehall/noticeQueryNewsListGfyjzxkb.html" target="ifm">·广发研究资讯快报</a></p>
            <p><a href="${ctx }/bussinesshall/movetradehall/noticeQueryNewsListJjtzzk.html" target="ifm">·基金投资周刊</a></p>
            <p><a href="${ctx }/bussinesshall/movetradehall/noticeQueryNewsListXgcjzx.html" target="ifm">·香港财经资讯</a></p>
            <p><a href="${ctx }/bussinesshall/movetradehall/noticeQueryNewsListHygzbg.html" target="ifm">·行业跟踪报告</a></p>
            <p><a href="${ctx }/bussinesshall/movetradehall/noticeQueryNewsListYsptzzk.html" target="ifm">·衍生品投资周刊</a></p>
            <p><a href="${ctx }/bussinesshall/movetradehall/noticeQueryNewsListDfxcpyb.html" target="ifm">·低风险产品月报</a></p>
        </td>
      </tr>
      <tr>
        <td class="wdlc_ltag1" id="hor2" onclick="selectlMenu('hor2','board2')">广发研究</td>
      </tr>
      <tr id="board2" >
        <td class="font_st welc_subtxt">
        	<p><a href="${ctx }/bussinesshall/movetradehall/noticeQueryNewsListGslyjbg.html" target="ifm">·公司类研究报告</a></p>
            <p><a href="${ctx }/bussinesshall/movetradehall/noticeQueryNewsListHglyjbg.html" target="ifm">·宏观类研究报告</a></p>
            <p><a href="${ctx }/bussinesshall/movetradehall/noticeQueryNewsListTzclbg.html" target="ifm">·投资策略报告</a></p>
            <p><a href="${ctx }/bussinesshall/movetradehall/noticeQueryNewsListHyyjbg.html" target="ifm">·行业研究报告</a></p>
            <p><a href="${ctx }/bussinesshall/movetradehall/noticeQueryNewsListZjyjbg.html" target="ifm">·债券研究报告</a></p>
        </td>
      </tr>
      <tr>
        <td class="wdlc_ltag1" id="hor3" onclick="selectlMenu('hor3','board3')">外购资讯</td>
      </tr>
      <tr id="board3" >
        <td class="font_st welc_subtxt">
        	<p><a href="${ctx }/bussinesshall/movetradehall/noticeQueryNewsListCjnc.html" target="ifm">·财经内参</a></p>
            <p><a href="${ctx }/bussinesshall/movetradehall/noticeQueryNewsListCjxw.html" target="ifm">·财经新闻</a></p>
            <p><a href="${ctx }/bussinesshall/movetradehall/noticeQueryNewsListCkxx.html" target="ifm">·参考消息</a></p>
            <p><a href="${ctx }/bussinesshall/movetradehall/noticeQueryNewsListGsxw.html" target="ifm">·公司新闻</a></p>
            <p><a href="${ctx }/bussinesshall/movetradehall/noticeQueryNewsListJggp.html" target="ifm">·机构股评</a></p>
            <p><a href="${ctx }/bussinesshall/movetradehall/noticeQueryNewsListPzsd.html" target="ifm">·盘中速递</a></p>
            <p><a href="${ctx }/bussinesshall/movetradehall/noticeQueryNewsListCcpl.html" target="ifm">·市场评论</a></p>
            <p><a href="${ctx }/bussinesshall/movetradehall/noticeQueryNewsListHyxw.html" target="ifm">·行业新闻</a></p>
        </td>
      </tr>
    </table>
<%
		String menuobj1 =	request.getParameter("menuobj1");
		String menuobj2 = request.getParameter("menuobj2");
		
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
							obj1.className = "wdlc_ltag1";
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