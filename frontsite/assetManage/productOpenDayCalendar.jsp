<%@ page contentType="text/html; charset=utf-8" language="java"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>万年历</title>
		<link type="text/css" rel="stylesheet" href="style.min.css" />
		<script type="text/javascript">
    var lichunDate = 0;
var lunarInfo = new Array(19416, 19168, 42352, 21717, 53856, 55632, 91476, 22176, 39632, 21970, 19168, 42422, 42192, 53840, 119381, 46400, 54944, 44450, 38320, 84343, 18800, 42160, 46261, 27216, 27968, 109396, 11104, 38256, 21234, 18800, 25958, 54432, 59984, 28309, 23248, 11104, 100067, 37600, 116951, 51536, 54432, 120998, 46416, 22176, 107956, 9680, 37584, 53938, 43344, 46423, 27808, 46416, 86869, 19872, 42416, 83315, 21168, 43432, 59728, 27296, 44710, 43856, 19296, 43748, 42352, 21088, 62051, 55632, 23383, 22176, 38608, 19925, 19152, 42192, 54484, 53840, 54616, 46400, 46752, 103846, 38320, 18864, 43380, 42160, 45690, 27216, 27968, 44870, 43872, 38256, 19189, 18800, 25776, 29859, 59984, 27480, 21952, 43872, 38613, 37600, 51552, 55636, 54432, 55888, 30034, 22176, 43959, 9680, 37584, 51893, 43344, 46240, 47780, 44368, 21977, 19360, 42416, 86390, 21168, 43312, 31060, 27296, 44368, 23378, 19296, 42726, 42208, 53856, 60005, 54576, 23200, 30371, 38608, 19415, 19152, 42192, 118966, 53840, 54560, 56645, 46496, 22224, 21938, 18864, 42359, 42160, 43600, 111189, 27936, 44448, 84835);
var yearInfo = [1901, 1902, 1903, 1904, 1905, 1906, 1907, 1908, 1909, 1910, 1911, 1912, 1913, 1914, 1915, 1916, 1917, 1918, 1919, 1920, 1921, 1922, 1923, 1924, 1925, 1926, 1927, 1928, 1929, 1930, 1931, 1932, 1933, 1934, 1935, 1936, 1937, 1938, 1939, 1940, 1941, 1942, 1943, 1944, 1945, 1946, 1947, 1948, 1949, 1950, 1951, 1952, 1953, 1954, 1955, 1956, 1957, 1958, 1959, 1960, 1961, 1962, 1963, 1964, 1965, 1966, 1967, 1968, 1969, 1970, 1971, 1972, 1973, 1974, 1975, 1976, 1977, 1978, 1979, 1980, 1981, 1982, 1983, 1984, 1985, 1986, 1987, 1988, 1989, 1990, 1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022, 2023, 2024, 2025, 2026, 2027, 2028, 2029, 2030, 2031, 2032, 2033, 2034, 2035, 2036, 2037, 2038, 2039, 2040, 2041, 2042, 2043, 2044, 2045, 2046, 2047, 2048, 2049];
var solarMonth = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
var Gan = new Array("甲", "乙", "丙", "丁", "戊", "己", "庚", "辛", "壬", "癸");
var Zhi = new Array("子", "丑", "寅", "卯", "辰", "巳", "午", "未", "申", "酉", "戌", "亥");
var Animals = new Array("鼠", "牛", "虎", "兔", "龙", "蛇", "马", "羊", "猴", "鸡", "狗", "猪");
var solarTerm = new Array("小寒", "大寒", "立春", "雨水", "惊蛰", "春分", "清明", "谷雨", "立夏", "小满", "芒种", "夏至", "小暑", "大暑", "立秋", "处暑", "白露", "秋分", "寒露", "霜降", "立冬", "小雪", "大雪", "冬至");
var sTermInfo = new Array(0, 21208, 42467, 63836, 85337, 107014, 128867, 150921, 173149, 195551, 218072, 240693, 263343, 285989, 308563, 331033, 353350, 375494, 397447, 419210, 440795, 462224, 483532, 504758);
var nStr1 = new Array("日", "一", "二", "三", "四", "五", "六", "七", "八", "九", "十");
var nStr2 = new Array("初", "十", "廿", "卅", "□");
var monthName = new Array("JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC");
var fFtv2012 = new Array("0101 *元旦", "0102 *", "0103 *","0105 _","0106 _", "0121 _", "0122 *", "0123 *", "0124 *", "0125 *", "0126 *", "0127 *", "0128 *", "0129 _", "0331 _", "0401 _", "0402 *", "0403 *", "0404 *", "0428 _", "0429 *", "0430 *", "0501 *劳动节", "0622 *", "0623 *", "0624 *", "0929 _", "0930 *", "1001 *国庆节", "1002 *", "1003 *", "1004 *", "1005 *", "1006 *", "1007 *");
var fFtv2013 = new Array("0101 *元旦", "0102 *", "0103 *","0105 _","0106 _","0204 立春","0218 雨水", "0209 *", "0210 *", "0211 *", "0212 *", "0213 *", "0214 *", "0215 *", "0216 _", "0217 _", "0404 *", "0405 *", "0406 *", "0407 _","0427 _", "0428 _", "0429 *", "0430 *", "0501 *劳动节", "0608 _", "0609 _", "0610 *","0611 *","0612 *", "0919 *", "0920 *","0921 *","0922 _","0929 _","1001 *国庆节", "1002 *", "1003 *", "1004 *", "1005 *", "1006 *", "1007 *","1012 _");

var AB = {0:"1月1日至3日放假3天，12月31日（星期六）上班。",1:"1月22日至1月28日放假7天，1月21日（星期六）、1月29日（星期日）上班。",
					3:"4月2日至4日放假3天，3月31日（星期六）、4月1日（星期日）上班。",4:"4月29日至5月1日放假3天，4月28日（星期六）上班。",
					5:"6月22日至6月24日放假3天，无调休。",8:"9月30日至10月7日放假8天，9月29日（星期六）上班。",
					9:"9月30日至10月7日放假8天，9月29日（星期六）上班。"};
					
var BC = {0:"1月1日至3日放假调休，共3天。1月5日(星期六)、1月6日(星期日)上班",1:"2月9日至2月15日放假7天，12月30日至1月1日放假3天，12月29日（星期六）上班。",
					3:"4月4日至6日放假3天，4月7日（星期日）上班。",4:"4月29日至5月1日放假3天，4月27日（星期六）、28日（星期日）照常上班",
					5:"6月10日至6月12日放假3天，6月8日（星期六）、6月9日（星期日）照常上班。",8:"9月19日至9月21日放假3天，9月22日（星期日）上班。",
					9:"10月1日至10月7日放假7天，9月28日（星期六）、9月29日（星期日）照常上班。"};

//节假日放假当天详细信息
var AB = {'2013-1-1':'2013-1-1','2013-2-9':'2013-2-9','2013-4-4':'2013-4-4','2013-5-1':'2013-5-1','2013-6-12':'2013-6-12','2013-9-19':'2013-9-19','2013-10-1':'2013-10-1'};
function lYearDays(c) {
    var a, b = 348;
    for (a = 32768; a > 8; a >>= 1) {
        b += (lunarInfo[c - 1900] & a) ? 1 : 0;
    }
    return (b + leapDays(c));
}
function leapDays(a) {
    if (leapMonth(a)) {
        return ((lunarInfo[a - 1900] & 65536) ? 30 : 29);
    } else {
        return (0);
    }
} 
function leapMonth(a) {
    return (lunarInfo[a - 1900] & 15);
}
function monthDays(b, a) {
    return ((lunarInfo[b - 1900] & (65536 >> a)) ? 30 : 29);
}
function Lunar(d) {
    var c, b = 0,
    a = 0;
    var e = (Date.UTC(d.getFullYear(), d.getMonth(), d.getDate()) - Date.UTC(1900, 0, 31)) / 86400000;
    for (c = 1900; c < 2050 && e > 0; c++) {
        a = lYearDays(c);
        e -= a;
    }
    if (e < 0) {
        e += a;
        c--;
    }
    this.year = c;
    b = leapMonth(c);
    this.isLeap = false;
    for (c = 1; c < 13 && e > 0; c++) {
        if (b > 0 && c == (b + 1) && this.isLeap == false) {--c;
            this.isLeap = true;
            a = leapDays(this.year);
        } else {
            a = monthDays(this.year, c);
        }
        if (this.isLeap == true && c == (b + 1)) {
            this.isLeap = false;
        }
        e -= a;
    }
    if (e == 0 && b > 0 && c == b + 1) {
        if (this.isLeap) {
            this.isLeap = false;
        } else {
            this.isLeap = true; --c;
        }
    }
    if (e < 0) {
        e += a; --c;
    }
    this.month = c;
    this.day = e + 1;
}
function solarDays(b, a) {
    if (a == 1) {
        return (((b % 4 == 0) && (b % 100 != 0) || (b % 400 == 0)) ? 29 : 28);
    } else {
        return (solarMonth[a]);
    }
}
function cyclical(a) {
    return (Gan[a % 10] + Zhi[a % 12]);
}
function calElement(a, g, j, b, f, d, e, h, c, i, k) {
    this.isToday = false;
    this.sYear = a;
    this.sMonth = g;
    this.sDay = j;
    this.week = b;
    this.lYear = f;
    this.lMonth = d;
    this.lDay = e;
    this.isLeap = h;
    this.cYear = c;
    this.cMonth = i;
    this.cDay = k;
    this.color = "";
    this.className = "";
    this.lunarFestival = "";
    this.solarFestival = "";
    this.solarTerms = "";
}
function sTerm(c, b) {
    var a = new Date((31556925974.7 * (c - 1900) + sTermInfo[b] * 60000) + Date.UTC(1900, 0, 6, 2, 5));
    return (a.getUTCDate());
}
function calendar(j, t, h) {
    var B, l, A, b, g = 1,
    e, C = 0,
    s, p, o;
    var z, a, f;
    var d = new Array(3);
    var r = 0;
    var c = 0;
    B = new Date(j, t, 1, 0, 0, 0, 0);
    this.length = solarDays(j, t);
    this.firstWeek = B.getDay();
    if (t < 2) {
        z = cyclical(j - 1900 + 36 - 1);
    } else {
        z = cyclical(j - 1900 + 36);
    }
    var v = sTerm(j, 2);
    lichunDate = v;
    var u = sTerm(j, t * 2);
    a = cyclical((j - 1900) * 12 + t + 12);
    var q = Date.UTC(j, t, 1, 0, 0, 0, 0) / 86400000 + 25567 + 10;
    for (var w = 0; w < this.length; w++) {
        if (g > C) {
            B = new Date(j, t, w + 1);
            l = new Lunar(B);
            A = l.year;
            b = l.month;
            g = l.day;
            e = l.isLeap;
            C = e ? leapDays(A) : monthDays(A, b);
            if (r == 0) {
                c = b;
            }
            d[r++] = w - g + 1;
        }
        if (t == 1 && (w + 1) == v) {
            z = cyclical(j - 1900 + 36);
        }
        if ((w + 1) == u) {
            a = cyclical((j - 1900) * 12 + t + 13);
        }
        
        f = cyclical(q + w);
        //alert(f)
        this[w] = new calElement(j, t + 1, w + 1, nStr1[(w + this.firstWeek) % 7], A, b, g++, e, z, a, f);
    }
    s = sTerm(j, t * 2) - 1;
    p = sTerm(j, t * 2 + 1) - 1;
    var k = Number(document.getElementById("current-data").innerHTML);
    if (j == tY && t == tM) {
		try{
			 this[tD - 1].isToday = true;
		}catch(ex){}
       
    }
}
function easter(g) {
    var b = sTerm(g, 5);
    var d = new Date(Date.UTC(g, 2, b, 0, 0, 0, 0));
    var a = new Lunar(d);
    if (a.day < 15) {
        var f = 15 - a.day;
    } else {
        var f = (a.isLeap ? leapDays(g) : monthDays(g, a.month)) - a.day + 15;
    }
    var e = new Date(d.getTime() + 86400000 * f);
    var c = new Date(e.getTime() + 86400000 * (7 - e.getUTCDay()));
    this.m = c.getUTCMonth();
    this.d = c.getUTCDate();
}
function cDay(b) {
    var a;
    switch (b) {
    case 10:
        a = "初十";
        break;
    case 20:
        a = "二十";
        break;
        break;
    case 30:
        a = "三十";
        break;
        break;
    default:
        a = nStr2[Math.floor(b / 10)];
        a += nStr1[b % 10];
    }
    return (a);
}
var cld;
//根据年月显示该年月日历
function drawCld(d, m,mm,yy) {
    var f, a, o, n, w, p, l, g;
    if (m != 0) {
        l = new calendar(d, m - 1);
    } else {
        l = new calendar(d - 1, 11);
    }
    if (m != 11) {
        g = new calendar(d, m + 1);
    } else {
        g = new calendar(d + 1, 0);
    }
   	
    cld = new calendar(d, m);
    if (d > 1874 && d < 1909) {
        yDisplay = "光绪" + (((d - 1874) == 1) ? "元": d - 1874);
    }
    if (d > 1908 && d < 1912) {
        yDisplay = "宣统" + (((d - 1908) == 1) ? "元": d - 1908);
    }
    //判断是什么生肖Animals[(d - 4)为下一年cyclical(d - 1900 + 36)下一年
    var b = $("#current-data-month").text();
    if ((cld.length + cld.firstWeek) > 35) {
        document.getElementById("lastLine").style.display = "";
    } else {
        document.getElementById("lastLine").style.display = "none";
    }

    for (f = 0; f < 42; f++) {
        sObj = document.getElementById("SD" + f);
        lObj = document.getElementById("LD" + f);
        gObj = document.getElementById("GD" + f);
        sObj.className = "";
        gObj.className = "";
        a = f - cld.firstWeek;
        if (f < cld.firstWeek) {
            var j = Number(l.length) - Number(cld.firstWeek) + f;
            if (l[j] && l[j].className) {
                if (l[j].className.indexOf("holidays") != -1) {
                    lObj.parentNode.className += "holidays";
                } else {
                    if (l[j].className.indexOf("works") != -1) {
                        lObj.parentNode.className += "works2";
                    }
                }
            }
            lObj.parentNode.innerHTML = "<div><strong id='SD" + f + "' class='grad' rel='up'>" + (j + 1) + "</strong></div><span id='LD" + f + "'><font color='#DBC48D'></font></span>";
        }
        if (f > (cld.firstWeek + cld.length - 1)) {
            if (cld.firstWeek + cld.length < 36 && f < 35) {
                var j = f - (cld.firstWeek + cld.length - 1);
                if (g[j - 1] && g[j - 1].className) {
                    if (g[j - 1].className.indexOf("holidays") != -1) {
                        lObj.parentNode.className += "holidays2";
                    } else {
                        if (g[j - 1].className.indexOf("works") != -1) {
                            lObj.parentNode.className += "works2";
                        }
                    }
                }
                lObj.parentNode.innerHTML = "<div><strong id='SD" + f + "' class='grad' rel='down'>" + j + "</strong></div><span id='LD" + f + "'><font color='#DBC48D'></font></span>";
            }
            if (cld.firstWeek + cld.length > 35) {
                var j = f - (cld.firstWeek + cld.length - 1);
                if (g[j - 1] && g[j - 1].className) {
                    if (g[j - 1].className.indexOf("holidays") != -1) {
                        lObj.parentNode.className += "holidays2";
                    } else {
                        if (g[j - 1].className.indexOf("works") != -1) {
                            lObj.parentNode.className += "works2";
                        }
                    }
                }
                lObj.parentNode.innerHTML = "<div><strong id='SD" + f + "' class='grad' rel='down'>" + j + "</strong></div><span id='LD" + f + "'><font color='#DBC48D'></font></span>";
            }
        }

        if (a > -1 && a < cld.length) {
        		
        		o = cld[a].lunarFestival;
        		n = cld[a].solarFestival;
        		w = cld[a].solarTerms;
            sObj.innerHTML = a + 1;
            //广发证券Start 产品开放日 核心维护代码
            //李伟鹏 2013-01-20
             if (sObj.className!="grad") {
		       //比较产品开放日期
		       //遍历开放日日期数组
		       for(var k=0;k<dates.length;k++){
		       	var dd = dates[k];
		       	//alert(dd);
	       		if((a + 1)==dd){
	       		  //ssssssssssssssalert(dd);
	       		  sObj.parentNode.parentNode.className="today";
	       		  break;
	       		}
		       }
		    }
		    //广发证券End
            var aa = cld[a].sYear+"-"+cld[a].sMonth+"-"+cld[a].sDay;
            
            if (cld[a].isToday) {
	            	if(m == mm){
	            		//当天
	            		//sObj.parentNode.parentNode.className += "now";
	            	}
                
                to_day.id = f;
                to_day.jin = cld[a].sYear + "-" + cld[a].sMonth + "-" + cld[a].sDay;
                to_day.N_Date = cld[a].lYear + "-" + cld[a].lMonth + "-" + cld[a].lDay;
                to_day.click_Date = cld[a].sMonth + "_" + cld[a].sDay;
                var h;
                if (cld[a].solarTerms == "" && cld[a].solarFestival == "" && cld[a].lunarFestival == "") {
                    h = "";
                } else {
                    h = '<div class="festival">' + cld[a].solarTerms + " " + cld[a].solarFestival + " " + cld[a].lunarFestival + "</div>";
                }
                var c = "";
                if (h != "") {
                    document.getElementById("info_letter").innerHTML = h;
                } else {
                    document.getElementById("info_letter").innerHTML = "";
                }
            } else {
                sObj.style.color = cld[a].color;
                sObj.parentNode.parentNode.className += cld[a].className;
            }
            if (cld[a].lDay == 1) {
                //lObj.innerHTML = "<b>" + (cld[a].isLeap ? "": "") + cld[a].lMonth + "月" + (monthDays(cld[a].lYear, cld[a].lMonth) == 29 ? "小": "大") + "</b>";
            } else {
            	//去除农历显示
                //lObj.innerHTML = cDay(cld[a].lDay);
            }
            if(aa == AB[aa]){
            	tD= cld[a].sDay;
            		var h;
                if (cld[a].solarTerms == "" && cld[a].solarFestival == "" && cld[a].lunarFestival == "") {
                    h = "";
                } else {
                    h = '<div class="festival">' + cld[a].solarTerms + " " + cld[a].solarFestival + " " + cld[a].lunarFestival + "</div>";
                }
                var c = "";
                if (h != "") {
                    document.getElementById("info_letter").innerHTML = h;
                } else {
                    document.getElementById("info_letter").innerHTML = "";
                }
                //sObj.parentNode.parentNode.className += " today";
            }
        		
            if (o.length > 0) {
                if (o.length > 6) {
                    o = o.substr(0, 4) + "...";
                }
                o = o.fontcolor("red");
            } else {
                if (n == "国庆节") {
                    if (parseInt(cld[a].sYear) > 1948) {
                        o = cld[a].solarFestival;
                    }
                } else {
                    o = cld[a].solarFestival;
                }
                if (o.length > 0) {
                    p = (o.charCodeAt(0) > 0 && o.charCodeAt(0) < 128) ? 8 : 4;
                    if (o.length > p + 2) {
                        o = o.substr(0, p) + "...";
                    }
                } else {
                    o = cld[a].solarTerms;
                }
                
            }
            if (o.length > 0) {
                lObj.innerHTML = o;
            }
        } else {
            sObj.innerHTML = "";
            lObj.innerHTML = "";
        }
    }
	//alert('end');
}
//年月下拉框值发生变化，日历随动函数
function changeCld(aaa) {
		if(aaa !=undefined){
			yy = aaa;	
		}
		// alert(7);
		
	// alert(sely+" "+selm);
	if((selm+"").substring(0,1)=='0'){
		selm = (selm+"").substring(1,2);
	}
	// alert(sely+" "+selm);
    drawCld(sely, parseInt(selm)-1,mm,yy);
}

//根据产品id 初始化年份下拉框，默认选择第一个 （产品列表下拉框调用）
function getOpenDayToSel(){
	var code = $('.productSel').val();//获取产品编号
	if(code=="")
		return;
    jQuery.post(
         "${contextPath }/assetManager/Calendar/web/ProductOpenDayAction.go?function=getOpenDayToSel",
         { product_code: code },
          function (data, state) {
             var data = eval("(" + data + ")");
             var json_data = data.data.date;
             var js = $.parseJSON(json_data); 
             var list_year='',year='';
             var years = new Array();
             for(var i=0;i<js.length;i++){
             		var openDate = "" + js[i].open_day;
             		year = openDate.substring(0,4);
             		years[i] = year;
             }
             years = uniq(years); //去掉数组中的重复年份
             var sel = document.getElementById('selectYear');
             sel.options.length = 0;
             for(var k=0;k<years.length;k++){
             	 sel.options.add(new Option(years[k],years[k]));
             }
             initMonthSelect();
     }); 
}

//根据产品id和用户选择的年份初始化月份下拉框 （年份下拉框调用）
function initMonthSelect(){
	//alert(4);
	var code = $('.productSel').val();//产品code
	//alert(code);
	var year = document.getElementById('selectYear').value;//选择的年份
	$.ajax({
           url: "${contextPath }/assetManager/Calendar/web/ProductOpenDayAction.go?function=getOpenMonthToSel",
           type: "post",
           data: "product_code=" + code +"&year="+year,
           cache: false,
           success: function(data) {
               try {
                  var data = eval("(" + data + ")");
                  var json_data = data.data.date;
                  var js = $.parseJSON(json_data); 
                  var list_month='';
                  var months = new Array();
                  for(var i=0;i<js.length;i++){
                  		var openDate = "" + js[i].open_day;
                  	     months[i] = openDate.substring(4,6);
                  }
                  months = uniq(months);//去掉重复月份
                  var sel = document.getElementById('selectMonth');
                  //清除下拉列表内容
				  sel.options.length = 0;
                   for(var k=0;k<months.length;k++){
                     sel.options.add(new Option(months[k],months[k]));
                   }
                  	document.getElementById('selectMonth').selectIndex = 0;
                  	selectCurrentDate();
               } catch(ex) {
               }
           }
       });
}
//月份下拉框调用
function selectCurrentDate(){
	dates=[];
	var code = $('.productSel').val();//获取产品编号
	//获取用户选择的日期
	sely = document.getElementById('selectYear').value;
	selm = document.getElementById('selectMonth').value;
	selDay(code);
}
//根据年月变化获取准备的开放日信息并在日历中选中该天
function selDay(code){
	//alert('in');
	$.ajax({
           url: "${contextPath }/assetManager/Calendar/web/ProductOpenDayAction.go?function=getProOpenDayByCode",
           type: "post",
           data: "product_code=" + code+ "&current_month_date="+sely+""+selm,
           cache: false,
           success: function(data) {
               try {
                   var data = eval("(" + data + ")");
                   var openDate = data.data.date;
                   var js = $.parseJSON(openDate); 
                   //alert(js.length);
                   for(var i=0;i<js.length;i++){
                  		var openDate = "" + js[i].open_day;
                        //获取日期
                        if(openDate!=""){
                            var d_ = openDate.substring(6,8);
                            if(d_.substring(0,1)=='0'){
								d_ = d_.substring(1,2);
							}
                        	dates[i] = d_;
                        }
                        //alert(dates[i]);
                  }
                 // alert(dates);
                  changeCld();
               } catch(ex) {
               }
           }
       });
}



var openDay = 100;//产品开放日初始值为100
var sely=0,selm=0;
var dates= new Array();
var Today = new Date();
var tY = Today.getFullYear();
var tM = Today.getMonth();
var tD = Today.getDate();
var mm ,yy;
var width = "200";
var offsetx = 2;
var offsety = 8;
var x = 0;
var y = 0;
var snow = 0;
var sw = 0;
var cnt = 0;
var to_day = {
    id: null,
    N_Date: "",
    ip: "",
    Y_Date: "",
    click_Date: "",
    jin: null
};
function pushBtm(b, h) {
	
    switch (b) {
    case "MU":
        if (Number(document.getElementById("current-data-month").innerHTML) > 1) {
            document.getElementById("current-data-month").innerHTML = Number(document.getElementById("current-data-month").innerHTML) - 1;
        } else {
            document.getElementById("current-data-month").innerHTML = 12;
            if (document.getElementById("current-data").innerHTML - 1901 > 0) {
                document.getElementById("current-data").innerHTML = Number(document.getElementById("current-data").innerHTML) - 1;
            }
        }
        break;
    case "MD":
        if (document.getElementById("current-data-month").innerHTML < 12) {
            document.getElementById("current-data-month").innerHTML = Number(document.getElementById("current-data-month").innerHTML) + 1;
        } else {
            document.getElementById("current-data-month").innerHTML = 1;
            if (document.getElementById("current-data").innerHTML - 1900 < 149) {
                document.getElementById("current-data").innerHTML = Number(document.getElementById("current-data").innerHTML) + 1;
            }
        }
        break;
    case "JT":
    	var t ,m;
    	t = Today.getFullYear();
    	m = parseInt(Today.getMonth()) + 1;
        document.getElementById("current-data").innerHTML = t;
        document.getElementById("current-data-month").innerHTML = m;
        break;
    default:
        document.getElementById("current-data").innerHTML = tY;
        document.getElementById("current-data-month").innerHTML = parseInt(tM) + 1;
        try {
            var c = to_day.jin.split("-"),
            g = c[0],
            a = c[1],
            f = c[2];
        } catch(e) {}
    }
    changeCld();
}

function initial() {
	dStyle = document.getElementById("detail").style;
var ttt = new Date();
mm = ttt.getMonth();

	var s_param = getQueryStr("s_param");
    if(s_param != ''){
    	yy = parseInt(s_param);
    		tM=parseInt(s_param);
    	if(tY==2012){
    		//tM = (parseInt(s_param)==1?0:parseInt(s_param));
    		
    		$('#p-a').show().html(AB[parseInt(s_param)]);
    	}else if(tY==2013){
    		
    		$('#p-a').show().html(BC[parseInt(s_param)]);
    	}
    	tY = tY;
    }
    sely = Today.getFullYear();
	selm = Today.getMonth()+1;
	//alert(sely+"  "+selm);
    //alert(tY+"  "+tM+"   "+mm+"   "+yy);
    //drawCld(tY, tM,mm,yy);
    //获取产品开放日期信息加载到下拉框
	getOpenDayToSel();
	//getOpenInfo();
}

//////////////////////////////////////////////////////////////////////////////
document.onmousemove = mEvn;
var width2 = "100";
var offsetx2 = 2;
var offsety2 = 8;

var x2 = 0;
var y2 = 0;
var snow2 = 0;
var sw2 = 0;
var cnt2 = 0;

var dStyle;


//显示详细日期资料
function mOvr(v) {
var s;
var sObj2=document.getElementById("SD" + v);
var d=parseInt($("#GD" + v).find("strong").text())-1;
var tttt = sObj2.parentNode.parentNode.className;
if(sObj2.innerHTML!='') {
	
	if(tttt==''){
			s= '<TABLE WIDTH="100" BORDER=0 CELLPADDING="2" CELLSPACING=0 BGCOLOR="#000066" style="filter:Alpha(opacity=80)"><TR><TD>' +
		'<TABLE WIDTH=100% BORDER=0 CELLPADDING=0 CELLSPACING=0><TR><TD ALIGN="right"><FONT COLOR="#ffffff" STYLE="font-size:9pt;">'+
		cld[d].sYear+'年'+cld[d].sMonth+'月'+cld[d].sDay+'日<br>星期'+cld[d].week+'<br>'+
		'<font color="violet">农历'+(cld[d].isLeap?'闰 ':' ')+cld[d].lMonth+' 月 '+cld[d].lDay+' 日</font>'+'</TD></TR></TABLE></TD></TR></TABLE>';
	}else{
		s= '<TABLE WIDTH="100" BORDER=0 CELLPADDING="2" CELLSPACING=0 BGCOLOR="#000066" style="filter:Alpha(opacity=80)"><TR><TD>' +
		'<TABLE WIDTH=100% BORDER=0 CELLPADDING=0 CELLSPACING=0><TR><TD ALIGN="right"><font color="violet" style="font-weight: bold">开放日</font><br><FONT COLOR="#ffffff" STYLE="font-size:9pt;">'+
		cld[d].sYear+'年'+cld[d].sMonth+'月'+cld[d].sDay+'日<br>星期'+cld[d].week+'<br>'+
		'<font color="violet">农历'+(cld[d].isLeap?'闰 ':' ')+cld[d].lMonth+' 月 '+cld[d].lDay+' 日</font>'+'</TD></TR></TABLE></TD></TR></TABLE>';
	}
	
	
	//document.getElementById("detail").innerHTML = s;
	$("#detail").html(s);
	if (snow2 == 0) {
	document.getElementById('detail').style.left = x2+offsetx2-(width2/2);
	document.getElementById('detail').style.top = y2+offsety2;
	document.getElementById('detail').style.visibility = "visible";
	snow2 = 1;
	}
}
}

//清除详细日期资料
function mOut() {
	if ( cnt2 >= 1 ) { sw2 = 0; }
	  if ( sw2 == 0 ) { snow2 = 0; document.getElementById('detail').style.visibility = "hidden";}
	else cnt2++;
}

//取得位置
function mEvn() {
	x2=event.x;
	y2=event.y;
	if (document.body.scrollLeft)
	{x2=event.x+document.body.scrollLeft; y2=event.y+document.body.scrollTop;}
	if (snow2){
	document.getElementById('detail').style.left = x2+offsetx2-(width2/2);
	document.getElementById('detail').style.top = y2+offsety2;
	}
}


 
///////////////////////////////////////////////////////////////////////////

function getQueryStr(str){
    var LocString=String(window.document.location.href);
    var rs = new RegExp("(^|)"+str+"=([^\&]*)(\&|$)","gi").exec(LocString), tmp;
    if(tmp=rs){
        return tmp[2];
    }
    return "";
}</script>
	</head>
	<body onload="initial()">
		<script language="javascript">
lck = 0;
function r(hval) {
    if(lck == 0) {
        document.body.style.background = hval;
    }
}
</script>
<DIV style="POSITION: absolute;z-index:6" id='detail'></DIV>
		<form name="CLD" id="CLD">
					<div id="recordTips"></div>
					<div>选择理财产品：
							<select onchange="getOpenDayToSel()" class="productSel">
								<option value="">
									--请选择--
								</option>
								<option value="870010">
									年年盈
								</option>
								<option value="870007">
									弘利债券
								</option>
								<option value="870008">
									量化避险
								</option>
								<option value="878001">
									多空母份额
								</option>
							    <option value="871003">
									广发理财3号
								</option>
								<option value="870004">
									广发理财4号
								</option>
								<option value="870005">
									广发理财5号
								</option>
								<option value="870006">
									广发理财6号
								</option>
								<option value="872001">
									广发策略1号
								</option>
								<option value="872002">
									广发策略2号
								</option>
								<option value="870013">
									睿利分级1号优先级
								</option>
							</select><div>
							<div>
								公&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;历：
								<select onchange="initMonthSelect();" name="SY" id="selectYear">
								</select>
								年
								<select onchange="selectCurrentDate();" name="SM" id="selectMonth">
								</select>
								月
							</div>
					<div class="select-data" style="display: none;">
								<ul>
									<li class="year-data">
										<div class="current-data" id="current-data" onclick=""></div>
										<div class="select-wrap" id="select-year-option">
											<ul class="select-year" id="select-year"></ul>
										</div>
									</li>
									<li class="month-data" id="month-data">
										<div class="current-data" id="current-data-month" onclick=""></div>
										<div class="select-wrap" id="select-month-option">
											<ul class="select-year" id="select-month">
												<li>1</li>
			                                    <li>2</li>
			                                    <li>3</li>
			                                    <li>4</li>
			                                    <li>5</li>
			                                    <li>6</li>
			                                    <li>7</li>
			                                    <li>8</li>
			                                    <li>9</li>
			                                    <li>10</li>
			                                    <li>11</li>
			                                    <li>12</li>
											</ul>
										</div>
									</li>
								</ul>
							</div>
						<div class="content-c">
							<div class="content-tb" style="" id="date_show">
								<table border="0" cellspacing="0" cellpadding="0"
									class="calendar">
									<tbody>
										<script language="javascript">
                            var gNum;
                            for(i=0;i<6;i++) {
                                if(i==5){
                                    document.write('<tr id="lastLine">')
                                }else{
                                    document.write('<tr>')
                                }
                               for(j=0;j<7;j++) {
                                  gNum = i*7+j
                                  document.write('<td id="GD' + gNum +'" onMouseOver="mOvr(' + gNum +')" onMouseOut="mOut()"><div ')
                  				  if(j == 0){
                                    document.write('  class="red"><strong id="SD' + gNum +'"  > </strong></div><span id="LD' + gNum + '" class="red"> </span></td>')
                                  }else if(j == 6){
                                    document.write(' class="red"><strong id="SD' + gNum +'" > </strong></div><span id="LD' + gNum + '" class="red"> </span></td>')
                                  }else{
                                    document.write('><strong id="SD' + gNum +'"  > </strong></div><span id="LD' + gNum + '"> </span></td>')
                                  }
                               }
                               document.write('</tr>')
                            }
                        </script>
									</tbody>
								</table>
							</div>

						</div>
						<div class="subar" style="display: none; width: 0px;">
							<div class="sub-icon">
								<div class="icon">
									<span class="gday" id="info_all">加载中...</span>
									<span class="tday" id="info_today"></span>
									<span class="nday" id="info_nong"></span>
									<span class="ganzhi" id="info_chang"></span>
									<span class="jieri" id="info_letter"></span>
								</div>
							</div>
							<div class="yiji clear">
								<div class="yi" id="yi">
									<span>产品开放日公示</span>
								</div>
							</div>
						</div>
		</form>
		<script src="scripts/jquery-1.4.2.min.js" type='text/javascript'></script>
		<script type="text/javascript" src="scripts/oper.min.js"></script>
	</body>
</html>