<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
<!--
function checkSearch(){
	if(document.query.StartDate.value=="" && document.query.EndDate.value==""){
		alert("起始时间和结束时间请任选其一!");
		return false;
	}
	document.query.submit();
}
//-->
</script>
<body>
<table width="95%" style="border-collapse:collapse" border="1" bgcolor="#ffffff" bordercolor="#cfcfcf" class="lh21 mt5" align="center">
  <tr>
    <td width="94%" class="info_th01" style=" border-bottom:0"><font color="#003994">资讯检索</font></td>
  </tr>
  <tr>
    <td style="padding:5px">
<form action="${ctx}/commons/QueryNewsList.jsp" name="query" method="post" onsubmit="checkSearch();return false;">
  <table width="100%" class="font_43">
      <tr>
        <td>开始时间：</td>
        <td>
        <input name="StartDate" class="input108" style="width:90px" onfocus="this.blur()" value="" size="10" readonly><a href="javascript:void(0)" onclick="gfPop.fStartPop(document.query.StartDate,document.query.EndDate);return false;" HIDEFOCUS><img src="${ctx}/pic/share/selectTime.gif" name="popcal" width="19" height="18" border="0" align="absmiddle"></a>
         </td>
        </tr>
       <tr>
        <td>结束时间：</td>
        <td>
        <input name="EndDate" class="input108" style="width:90px" onfocus="this.blur()" value="" size="10" readonly><a href="javascript:void(0)" onClick="gfPop.fEndPop(document.query.StartDate,document.query.EndDate);return false;" HIDEFOCUS><img src="${ctx}/pic/share/selectTime.gif" name="popcal" width="19" height="18" border="0" align="absmiddle"></a>
         </td>
      </tr>
      <tr>
        <td>栏目：</td>
        <td><label>
        <select name="whichCat">
              	<option value="">请选择栏目</option>
				<option value="zxzx">资讯中心</option>
				<option value="zqyj">证券研究</option>
				<option value="tzzyd">投资者园地 </option>		
              </select>
         </td>
      </tr>
      <tr>
        <td>标题：</td>
        <td>
        <input type="text" id="title" name="title" class="input108" size="10"/>
         <input type="hidden" name="state" value="1">
         <input type="hidden" name="is_delete" value="0">
        </td>
      </tr>
      <tr>
        <td>作者：</td>
        <td>
        <input name="author" type="text" size="10" class="input108" />
        </td>
      </tr>
      <tr>
        <td>股票代码：</td>
        <td>
        <input type="text" id="stock_id" name="stock_id"  class="input108" size="10"/>
        </td>
      </tr>
      <tr>
        <td>关键字：</td>
        <td>
        <input name="keyword" id="keyword" type="text" class="input108" size="10">
        </td>
      </tr>
      <tr>
        <td height="28" colspan="2" align="center"><a href="#"><input type="image" src="${ctx}/pic/wsyyt/but_cx1.jpg" /></a></td>
      </tr>
    </table>
</form>
   </td>
  </tr>
</table>

</body>
</html>