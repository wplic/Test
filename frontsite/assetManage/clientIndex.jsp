<%@ page contentType="text/html; charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<script src="${ctx}/js/prototype.js" type="text/javascript"
	charset="UTF-8"></script>
<script>
function isNumber(String){ 
	  var Letters = "1234567890.-"; 
	   var i;
		   var c;
		 for( i = 0; i < String.length; i ++ ){
        c = String.charAt( i );
			  	 if (Letters.indexOf( c ) < 0){
	       		 return false;
				}
		} 
		return true;
}

function checkForm(){
	var val1 = document.getElementById("outCount").value;
	var val2 = document.getElementById("outAllAccount").value;
	var val3 = document.getElementById("outUnitAccount").value;
	if(!isNumber(val1) || !isNumber(val2) || !isNumber(val3)){
		alert('所填数值需数字类型')
		return false;
	}	
	return true;
	
}
function calculate(m){
 var url="${ctx}/prod/productAction.do";
// alert(url);
 var pars='method=calculate&date='+m;
//  alert(pars);
 var myAjax = new Ajax.Request(url,{method:'post',parameters:pars,onComplete: showResponse}); 
 
}
function showResponse(res){
	var str=res.responseText; 
	if(str.length>0){
		document.getElementById("outUnitAccount").value=str.split(',')[0];
		document.getElementById("outAllAccount").value=str.split(',')[1];
	}else{
		document.getElementById("outAllAccount").value='';
		document.getElementById("outUnitAccount").value='';
	}
}
</script>

<c:if test="${message != null }">
	<script>
		alert('${message}');
	</script>
</c:if>
</head>
<body>
<jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="${contextPath }/default.html"> 首页 </a>-<a href="${contextPath }/assetManage/index.jsp">资产管理</a> - 客户服务</div>
</div>
<div class="wrap_3c">
  <!--左侧sied开始-->
  <div class="w210 fleft">
	 <jsp:include page="${contextPath }/assetManage/assetInfo_index_lmenu.jsp?nav=khfw&nav1=lcjsq" />
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w706 fright">
  	<div class="comtit1"><h4>理财工具</h4></div>
  	<div class="blank10"></div>
    <div class="lcgztit">
        <table width="89%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="11%"><img src="/pic/assetManage/lcgzJsq.jpg" /></td>
            <td width="89%" class="bold">理财4号业绩报酬计提查询 </td>
          </tr>
        </table>
   </div>
   <div style="border:1px solid #cccccc; padding:15px; background:#eceff4">
   <form name="form1" action="${ctx}/prod/productAction.do?method=calculateFeeRate" onsubmit="return checkForm();" method="post"> 
     <table width="90%" align="center" class="lh28 fcenter">
       <tr>
         <td width="60">参与日期：</td>
         <td width="85"><input name="startTime" type="text" id="startTime" value="${startTime }" onfocus="this.blur()" class="khfwinput" style=" width:80px" /></td>
         <td width="30"><a href="javascript:void(0)" onclick="gfPop.fStartPop(document.form1.startTime,document.form1.endTime);return false;" HIDEFOCUS><img src="${ctx}/pic/assetManage/date.gif" name="popcal" width="19" height="18" border="0" align="middle"></a></td>
         <td width="60">退出日期：</td>
         <td width="87"><input name="endTime" type="text" id="endTime" onpropertychange="calculate(this.value);" value="${endTime }" onfocus="this.blur()" class="khfwinput" onchange="" style=" width:80px" /></td>
         <td width="30">
         <a href="javascript:void(0)" on onclick="gfPop.fEndPop(document.form1.startTime,document.form1.endTime);return false;" HIDEFOCUS><img src="${ctx}/pic/assetManage/date.gif" name="popcal" width="19" height="18" border="0" align="middle"></a>
        </td>
         <td><input type="submit" value="计算" class="khfwbut" /></td>
       </tr>
       <tr>
         <td>退出份额：</td>
         <td><input name="outCount" type="text" id="outCount" value="${outCount }" class="khfwinput" style=" width:80px" /></td>
         <td>份</td>
         <td>&nbsp;</td>
         <td>&nbsp;</td>
         <td>&nbsp;</td>
         <td>&nbsp;</td>
       </tr>
     </table>
     
     <table width="90%" align="center" class="lh28">
       <tr>
         <td width="25%">退出日单位资产累计净值： </td>
         <td width="69%"><input name="outAllAccount" type="text" id="outAllAccount" value="${outAllAccount }" class="khfwinput" style=" width:80px" />
         元</td>
        </tr>
       <tr>
         <td>退出日单位资产净值： </td>
         <td><input name="outUnitAccount" type="text" id="outUnitAccount" value="${outUnitAccount }" class="khfwinput" style=" width:80px" />
          元</td>
        </tr>
     </table>
     </form>
   </div>
   <div class="blank10"></div>
   <table border="1" bordercolor="#cccccc" width="100%" align="center" class="lh24">
      <tr class="rrtab_tt bold">
        <td width="28%" align="center">项目明细</td>
        <td width="72%" align="center">数值</td>
      </tr>
      <tr>
        <td class="pl5">持有期限</td>
        <td class="pl5">${bean.hodeDays }</td>
      </tr>
      <tr class="bg_ec">
        <td class="pl5">退出份额</td>
        <td class="pl5">${bean.outCount }</td>
      </tr>
      <tr>
        <td class="pl5">参与日单位资产累计净值</td>
        <td class="pl5">${bean.inAllAccount }</td>
      </tr>
      <tr class="bg_ec">
        <td class="pl5">参与日单位资产净值</td>
        <td class="pl5">${bean.inUnitAccount }</td>
      </tr>
      <tr>
        <td class="pl5">退出日单位资产累计净值</td>
        <td class="pl5">${bean.outAllAccount }</td>
      </tr>
      <tr class="bg_ec">
        <td class="pl5">退出日单位资产净值</td>
        <td class="pl5">${bean.outUnitAccount }</td>
      </tr>
      <tr>
        <td class="pl5">退出费率</td>
        <td class="pl5">${bean.outFeeRate }</td>
      </tr>
      <tr class="bg_ec">
        <td class="pl5">退出费</td>
        <td class="pl5">${bean.outFee }%</td>
      </tr>
      <tr>
        <td class="pl5">年化收益率(R)</td>
        <td class="pl5">${bean.yearIncomeRateStr }%</td>
      </tr>
      <tr class="bg_ec">
        <td class="pl5">业绩报酬(E)</td>
        <td class="pl5">${bean.finalIncomeStr }</td>
      </tr>
      <tr>
        <td class="pl5">退出支付金额</td>
        <td class="pl5">${bean.finalAllAccountStr }</td>
      </tr>
      <tr class="bg_ec">
        <td colspan="2" class="pl5"><span class="red">附：</span><span class="blue2"><a href="/pic/assetManage/detail_yjbc.gif" target="_blank">算法说明</a></span></td>
      </tr>
    </table>
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<div class="blank5"></div>
<jsp:include page="/commons/msbottom.jsp" />
</body>
<iframe width=174 height=189 name="gToday:normal:agenda.js" id="gToday:normal:agenda.js"
			src="${ctx}/js/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; left:-500px; top:0px;"> 

</html>