<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<link href="/css/stockResearch/stockResearch.css" rel="stylesheet" type="text/css" />
</head>
<body>
<jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：首页 - 证券研究 - 研发中心概况 - 博士后工作站</div>
</div>
<div class="wrap_3c">
  <!--左侧sied开始-->
  <div class="w210 fleft">
		<jsp:include page="/stockResearch/departments_lmenu.jsp?nav2=bshgzz" />
  </div>
  <!--左侧sied结束-->
   
  <!--中侧sied开始-->
  <div class="w492 fleft mlr4">
  		<div class="comtit1"><h4>博士后工作站</h4></div>
    <div class="blank10"></div>
        <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td class="lh25"><p class="inden25">广发证券作为国内首批综合类证券公司于2000年春率先设立博士后工作站，并成为中国金融行业首批获得国家人事部批准设立博士后工作站的企业。</p><p class="inden25">广发证券博士后工作站目前已招收九批共35名博士，其中在站博士3名，相当比例的博士后人员在出站后继续留在公司任职。博士后工作站承担着证券业相关监管部门、社保基金等机构或客户委托的大量研究课题，在公司许多重要项目中担任核心技术指导角色，并且多次在广东省金融学会、深圳证券交易所等单位组织的优秀研究成果评选活动中获得奖项。</p><p class="inden25">在站的研究人员坚持将理论探索与资本市场实践相结合，取得了一系列对金融企业的业务拓展及金融市场发展具有指导和借鉴意义的科研成果。</p></td>
          </tr>
        </table>
        <div class="h40"></div>
    <div class="blank10"></div>
  </div>
  <!--中侧sied结束--> 
    <!--右侧sied开始-->
  <div class="w210 fright">
		<div class="rtit1">研发动态</div>
  <div class="bg_ff ptb6 ribor3">
        <marquee scrollamount="3" direction="up" onmouseover="this.stop()" onmouseout="this.start()" height="200">
       <jsp:include page="/stockResearch/stockList.jsp"/>
        </marquee>
    </div>
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
    <div class="blank5"></div>
<jsp:include page="/commons/msbottom.jsp" />
</body>
</html>