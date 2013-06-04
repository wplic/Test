<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>   
  	<title>广发证券牛熊宝模拟交易常见问题</title>
  </head>
  <body>
     <jsp:include page="${ctx }/match/nxsy/commons/head.jsp"></jsp:include>
     <link href="${ctx}/css/global.css" rel="stylesheet" type="text/css" />      
     <div class="ggjs_box1" style="display:block;">  
    	 <div class="p15 nxsyTitle">
                     广发证券“牛熊双赢”常见问题解答
    </div>
    <div class="nxsyIntro">
        <h2>常见问题：</h2>
        
        <logic:iterate id="data" name="questions" scope="request" indexId="num">
        <h3>${num+1 }、${data.reqContent } </h3>
        <p>答：${data.ansContent }</p>
        </logic:iterate>
        <p style="text-align: center;"><input type="button" value="点此注册" onclick="javascript:window.location.href=('${ctx }/match/nxsy/register.jsp')" />  </p>
    </div>
    </div>
	<jsp:include page="${ctx }/match/nxsy/commons/bottom.jsp"></jsp:include>
</body>