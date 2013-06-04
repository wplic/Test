<%@ page contentType="text/html; charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />

</head>

<body class="ggjs_bg">
<div class="ggjs_box">
	<div class="jobtcy_tt">
    	<p><a href="/default.jsp"><img src="/pic/job/tcy_logo.jpg" /></a></p>
    </div>
    <div class="ggjs_line"></div>
    
    <div class="dqwz"><span class=" mr10 ml10">当前位置：首页 - 留言反馈</span></div>
  <div class="p15">
    
    <table width="95%" align="center" class="lh22 mt10">
      <tr>
        <td width="17" height="30"><img src="/pic/business/dot-jt.jpg" /></td>
        <td class="font14 blue bold">留言反馈</td>
      </tr>
      <tr>
        <td></td>
        <td class="font14" height="30">如属个股咨询，请向本站分析师提出，这里不作个股答疑！<br /></td>
      </tr>
    </table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="list_bline02">&nbsp;</td>
      </tr>
    </table>
    <table width="52%" align="center" class="lh24 mt10">
      <tr>
        <td width="5%"><img src="/pic/commons/list_02.gif" /></td>
        <td width="19%">您的姓名：</td>
        <td width="76%"><label>
          <input type="text" name="textfield" id="textfield" />
        <span class="font_cs2">        * </span></label></td>
      </tr>
      <tr>
        <td><img src="/pic/commons/list_02.gif" /></td>
        <td>主页地址：</td>
        <td><input name="textfield3" type="text" id="textfield3" value="http://" /></td>
      </tr>
      <tr>
        <td><img src="/pic/commons/list_02.gif" /></td>
        <td>电子邮件： </td>
        <td><input type="text" name="textfield4" id="textfield4" />
        <span class="font_cs2">* </span></td>
      </tr>
      <tr>
        <td valign="top"><img class="pt7" src="/pic/commons/list_02.gif" /></td>
        <td colspan="2" valign="top">您的留言：</td>
      </tr>
      <tr>
        <td colspan="3" class="font_cs2"><textarea name="textarea" id="textarea" cols="45" rows="7"></textarea>
        * </td>
      </tr>
      <tr>
        <td colspan="3" height="32" align="center"><input name="input2" type="button" value="提交" class="but01 mr5" /></td>
      </tr>
      <tr>
        <td colspan="3" height="32">注意：打<span class="font_cs2">*</span>为必填项</td>
      </tr>
    </table>
    <div align="center" class="mt10">
      <input name="input" type="button" class="but02 blue" value="关闭此页" onclick="javascript:window.opener=null;window.close();" />
    </div>
  </div>
    <jsp:include page="/commons/msbottom2.jsp" />
</div>

</body>
</html>