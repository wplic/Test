<%@page import="com.css.cms.document.util.DocumentHelper"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="zxgg_box mt4">
       	  <h4>交易所每日公告</h4>
            <div class=" text_box">
              <table width="100%" cellpadding="0" cellspacing="0" class="lh21 font_st">
                <tr>
		          <td><a href="${ctx }/infoCenter/stockjygg.jsp?nav=wsyyt&nav1=jygg&nav2=jysmrgg&nav3=hstbts&whichCat=zxzx_jysgg_hstbts">·沪市特别提示</a></td>
		          <td><a href="${ctx }/infoCenter/stockjygg.jsp?nav=wsyyt&nav1=jygg&nav2=jysmrgg&nav3=sstbts&whichCat=zxzx_jysgg_sstbts">·深市特别提示</a></td>
		          </tr>
		          <tr>
		            <td><a href="${ctx }/infoCenter/stockjygg.jsp?nav=wsyyt&nav1=jygg&nav2=jysmrgg&nav3=jrxgts&whichCat=zxzx_jysgg_jrxgts">·今日新股提示</a></td>
		            <td><a href="${ctx }/infoCenter/stockjygg.jsp?nav=wsyyt&nav1=jygg&nav2=jysmrgg&nav3=zfpgts&whichCat=zxzx_jysgg_zfpgts">·增发配股提示</a></td>
		          </tr>
		          <tr>
		            <td colspan="2"><a href="${ctx }/infoCenter/stockjygg.jsp?nav=wsyyt&nav1=jygg&nav2=jysmrgg&nav3=zqts&whichCat=zxzx_jysgg_zqts">·债券发行与上市提示</a></td>
		          </tr>
		          <tr>
		            <td colspan="2"><a href="${ctx }/infoCenter/stockjygg.jsp?nav=wsyyt&nav1=jygg&nav2=jysmrgg&nav3=jjts&whichCat=zxzx_jysgg_jjts">·基金发行扩募提示</a></td>
		          </tr>
		          <tr>
		            <td><a href="${ctx }/infoCenter/stockjygg.jsp?nav=wsyyt&nav1=jygg&nav2=jysmrgg&nav3=hsgg&whichCat=zxzx_jysgg_hsgg">·上交所公告</a></td>
		            <td><a href="${ctx }/infoCenter/stockjygg.jsp?nav=wsyyt&nav1=jygg&nav2=jysmrgg&nav3=ssgg&whichCat=zxzx_jysgg_ssgg">·深交所公告</a></td>
		          </tr>
		          
              </table>
          </div>
      </div>
</body>
</html>