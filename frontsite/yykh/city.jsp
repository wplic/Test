<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="/commons/taglibs.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>My JSP 'gncj.jsp' starting page</title>
	</head>

	<body>
		<select name="yyb" id="yyb" style="width: 189px">
		   <!--第二个下拉菜单-->
		   <logic:iterate id="data" name="cityList">
		　 		<option value="${data.branch_code }">${data.branch_name }</option>
		    </logic:iterate>
		</select>
	</body>
</html>
