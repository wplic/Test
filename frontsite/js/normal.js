﻿///////// JS theme file for PopCalendarXP 7.0 /////////
// This file is totally configurable. You may remove all the comments in this file to shrink the download size.
// Since the plugins are loaded after theme config, sometimes we would redefine(override) some theme options there for convenience.
////////////////////////////////////////////////////////

// ---- PopCalendar Specific Options ----
var gsSplit="-";	// (日期分割符) separator of date string, AT LEAST one char.
var giDatePos=2;	// date format sequence  0: D-M-Y ; 1: M-D-Y; 2: Y-M-D
var gbPadZero=true;	// whether to pad the digits with 0 in the left when less than 10.
var giMonthMode=0;	// month format 0: digits ; 1: full name from gMonths; >2: abbreviated month name in specified length.
var gbShortYear=false;   // year format   true: 2-digits; false: 4-digits
var gbAutoPos=true;	// enable auto-adpative positioning or not
var gbPopDown=true;	// true: pop the calendar below the dateCtrl; false: pop above if gbAutoPos is false.
var gbAutoClose=true;	// (是否单击日期后自动关闭) whether to close the calendar after selecting a date.
var gPosOffset=[0,0];	// Offsets used to adjust the pop-up postion, [leftOffset, topOffset].
var gbFixedPos=false;	// true: pop the calendar absolutely at gPosOffset; false: pop it relatively.

// ---- Common Options ----
//var gMonths=["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"];
//var gWeekDay=["Su","Mo","Tu","We","Th","Fr","Sa"];	// weekday caption from Sunday to Saturday
var gMonths=["一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月"];
var gWeekDay=["日","一","二","三","四","五","六"];	// weekday caption from Sunday to Saturday

var gBegin=[1900,1,1];	// (日历起始时间)calendar date range begin from [Year,Month,Date]. Using gToday here will make it start from today.
var gEnd=[2050,12,31];	// (日期终止时间)calendar date range end at [Year,Month,Date]
var gsOutOfRange="注意，你选择的日期超出了您刚设定的日期范围，请重新选择。";	// out-of-date-range error message. If set to "", no alerts will popup on such error.
var guOutOfRange=null;	// the background image url for the out-range dates. e.g. "outrange.gif"

var gbEuroCal=false;	// true: ISO-8601 calendar layout - Monday is the 1st day of week; false: US layout - Sunday is the 1st day of week.

var gcCalBG="#EFEFEF";	// the background color of the outer calendar panel.
var guCalBG=null;	//  the background image url for the inner table.
var gcCalFrame="#CDDDFF";	// the background color of the inner table, showing as a frame.
var gsInnerTable="border=0 cellpadding=2 cellspacing=1";	// HTML tag properties of the inner <table> tag, which holds all the calendar cells.
var gsOuterTable=NN4?"border=1 cellpadding=3 cellspacing=0":"border=0 cellpadding=1 cellspacing=2";	// HTML tag properties of the outmost container <table> tag, which holds the top, middle and bottom sections.

var gbHideTop=false;	// true: hide the top section; false: show it according to the following settings
var giDCStyle=0;	// the style of month-controls in top section.	0: use predefined html dropdowns & gsNavPrev/Next; 1: use gsCalTitle & gsNavPrev/Next; 2: use only gsCalTitle;
var gsCalTitle="gMonths[gCurMonth[1]-1]+' '+gCurMonth[0]";	// dynamic statement to be eval()'ed as the title when giDCStyle>0.
var gbDCSeq=false;	// (effective only when giDCStyle is 0) true: show month box before year box; false: vice-versa;
var gsYearInBox="i";	// dynamic statement to be eval()'ed as the text shown in the year box. e.g. "'A.D.'+i" will show "A.D.2001"
var gsNavPrev="<INPUT type='button' value='&lt;' class='MonthNav' onclick='fPrevMonth();this.blur();'>";	// the content of the left month navigator
var gsNavNext="<INPUT type='button' value='&gt;' class='MonthNav' onclick='fNextMonth();this.blur();'>";	// the content of the right month navigator

var gbHideBottom=false;	// true: hide the bottom section; false: show it with gsBottom.
var gsBottom="<table border='0' cellspacing='0' cellpadding='0' align='center'><tr><td><input class='Today' type='button' value='清除' onclick='gdCtrl.value=\"\";if(this.blur)this.blur();return false;'></td><td width=60 align=center><input class='Today' type='button' value='今日' onclick='if(this.blur)this.blur();if(!fSetDate(gToday[0],gToday[1],gToday[2]))alert(\"Today is not a selectable date!\");return false;'></td><td><input class='Today' type='button' value='关闭' onclick='fHideCal();return false;'></td></tr></table>";	// the content of the bottom section.

var giCellWidth=18;	// calendar cell width;
var giCellHeight=14;	// calendar cell height;
var giHeadHeight=14;	// calendar head row height;
var giWeekWidth=22;	// calendar week-number-column width;
var giHeadTop=1;	// calendar head row top offset;
var giWeekTop=0;	// calendar week-number-column top offset;

var gcCellBG="white";	// default background color of the cells. Use "" for transparent!!!
var gsCellHTML="";	// default HTML contents for days without any agenda, usually an image tag.
var guCellBGImg="";	// url of default background image for each calendar cell.
var gsAction=" ";	// default action to be eval()'ed on everyday except the days with agendas, which have their own actions defined in agendas.
var gsDays="dayNo";	// the dynamic statement to be eval()'ed into each day cell.

var giWeekCol=-1;	// -1: disable week-number-column;  0~7: show week numbers at the designated column.
var gsWeekHead="#";	// the text shown in the table head of week-number-column.
var gsWeeks="weekNo";	// the dynamic statement to be eval()'ed into the week-number-column. e.g. "'week '+weekNo" will show "week 1", "week 2" ...

var gcWorkday="black";	// Workday font color
var gcSat="red";	// Saturday font color
var gcSatBG="white";	// Saturday background color
var gcSun="red";	// Sunday font color
var gcSunBG="white";	// Sunday background color

var gcOtherDay="#ABABAB";	// the font color of days in other months; It's of no use when giShowOther is set to hide.
var gcOtherDayBG=gcCellBG;	// the background color of days in other months. when giShowOther set to hiding, it'll substitute the gcOtherDay.
var giShowOther=2;	// control the look of days in OTHER months. 1: show date & agendas effects; 2: show selected & today effects; 4: hide days in previous month; 8: hide days in next month; 16: when set with 4 and/or 8, the days will be visible but not selectable.  NOTE: values can be added up to create mixed effects.

var gbFocus=true;	// whether to enable the gcToggle highlight whenever mouse pointer focuses over a calendar cell.
var gcToggle="yellow";	// the highlight color for the focused cell

var gcFGToday="red";	// the font color for today 
var gcBGToday="white";	// the background color for today 
var guTodayBGImg="";	// url of image as today's background
var giMarkToday=1; // Effects for today - 0: nothing; 1: set background color with gcBGToday; 2: draw a box with gcBGToday; 4: bold the font; 8: set font color with gcFGToday; 16: set background image with guTodayBGImg; - they can be added up to create mixed effects.

var gcFGSelected="white";	// the font color for the selected date
var gcBGSelected="#CDCDFF";	// the background color for the selected date
var guSelectedBGImg="";	// url of image as background of the selected date
var giMarkSelected=2;	// Effects for selected date - 0: nothing; 1: set background color with gcBGSelected; 2: draw a box with gcBGSelected; 4: bold the font; 8: set font color with gcFGSelected; 16: set background image with guSelectedBGImg; - they can be added up to create mixed effects.

var gbBoldAgenda=true;	// whether to boldface the dates with agendas.
var gbInvertBold=false;	// true: invert the boldface effect set by gbBoldAgenda; false: no inverts.
var gbShrink2fit=true;	// whether to hide the week line if none of its day belongs to the current month.
var gdSelect=gToday;	// default selected date in format of [year, month, day]; [0,0,0] means no default date selected.
var giFreeDiv=0;	// The number of absolutely positioned layers you want to customize, they will be named as "freeDiv0", "freeDiv1"...
var gAgendaMask=[-1,-1,-1,null,null,-1,null];	// Set the relevant bit to -1 to keep the original agenda info of that bit unchanged, otherwise the new value will substitute the one defined in agenda.js.

var giResizeDelay=KO3?150:50;	// delay in milliseconds before resizing the calendar panel. Calendar may have incorrect initial size if this value is too small.
var gbFlatBorder=true;	// flat the .CalCell css border of any agenda date by setting it to solid style. NOTE: it should always be set to false if .CalCell has no explicit border size.
var gbInvertBorder=true;	// true: invert the effect caused by gbFlatBorder; false: no change.
var gbShareAgenda=false;	// if set to true, a global agenda store will be created and used to share across calendars. Check tutorials for details.

