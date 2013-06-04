
<%
	String bondCode = "020010";

	if (com.cssweb.F10.gazx.bond.util.Validator.isNotNull(request.getSession().getAttribute("bondCode"))) {
		bondCode = (String)request.getSession().getAttribute("bondCode");
	} else if (null != ((com.cssweb.F10.gazx.bond.pojo.BondInfo)(request.getSession().getAttribute("bondCodeBondInfo")))) {
		bondCode = ((com.cssweb.F10.gazx.bond.pojo.BondInfo)(request.getSession().getAttribute("bondCodeBondInfo"))).getBondCode();
	}
	
	String bondShortName = "";
	if (null != ((com.cssweb.F10.gazx.bond.pojo.BondInfo)(request.getSession().getAttribute("bondCodeBondInfo")))) {
		bondShortName = ((com.cssweb.F10.gazx.bond.pojo.BondInfo)(request.getSession().getAttribute("bondCodeBondInfo"))).getBondShortName();
	}	
%>