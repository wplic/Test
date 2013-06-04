// JavaScript Document

var hdtitle=encodeURI('广发证券 微笑运动');
var lian=encodeURI('&');
var bubian=encodeURI('http://www.gf.com.cn/london2012/');


//分享视频按钮内容开始

var newcontent='这是属于我们的快乐奥运，这是属于大家的微笑世界。快来加入我们，一起分享广发证券奥运视频，分享我们的喜悦，分享我们的欢笑。与微笑同行,为运动喝彩。分享赢取4500元SONY最热微单相机等丰富奖品。活动地址：http://www.gf.com.cn/london2012/';

var sa_url1='http://service.weibo.com/share/share.php?appkey=1152390549'+lian+'title=%23广发证券 微笑运动%23';
var sa_url2=newcontent+lian+'pic=http%3A//www.botuu.com/wb_zimg.jpg'+lian;
var sa_url;

function xl_share(){
	sa_url=sa_url1+sa_url2;
	window.open(sa_url);
    }
	
	
var tx_url1='http://share.v.t.qq.com/index.php?c=share&amp;a=index'+lian+'url=http%3A//www.gf.com.cn/'+lian+'title=%23'+hdtitle+'%23';
var tx_url2=encodeURI(newcontent)+lian+'appkey=dad361aadb9948278afc268bd5617307'+lian+'pic=http%3A//www.botuu.com/wb_zimg.jpg'+lian;
var tx_url;

function tx_share(){
	tx_url=tx_url1+tx_url2;
	window.open(tx_url);
    }
	

//分享视频按钮内容结束	



var sina_url1='http://service.weibo.com/share/share.php?appkey=1152390549'+lian+'title=%23广发证券 微笑运动%23';
var sina_url2;
var sina_url3=bubian+lian+'pic=http%3A//www.botuu.com/wb_zimg.jpg'+lian;
var sina_url;

function share1(){
	/*alert(sina_url1);*/
	sina_url2=$('#wb1').val();
	sina_url=sina_url1+sina_url2+sina_url3;
	window.open(sina_url);
    }
	
function share2(){
	sina_url2=$('#wb2').val();
	sina_url=sina_url1+sina_url2+sina_url3;
	window.open(sina_url);
    }
	
	function share3(){
	sina_url2=$('#wb3').val();
	sina_url=sina_url1+sina_url2+sina_url3;
	window.open(sina_url);
    }
	
	function share4(){
	sina_url2=$('#wb4').val();
	sina_url=sina_url1+sina_url2+sina_url3;
	window.open(sina_url);
    }
	
	
var tq_url1='http://share.v.t.qq.com/index.php?c=share&amp;a=index'+lian+'url=http%3A//www.gf.com.cn/'+lian+'title=%23'+hdtitle+'%23';
var tq_url2;
var tq_url3=bubian+lian+'appkey=dad361aadb9948278afc268bd5617307'+lian+'pic=http%3A//www.botuu.com/wb_zimg.jpg'+lian;	
var tq_url;

function tqshare1(){
	
	tq_url2=$('#wb1').val();
	tq_url2=encodeURI(tq_url2);
	tq_url=tq_url1+tq_url2+tq_url3;
	window.open(tq_url);
    }
	
function tqshare2(){
	tq_url2=$('#wb2').val();
	tq_url2=encodeURI(tq_url2);
	tq_url=tq_url1+tq_url2+tq_url3;
	window.open(tq_url);
    }
	
function tqshare3(){
	tq_url2=$('#wb3').val();
	tq_url2=encodeURI(tq_url2);
	tq_url=tq_url1+tq_url2+tq_url3;
	window.open(tq_url);
    }
	
function tqshare4(){
	tq_url2=$('#wb4').val();
	tq_url2=encodeURI(tq_url2);
	tq_url=tq_url1+tq_url2+tq_url3;
	window.open(tq_url);
    }		
	
	
	
$(document).ready(function(){ })
