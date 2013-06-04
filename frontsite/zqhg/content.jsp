<%@ page contentType="text/html; charset=utf-8" language="java" %>
<html>
<head>
<META content="text/html; charset=UTF-8" http-equiv=Content-Type>
<style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:宋体;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:宋体;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Cambria;
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@宋体";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin-top:0cm;
	margin-right:0cm;
	margin-bottom:10.0pt;
	margin-left:0cm;
	line-height:115%;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
h1
	{mso-style-link:"标题 1 Char";
	margin-top:24.0pt;
	margin-right:0cm;
	margin-bottom:0cm;
	margin-left:0cm;
	margin-bottom:.0001pt;
	line-height:115%;
	font-size:14.0pt;
	font-family:"Cambria","serif";}
h1.CxSpFirst
	{mso-style-link:"标题 1 Char";
	margin-top:24.0pt;
	margin-right:0cm;
	margin-bottom:0cm;
	margin-left:0cm;
	margin-bottom:.0001pt;
	line-height:115%;
	font-size:14.0pt;
	font-family:"Cambria","serif";}
h1.CxSpMiddle
	{mso-style-link:"标题 1 Char";
	margin:0cm;
	margin-bottom:.0001pt;
	line-height:115%;
	font-size:14.0pt;
	font-family:"Cambria","serif";}
h1.CxSpLast
	{mso-style-link:"标题 1 Char";
	margin:0cm;
	margin-bottom:.0001pt;
	line-height:115%;
	font-size:14.0pt;
	font-family:"Cambria","serif";}
h2
	{mso-style-link:"标题 2 Char";
	margin-top:10.0pt;
	margin-right:0cm;
	margin-bottom:0cm;
	margin-left:0cm;
	margin-bottom:.0001pt;
	line-height:115%;
	font-size:13.0pt;
	font-family:"Cambria","serif";}
h3
	{mso-style-link:"标题 3 Char";
	margin-top:10.0pt;
	margin-right:0cm;
	margin-bottom:0cm;
	margin-left:0cm;
	margin-bottom:.0001pt;
	line-height:112%;
	font-size:11.0pt;
	font-family:"Cambria","serif";}
h4
	{mso-style-link:"标题 4 Char";
	margin-top:10.0pt;
	margin-right:0cm;
	margin-bottom:0cm;
	margin-left:0cm;
	margin-bottom:.0001pt;
	line-height:115%;
	font-size:11.0pt;
	font-family:"Cambria","serif";
	font-style:italic;}
h5
	{mso-style-link:"标题 5 Char";
	margin-top:10.0pt;
	margin-right:0cm;
	margin-bottom:0cm;
	margin-left:0cm;
	margin-bottom:.0001pt;
	line-height:115%;
	font-size:11.0pt;
	font-family:"Cambria","serif";
	color:#7F7F7F;}
h6
	{mso-style-link:"标题 6 Char";
	margin:0cm;
	margin-bottom:.0001pt;
	line-height:112%;
	font-size:11.0pt;
	font-family:"Cambria","serif";
	color:#7F7F7F;
	font-style:italic;}
p.MsoHeading7, li.MsoHeading7, div.MsoHeading7
	{mso-style-link:"标题 7 Char";
	margin:0cm;
	margin-bottom:.0001pt;
	line-height:115%;
	font-size:11.0pt;
	font-family:"Cambria","serif";
	font-style:italic;}
p.MsoHeading8, li.MsoHeading8, div.MsoHeading8
	{mso-style-link:"标题 8 Char";
	margin:0cm;
	margin-bottom:.0001pt;
	line-height:115%;
	font-size:10.0pt;
	font-family:"Cambria","serif";}
p.MsoHeading9, li.MsoHeading9, div.MsoHeading9
	{mso-style-link:"标题 9 Char";
	margin:0cm;
	margin-bottom:.0001pt;
	line-height:115%;
	font-size:10.0pt;
	font-family:"Cambria","serif";
	letter-spacing:.25pt;
	font-style:italic;}
p.MsoCommentText, li.MsoCommentText, div.MsoCommentText
	{mso-style-link:"批注文字 Char";
	margin-top:0cm;
	margin-right:0cm;
	margin-bottom:10.0pt;
	margin-left:0cm;
	line-height:115%;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
p.MsoHeader, li.MsoHeader, div.MsoHeader
	{mso-style-link:"页眉 Char";
	margin-top:0cm;
	margin-right:0cm;
	margin-bottom:10.0pt;
	margin-left:0cm;
	text-align:center;
	layout-grid-mode:char;
	border:none;
	padding:0cm;
	font-size:9.0pt;
	font-family:"Calibri","sans-serif";}
p.MsoFooter, li.MsoFooter, div.MsoFooter
	{mso-style-link:"页脚 Char";
	margin-top:0cm;
	margin-right:0cm;
	margin-bottom:10.0pt;
	margin-left:0cm;
	layout-grid-mode:char;
	font-size:9.0pt;
	font-family:"Calibri","sans-serif";}
p.MsoTitle, li.MsoTitle, div.MsoTitle
	{mso-style-link:"标题 Char";
	margin-top:0cm;
	margin-right:0cm;
	margin-bottom:10.0pt;
	margin-left:0cm;
	border:none;
	padding:0cm;
	font-size:26.0pt;
	font-family:"Cambria","serif";
	letter-spacing:.25pt;}
p.MsoTitleCxSpFirst, li.MsoTitleCxSpFirst, div.MsoTitleCxSpFirst
	{mso-style-link:"标题 Char";
	margin:0cm;
	margin-bottom:.0001pt;
	border:none;
	padding:0cm;
	font-size:26.0pt;
	font-family:"Cambria","serif";
	letter-spacing:.25pt;}
p.MsoTitleCxSpMiddle, li.MsoTitleCxSpMiddle, div.MsoTitleCxSpMiddle
	{mso-style-link:"标题 Char";
	margin:0cm;
	margin-bottom:.0001pt;
	border:none;
	padding:0cm;
	font-size:26.0pt;
	font-family:"Cambria","serif";
	letter-spacing:.25pt;}
p.MsoTitleCxSpLast, li.MsoTitleCxSpLast, div.MsoTitleCxSpLast
	{mso-style-link:"标题 Char";
	margin-top:0cm;
	margin-right:0cm;
	margin-bottom:10.0pt;
	margin-left:0cm;
	border:none;
	padding:0cm;
	font-size:26.0pt;
	font-family:"Cambria","serif";
	letter-spacing:.25pt;}
p.MsoSubtitle, li.MsoSubtitle, div.MsoSubtitle
	{mso-style-link:"副标题 Char";
	margin-top:0cm;
	margin-right:0cm;
	margin-bottom:30.0pt;
	margin-left:0cm;
	line-height:115%;
	font-size:12.0pt;
	font-family:"Cambria","serif";
	letter-spacing:.65pt;
	font-style:italic;}
em
	{letter-spacing:.5pt;
	border:none;
	font-weight:bold;}
p.MsoDocumentMap, li.MsoDocumentMap, div.MsoDocumentMap
	{mso-style-link:"文档结构图 Char";
	margin-top:0cm;
	margin-right:0cm;
	margin-bottom:10.0pt;
	margin-left:0cm;
	line-height:115%;
	font-size:9.0pt;
	font-family:宋体;}
p.MsoCommentSubject, li.MsoCommentSubject, div.MsoCommentSubject
	{mso-style-link:"批注主题 Char";
	margin-top:0cm;
	margin-right:0cm;
	margin-bottom:10.0pt;
	margin-left:0cm;
	line-height:115%;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	font-weight:bold;}
p.MsoAcetate, li.MsoAcetate, div.MsoAcetate
	{mso-style-link:"批注框文本 Char";
	margin:0cm;
	margin-bottom:.0001pt;
	font-size:9.0pt;
	font-family:"Calibri","sans-serif";}
p.MsoNoSpacing, li.MsoNoSpacing, div.MsoNoSpacing
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{margin-top:0cm;
	margin-right:0cm;
	margin-bottom:10.0pt;
	margin-left:36.0pt;
	line-height:115%;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
p.MsoListParagraphCxSpFirst, li.MsoListParagraphCxSpFirst, div.MsoListParagraphCxSpFirst
	{margin-top:0cm;
	margin-right:0cm;
	margin-bottom:0cm;
	margin-left:36.0pt;
	margin-bottom:.0001pt;
	line-height:115%;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
p.MsoListParagraphCxSpMiddle, li.MsoListParagraphCxSpMiddle, div.MsoListParagraphCxSpMiddle
	{margin-top:0cm;
	margin-right:0cm;
	margin-bottom:0cm;
	margin-left:36.0pt;
	margin-bottom:.0001pt;
	line-height:115%;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
p.MsoListParagraphCxSpLast, li.MsoListParagraphCxSpLast, div.MsoListParagraphCxSpLast
	{margin-top:0cm;
	margin-right:0cm;
	margin-bottom:10.0pt;
	margin-left:36.0pt;
	line-height:115%;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
p.MsoQuote, li.MsoQuote, div.MsoQuote
	{mso-style-link:"引用 Char";
	margin-top:10.0pt;
	margin-right:18.0pt;
	margin-bottom:0cm;
	margin-left:18.0pt;
	margin-bottom:.0001pt;
	line-height:115%;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	font-style:italic;}
p.MsoIntenseQuote, li.MsoIntenseQuote, div.MsoIntenseQuote
	{mso-style-link:"明显引用 Char";
	margin-top:10.0pt;
	margin-right:57.6pt;
	margin-bottom:14.0pt;
	margin-left:50.4pt;
	text-align:justify;
	text-justify:inter-ideograph;
	line-height:115%;
	border:none;
	padding:0cm;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	font-weight:bold;
	font-style:italic;}
span.MsoSubtleEmphasis
	{font-style:italic;}
span.MsoIntenseEmphasis
	{font-weight:bold;}
span.MsoSubtleReference
	{font-variant:small-caps;}
span.MsoIntenseReference
	{font-variant:small-caps;
	letter-spacing:.25pt;
	text-decoration:underline;}
span.MsoBookTitle
	{font-variant:small-caps;
	letter-spacing:.25pt;
	font-style:italic;}
p.MsoTocHeading, li.MsoTocHeading, div.MsoTocHeading
	{margin-top:24.0pt;
	margin-right:0cm;
	margin-bottom:0cm;
	margin-left:0cm;
	margin-bottom:.0001pt;
	line-height:115%;
	font-size:14.0pt;
	font-family:"Cambria","serif";
	font-weight:bold;}
p.MsoTocHeadingCxSpFirst, li.MsoTocHeadingCxSpFirst, div.MsoTocHeadingCxSpFirst
	{margin-top:24.0pt;
	margin-right:0cm;
	margin-bottom:0cm;
	margin-left:0cm;
	margin-bottom:.0001pt;
	line-height:115%;
	font-size:14.0pt;
	font-family:"Cambria","serif";
	font-weight:bold;}
p.MsoTocHeadingCxSpMiddle, li.MsoTocHeadingCxSpMiddle, div.MsoTocHeadingCxSpMiddle
	{margin:0cm;
	margin-bottom:.0001pt;
	line-height:115%;
	font-size:14.0pt;
	font-family:"Cambria","serif";
	font-weight:bold;}
p.MsoTocHeadingCxSpLast, li.MsoTocHeadingCxSpLast, div.MsoTocHeadingCxSpLast
	{margin:0cm;
	margin-bottom:.0001pt;
	line-height:115%;
	font-size:14.0pt;
	font-family:"Cambria","serif";
	font-weight:bold;}
span.1Char
	{mso-style-name:"标题 1 Char";
	mso-style-link:"标题 1";
	font-family:"Cambria","serif";
	font-weight:bold;}
span.2Char
	{mso-style-name:"标题 2 Char";
	mso-style-link:"标题 2";
	font-family:"Cambria","serif";
	font-weight:bold;}
span.3Char
	{mso-style-name:"标题 3 Char";
	mso-style-link:"标题 3";
	font-family:"Cambria","serif";
	font-weight:bold;}
span.4Char
	{mso-style-name:"标题 4 Char";
	mso-style-link:"标题 4";
	font-family:"Cambria","serif";
	font-weight:bold;
	font-style:italic;}
span.5Char
	{mso-style-name:"标题 5 Char";
	mso-style-link:"标题 5";
	font-family:"Cambria","serif";
	color:#7F7F7F;
	font-weight:bold;}
span.6Char
	{mso-style-name:"标题 6 Char";
	mso-style-link:"标题 6";
	font-family:"Cambria","serif";
	color:#7F7F7F;
	font-weight:bold;
	font-style:italic;}
span.7Char
	{mso-style-name:"标题 7 Char";
	mso-style-link:"标题 7";
	font-family:"Cambria","serif";
	font-style:italic;}
span.8Char
	{mso-style-name:"标题 8 Char";
	mso-style-link:"标题 8";
	font-family:"Cambria","serif";}
span.9Char
	{mso-style-name:"标题 9 Char";
	mso-style-link:"标题 9";
	font-family:"Cambria","serif";
	letter-spacing:.25pt;
	font-style:italic;}
span.Char
	{mso-style-name:"标题 Char";
	mso-style-link:标题;
	font-family:"Cambria","serif";
	letter-spacing:.25pt;}
span.Char0
	{mso-style-name:"副标题 Char";
	mso-style-link:副标题;
	font-family:"Cambria","serif";
	letter-spacing:.65pt;
	font-style:italic;}
span.Char1
	{mso-style-name:"引用 Char";
	mso-style-link:引用;
	font-style:italic;}
span.Char2
	{mso-style-name:"明显引用 Char";
	mso-style-link:明显引用;
	font-weight:bold;
	font-style:italic;}
span.Char3
	{mso-style-name:"批注框文本 Char";
	mso-style-link:批注框文本;}
span.Char4
	{mso-style-name:"页眉 Char";
	mso-style-link:页眉;}
span.Char5
	{mso-style-name:"页脚 Char";
	mso-style-link:页脚;}
p.4, li.4, div.4
	{mso-style-name:4级;
	margin:0cm;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	text-indent:24.0pt;
	line-height:150%;
	layout-grid-mode:char;
	font-size:10.5pt;
	font-family:宋体;}
span.Char6
	{mso-style-name:"批注文字 Char";
	mso-style-link:批注文字;}
span.Char7
	{mso-style-name:"批注主题 Char";
	mso-style-link:批注主题;
	font-weight:bold;}
span.Char8
	{mso-style-name:"文档结构图 Char";
	mso-style-link:文档结构图;
	font-family:宋体;}
 /* Page Definitions */
 @page WordSection1
	{size:595.3pt 841.9pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;
	layout-grid:15.6pt;}
div.WordSection1
	{page:WordSection1;}
 /* List Definitions */
 ol
	{margin-bottom:0cm;}
ul
	{margin-bottom:0cm;}
-->
</style>

</head>

<body lang=ZH-CN style='text-justify-trim:punctuation'>

<div class=WordSection1 style='layout-grid:15.6pt'>

<p class=MsoNormal align=center style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:center;line-height:150%'><b><span style='font-size:14.0pt;
line-height:150%;font-family:宋体'>约定购回式证券交易业务</span></b></p>

<p class=MsoNormal align=center style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:center;line-height:150%'><b><span lang=EN-US style='font-size:14.0pt;
line-height:150%;font-family:宋体'>&nbsp;</span></b></p>

<p class=MsoNormal align=center style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:center;line-height:150%'><b><span style='font-size:12.0pt;
line-height:150%;font-family:宋体'>第一部分</span></b><b><span style='font-size:12.0pt;
line-height:150%'> </span></b><b><span style='font-size:12.0pt;line-height:
150%;font-family:宋体'>约定购回式证券交易业务简介</span></b></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
150%'><b><span style='font-size:12.0pt;line-height:150%;font-family:宋体'>一、约定购回式证券交易</span></b></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
150%'><span style='font-size:12.0pt;line-height:150%;font-family:宋体'>&nbsp;&nbsp;&nbsp;&nbsp;约定购回式证券交易指符合条件的客户以约定价格向指定交易的广发证券卖出标的证券，并约定在未来某一日期客户按照另一约定价格从广发证券购回标的证券，除指定情形外，待购回期间标的证券所产生的相关权益于权益登记日划转给客户的交易行为。约定购回式证券交易包括初始交易和购回交易两次交易。</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
150%'><b><span style='font-size:12.0pt;line-height:150%;font-family:宋体'>二、约定购回式证券交易业务模式</span></b></p>

<p class=MsoNormal align="center" style='margin-bottom:0cm;margin-bottom:.0001pt;text-indent:
21.2pt;line-height:150%'><b><span lang=EN-US style='font-size:12.0pt;
line-height:150%'><img width=800 height=400 id="对象 4"
src="pic/1.jpg"></span></b></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-indent:
21.2pt;line-height:150%'><b><span lang=EN-US style='font-size:12.0pt;
line-height:150%'>&nbsp;</span></b></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
150%'><b><span style='font-size:12.0pt;line-height:150%;font-family:宋体'>三、约定购回式证券交易优势</span></b></p>

<p class=MsoNormal style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
margin-left:21.0pt;margin-bottom:.0001pt;text-indent:-21.0pt;line-height:150%'><span
style='font-size:12.0pt;line-height:150%;font-family:宋体'>&nbsp;&nbsp;&nbsp;&nbsp;丰富客户的融资渠道，解决客户短期资金需求。</span></p>

<p class=MsoNormal style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
margin-left:21.0pt;margin-bottom:.0001pt;text-indent:-21.0pt;line-height:150%'><span
lang=EN-US style='font-size:12.0pt;line-height:150%;font-family:宋体'>&nbsp;&nbsp;&nbsp;&nbsp;资金使用灵活，所融得的资金不限使用范围。</span></p>

<p class=MsoNormal style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
margin-left:21.0pt;margin-bottom:.0001pt;text-indent:-21.0pt;line-height:150%'><span
lang=EN-US style='font-size:12.0pt;line-height:150%;font-family:宋体'>&nbsp;&nbsp;&nbsp;&nbsp;融资效率高，流程便捷高效。</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
150%'><b><span style='font-size:12.0pt;line-height:150%;font-family:宋体'>四、约定购回式证券交易基本要素</span></b></p>

<p class=4 ><span lang=EN-US
style='font-size:12.0pt;line-height:150%;font-family:宋体'>&nbsp;&nbsp;&nbsp;&nbsp;交易时间：每个交易日<span lang=EN-US>9:30 </span>--<span
lang=EN-US>11:30&nbsp;&nbsp; 13:00 </span>--<span lang=EN-US>15:00</span>。</span></p>

<p class=4 ><span lang=EN-US
style='font-size:12.0pt;line-height:150%;font-family:宋体'>&nbsp;&nbsp;&nbsp;&nbsp;标的证券：在上海证券交易所上市的股票、基金和债券，但非流通股、限售流通股和个人持有的解除限售存量股票等除外。</span></p>

<p class=4 ><span lang=EN-US
style='font-size:12.0pt;line-height:150%;font-family:宋体'>&nbsp;&nbsp;&nbsp;&nbsp;交易期限：非固定期限，可到期购回、提前购回和延期购回，但购回期限最长不超过<span
lang=EN-US>182</span>天。</span></p>

<p class=4 ><span lang=EN-US
style='font-size:12.0pt;line-height:150%;font-family:宋体'>&nbsp;&nbsp;&nbsp;&nbsp;折算率：</span><span
style='font-size:12.0pt;line-height:150%;font-family:宋体'>用于初始交易时在标的证券市值上进行折算，以便计算初始交易成交金额；我司将根据市场风险、购回期限等因素考虑，综合确定标的证券折算率，并适时调整</span><span
style='font-size:12.0pt;line-height:150%;font-family:宋体'>。</span></p>

<p class=4 ><span lang=EN-US
style='font-size:12.0pt;line-height:150%;font-family:宋体'>&nbsp;&nbsp;&nbsp;&nbsp;购回利率：</span><span
style='font-size:12.0pt;line-height:150%;font-family:宋体'>指客户参与约定购回式证券交易时，向我司支付的年化资金利息率。利率请详询营业部。</span></p>

<p class=4 ><span lang=EN-US
style='font-size:12.0pt;line-height:150%;font-family:宋体'>&nbsp;&nbsp;&nbsp;&nbsp;交易税费：印花税、经手费、证管费按现行证券交易标准收取；过户费按面值收取，超过500元的部分减免。</span>

<p class=MsoNormal style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
margin-left:21.0pt;margin-bottom:.0001pt;line-height:150%'><span lang=EN-US
style='font-size:12.0pt;line-height:150%;font-family:宋体'>&nbsp;</span></p>

<p class=MsoNormal align=center style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:center;line-height:150%'><b><span style='font-size:12.0pt;
line-height:150%;font-family:宋体'>第二部分<span lang=EN-US>&nbsp; </span>客户约定购回式证券交易业务操作</span></b></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
150%'><b><span style='font-size:12.0pt;line-height:150%;font-family:宋体'>一、客户参与条件</span></b></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
150%'><span style='font-size:12.0pt;line-height:150%;font-family:宋体'>&nbsp;&nbsp;&nbsp;&nbsp;试点阶段，参与约定购回式证券交易业务的客户需满足以下条件：</span></p>

<p class=MsoNormal style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
margin-left:21.0pt;margin-bottom:.0001pt;text-indent:-21.0pt;line-height:150%'><span
lang=EN-US style='font-size:12.0pt;line-height:150%;font-family:宋体'>&nbsp;&nbsp;&nbsp;&nbsp;<span
style='font:7.0pt "Times New Roman"'>&nbsp; </span></span><span
style='font-size:12.0pt;line-height:150%;font-family:宋体'>上海<span lang=EN-US>A</span>股证券账户指定在我司，账户状态正常；</span></p>

<p class=MsoNormal style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
margin-left:21.0pt;margin-bottom:.0001pt;text-indent:-21.0pt;line-height:150%'><span
lang=EN-US style='font-size:12.0pt;line-height:150%;font-family:宋体'>&nbsp;&nbsp;&nbsp;&nbsp;<span
style='font:7.0pt "Times New Roman"'>&nbsp; </span></span><span
style='font-size:12.0pt;line-height:150%;font-family:宋体'>在我司开户的时间不少于<span
lang=EN-US>6</span>个月；</span></p>

<p class=MsoNormal style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
margin-left:21.0pt;margin-bottom:.0001pt;text-indent:-21.0pt;line-height:150%'><span
lang=EN-US style='font-size:12.0pt;line-height:150%;font-family:宋体'>&nbsp;&nbsp;&nbsp;&nbsp;<span
style='font:7.0pt "Times New Roman"'>&nbsp; </span></span><span
style='font-size:12.0pt;line-height:150%;font-family:宋体'>客户账户内总资产<span
lang=EN-US>250</span>万元以上（含<span lang=EN-US>250</span>万元）；</span></p>

<p class=MsoNormal style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
margin-left:21.0pt;margin-bottom:.0001pt;text-indent:-21.0pt;line-height:150%'><span
lang=EN-US style='font-size:12.0pt;line-height:150%;font-family:宋体'>&nbsp;&nbsp;&nbsp;&nbsp;<span
style='font:7.0pt "Times New Roman"'>&nbsp; </span></span><span
style='font-size:12.0pt;line-height:150%;font-family:宋体'>我司规定的其它条件。</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
150%'><b><span style='font-size:12.0pt;line-height:150%;font-family:宋体'>二、客户参与流程</span></b></p>

<p class=MsoNormal style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
margin-left:45.0pt;margin-bottom:.0001pt;text-indent:-21.0pt;line-height:150%;
layout-grid-mode:char'><span lang=EN-US style='font-size:12.0pt;line-height:
150%'>(一)<span style='font:7.0pt "Times New Roman"'> </span></span><span
style='font-size:12.0pt;line-height:150%;font-family:宋体'>客户参与约定购回交易基本流程：</span></p>

<p class=MsoNormal style='margin-left:35px;margin-bottom:0cm;margin-bottom:.0001pt;line-height:
150%;layout-grid-mode:char'><span style='font-size:12.0pt;line-height:150%;
font-family:宋体'>&nbsp;&nbsp;&nbsp;&nbsp;第一步：客户接受营业部的约定购回式证券交易业务知识培训及投资者教育。</span></p>

<p class=MsoNormal style='margin-left:35px;margin-bottom:0cm;margin-bottom:.0001pt;line-height:
150%;layout-grid-mode:char'><span style='font-size:12.0pt;line-height:150%;
font-family:宋体'>&nbsp;&nbsp;&nbsp;&nbsp;第二步：向营业部提交业务申请，签署《</span><span style='font-size:12.0pt;
line-height:150%;font-family:宋体'>约定购回式证券交易业务客户协议</span><span style='font-size:
12.0pt;line-height:150%;font-family:宋体'>》（以下简称《客户协议》）、《</span><span
style='font-size:12.0pt;line-height:150%;font-family:宋体'>约定购回式证券交易业务</span><span
style='font-size:12.0pt;line-height:150%;font-family:宋体'>风险揭示书》（以下简称《风险揭示书》）。经我司审核通过后，再由我司向上海交易所报备。</span></p>

<p class=MsoNormal style='margin-left:35px;margin-bottom:0cm;margin-bottom:.0001pt;line-height:
150%;layout-grid-mode:char'><span style='font-size:12.0pt;line-height:150%;
font-family:宋体'>&nbsp;&nbsp;&nbsp;&nbsp;第三步：</span><span style='font-size:12.0pt;line-height:150%;
font-family:宋体'>签署包含初始交易日、购回交易日、标的证券代码、标的证券数量、初始交易金额、购回交易金额、购回利率等交易要素的</span><span
style='font-size:12.0pt;line-height:150%;font-family:宋体'>《约定购回式证券交易协议书》（以下简称《交易协议》）。</span></p>

<p class=MsoNormal style='margin-left:35px;margin-bottom:0cm;margin-bottom:.0001pt;line-height:
150%;layout-grid-mode:char'><span style='font-size:12.0pt;line-height:150%;
font-family:宋体'>&nbsp;&nbsp;&nbsp;&nbsp;第四步：在双方约定的初始交易日的交易时间内，客户在证券账户内备足标的证券，由我司执行初始交易申报，日终由登记结算公司完成证券过户和资金划付，完成初始交易。</span></p>

<p class=MsoNormal style='margin-left:35px;margin-bottom:0cm;margin-bottom:.0001pt;line-height:
150%;layout-grid-mode:char'><span style='font-size:12.0pt;line-height:150%;
font-family:宋体'>&nbsp;&nbsp;&nbsp;&nbsp;第五步：在约定的购回交易日交易时间内，客户在资金账户内备足购回资金，由我司执行购回交易申报，日终由登记结算公司完成证券过户和资金划付，完成购回交易。</span></p>

<p class=MsoNormal style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
margin-left:45.0pt;margin-bottom:.0001pt;text-indent:-21.0pt;line-height:150%;
layout-grid-mode:char'><span lang=EN-US style='font-size:12.0pt;line-height:
150%'>(二)<span style='font:7.0pt "Times New Roman"'> </span></span><span
style='font-size:12.0pt;line-height:150%;font-family:宋体'>客户参与约定购回式证券交易基本流程图</span></p>

<p class=MsoNormal align="center"  style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
150%;layout-grid-mode:char'><span lang=EN-US><img width=821 height=1024
src="pic/2.jpg"></span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
150%'><b><span lang=EN-US style='font-size:12.0pt;line-height:150%;font-family:
宋体'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></b></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
150%'><b><span lang=EN-US style='font-size:12.0pt;line-height:150%;font-family:
宋体'>&nbsp;</span></b></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
150%'><b><span lang=EN-US style='font-size:12.0pt;line-height:150%;font-family:
宋体'>&nbsp;</span></b></p>

<p class=MsoNormal align=center style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:center;line-height:150%'><b><span style='font-size:12.0pt;
line-height:150%;font-family:宋体'>第三部分 期间管理</span></b></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
150%;layout-grid-mode:char'><b><span style='font-size:12.0pt;line-height:150%;
font-family:宋体'>一、购回期限管理</span></b></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
150%;layout-grid-mode:char'><b><span style='font-size:12.0pt;line-height:150%;
font-family:宋体'>提前购回：</span></b><span style='font-size:12.0pt;line-height:150%;
font-family:宋体'>在待购回期间，客户可根据自身需要，选择提前购回任一笔约定购回式证券交易。</span></p>

<p class=MsoNormal style='margin-top:7.8pt;margin-right:0cm;margin-bottom:7.8pt;
margin-left:0cm;text-align:justify;text-justify:inter-ideograph;line-height:
150%'><b><span style='font-size:12.0pt;line-height:150%;font-family:宋体'>延期购回：</span></b><span
style='font-size:12.0pt;line-height:150%;font-family:宋体'>在待购回期间，客户可根据自身需要，选择延期购回任一笔约定购回式证券交易，但原则上每笔约定购回式证券交易只能延期一次，且延期后购回期限不得超过</span><span
lang=EN-US style='font-size:12.0pt;line-height:150%'>182</span><span
style='font-size:12.0pt;line-height:150%;font-family:宋体'>天。</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
150%;layout-grid-mode:char'><b><span style='font-size:12.0pt;line-height:150%;
font-family:宋体'>二、履约保障交易</span></b></p>

<p class=4><span style='font-size:12.0pt;line-height:150%'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;履约保障交易是指客户申请进行新的约定购回式证券交易，用于与待购回的特定约定购回式证券交易关联，并对标的证券市值、购回交易金额进行合并计算。</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-indent:
24.1pt;line-height:150%;layout-grid-mode:char'><b><span lang=EN-US
style='font-size:12.0pt;line-height:150%;font-family:宋体'>(</span></b><b><span
style='font-size:12.0pt;line-height:150%;font-family:宋体'>一</span></b><b><span
lang=EN-US style='font-size:12.0pt;line-height:150%;font-family:宋体'>)</span></b><b><span
style='font-size:12.0pt;line-height:150%;font-family:宋体'>履约保障比例</span></b></p>

<p class=4 style="margin-left:30px;"><span style='font-size:12.0pt;line-height:150%'>&nbsp;&nbsp;&nbsp;&nbsp;履约保障比例是指单笔约定购回式证券交易或合并管理的多笔约定购回式证券交易的标的证券市值与其初始交易成交金额的比值。</span></p>

<p class=4 style="margin-left:30px;"><span style='font-size:12.0pt;line-height:150%'>&nbsp;&nbsp;&nbsp;&nbsp;交易履约保障比例</span><span
lang=EN-US style='font-size:12.0pt;line-height:150%;font-family:"Times New Roman","serif"'>=∑</span><span
lang=EN-US style='font-size:12.0pt;line-height:150%'>(</span><span
style='font-size:12.0pt;line-height:150%'>标的证券数量</span><span lang=EN-US
style='font-size:12.0pt;line-height:150%;font-family:"Times New Roman","serif"'>×</span><span
style='font-size:12.0pt;line-height:150%'>标的证券的当前价格</span><span lang=EN-US
style='font-size:12.0pt;line-height:150%'>)</span><span lang=EN-US
style='font-size:12.0pt;line-height:150%;font-family:"Times New Roman","serif"'>/∑</span><span
style='font-size:12.0pt;line-height:150%'>初始交易成交金额</span><span lang=EN-US
style='font-size:12.0pt;line-height:150%'>(</span><span style='font-size:12.0pt;
line-height:150%'>合计范围为原交易及其关联并合并计算的履约保障交易</span><span lang=EN-US
style='font-size:12.0pt;line-height:150%'>)</span></p>

<p class=MsoListParagraph style='margin-top:0cm;margin-right:12.0pt;margin-bottom:
0cm;margin-left:0cm;margin-bottom:.0001pt;text-indent:18.05pt;line-height:150%;
layout-grid-mode:char'><b><span style='font-size:12.0pt;line-height:150%;
font-family:宋体'>（二）警戒线和处置线</span></b></p>

<p class=4 style='margin-left:45.0pt;text-indent:-21.0pt'><span lang=EN-US
style='font-size:12.0pt;line-height:150%;font-family:宋体'><span
style='font:7.0pt "Times New Roman"'>&nbsp; </span></span><span
style='font-size:12.0pt;line-height:150%'>履约保障比例的值等于</span><span lang=EN-US
style='font-size:12.0pt;line-height:150%;font-family:"Times New Roman","serif"'>150%</span><span
style='font-size:12.0pt;line-height:150%'>时，为警戒线。</span></p>

<p class=4 style='margin-left:45.0pt;text-indent:-21.0pt'><span lang=EN-US
style='font-size:12.0pt;line-height:150%;font-family:宋体'><span
style='font:7.0pt "Times New Roman"'>&nbsp; </span></span><span
style='font-size:12.0pt;line-height:150%'>履约保障比例的值等于</span><span lang=EN-US
style='font-size:12.0pt;line-height:150%;font-family:"Times New Roman","serif"'>130%</span><span
style='font-size:12.0pt;line-height:150%'>时，为处置线。</span></p>

<p class=MsoListParagraph style='margin-top:0cm;margin-right:12.0pt;margin-bottom:
0cm;margin-left:24.0pt;margin-bottom:.0001pt;line-height:150%;layout-grid-mode:
char'><b><span lang=EN-US style='font-size:12.0pt;line-height:150%;font-family:
宋体'>(</span></b><b><span style='font-size:12.0pt;line-height:150%;font-family:
宋体'>三</span></b><b><span lang=EN-US style='font-size:12.0pt;line-height:150%;
font-family:宋体'>)</span></b><b><span style='font-size:12.0pt;line-height:150%;
font-family:宋体'>履约保障交易申请</span></b></p>

<p class=4 style="margin-left:30px;"><span style='font-size:12.0pt;line-height:150%'>&nbsp;&nbsp;&nbsp;&nbsp;在履约保障比例较低时，客户可向我司申请履约保障交易。客户申请履约保障交易的流程与初始交易发起程序相同，每一笔履约保障交易只能对应某一笔特定的约定购回式证券交易。</span></p>

<p class=4 style="margin-left:30px;"><span style='font-size:12.0pt;line-height:150%'>&nbsp;&nbsp;&nbsp;&nbsp;客户可为一笔初始交易申请一笔或多笔履约保障交易，当客户有多笔初始交易需要通过履约保障交易提供保障的，需要为每一笔交易分别申请履约保障交易。</span></p>

<p class=MsoListParagraph style='margin-top:0cm;margin-right:12.0pt;margin-bottom:
0cm;margin-left:24.0pt;margin-bottom:.0001pt;line-height:150%;layout-grid-mode:
char'><b><span style='font-size:12.0pt;line-height:150%;font-family:宋体'>（四）履约保障交易标的证券数量的最小数量</span></b></p>

<p class=4 style="margin-left:30px;"><span style='font-size:12.0pt;line-height:150%'>&nbsp;&nbsp;&nbsp;&nbsp;履约保障交易的标的证券数量应不少于按照下列公式计算的最小数量：</span></p>

<p class=4 style="margin-left:30px;"><span style='font-size:12.0pt;line-height:150%'>&nbsp;&nbsp;&nbsp;&nbsp;履约保障交易标的证券最小数量</span><span
lang=EN-US style='font-size:12.0pt;line-height:150%;font-family:"Times New Roman","serif"'>=[(</span><span
style='font-size:12.0pt;line-height:150%'>被保障的约定购回式证券交易购回交易成交金额</span><span
lang=EN-US style='font-size:12.0pt;line-height:150%;font-family:"Times New Roman","serif"'>+</span><span
style='font-size:12.0pt;line-height:150%'>履约保障交易购回交易成交金额</span><span
lang=EN-US style='font-size:12.0pt;line-height:150%;font-family:"Times New Roman","serif"'>)×</span><span
style='font-size:12.0pt;line-height:150%'>警戒线</span><span lang=EN-US
style='font-size:12.0pt;line-height:150%;font-family:"Times New Roman","serif"'>-</span><span
style='font-size:12.0pt;line-height:150%'>被保障的约定购回式证券交易标的证券的市值</span><span
lang=EN-US style='font-size:12.0pt;line-height:150%;font-family:"Times New Roman","serif"'>)]/</span><span
style='font-size:12.0pt;line-height:150%'>履约保障交易标的证券的当前价格。</span></p>

<p class=MsoListParagraph style='margin-top:0cm;margin-right:12.0pt;margin-bottom:
0cm;margin-left:24.0pt;margin-bottom:.0001pt;line-height:150%;layout-grid-mode:
char'><b><span lang=EN-US style='font-size:12.0pt;line-height:150%;font-family:
宋体'>&nbsp;(</span></b><b><span style='font-size:12.0pt;line-height:150%;
font-family:宋体'>五<span lang=EN-US>)</span>提前购回或延期购回履约保障交易</span></b></p>

<p class=4 style="margin-left:30px;"><span style='font-size:12.0pt;line-height:150%'>&nbsp;&nbsp;&nbsp;&nbsp;履约保障比例高于约定的警戒线时，客户可以单独申请提前购回履约保障交易，但完成购回后被保障的特定交易及其关联的其它履约保障交易合并计算的履约保障比例不得低于约定的警戒线。</span></p>

<p class=4 style="margin-left:30px;"><span style='font-size:12.0pt;line-height:150%'>&nbsp;&nbsp;&nbsp;&nbsp;客户申请提前购回或延期购回被保障的约定购回式证券交易时，所有合并计算的履约保障交易须同时申请提前购回或延期购回。</span></p>

<p class=MsoListParagraph style='margin-top:0cm;margin-right:12.0pt;margin-bottom:
0cm;margin-left:24.0pt;margin-bottom:.0001pt;line-height:150%;layout-grid-mode:
char'><b><span style='font-size:12.0pt;line-height:150%;font-family:宋体'>（六）履约保障通知</span></b></p>

<p class=4 style="margin-left:30px;"> <span style='font-size:12.0pt;line-height:150%'>&nbsp;&nbsp;&nbsp;&nbsp;当交易履约保障比例等于或低于警戒线时，我司将对客户进行预警，提示客户准备履约保障交易或提前购回；交易履约保障比例等于或低于处置线时，我司将要求客户于指定日期前完成履约保障交易或提前购回。</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
150%;layout-grid-mode:char'><b><span style='font-size:12.0pt;line-height:150%;
font-family:宋体'>三</span></b><b><span lang=EN-US style='font-size:12.0pt;
line-height:150%'>.&nbsp; </span></b><b><span style='font-size:12.0pt;
line-height:150%;font-family:宋体'>证券权益处理</span></b></p>

<p class=4><span style='font-size:12.0pt;line-height:150%'>&nbsp;&nbsp;&nbsp;&nbsp;待购回期间产生股票分红、派息、送股、转增、配股等权益时，由登记公司在权益登记日将权益直接划转至客户证券账户，客户享有相关权益，或自行行使相关权益。</span></p>
<table class=MsoNormalTable border=1 cellspacing=0 cellpadding=0 width="100%"
 style='width:100.0%;border-collapse:collapse;border:none'>
 <tr>
  <td width="33%" valign=top style='width:33%;border:solid windowtext 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal align=center style='text-align:center;line-height:125%'><span
  style='font-size:12.0pt;line-height:125%;font-family:宋体'><b>无须支付对价的权益<br>（分红/派息/送股）</b></span></p>
  </td>
  <td width="33%" style='width:33%;border:solid windowtext 1.0pt;border-left:
  none;padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal align=center style='text-align:center;line-height:125%'><span
  lang=EN-US style='font-size:12.0pt;line-height:125%;font-family:宋体'><b>须支付对价的权益<br>（配股/配债/增发）</b></span></p>
  </td>
  <td width="33%" style='width:33%;border:solid windowtext 1.0pt;border-left:
  none;padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal align=center style='text-align:center;line-height:125%'><span
  lang=EN-US style='font-size:12.0pt;line-height:125%;font-family:宋体'><b>投票权<br></b></span></p>
  </td>
 </tr>
 <tr style='page-break-inside:avoid'>
  <td width="33%" style='width:33%;border:solid windowtext 1.0pt;border-top:
  none;padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal align=center style='text-align:center;line-height:125%'><span
  lang=EN-US style='font-size:12.0pt;line-height:125%'>在权益登记日，由登记公司将相应权益从划转至客户账户</span></p>
  </td>
  <td width="33%" style='width:33%;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US
  style='font-size:12.0pt;line-height:115%;font-family:宋体'>在权益登记日，由登记公司将相应权益从划转至客户账户，有客户自行行使</span></p>
  </td>
  <td width="33%" style='width:33%;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US
  style='font-size:12.0pt;line-height:115%;font-family:宋体'>客户提前购回，再自行行使投票权；或者客户委托我司代为行使投票权</span></p>
  </td>
 </tr>
</table>
<!--
<p class=4><span lang=EN-US style='font-size:12.0pt;line-height:150%;
font-family:"Times New Roman","serif"'><img width=554 height=335
src="pic/3.JPG"></span></p>
 -->
<p class=MsoNormal style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
margin-left:21.25pt;margin-bottom:.0001pt;text-indent:2.65pt;line-height:150%'><b><span
lang=EN-US style='font-size:12.0pt;line-height:150%;font-family:宋体'>&nbsp;</span></b></p>

<p class=MsoNormal style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
margin-left:21.25pt;margin-bottom:.0001pt;text-indent:2.65pt;line-height:150%'><b><span
lang=EN-US style='font-size:12.0pt;line-height:150%;font-family:宋体'>&nbsp;</span></b></p>

<p class=MsoNormal style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
margin-left:21.25pt;margin-bottom:.0001pt;text-indent:2.65pt;line-height:150%'><b><span
lang=EN-US style='font-size:12.0pt;line-height:150%;font-family:宋体'>&nbsp;</span></b></p>

<p class=MsoNormal style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
margin-left:21.25pt;margin-bottom:.0001pt;text-indent:2.65pt;line-height:150%'><span
lang=EN-US style='font-size:12.0pt;line-height:150%;font-family:宋体'>&nbsp;</span></p>

<p class=MsoNormal align=center style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:center;line-height:150%'><b><span style='font-size:12.0pt;
line-height:150%;font-family:宋体'>第四部分 违约及处置</span></b></p>

<p class=MsoNormal style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
margin-left:36.0pt;margin-bottom:.0001pt;text-indent:-36.0pt;line-height:150%'><b><span
lang=EN-US style='font-size:12.0pt;line-height:150%;font-family:宋体'>一、<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp; </span></span></b><b><span
style='font-size:12.0pt;line-height:150%;font-family:宋体'>违约</span></b></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
150%'><span style='font-size:12.0pt;line-height:150%;font-family:宋体'>&nbsp;&nbsp;&nbsp;&nbsp;我司与客户签订的《</span><span
style='font-size:12.0pt;line-height:150%;font-family:宋体'>客户协议</span><span
style='font-size:12.0pt;line-height:150%;font-family:宋体'>》中列明了违约的情形，常见违约情形有：</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
150%;layout-grid-mode:char'><span style='font-size:12.0pt;line-height:150%;
font-family:宋体'>&nbsp;&nbsp;&nbsp;&nbsp;情形一：</span><span style='font-size:12.0pt;line-height:150%;
font-family:宋体'>因客户原因导致购回交易无法完成的；</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
150%;layout-grid-mode:char'><span style='font-size:12.0pt;line-height:150%;
font-family:宋体'>&nbsp;&nbsp;&nbsp;&nbsp;情形二：</span><span style='font-size:12.0pt;line-height:150%;
font-family:宋体'>待购回期间，日终清算后交易履约保障比例低于处置线的，客户未按《</span><span style='font-size:
12.0pt;line-height:150%;font-family:宋体'>客户协议</span><span style='font-size:12.0pt;
line-height:150%;font-family:宋体'>》约定提前购回且未提供履约保障措施的；</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
150%;layout-grid-mode:char'><span style='font-size:12.0pt;line-height:150%;
font-family:宋体'>&nbsp;&nbsp;&nbsp;&nbsp;情形三：</span><span style='font-size:12.0pt;line-height:150%;
font-family:宋体'>公司根据《</span><span style='font-size:12.0pt;line-height:150%;
font-family:宋体'>客户协议》</span><span style='font-size:12.0pt;line-height:150%;
font-family:宋体'>约定要求客户提前购回，客户未提前购回的。</span></p>

<p class=MsoNormal style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
margin-left:36.0pt;margin-bottom:.0001pt;text-indent:-36.0pt;line-height:150%'><b><span
lang=EN-US style='font-size:12.0pt;line-height:150%;font-family:宋体'>二、<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp; </span></span></b><b><span
style='font-size:12.0pt;line-height:150%;font-family:宋体'>违约处理</span></b></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
150%;layout-grid-mode:char'><span style='font-size:12.0pt;line-height:150%;
font-family:宋体'>&nbsp;&nbsp;&nbsp;&nbsp;发生违约情况时，客户与我司将进行协商处理：</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
150%;layout-grid-mode:char'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span lang=EN-US style='font-size:12.0pt;
line-height:150%;font-family:宋体'>(</span><span lang=EN-US style='font-size:
12.0pt;line-height:150%'>1</span><span lang=EN-US style='font-size:12.0pt;
line-height:150%;font-family:宋体'>)</span><span style='font-size:12.0pt;
line-height:150%;font-family:宋体'>根据客户与我司的约定，由我司向交易所提交相关材料，申请违约处置及划转标的证券；</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
150%;layout-grid-mode:char'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span lang=EN-US style='font-size:12.0pt;
line-height:150%;font-family:宋体'>(</span><span lang=EN-US style='font-size:
12.0pt;line-height:150%'>2</span><span lang=EN-US style='font-size:12.0pt;
line-height:150%;font-family:宋体'>)</span><span style='font-size:12.0pt;
line-height:150%;font-family:宋体'>处置完成后，我司向客户发送结果通知，若处置金额有余，将余款划回给客户，若处置金额不足以支付客户所欠款项，我司有权向客户追索。</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
150%;layout-grid-mode:char'><span lang=EN-US style='font-size:12.0pt;
line-height:150%'>&nbsp;</span></p>

<p class=MsoNormal align=center style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:center;line-height:150%'><b><span style='font-size:12.0pt;
line-height:150%;font-family:宋体'>第五部分 主要风险揭示</span></b></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
150%'><span style='font-size:12.0pt;line-height:150%;font-family:宋体'><b>一、利率波动风险</b></span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
150%'><span style='font-size:12.0pt;line-height:150%;font-family:宋体'>&nbsp;&nbsp;&nbsp;&nbsp;客户在参与约定购回式证券交易期间，若因提前购回、延期购回，或中国人民银行调整同期金融机构贷款基准利率，导致期限利率变动，可能会给投资者带来额外的利息支出。</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
150%'><span style='font-size:12.0pt;line-height:150%;font-family:宋体'><b>二、履约保障不足风险</b></span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
150%'><span style='font-size:12.0pt;line-height:150%;font-family:宋体'>&nbsp;&nbsp;&nbsp;&nbsp;客户在参与约定购回式证券交易期间，因标的证券价格下跌等原因导致交易的履约保障不足<b>时</b>，客户需提供履约保障，否则将面临被动提前购回的风险；若客户无法提前购回或提供履约保障，则面临标的证券被违约处置的风险；且因处置结果的不确定，可能会给客户造成损失。</span></p>

<p class=MsoNormal style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
margin-left:36.0pt;margin-bottom:.0001pt;text-indent:-36.0pt;line-height:150%'><span
lang=EN-US style='font-size:12.0pt;line-height:150%'><b>三、违约处置风险</b></span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
150%'><span style='font-size:12.0pt;line-height:150%;font-family:宋体'>&nbsp;&nbsp;&nbsp;&nbsp;客户在参与约定购回式证券交易期间，在交易到期且期限已满</span><span
lang=EN-US style='font-size:12.0pt;line-height:150%'>182</span><span
style='font-size:12.0pt;line-height:150%;font-family:宋体'>天无法延期的情况下，客户不按规定在购回日期进行购回交易的；或因履约保障比例低于处置线且客户未按《</span><span
style='font-size:12.0pt;line-height:150%;font-family:宋体'>客户协议</span><span
style='font-size:12.0pt;line-height:150%;font-family:宋体'>》约定进行提前购回或提供履约保障措施的；或发生《客户协议》所列示的违约情形时，则将面临标的证券被违约处置的风险，因处置结果的不确定，可能会给客户造成损失。</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
150%'><span style='font-size:12.0pt;line-height:150%;font-family:宋体'><b>四、权益处理规则导致的风险</b></span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
150%'><span style='font-size:12.0pt;line-height:150%;font-family:宋体'>&nbsp;&nbsp;&nbsp;&nbsp;若标的证券在待购回期间发生分红派息、送股、转增股份、老股东配售方式的增发、配股或配售债券等权益时，导致交易的履约保障不足，客户需提供履约保障，否则将面临被动提前购回的风险，若客户无法提前购回或提供履约保障，则面临标的证券被违约处置的风险；且因处置结果的不确定，可能会给客户造成损失。</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
150%'><span lang=EN-US style='font-size:12.0pt;line-height:150%'>&nbsp;</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
150%'><span style='font-size:12.0pt;line-height:150%;font-family:宋体'><b>免责声明：</b></span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
150%'><span style='font-size:12.0pt;line-height:150%;font-family:宋体'>&nbsp;&nbsp;&nbsp;&nbsp;本材料内容仅供客户参考。材料内容仅为列举性质，未能全面覆盖约定购回式证券交易业务内容及风险，若相关内容发生变更，以监管部门及广发证券最新公告为准。</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
150%'><b><span lang=EN-US style='font-size:12.0pt;line-height:150%;font-family:
宋体'>&nbsp;</span></b></p>

</div>

</body>

</html>
