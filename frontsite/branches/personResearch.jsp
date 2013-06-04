<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/branches/branches.css" rel="stylesheet" type="text/css" />
</head>

<body class="body_bg">
<jsp:include page="${contextPath }/share/top.jsp" />
<div class="wjdc_box">
  <p class="wjdc"><a href="/investorEdu/investorSurvey.html"><img src="/pic/index/wzdc.jpg"/></a></p>
</div>
<div class="main">
  <div class="dqwz">当前位置：首页 > 分支机构 &gt; 产品与服务</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">  
  <div class="iptvside_top"></div>
  <div class="iptvside_mid">
	  <jsp:include page="productsServices_lmenu.jsp" />
  </div>
  <div class="iptvside_bot"></div>
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w706 fright">
    <div class="left_tit2">
      <table width="98%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="40">&nbsp;</td>
          <td width="57" style="text-indent:0">营业部</td>
          <td width="283" style="text-indent:0"><select name="deptname">
            <option value="" selected="selected">全部</option>
            <option value="北京阜成门南大街营业部">北京阜成门南大街营业部</option>
            <option value="长春民康路营业部">长春民康路营业部</option>
            <option value="长沙荷花路营业部">长沙荷花路营业部</option>
            <option value="潮州枫春路营业部">潮州枫春路营业部</option>
            <option value="成都新光路营业部">成都新光路营业部</option>
            <option value="大连成仁街营业部">大连成仁街营业部</option>
            <option value="德庆康城大道营业部">德庆康城大道营业部</option>
            <option value="东营济南路营业部">东营济南路营业部</option>
            <option value="东莞长安营业部">东莞长安营业部</option>
            <option value="东莞东城营业部">东莞东城营业部</option>
            <option value="东莞虎门营业部">东莞虎门营业部</option>
            <option value="东莞中堂营业部">东莞中堂营业部</option>
            <option value="佛山汾江南营业部">佛山汾江南营业部</option>
            <option value="佛山季华路营业部">佛山季华路营业部</option>
            <option value="佛山三水广海路营业部">佛山三水广海路营业部</option>
            <option value="佛山同济西营业部">佛山同济西营业部</option>
            <option value="福州古田路营业部">福州古田路营业部</option>
            <option value="高明沧江路营业部">高明沧江路营业部</option>
            <option value="广州番禺环城东路营业部">广州番禺环城东路营业部</option>
            <option value="广州华利路营业部">广州华利路营业部</option>
            <option value="广州环市东路营业部">广州环市东路营业部</option>
            <option value="广州黄埔大道营业部">广州黄埔大道营业部</option>
            <option value="广州江南西路营业部">广州江南西路营业部</option>
            <option value="广州江湾营业部">广州江湾营业部</option>
            <option value="广州科韵路营业部">广州科韵路营业部</option>
            <option value="广州农林下路营业部">广州农林下路营业部</option>
            <option value="广州体育东路营业部">广州体育东路营业部</option>
            <option value="广州中山三路中华广场营业部">广州中山三路中华广场营业部</option>
            <option value="贵阳延安中路营业部">贵阳延安中路营业部</option>
            <option value="哈尔滨清滨路营业部">哈尔滨清滨路营业部</option>
            <option value="海口和平大道营业部">海口和平大道营业部</option>
            <option value="海口龙昆北路营业部">海口龙昆北路营业部</option>
            <option value="杭州凤起路营业部">杭州凤起路营业部</option>
            <option value="杭州富春江路营业部">杭州富春江路营业部</option>
            <option value="杭州密渡桥路营业部">杭州密渡桥路营业部</option>
            <option value="杭州天目山路营业部">杭州天目山路营业部</option>
            <option value="合肥长江中路营业部">合肥长江中路营业部</option>
            <option value="葫芦岛龙湾大街营业部">葫芦岛龙湾大街营业部</option>
            <option value="黄石颐阳路营业部">黄石颐阳路营业部</option>
            <option value="吉林吉林街营业部">吉林吉林街营业部</option>
            <option value="吉林珲春街营业部">吉林珲春街营业部</option>
            <option value="济南经七路营业部">济南经七路营业部</option>
            <option value="济南泺源路营业部">济南泺源路营业部</option>
            <option value="江门江华路营业部">江门江华路营业部</option>
            <option value="江门天宁路营业部">江门天宁路营业部</option>
            <option value="锦州解放路营业部">锦州解放路营业部</option>
            <option value="锦州山西街营业部">锦州山西街营业部</option>
            <option value="荆州北京路营业部">荆州北京路营业部</option>
            <option value="开平曙光西路营业部">开平曙光西路营业部</option>
            <option value="昆明东风西路营业部">昆明东风西路营业部</option>
            <option value="兰州酒泉路营业部">兰州酒泉路营业部</option>
            <option value="廊坊新开路营业部">廊坊新开路营业部</option>
            <option value="辽阳民主路营业部">辽阳民主路营业部</option>
            <option value="罗定大岗东路营业部">罗定大岗东路营业部</option>
            <option value="茂名官山三路营业部">茂名官山三路营业部</option>
            <option value="南昌北京西路营业部">南昌北京西路营业部</option>
            <option value="南海南兴三路营业部">南海南兴三路营业部</option>
            <option value="南京北京东路营业部">南京北京东路营业部</option>
            <option value="南京洪武路营业部">南京洪武路营业部</option>
            <option value="南宁星湖路营业部">南宁星湖路营业部</option>
            <option value="南通城山路营业部">南通城山路营业部</option>
            <option value="宁波中山东路营业部">宁波中山东路营业部</option>
            <option value="秦皇岛河北大街营业部">秦皇岛河北大街营业部</option>
            <option value="青岛香港中路营业部">青岛香港中路营业部</option>
            <option value="清远新城中心市场营业部">清远新城中心市场营业部</option>
            <option value="泉州温陵路营业部">泉州温陵路营业部</option>
            <option value="汕头梅溪东路证券营业部">汕头梅溪东路证券营业部</option>
            <option value="上海吴兴路营业部">上海吴兴路营业部</option>
            <option value="韶关文化街营业部">韶关文化街营业部</option>
            <option value="深圳彩田路证券营业部">深圳彩田路证券营业部</option>
            <option value="深圳高新区科苑南路证券营业部">深圳高新区科苑南路证券营业部</option>
            <option value="深圳民田路证券营业部">深圳民田路证券营业部</option>
            <option value="深圳南园路证券营业部">深圳南园路证券营业部</option>
            <option value="深圳蛇口兴华路证券营业部">深圳蛇口兴华路证券营业部</option>
            <option value="深圳深南东路证券营业部">深圳深南东路证券营业部</option>
            <option value="深圳天安创新科技广场营业部">深圳天安创新科技广场营业部</option>
            <option value="沈阳建设东路营业部">沈阳建设东路营业部</option>
            <option value="沈阳小西路营业部">沈阳小西路营业部</option>
            <option value="石家庄裕华西路裕园营业部">石家庄裕华西路裕园营业部</option>
            <option value="顺德容桂营业部">顺德容桂营业部</option>
            <option value="苏州干将东路营业部">苏州干将东路营业部</option>
            <option value="随州营业部">随州营业部</option>
            <option value="台山桥湖路营业部">台山桥湖路营业部</option>
            <option value="太原新建北路营业部">太原新建北路营业部</option>
            <option value="天津环湖中路营业部">天津环湖中路营业部</option>
            <option value="温州人民西路营业部">温州人民西路营业部</option>
            <option value="乌鲁木齐北京南路营业部">乌鲁木齐北京南路营业部</option>
            <option value="无锡金星路营业部">无锡金星路营业部</option>
            <option value="武汉沿江大道证券营业部">武汉沿江大道证券营业部</option>
            <option value="西安金花北路营业部">西安金花北路营业部</option>
            <option value="西安南广济街营业部">西安南广济街营业部</option>
            <option value="厦门湖滨南路营业部">厦门湖滨南路营业部</option>
            <option value="烟台大海阳路营业部">烟台大海阳路营业部</option>
            <option value="宜昌东山大道营业部">宜昌东山大道营业部</option>
            <option value="云浮星岩路营业部">云浮星岩路营业部</option>
            <option value="张家口建设东街营业部">张家口建设东街营业部</option>
            <option value="肇庆端州三路营业部">肇庆端州三路营业部</option>
            <option value="肇庆端州五路营业部">肇庆端州五路营业部</option>
            <option value="肇庆黄塘路营业部">肇庆黄塘路营业部</option>
            <option value="郑州花园路营业部">郑州花园路营业部</option>
            <option value="重庆凤天大道营业部">重庆凤天大道营业部</option>
            <option value="重庆科园一路营业部">重庆科园一路营业部</option>
            <option value="珠海凤凰北路证券营业部">珠海凤凰北路证券营业部</option>
            <option value="珠海凤凰路证券营业部">珠海凤凰路证券营业部</option>
            <option value="珠海吉大路证券营业部">珠海吉大路证券营业部</option>
            <option value="珠海景山路证券营业部">珠海景山路证券营业部</option>
            <option value="珠海敬业路证券营业部">珠海敬业路证券营业部</option>
            <option value="珠海九洲大道证券营业部">珠海九洲大道证券营业部</option>
            <option value="珠海柠溪路证券营业部">珠海柠溪路证券营业部</option>
            <option value="珠海情侣南路证券营业部">珠海情侣南路证券营业部</option>
            <option value="珠海情侣南路证券营业部斗门证券服务部">珠海情侣南路证券营业部斗门证券服务部</option>
            <option value="珠海情侣南路证券营业部凤凰路证券服务部">珠海情侣南路证券营业部凤凰路证券服务部</option>
            <option value="珠海情侣南路证券营业部吉大证券服务部">珠海情侣南路证券营业部吉大证券服务部</option>
            <option value="珠海情侣南路证券营业部九洲大道证券服务部">珠海情侣南路证券营业部九洲大道证券服务部</option>
            <option value="珠海情侣南路证券营业部银桦路证券服务部">珠海情侣南路证券营业部银桦路证券服务部</option>
            <option value="珠海西区证券营业部">珠海西区证券营业部</option>
            <option value="珠海业务总部营销拓展部">珠海业务总部营销拓展部</option>
            <option value="珠海银桦路证券营业部">珠海银桦路证券营业部</option>
            <option value="珠海粤海中路证券营业部">珠海粤海中路证券营业部</option>
            <option value="珠海粤海中证券营业部">珠海粤海中证券营业部</option>
          </select></td>
          <td width="39" align="center" style="text-indent:0">姓名</td>
          <td width="146" style="text-indent:0"><input id="name" maxlength="30" name="name" /></td>
          <td width="127" style="text-indent:0"><input type="submit" class="but_01" name="button" id="button" value="提交" /></td>
        </tr>
      </table>
    </div>
    <div class="blank5"></div>
    <table border="1" class="lh24 center" bordercolor="#cccccc" width="100%" id="tabs11">
      <tr>
        <td width="19%" class="tab_th1 bold">姓名 </td>
        <td width="40%" class="tab_th1 bold">营业部</td>
        <td width="14%" class="tab_th1 bold">职务</td>
        <td width="12%" class="tab_th1 bold">性别</td>
        <td width="15%" class="tab_th1 bold">证券从业资格</td>
      </tr>
      <tr>
        <td>史丽</td>
        <td>北京阜成门南大街营业部</td>
        <td>客户经理</td>
        <td>女</td>
        <td class="font_cs"><a href="#">点击查询</a></td>
      </tr>
      <tr class="bg_ec">
        <td>王松超</td>
        <td>北京阜成门南大街营业部</td>
        <td>客户经理</td>
        <td>男</td>
        <td><span class="font_cs"><a href="#">点击查询</a></span></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr class="bg_ec">
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr class="bg_ec">
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr class="bg_ec">
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr class="bg_ec">
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr class="bg_ec">
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr class="bg_ec">
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr class="bg_ec">
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr class="bg_ec">
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr class="bg_ec">
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table>
    <div class="lh30 textcenter">
  页次: 1 / 6 每页 20 行 共 83 行   <a href="#">首 页</a> <a href="#">下一页</a> <a href="#">末页</a>
</div>
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="${contextPath }/share/bottom.jsp" />
</body>
</html>