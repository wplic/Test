<%@ page contentType="text/html; charset=utf-8" language="java" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/mobile.css" rel="stylesheet" type="text/css" />
<script src="/js/setTab.js" type="text/javascript"></script>
 <script language="javascript">
	function downSoft(type,model){
		if(''!=type && ''!=model)
	    	sendRequest("${ctx}/phoneSoftUrl.do?method=getPhoneSoftUrlByBrand&type="+type+"&model="+model); 
	    if(confirm("确定下载手机软件？")){
			var softdownurl = document.getElementById("softurl").value;
			var softdownurl2 = document.getElementById("softurl2").value;
	    	if(''==softdownurl){
	    		alert("没有找到相匹配的软件,请到品牌通用区下载！");
	    	}else{
				//if(softdownurl.indexOf(".cab")>0 || softdownurl.indexOf(".CAB")>0)
				//	window.open("${ctx}/mobile/downfile.jsp?fileName="+softdownurl);
				//else
				if(''!=softdownurl2)
					window.open(softdownurl2);
				window.open(softdownurl);
	    	}
	    }
	}
	function createXMLHttpRequest(){
 		if (window.XMLHttpRequest) { 
	　　 	XMLHttpReq = new XMLHttpRequest(); 
	　　 }else if (window.ActiveXObject) { 
	　　 	XMLHttpReq = new ActiveXObject("Microsoft.XMLHTTP"); 
	　　 } 
	}
	function sendRequest(url){
		createXMLHttpRequest();
		XMLHttpReq.open("GET",url,true);
		XMLHttpReq.onreadystatechange=completeUrl;
		XMLHttpReq.send(null);
	
	}
	function completeUrl(){
	　　 if (XMLHttpReq.readyState == 4) {
	　　 	if (XMLHttpReq.status == 200) {
				var soft = XMLHttpReq.responseXML.getElementsByTagName("soft");
				if(soft.length>0){
					document.getElementById("softurl").value=soft[0].childNodes[3].firstChild.data;
					if(null!=soft[0].childNodes[4].firstChild)
						document.getElementById("softurl2").value=soft[0].childNodes[4].firstChild.data;
					else
						document.getElementById("softurl2").value='';
				}else{
					document.getElementById("softurl").value='';
					document.getElementById("softurl2").value='';
				}
		　　 }
	　　 }
	}
 </script>
</head>

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
  		<jsp:include page="leftMenu.jsp?leftnav=management1&leftnav2=management1_4"/>
  </div>
  
  
<div class="moright">
  		<p><jsp:include page="/ad/ad_index.jsp">
		    	      <jsp:param name="width" value="696"/>
					  <jsp:param name="height" value="174"/>
					  <jsp:param name="subAdCode" value="ad_default_phone"/>
		     </jsp:include></p>
        <div class="blank10"></div>
		<div class="rtit2">支持手机列表</div>
        
	<p class="tabstxt" style="padding:20px 15px">广发证金管家手机证券几乎涵盖了所有的主流机型，针对不同的手机操作系统、不同的品牌和机型开发不同的版本，以下列出部分支持型号：</p>
    
    <table width="96%" align="center" border="1" bordercolor="#d1d7e3" cellspacing="0" cellpadding="0" class="zctab1">
      <tr>
        <th width="20%">手机厂商</th>
        <th width="63%">支持型号</th>
        <th width="17%">下载
                <input type="hidden" name="softurl" id="softurl" value=""/>
                <input type="hidden" name="softurl2" id="softurl2" value=""/>
        </th>
      </tr>
      <tr>
        <td rowspan="4" align="center"><img src="../pic/mobile/sjjx/mobile_logo_nokia.gif" width="100" height="60" /></td>
        <td>N71、N73、N75、N76、N77、N78、N79、N80、N81、N82、N83、N91、N92、N93、N93i、N95、N96、3250、5320xm、5500、5700、5710、6110n、6120、6120c、6122c、6210、6220c、6290、6650f、E50、E51、E60、E61、E61i、E62、E66、E70、E71、E90</td>
        <td align="center"><span style="cursor:pointer" onclick="downSoft(1,'N71/N79/N93/3250/5700/6120/E50/E70')"><img src="../pic/mobile/sjjx/btn_xz.jpg" /></span></td>
      </tr>
      <tr>
        <td>N70、N72、N90、3230、3600、5030、6260、6600、6630、6670、6680、6681、7610</td>
        <td align="center"><span style="cursor:pointer" onclick="downSoft(1,'N70/N90/3600/6630/7610')"><img src="../pic/mobile/sjjx/btn_xz.jpg" /></span></td>
      </tr>
      <tr>
        <td>3110c、3110E、3120、3120c、3300、3500C、3555、3600s、5000、5070、5200、5220xm、5208、5300、5310、5610XM、6060、6070、6080、6085、6088、6110n、6122C、6126、6124c、6131、6131i、6210s、6233、6234、6263、6270、6276、6288、6300、6301、6555、6500c、6500s、6650、6600s、6600f、7210C、7360、7370、7373、7390、7500、7500p、7510a、7610S、7710、7900p、8600、E66
       </td>
        <td align="center"><span style="cursor:pointer" onclick="downSoft(1,'3110c/3300/5000/5310/6110n/6234/6650/E66')"><img src="../pic/mobile/sjjx/btn_xz.jpg" /></span></td>
      </tr>
       <tr>
        <td>5800、N97</td>
        <td align="center"><span style="cursor:pointer" onclick="downSoft(1,'5800/N97')"><img src="../pic/mobile/sjjx/btn_xz.jpg" /></span></td>
      </tr>
      <tr>
        <td rowspan="4" align="center"><img src="../pic/mobile/sjjx/moto.jpg" /></td>
        <td>E2、E8、E375、E398、K1、K3、L7、L71、72、V1100、V3、V3i、V3ie、V300、V303、V360、V500、V501、V600、V635、V8、V80、V9、U6、U9、W5、W380、Z6、Z6W、ZN5、Z9、Z10</td>
        <td align="center"><span style="cursor:pointer" onclick="downSoft(2,'E2/E375/K3/L71/V1100/V360/U9/Z10')"><img src="../pic/mobile/sjjx/btn_xz.jpg" /></span></td>
      </tr>
      <tr>
        <td>A1200、A1200E、A1200R、A1208、A1600、A728、A768i、A728、A780、E6、E680、E680i、E680g、E6e</td>
        <td align="center"><span style="cursor:pointer" onclick="downSoft(2,'A1200/A780/E680i/E6e')"><img src="../pic/mobile/sjjx/btn_xz.jpg" /></span></td>
      </tr>
      <tr>
        <td>Q8、Q9、MC3504</td>
        <td align="center"><span style="cursor:pointer" onclick="downSoft(2,'Q8/Q9/MC3504')"><img src="../pic/mobile/sjjx/btn_xz.jpg" /></span></td>
      </tr>
      <tr>
        <td>Mpx220</td>
        <td align="center"><span style="cursor:pointer" onclick="downSoft(2,'Mpx220')"><img src="../pic/mobile/sjjx/btn_xz.jpg" /></span></td>
      </tr>
      <tr>
        <td rowspan="3" align="center"><img src="../pic/mobile/sjjx/dopud.jpg" width="115" height="65" /></td>
        <td>686、696、699、818、828、828+、830、838、848、9100、C858、CHT9000、D600、D802、D805、D810、D9000、E616、M700、P660、P800、P860、P863、P3450、P3600i、P4550、P5500、P6500、S1、S700、S900、S500、T2222、T4222、T4288、U1000</td>
        <td align="center"><span style="cursor:pointer" onclick="downSoft(3,'686/9100/D9000/P3600i/S500/T4288/U1000')"><img src="../pic/mobile/sjjx/btn_xz.jpg" /></span></td>
      </tr>
      <tr>
        <td>310、700tv、596、C750、565、566、568、575、577W、585、586、586w、595、596、710、710+、C730、CHT9000、S600</td>
        <td align="center"><span style="cursor:pointer" onclick="downSoft(3,'310/700tv/596/C730/S600')"><img src="../pic/mobile/sjjx/btn_xz.jpg" /></span></td>
      </tr>
      <tr>
        <td>C720、C730W、X7510、CHT9000、P4550</td>
        <td align="center"><span style="cursor:pointer" onclick="downSoft(3,'C720/C730W/X7510/CHT9000/P4550')"><img src="../pic/mobile/sjjx/btn_xz.jpg" /></span></td>
      </tr>
      <tr>
        <td rowspan="3" align="center"><img src="../pic/mobile/sjjx/sony.jpg" width="121" height="29" /></td>
        <td>750c、800c、C902c、J300、M600i、M608、M608c、P908、P990i、R300i、S500c、S500i、S700i、T250c、T270i、T658c、V630i、Z310c、Z520c、Z530c、Z558c、Z61、Z610i、Z710c、Z770i、P990i</td>
        <td align="center"><span style="cursor:pointer" onclick="downSoft(4,'750c/800c/C902c/J300/M600i/P908/P990i/R300i/S500c//T250c/T270i/V630i/Z310c/P990i')"><img src="../pic/mobile/sjjx/btn_xz.jpg" /></span></td>
      </tr>
      <tr>
        <td>W200c、W300、W300c、W550c、W580c、W600c、W610c、W660i、W610c、W700c、W710c、W760c、W800c、W810、W810c、W830c、W850i、W888c、W908c、W950i、W958、W958c、W989c</td>
        <td align="center"><span style="cursor:pointer" onclick="downSoft(4,'W200c/W610c/W850i/W989c')"><img src="../pic/mobile/sjjx/btn_xz.jpg" /></span></td>
      </tr>
      <tr>
        <td>K310c、K500c、K506c、K508c、K510c、K530c、K550c、K600c、K610i、K618、K620i、K630c、K660i、K750c、K758c、K790c、K800i、K858c</td>
        <td align="center"><span style="cursor:pointer" onclick="downSoft(4,'K310c/K508c/K618/K800i')"><img src="../pic/mobile/sjjx/btn_xz.jpg" /></span></td>
      </tr>
      <tr>
        <td rowspan="6" align="center"><img src="../pic/mobile/sjjx/mobile_logo_samsung.gif" width="100" height="60" /></td>
        <td><p>707SC、D428、D528、D608、D728、D780、D808、D828、D848、D888、D900、D908、D908i、E378、E388、E398、E428、E488、E498、E508、E568、E618、E628、E690、E728、E778、E838、E908、E958、F338、F400、F488E、G600、G608、G808E、J150、J218、J618、J708、J750、L170、L258、L288、L310、L320、L600、L608、L770、M620、P738、P858、P960、T819、U108、U308、U608、U700、U708、U900、U908E、X808、X828、Z728</p></td>
        <td align="center"><span style="cursor:pointer" onclick="downSoft(5,'707SC/D608/D848/E568/F338/J750/U900/Z728')"><img src="../pic/mobile/sjjx/btn_xz.jpg" /></span></td>
      </tr>
      <tr>
        <td><p>D988、P528</p></td>
        <td align="center"><span style="cursor:pointer" onclick="downSoft(5,'D988/P528')"><img src="../pic/mobile/sjjx/btn_xz.jpg" /></span></td>
      </tr>
      <tr>
        <td>i718、i718+、i728、i740、i788、i8510、i908、M4650</td>
        <td align="center"><span style="cursor:pointer" onclick="downSoft(5,'i718/i718+/i728/i740/i788/i8510/i908/M4650')"><img src="../pic/mobile/sjjx/btn_xz.jpg" /></span></td>
      </tr>
      <tr>
        <td><p>i400、i408、i458、i520、i550、i560、L870、G810</p></td>
        <td align="center"><span style="cursor:pointer" onclick="downSoft(5,'i400/i408/i458/i520/i550/i560/L870/G810')"><img src="../pic/mobile/sjjx/btn_xz.jpg" /></span></td>
      </tr>
      <tr>
        <td><p>D728</p></td>
        <td align="center"><span style="cursor:pointer" onclick="downSoft(5,'D728')"><img src="../pic/mobile/sjjx/btn_xz.jpg" /></span></td>
      </tr>
      <tr>
        <td><p>P318、P318(+)</p></td>
        <td align="center"><span style="cursor:pointer" onclick="downSoft(5,'P318')"><img src="../pic/mobile/sjjx/btn_xz.jpg" /></span></td>
      </tr>
      <tr>
        <td rowspan="2" align="center"><img src="../pic/mobile/sjjx/mobile_logo_lenovo.gif" width="114" height="53" /></td>
        <td><p>ET280、ET560、ET600、ET860、ET880、ET960、ET980</p></td>
        <td align="center"><span style="cursor:pointer" onclick="downSoft(6,'ET280/ET560/ET600/ET860/ET880/ET960/ET980')"><img src="../pic/mobile/sjjx/btn_xz.jpg" /></span></td>
      </tr>
      <tr>
        <td><p>i389、i399、i609、i750、i758、i880、i906、i908、i910、i919、i966、i968、P609、P618、P719、P768、P806、P809、P960、P7800、S7、S9、S70、S90、S530、V80、V700、V800</p></td>
        <td align="center"><span style="cursor:pointer" onclick="downSoft(6,'i389/i906/P809/S530/V800')"><img src="../pic/mobile/sjjx/btn_xz.jpg" /></span></td>
      </tr>
      <tr>
        <td align="center"><img src="../pic/mobile/sjjx/sharp.jpg" /></td>
        <td><p>902、sh8010、sh906i、sh9010c、903SH、904、GX293、SX633A、V703SH</p></td>
        <td align="center"><span style="cursor:pointer" onclick="downSoft(7,'902/sh8010/904/V703SH')"><img src="../pic/mobile/sjjx/btn_xz.jpg" /></span></td>
      </tr>
      <tr>
        <td rowspan="4" align="center"><img src="../pic/mobile/sjjx/mobile_logo_lg.gif" width="82" height="37" /></td>
        <td><p>KS10、KT610、KS20</p></td>
        <td align="center"><span style="cursor:pointer" onclick="downSoft(8,'KS10/KT610/KS20')"><img src="../pic/mobile/sjjx/btn_xz.jpg" /></span></td>
      </tr>
      <tr>
        <td><p>G639、hb620t、KE850、KF240、KF300、KF310、KF510、KF600、KF690、KF750、KF755、KG70、KG90、KG90N、KG195、KG198、KG298、KG300、KG328、KG928、KG98、KG90n、KM380、KM500、KM501、KM701、KP320、KS10、KU800、U8138</p></td>
        <td align="center"><span style="cursor:pointer" onclick="downSoft(8,'G639/KF300/KG70/KG328/KM501/U8138')"><img src="../pic/mobile/sjjx/btn_xz.jpg" /></span></td>
      </tr>
      <tr>
        <td><p>KG99</p></td>
        <td align="center"><span style="cursor:pointer" onclick="downSoft(8,'KG99')"><img src="../pic/mobile/sjjx/btn_xz.jpg" /></span></td>
      </tr>
      <tr>
        <td><p>Ke998、KC550</p></td>
        <td align="center"><span style="cursor:pointer" onclick="downSoft(8,'Ke998/KC550')"><img src="../pic/mobile/sjjx/btn_xz.jpg" /></span></td>
      </tr>
      <tr>
        <td align="center"><img src="../pic/mobile/sjjx/zte.gif" width="78" height="27" /></td>
        <td><p>700、E700、F252、N7100、U85、U728、U860</p></td>
        <td align="center"><span style="cursor:pointer" onclick="downSoft(9,'700/E700/F252/N7100/U85/U728/U860')"><img src="../pic/mobile/sjjx/btn_xz.jpg" /></span></td>
      </tr>
      <tr>
        <td align="center"><img src="../pic/mobile/sjjx/mio8390.jpg" width="110" height="70" /></td>
        <td><p>A501、A700、A701、A702</p></td>
        <td align="center"><span style="cursor:pointer" onclick="downSoft(10,'A501/A700/A701/A702')"><img src="../pic/mobile/sjjx/btn_xz.jpg" /></span></td>
      </tr>
      <tr>
        <td rowspan="2" align="center"><img src="../pic/mobile/sjjx/mobile_logo_bird.gif" width="118" height="55" /></td>
        <td><p>D608、D609、D615、D636、D718、D780、F520</p></td>
        <td align="center"><span style="cursor:pointer" onclick="downSoft(11,'D608/D609/D615/D636/D718/D780/F520')"><img src="../pic/mobile/sjjx/btn_xz.jpg" /></span></td>
      </tr>
      <tr>
        <td>E819、E820、E895、E990、F518、V600、V706、V708、V750、V758、V770、V786、V788、V789、V808、W518</td>
        <td align="center"><span style="cursor:pointer" onclick="downSoft(11,'E819/E990/V706/W518')"><img src="../pic/mobile/sjjx/btn_xz.jpg" /></span></td>
      </tr>
      <tr>
        <td rowspan="4" align="center"><img src="../pic/mobile/sjjx/amoi.jpg" width="122" height="76" /></td>
        <td><p>A1、A530、A636、E5、N5、N6、M68、M500、M515、M550</p></td>
        <td align="center"><span style="cursor:pointer" onclick="downSoft(12,'A1/A636/E5/N6/M550')"><img src="../pic/mobile/sjjx/btn_xz.jpg" /></span></td>
      </tr>
       <tr>
        <td>E850、E860、E870、N800、N810</td>
        <td align="center"><span style="cursor:pointer" onclick="downSoft(12,'E850/E860/E870/N800/N810')"><img src="../pic/mobile/sjjx/btn_xz.jpg" /></span></td>
      </tr>
      <tr>
        <td>E70、E75、E76</td>
        <td align="center"><span style="cursor:pointer" onclick="downSoft(12,'E70/E75/E76')"><img src="../pic/mobile/sjjx/btn_xz.jpg" /></span></td>
      </tr>
       <tr>
        <td>E72、E78</td>
        <td align="center"><span style="cursor:pointer" onclick="downSoft(12,'E72/E78')"><img src="../pic/mobile/sjjx/btn_xz.jpg" /></span></td>
      </tr>
      
      <tr>
        <td rowspan="2" align="center"><img src="../pic/mobile/sjjx/asus.jpg" width="99" height="45" /></td>
        <td><p>M536、M530W、P305、P320、P525、P535、P550、P560、P735、P750</p></td>
        <td align="center"><span style="cursor:pointer" onclick="downSoft(13,'M536/M530W/P305/P525/P550/P735/P750')"><img src="../pic/mobile/sjjx/btn_xz.jpg" /></span></td>
      </tr>
      <tr>
        <td>Z801、Z802i</td>
        <td align="center"><span style="cursor:pointer" onclick="downSoft(13,'Z801/Z802i')"><img src="../pic/mobile/sjjx/btn_xz.jpg" /></span></td>
      </tr>
      
      <tr>
        <td align="center"><img src="../pic/mobile/sjjx/tcl.jpg" width="96" height="65" /></td>
        <td><p>E9、E330、F06、V18、M388、M398、M585、M586、M680、M688、M780</p></td>
        <td align="center"><span style="cursor:pointer" onclick="downSoft(14,'E9/F06/V18/M780')"><img src="../pic/mobile/sjjx/btn_xz.jpg" /></span></td>
      </tr>
      <tr>
        <td rowspan="2" align="center"><img src="../pic/mobile/sjjx/changh.gif" width="120" height="24" /></td>
        <td><p>K268、L138、M578、008-II</p></td>
        <td align="center"><span style="cursor:pointer" onclick="downSoft(15,'K268/L138/M578/008-II')"><img src="../pic/mobile/sjjx/btn_xz.jpg" /></span></td>
      </tr>
      <tr>
        <td>S818、TV001</td>
        <td align="center"><span style="cursor:pointer" onclick="downSoft(15,'S818/TV001')"><img src="../pic/mobile/sjjx/btn_xz.jpg" /></span></td>
      </tr>
      <tr>
        <td align="center"><img src="../pic/mobile/sjjx/kupai.jpg" width="120" height="24" /></td>
        <td>N900C</td>
        <td align="center"><span style="cursor:pointer" onclick="downSoft(16,'N900C')"><img src="../pic/mobile/sjjx/btn_xz.jpg" /></span></td>
      </tr>
      
      <tr>
        <td align="center"><img src="../pic/mobile/sjjx/ktouch.jpg" width="130" height="31" /></td>
        <td><p>A905C、A908、B920</p></td>
        <td align="center"><span style="cursor:pointer" onclick="downSoft(17,'A905C/A908/B920')"><img src="../pic/mobile/sjjx/btn_xz.jpg" /></span></td>
      </tr>
      <tr>
        <td align="center"><img src="../pic/mobile/sjjx/rim.jpg" width="140" /></td>
        <td><p>8300、8310、8320、8800</p></td>
        <td align="center"><span style="cursor:pointer" onclick="downSoft(18,'8300/8310/8320/8800')"><img src="../pic/mobile/sjjx/btn_xz.jpg" /></span></td>
      </tr>
      <tr>
        <td align="center"><img src="../pic/mobile/sjjx/iphone.jpg" width="125" height="38" /></td>
        <td><p>固件2.0以上 </p></td>
        <td align="center"><span style="cursor:pointer" onclick="downSoft(19,'Iphone2.0/iphone2.0/iphone3.0')"><img src="../pic/mobile/sjjx/btn_xz.jpg" /></span></td>
    </table>
	<div class="blank10"></div>
    
</div>
  <div class="blank0"></div>

</div>
<jsp:include page="/share/bottom.jsp" />
</body>
</html>