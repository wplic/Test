<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/commons/taglibs.jsp"%>
<%@page import="java.util.List"%>
<%@page import="com.cssweb.common.util.PageUtil"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${ctx}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
<script src="${ctx}/js/setTab.js"></script>
</head>
<script type="text/javascript">
<!-- 更改显示的资讯块 -->
function changeBlock(num,allnum,name){
	clearBlock(allnum,name)
	document.getElementById(name+num).style.display="block";
	document.getElementById(name+num).style.display="block";
}

<!-- 将所有资讯块隐藏 -->
function clearBlock(allnum,name){
	for(i=1 ; i<=allnum ; i++){
		document.getElementById(name + i).style.display="none";
		document.getElementById(name + i).style.display="none";
	}
}
</script>
<%
String stock_id="";
if(request.getParameter("stock_id")!=null&&!request.getParameter("stock_id").equals(""))
{
	stock_id=request.getParameter("stock_id").trim();
}
 String sttdpdm="";
 if(stock_id!=null)
 {
  String [] stt = stock_id.split(",");
  if(stt.length==1)
  {
   sttdpdm=stt[0];
  }
 }
 %>
<body class="body_bg">
  <table align="center" width="901">
              <tr>
                <td width="74" class="dpzs_hov red bold" id="tagdp1" onmouseover="SwitchNews('dp', 1, 5,'dpzs_hov red bold','dpzs_a bold');changeBlock('1','5','dpdiv');">公  告</td>
                <td width="74" class="dpzs_a bold" id="tagdp2" onmouseover="SwitchNews('dp', 2, 5,'dpzs_hov red bold','dpzs_a bold');changeBlock('2','5','dpdiv');">新  闻</td>
                <td width="74" class="dpzs_a bold" id="tagdp3" onmouseover="SwitchNews('dp', 3, 5,'dpzs_hov red bold','dpzs_a bold');changeBlock('3','5','dpdiv');">股    评</td>
                <td width="74" class="dpzs_a bold" id="tagdp4" onmouseover="SwitchNews('dp', 4, 5,'dpzs_hov red bold','dpzs_a bold');changeBlock('4','5','dpdiv');">研究报告</td>
                <td width="74" class="dpzs_a bold" id="tagdp5" onmouseover="SwitchNews('dp', 5, 5,'dpzs_hov red bold','dpzs_a bold');changeBlock('5','5','dpdiv');">管家资讯</td>
                <td class="dpzs_a0 red" width="531" align="right">
                <div id="dpdiv1" style="">
                <a href="${ctx}/bussinesshall/movetradehall/myStokCmsMore.jsp?nav=wsyyt&nav1=wdlczx&nav2=wsyyt_jygg&whichCat=zxzx_jysgg&stock_id=<%=stock_id %>" class="mr15" target="_blank">>>more1</a>
                </div>
                <div id="dpdiv2" style=" display:none">
                <a href="${ctx}/bussinesshall/movetradehall/myStokCmsMore.jsp?nav=wsyyt&nav1=wdlczx&nav2=zxzx_gp_gsyw&whichCat=xw&stock_id=<%=stock_id %>" class="mr15" target="_blank">>>more2</a>
                </div>
                <div id="dpdiv3" style=" display:none">
                <a href="${ctx}/bussinesshall/movetradehall/myStokCmsMore.jsp?nav=wsyyt&nav1=wdlczx&nav2=zxzx_gp_rdqj&whichCat=blcj_nbzx_zgsxcj|blcj_nbzx_sxzqcc|blcj_nbzx_gcjcck|blcj_nbzx_cyb&stock_id=<%=stock_id %>" class="mr15" target="_blank">>>more3</a>
                </div>
                <div id="dpdiv4" style=" display:none">
                <a href="${ctx}/bussinesshall/movetradehall/myStokCmsMore.jsp?nav=wsyyt&nav1=wdlczx&nav2=zxzx_hyxw&whichCat=zqyj_yjbg&stock_id=<%=stock_id %>" class="mr15" target="_blank">>>more4</a>
                </div>
                <div id="dpdiv5" style=" display:none">
                <a href="${ctx}/bussinesshall/movetradehall/myStokCmsMore.jsp?nav=wsyyt&nav1=wdlczx&nav2=nbzx|gfyj|wgzx&whichCat=nbzx_gftzsd|nbzx_pzbb|nbzx_gfmrtznc|nbzx_scclbg|nbzx_jjxt|nbzx_dfxcpyb|cpdy_jgjztbg&stock_id=<%=stock_id %>" class="mr15" target="_blank">>>more5</a>
                </div>
                </td>
              </tr>
          </table>
          	<table width="92%" align="center" class="lh28 mt20  font_st list_bline1" id="dp1" style="">
			<jsp:include page="/cms/myStockCms.jsp">
				<jsp:param name="catName" value="公  告" />
				<jsp:param name="whichCat" value="zxzx_jysgg"/>
				<jsp:param name="state" value="1"/>
				<jsp:param name="showSize" value="6"/>
				<jsp:param name="stock_id" value="<%=sttdpdm %>"/>
			</jsp:include> 
			</table>
           <table width="92%" align="center" class="lh28 mt20  font_st list_bline1" id="dp2" style=" display:none">
            <jsp:include page="/cms/myStockCms.jsp">
				<jsp:param name="catName" value="新  闻" />
				<jsp:param name="whichCat" value="xw"/>
				<jsp:param name="state" value="1"/>
				<jsp:param name="showSize" value="6"/>
				<jsp:param name="stock_id" value="<%=sttdpdm %>"/>
			</jsp:include>  
           </table>
           <table width="92%" align="center" class="lh28 mt20  font_st list_bline1" id="dp3" style=" display:none">
              <jsp:include page="/cms/myStockCms.jsp">
				<jsp:param name="catName" value="股    评" />
				<jsp:param name="whichCat" value="blcj_nbzx_zgsxcj|blcj_nbzx_sxzqcc|blcj_nbzx_gcjcck|blcj_nbzx_cyb"/>
				<jsp:param name="state" value="1"/>
				<jsp:param name="showSize" value="6"/>
				<jsp:param name="stock_id" value="<%=sttdpdm %>"/>
			</jsp:include> 
           </table>
           <table width="92%" align="center" class="lh28 mt20  font_st list_bline1" id="dp4" style=" display:none">
             <jsp:include page="/cms/myStockCms.jsp">
				<jsp:param name="catName" value="研究报告" />
				<jsp:param name="whichCat" value="zqyj_yjbg"/>
				<jsp:param name="state" value="1"/>
				<jsp:param name="showSize" value="6"/>
				<jsp:param name="stock_id" value="<%=sttdpdm %>"/>
			</jsp:include> 
           </table>
           <table width="92%" align="center" class="lh28 mt20  font_st list_bline1" id="dp5" style=" display:none">
             <jsp:include page="/cms/myStockCms.jsp">
				<jsp:param name="catName" value="管家资讯" />
				<jsp:param name="whichCat" value="nbzx_gftzsd|nbzx_pzbb|nbzx_gfmrtznc|nbzx_scclbg|nbzx_jjxt|nbzx_dfxcpyb|cpdy_jgjztbg"/>
				<jsp:param name="state" value="1"/>
				<jsp:param name="showSize" value="6"/>
				<jsp:param name="stock_id" value="<%=sttdpdm %>"/>
			</jsp:include> 
           </table>
</body>
</html>