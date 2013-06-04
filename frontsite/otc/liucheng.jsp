<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>柜台交易开户流程图</title>
<link href="${ctx }/css/otc/common.css" rel="stylesheet" type="text/css" />
</head>
<body>
<br /><jsp:include page="${ctx}/commons/mstop.jsp" />
<div class="main"><!--此处CLASS样式为原网站引用的--> 
  <!--请从此处复制代码开始--> 
  <div id="gtjy" class="gtjy">
  <div class="gtjy_l">
  <div class="gtjy_l_t"><span>当前位置：</span><a href="${ctx }/otc/action/OtcAction.go?function=FrontGetOtcList">广发OTC首页</a> > 柜台交易开户流程图 </div>
  <div class="gtjy_l_c">
  <h2>柜台交易开户流程图</h2>
  <div style="text-align:center; margin:10px 0;"><a  href="${ctx }/otc/file/LiuChengTu.jpg" target="_blank"><img alt="下载文档" src="${ctx }/images/otc/ico_06.gif"/></a></div>
  <a href="${ctx }/images/otc/liucheng.jpg" target="_blank"><img alt="流程图"  width="635" height="895" src="${ctx }/images/otc/liucheng.jpg"/></a>
  </div>
  </div>
  <div class="gtjy_r">
  <div class="ny_banner2"><img src="${ctx }/images/otc/img_03.jpg"/></div>
  <div class="ico_03"><img src="${ctx }/images/otc/ico_03_z.jpg" alt="" border="0" usemap="#Map"/>
        <map name="Map" id="Map">
          <area shape="rect" coords="8,9,239,90" href="${ctx }/otc/yuedingshu.jsp" />
          <area shape="rect" coords="10,100,240,185" href="${ctx }/otc/jieshishu.jsp"/>
        </map></div>
  </div>
    </div>
  <!--请从此处复制代码结束--> 
</div>
<div class="foot"><div class="foot"><jsp:include page="${ctx }/commons/msbottom.jsp" /></div>
<div style="text-align:center;"> 
  <script type="text/javascript">
var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3Fe14b926afad5726cb5e58a0cb2511717' type='text/javascript'%3E%3C/script%3E"));
</script> </div>
</body>
</html>