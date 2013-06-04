<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
<script src="/js/setTab.js"></script>
</head>

<body class="body_bg">
<jsp:include page="/commons/top.jsp" />
<div class="wjdc_box">
  <p class="wjdc"><a href="/investorEdu/investorSurvey.html"><img src="/pic/index/wzdc.jpg"/></a></p>
</div>
<div class="main">
  
	<div class="dqwz">当前位置：首页 > 网上营业厅 > 页面行情</div>
    <div class="left_tit1">
    	<table width="98%" border="0" cellspacing="0" cellpadding="0" style=" text-indent:0px">
          <tr>
            <td width="7%">&nbsp;</td>
            <td width="8%" class="red bold">行情查询：</td>
            <td width="13%"><input type="text" name="textfield5" id="textfield5" class="input108" /></td>
            <td width="6%"><a href="#"><img src="/pic/wsyyt/but_cx1.jpg" /></a></td>
            <td width="48%"><a href="#"><img src="/pic/wsyyt/but_dpzs.jpg" /></a></td>
            <td width="5%" class="red bold" align="right">排名</td>
            <td width="13%" align="right"><label>
              <select name="select" id="select">
                <option>选择市场类型</option>
              </select>
            </label></td>
          </tr>
        </table>
  </div>
  
  <table width="845" align="center" class="mt15">
      <tr>
        <td width="28" class="zdpm" valign="top">
          <ul>
                <li id="tagtabs1" onmouseover="SwitchNews('tabs', 1, 4,'hov white','')"><a href="javascript:void(0)"><div style="height:32px"></div><a href="#">分<br />时</a></li>
                <li id="tagtabs2" onmouseover="SwitchNews('tabs', 2, 4,'hov white','')"><div style="height:32px"></div><a href="#">K<br />线</a></li>
                <li id="tagtabs3" onmouseover="SwitchNews('tabs', 3, 4,'hov white','')" class="hov white"><div style="height:25px"></div><a href="#">涨<br />跌<br />排<br />名</a></li>
                <li id="tagtabs4" onmouseover="SwitchNews('tabs', 4, 4,'hov white','')"><div style="height:25px"></div><a href="#">自<br />选<br />股</a></li>
          </ul>    
        </td>
        <td valign="top">
        	<table width="100%" class="dzpmtab font_43" id="tabs1" style=" display:none">
                  <tr>
                    <th>分时</th>
                    <th>股票名称 </th>
                    <th>涨    幅 </th>
                    <th>现    价</th>
                    <th>现    手 </th>
                    <th>开    盘 </th>
                    <th>最    高</th>
                    <th>最    低</th>
                  </tr>
                  <tr>
                    <td>002108</td>
                    <td><a href="#">沧州明珠</a></td>
                    <td class="red">18.16%</td>
                    <td class="red">16.85 </td>
                    <td class="green">23 </td>
                    <td class="red">15.67 </td>
                    <td class="red">18 </td>
                    <td class="red">15.67</td>
                  </tr>
                  <tr>
                    <td>600429          </td>
                    <td><a href="#">三元股份</a></td>
                    <td class="red">10.06% </td>
                    <td class="red"> 7.33</td>
                    <td class="green">5</td>
                    <td class="red">6.67</td>
                    <td class="red">7.46 </td>
                    <td class="red">6.54</td>
                  </tr>
                  <tr>
                    <td>600497</td>
                    <td><a href="#">驰宏锌锗</a></td>
                    <td class="red">10.03%</td>
                    <td class="red"> 15.58</td>
                    <td class="green"> 15 </td>
                    <td class="red">14.02 </td>
                    <td class="red">15.88 </td>
                    <td class="red">13.44</td>
                  </tr>
                  <tr>
                    <td>000939</td>
                    <td> <a href="#">凯迪电力</a></td>
                    <td class="red">10.03%</td>
                    <td class="red"> 7.67 </td>
                    <td class="green">45</td>
                    <td class="red"> 6.89 </td>
                    <td class="red">7.70</td>
                    <td class="red"> 6.89</td>
                  </tr>
                  <tr>
                    <td>002108</td>
                    <td> 沧州明珠</td>
                    <td class="red"> 18.16% </td>
                    <td class="red">16.85</td>
                    <td class="green"> 23 </td>
                    <td class="red">15.67 </td>
                    <td class="red">18</td>
                    <td class="red"> 15.67</td>
                  </tr>
                  <tr>
                    <td>600429</td>
                    <td> 三元股份</td>
                    <td class="red"> 10.06%</td>
                    <td class="red"> 7.33 </td>
                    <td class="green">5</td>
                    <td class="red"> 6.67</td>
                    <td class="red"> 7.46 </td>
                    <td class="red">6.54</td>
                  </tr>
                  <tr>
                    <td>600497</td>
                    <td> 驰宏锌锗</td>
                    <td class="red"> 10.03% </td>
                    <td class="red">15.58 </td>
                    <td class="green">15</td>
                    <td class="red"> 14.02 </td>
                    <td class="red">15.88 </td>
                    <td class="red">13.44</td>
                  </tr>
                  <tr>
                    <td>000939          </td>
                    <td>凯迪电力 </td>
                    <td class="red">10.03%</td>
                    <td class="red"> 7.67 </td>
                    <td class="green">45</td>
                    <td class="red"> 6.89</td>
                    <td class="red"> 7.70</td>
                    <td class="red"> 6.89</td>
                  </tr>
                  <tr>
                    <td>002108</td>
                    <td> 沧州明珠 </td>
                    <td class="red">18.16% </td>
                    <td class="red">16.85</td>
                    <td class="green"> 23 </td>
                    <td class="red">15.67</td>
                    <td class="red"> 18 </td>
                    <td class="red">15.67</td>
                  </tr>
                  <tr>
                    <td>600429</td>
                    <td> 三元股份</td>
                    <td class="red"> 10.06% </td>
                    <td class="red">7.33 </td>
                    <td class="green">5 </td>
                    <td class="red">6.67</td>
                    <td class="red"> 7.46 </td>
                    <td class="red">6.54</td>
                  </tr>
                  <tr>
                    <td>600497</td>
                    <td> 驰宏锌锗 </td>
                    <td class="red">10.03%</td>
                    <td class="red"> 15.58 </td>
                    <td class="green">15 </td>
                    <td class="red">14.02 </td>
                    <td class="red">15.88 </td>
                    <td class="red">13.44</td>
                  </tr>
                  <tr>
                    <td>000939</td>
                    <td> 凯迪电力</td>
                    <td class="red"> 10.03%</td>
                    <td class="red"> 7.67 </td>
                    <td class="green">45</td>
                    <td class="red"> 6.89</td>
                    <td class="red"> 7.70</td>
                    <td class="red"> 6.89</td>
                  </tr>
                  <tr>
                    <td>002108          </td>
                    <td>沧州明珠</td>
                    <td class="red"> 18.16% </td>
                    <td class="red">16.85</td>
                    <td class="green"> 23 </td>
                    <td class="red">15.67 </td>
                    <td class="red">18 </td>
                    <td class="red">15.67</td>
                  </tr>
                  <tr>
                    <td>600429</td>
                    <td> 三元股份 </td>
                    <td class="red">10.06%</td>
                    <td class="red"> 7.33 </td>
                    <td class="green">5</td>
                    <td class="red"> 6.67</td>
                    <td class="red"> 7.46 </td>
                    <td class="red">6.54</td>
                  </tr>
                  <tr>
                    <td>600497          </td>
                    <td>驰宏锌锗</td>
                    <td class="red"> 10.03% </td>
                    <td class="red">15.58</td>
                    <td class="green"> 15 </td>
                    <td class="red">14.02 </td>
                    <td class="red">15.88</td>
                    <td class="red"> 13.44</td>
                  </tr>
                  <tr>
                    <td>000939</td>
                    <td> 凯迪电力 </td>
                    <td class="red">10.03%</td>
                    <td class="red"> 7.67</td>
                    <td class="green"> 45 </td>
                    <td class="red">6.89</td>
                    <td class="red"> 7.70 </td>
                    <td class="red">6.89</td>
                  </tr>
                </table>
                
                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="dzpmtab font_43" id="tabs2" style=" display:none">
                  <tr>
                    <th>K线</th>
                    <th>股票名称 </th>
                    <th>涨    幅 </th>
                    <th>现    价</th>
                    <th>现    手 </th>
                    <th>开    盘 </th>
                    <th>最    高</th>
                    <th>最    低</th>
                  </tr>
                  <tr>
                    <td>002108</td>
                    <td><a href="#">沧州明珠</a></td>
                    <td class="red">18.16%</td>
                    <td class="red">16.85 </td>
                    <td class="green">23 </td>
                    <td class="red">15.67 </td>
                    <td class="red">18 </td>
                    <td class="red">15.67</td>
                  </tr>
                  <tr>
                    <td>600429          </td>
                    <td><a href="#">三元股份</a></td>
                    <td class="red">10.06% </td>
                    <td class="red"> 7.33</td>
                    <td class="green">5</td>
                    <td class="red">6.67</td>
                    <td class="red">7.46 </td>
                    <td class="red">6.54</td>
                  </tr>
                  <tr>
                    <td>600497                    </td>
                    <td><a href="#">驰宏锌锗</a></td>
                    <td class="red">10.03%</td>
                    <td class="red"> 15.58</td>
                    <td class="green"> 15 </td>
                    <td class="red">14.02 </td>
                    <td class="red">15.88 </td>
                    <td class="red">13.44</td>
                  </tr>
                  <tr>
                    <td>000939</td>
                    <td> <a href="#">凯迪电力</a></td>
                    <td class="red">10.03%</td>
                    <td class="red"> 7.67 </td>
                    <td class="green">45</td>
                    <td class="red"> 6.89 </td>
                    <td class="red">7.70</td>
                    <td class="red"> 6.89</td>
                  </tr>
                  <tr>
                    <td>002108</td>
                    <td> 沧州明珠</td>
                    <td class="red"> 18.16% </td>
                    <td class="red">16.85</td>
                    <td class="green"> 23 </td>
                    <td class="red">15.67 </td>
                    <td class="red">18</td>
                    <td class="red"> 15.67</td>
                  </tr>
                  <tr>
                    <td>600429</td>
                    <td> 三元股份</td>
                    <td class="red"> 10.06%</td>
                    <td class="red"> 7.33 </td>
                    <td class="green">5</td>
                    <td class="red"> 6.67</td>
                    <td class="red"> 7.46 </td>
                    <td class="red">6.54</td>
                  </tr>
                  <tr>
                    <td>600497</td>
                    <td> 驰宏锌锗</td>
                    <td class="red"> 10.03% </td>
                    <td class="red">15.58 </td>
                    <td class="green">15</td>
                    <td class="red"> 14.02 </td>
                    <td class="red">15.88 </td>
                    <td class="red">13.44</td>
                  </tr>
                  <tr>
                    <td>000939          </td>
                    <td>凯迪电力 </td>
                    <td class="red">10.03%</td>
                    <td class="red"> 7.67 </td>
                    <td class="green">45</td>
                    <td class="red"> 6.89</td>
                    <td class="red"> 7.70</td>
                    <td class="red"> 6.89</td>
                  </tr>
                  <tr>
                    <td>002108</td>
                    <td> 沧州明珠 </td>
                    <td class="red">18.16% </td>
                    <td class="red">16.85</td>
                    <td class="green"> 23 </td>
                    <td class="red">15.67</td>
                    <td class="red"> 18 </td>
                    <td class="red">15.67</td>
                  </tr>
                  <tr>
                    <td>600429</td>
                    <td> 三元股份</td>
                    <td class="red"> 10.06% </td>
                    <td class="red">7.33 </td>
                    <td class="green">5 </td>
                    <td class="red">6.67</td>
                    <td class="red"> 7.46 </td>
                    <td class="red">6.54</td>
                  </tr>
                  <tr>
                    <td>600497</td>
                    <td> 驰宏锌锗 </td>
                    <td class="red">10.03%</td>
                    <td class="red"> 15.58 </td>
                    <td class="green">15 </td>
                    <td class="red">14.02 </td>
                    <td class="red">15.88 </td>
                    <td class="red">13.44</td>
                  </tr>
                  <tr>
                    <td>000939</td>
                    <td> 凯迪电力</td>
                    <td class="red"> 10.03%</td>
                    <td class="red"> 7.67 </td>
                    <td class="green">45</td>
                    <td class="red"> 6.89</td>
                    <td class="red"> 7.70</td>
                    <td class="red"> 6.89</td>
                  </tr>
                  <tr>
                    <td>002108          </td>
                    <td>沧州明珠</td>
                    <td class="red"> 18.16% </td>
                    <td class="red">16.85</td>
                    <td class="green"> 23 </td>
                    <td class="red">15.67 </td>
                    <td class="red">18 </td>
                    <td class="red">15.67</td>
                  </tr>
                  <tr>
                    <td>600429</td>
                    <td> 三元股份 </td>
                    <td class="red">10.06%</td>
                    <td class="red"> 7.33 </td>
                    <td class="green">5</td>
                    <td class="red"> 6.67</td>
                    <td class="red"> 7.46 </td>
                    <td class="red">6.54</td>
                  </tr>
                  <tr>
                    <td>600497          </td>
                    <td>驰宏锌锗</td>
                    <td class="red"> 10.03% </td>
                    <td class="red">15.58</td>
                    <td class="green"> 15 </td>
                    <td class="red">14.02 </td>
                    <td class="red">15.88</td>
                    <td class="red"> 13.44</td>
                  </tr>
                  <tr>
                    <td>000939</td>
                    <td> 凯迪电力 </td>
                    <td class="red">10.03%</td>
                    <td class="red"> 7.67</td>
                    <td class="green"> 45 </td>
                    <td class="red">6.89</td>
                    <td class="red"> 7.70 </td>
                    <td class="red">6.89</td>
                  </tr>
                </table>
                
                <table width="100%" class="dzpmtab font_43" id="tabs3">
                  <tr>
                    <th>股票代码</th>
                    <th>股票名称 </th>
                    <th>涨    幅 </th>
                    <th>现    价</th>
                    <th>现    手 </th>
                    <th>开    盘 </th>
                    <th>最    高</th>
                    <th>最    低</th>
                  </tr>
                  <tr>
                    <td>002108</td>
                    <td><a href="#">沧州明珠</a></td>
                    <td class="red">18.16%</td>
                    <td class="red">16.85 </td>
                    <td class="green">23 </td>
                    <td class="red">15.67 </td>
                    <td class="red">18 </td>
                    <td class="red">15.67</td>
                  </tr>
                  <tr>
                    <td>600429          </td>
                    <td><a href="#">三元股份</a></td>
                    <td class="red">10.06% </td>
                    <td class="red"> 7.33</td>
                    <td class="green">5</td>
                    <td class="red">6.67</td>
                    <td class="red">7.46 </td>
                    <td class="red">6.54</td>
                  </tr>
                  <tr>
                    <td>600497                    </td>
                    <td><a href="#">驰宏锌锗</a></td>
                    <td class="red">10.03%</td>
                    <td class="red"> 15.58</td>
                    <td class="green"> 15 </td>
                    <td class="red">14.02 </td>
                    <td class="red">15.88 </td>
                    <td class="red">13.44</td>
                  </tr>
                  <tr>
                    <td>000939</td>
                    <td> <a href="#">凯迪电力</a></td>
                    <td class="red">10.03%</td>
                    <td class="red"> 7.67 </td>
                    <td class="green">45</td>
                    <td class="red"> 6.89 </td>
                    <td class="red">7.70</td>
                    <td class="red"> 6.89</td>
                  </tr>
                  <tr>
                    <td>002108</td>
                    <td> 沧州明珠</td>
                    <td class="red"> 18.16% </td>
                    <td class="red">16.85</td>
                    <td class="green"> 23 </td>
                    <td class="red">15.67 </td>
                    <td class="red">18</td>
                    <td class="red"> 15.67</td>
                  </tr>
                  <tr>
                    <td>600429</td>
                    <td> 三元股份</td>
                    <td class="red"> 10.06%</td>
                    <td class="red"> 7.33 </td>
                    <td class="green">5</td>
                    <td class="red"> 6.67</td>
                    <td class="red"> 7.46 </td>
                    <td class="red">6.54</td>
                  </tr>
                  <tr>
                    <td>600497</td>
                    <td> 驰宏锌锗</td>
                    <td class="red"> 10.03% </td>
                    <td class="red">15.58 </td>
                    <td class="green">15</td>
                    <td class="red"> 14.02 </td>
                    <td class="red">15.88 </td>
                    <td class="red">13.44</td>
                  </tr>
                  <tr>
                    <td>000939          </td>
                    <td>凯迪电力 </td>
                    <td class="red">10.03%</td>
                    <td class="red"> 7.67 </td>
                    <td class="green">45</td>
                    <td class="red"> 6.89</td>
                    <td class="red"> 7.70</td>
                    <td class="red"> 6.89</td>
                  </tr>
                  <tr>
                    <td>002108</td>
                    <td> 沧州明珠 </td>
                    <td class="red">18.16% </td>
                    <td class="red">16.85</td>
                    <td class="green"> 23 </td>
                    <td class="red">15.67</td>
                    <td class="red"> 18 </td>
                    <td class="red">15.67</td>
                  </tr>
                  <tr>
                    <td>600429</td>
                    <td> 三元股份</td>
                    <td class="red"> 10.06% </td>
                    <td class="red">7.33 </td>
                    <td class="green">5 </td>
                    <td class="red">6.67</td>
                    <td class="red"> 7.46 </td>
                    <td class="red">6.54</td>
                  </tr>
                  <tr>
                    <td>600497</td>
                    <td> 驰宏锌锗 </td>
                    <td class="red">10.03%</td>
                    <td class="red"> 15.58 </td>
                    <td class="green">15 </td>
                    <td class="red">14.02 </td>
                    <td class="red">15.88 </td>
                    <td class="red">13.44</td>
                  </tr>
                  <tr>
                    <td>000939</td>
                    <td> 凯迪电力</td>
                    <td class="red"> 10.03%</td>
                    <td class="red"> 7.67 </td>
                    <td class="green">45</td>
                    <td class="red"> 6.89</td>
                    <td class="red"> 7.70</td>
                    <td class="red"> 6.89</td>
                  </tr>
                  <tr>
                    <td>002108          </td>
                    <td>沧州明珠</td>
                    <td class="red"> 18.16% </td>
                    <td class="red">16.85</td>
                    <td class="green"> 23 </td>
                    <td class="red">15.67 </td>
                    <td class="red">18 </td>
                    <td class="red">15.67</td>
                  </tr>
                  <tr>
                    <td>600429</td>
                    <td> 三元股份 </td>
                    <td class="red">10.06%</td>
                    <td class="red"> 7.33 </td>
                    <td class="green">5</td>
                    <td class="red"> 6.67</td>
                    <td class="red"> 7.46 </td>
                    <td class="red">6.54</td>
                  </tr>
                  <tr>
                    <td>600497          </td>
                    <td>驰宏锌锗</td>
                    <td class="red"> 10.03% </td>
                    <td class="red">15.58</td>
                    <td class="green"> 15 </td>
                    <td class="red">14.02 </td>
                    <td class="red">15.88</td>
                    <td class="red"> 13.44</td>
                  </tr>
                  <tr>
                    <td>000939</td>
                    <td> 凯迪电力 </td>
                    <td class="red">10.03%</td>
                    <td class="red"> 7.67</td>
                    <td class="green"> 45 </td>
                    <td class="red">6.89</td>
                    <td class="red"> 7.70 </td>
                    <td class="red">6.89</td>
                  </tr>
                </table>
                
                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="dzpmtab font_43" id="tabs4" style=" display:none">
                  <tr>
                    <th>自选股</th>
                    <th>股票名称 </th>
                    <th>涨    幅 </th>
                    <th>现    价</th>
                    <th>现    手 </th>
                    <th>开    盘 </th>
                    <th>最    高</th>
                    <th>最    低</th>
                  </tr>
                  <tr>
                    <td>002108</td>
                    <td><a href="#">沧州明珠</a></td>
                    <td class="red">18.16%</td>
                    <td class="red">16.85 </td>
                    <td class="green">23 </td>
                    <td class="red">15.67 </td>
                    <td class="red">18 </td>
                    <td class="red">15.67</td>
                  </tr>
                  <tr>
                    <td>600429          </td>
                    <td><a href="#">三元股份</a></td>
                    <td class="red">10.06% </td>
                    <td class="red"> 7.33</td>
                    <td class="green">5</td>
                    <td class="red">6.67</td>
                    <td class="red">7.46 </td>
                    <td class="red">6.54</td>
                  </tr>
                  <tr>
                    <td>600497                    </td>
                    <td><a href="#">驰宏锌锗</a></td>
                    <td class="red">10.03%</td>
                    <td class="red"> 15.58</td>
                    <td class="green"> 15 </td>
                    <td class="red">14.02 </td>
                    <td class="red">15.88 </td>
                    <td class="red">13.44</td>
                  </tr>
                  <tr>
                    <td>000939</td>
                    <td> <a href="#">凯迪电力</a></td>
                    <td class="red">10.03%</td>
                    <td class="red"> 7.67 </td>
                    <td class="green">45</td>
                    <td class="red"> 6.89 </td>
                    <td class="red">7.70</td>
                    <td class="red"> 6.89</td>
                  </tr>
                  <tr>
                    <td>002108</td>
                    <td> 沧州明珠</td>
                    <td class="red"> 18.16% </td>
                    <td class="red">16.85</td>
                    <td class="green"> 23 </td>
                    <td class="red">15.67 </td>
                    <td class="red">18</td>
                    <td class="red"> 15.67</td>
                  </tr>
                  <tr>
                    <td>600429</td>
                    <td> 三元股份</td>
                    <td class="red"> 10.06%</td>
                    <td class="red"> 7.33 </td>
                    <td class="green">5</td>
                    <td class="red"> 6.67</td>
                    <td class="red"> 7.46 </td>
                    <td class="red">6.54</td>
                  </tr>
                  <tr>
                    <td>600497</td>
                    <td> 驰宏锌锗</td>
                    <td class="red"> 10.03% </td>
                    <td class="red">15.58 </td>
                    <td class="green">15</td>
                    <td class="red"> 14.02 </td>
                    <td class="red">15.88 </td>
                    <td class="red">13.44</td>
                  </tr>
                  <tr>
                    <td>000939          </td>
                    <td>凯迪电力 </td>
                    <td class="red">10.03%</td>
                    <td class="red"> 7.67 </td>
                    <td class="green">45</td>
                    <td class="red"> 6.89</td>
                    <td class="red"> 7.70</td>
                    <td class="red"> 6.89</td>
                  </tr>
                  <tr>
                    <td>002108</td>
                    <td> 沧州明珠 </td>
                    <td class="red">18.16% </td>
                    <td class="red">16.85</td>
                    <td class="green"> 23 </td>
                    <td class="red">15.67</td>
                    <td class="red"> 18 </td>
                    <td class="red">15.67</td>
                  </tr>
                  <tr>
                    <td>600429</td>
                    <td> 三元股份</td>
                    <td class="red"> 10.06% </td>
                    <td class="red">7.33 </td>
                    <td class="green">5 </td>
                    <td class="red">6.67</td>
                    <td class="red"> 7.46 </td>
                    <td class="red">6.54</td>
                  </tr>
                  <tr>
                    <td>600497</td>
                    <td> 驰宏锌锗 </td>
                    <td class="red">10.03%</td>
                    <td class="red"> 15.58 </td>
                    <td class="green">15 </td>
                    <td class="red">14.02 </td>
                    <td class="red">15.88 </td>
                    <td class="red">13.44</td>
                  </tr>
                  <tr>
                    <td>000939</td>
                    <td> 凯迪电力</td>
                    <td class="red"> 10.03%</td>
                    <td class="red"> 7.67 </td>
                    <td class="green">45</td>
                    <td class="red"> 6.89</td>
                    <td class="red"> 7.70</td>
                    <td class="red"> 6.89</td>
                  </tr>
                  <tr>
                    <td>002108          </td>
                    <td>沧州明珠</td>
                    <td class="red"> 18.16% </td>
                    <td class="red">16.85</td>
                    <td class="green"> 23 </td>
                    <td class="red">15.67 </td>
                    <td class="red">18 </td>
                    <td class="red">15.67</td>
                  </tr>
                  <tr>
                    <td>600429</td>
                    <td> 三元股份 </td>
                    <td class="red">10.06%</td>
                    <td class="red"> 7.33 </td>
                    <td class="green">5</td>
                    <td class="red"> 6.67</td>
                    <td class="red"> 7.46 </td>
                    <td class="red">6.54</td>
                  </tr>
                  <tr>
                    <td>600497          </td>
                    <td>驰宏锌锗</td>
                    <td class="red"> 10.03% </td>
                    <td class="red">15.58</td>
                    <td class="green"> 15 </td>
                    <td class="red">14.02 </td>
                    <td class="red">15.88</td>
                    <td class="red"> 13.44</td>
                  </tr>
                  <tr>
                    <td>000939</td>
                    <td> 凯迪电力 </td>
                    <td class="red">10.03%</td>
                    <td class="red"> 7.67</td>
                    <td class="green"> 45 </td>
                    <td class="red">6.89</td>
                    <td class="red"> 7.70 </td>
                    <td class="red">6.89</td>
                  </tr>
                </table>

        </td>
      </tr>
    </table>
     <table width="845" class="mt10" align="center">
       <tr>
       	 <td width="28">&nbsp;</td>	
         <td width="115"><input type="text" name="textfield" id="textfield" class="input108" /></td>
         <td><a href="javascript:void(0)"><img src="/pic/wsyyt/but_ok.jpg" /></a></td>
         <td width="155" align="center"><a href="javascript:void(0)"><img src="/pic/wsyyt/but_lczx.jpg" /></a></td>
       </tr>
     </table>
</div>
<jsp:include page="/commons/bottom.jsp" />

</body>
</html>