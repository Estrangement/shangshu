﻿function homepageload() { Gettip3(); Gethomereadleft(); Gethomereadcenter(); Gethomereadright(); Getbooks6() } function Gettip3() { $.getJSON("../mpage/MPageSer.ashx?m=Gettip3", function(data, status) { if (data.length > 0) { for (var i = 0; i < data.length; i++) { var tipstr = ""; var hrefurl = "booksdetial.html"; var imagedir = "bookcov/tips/"; var reduri = "BookDetail.html"; if (data[i].SIid == "4" || data[i].SIid == "5") { hrefurl = "readinginfo.html"; imagedir = "Readpic/tips/"; reduri = "ReadDetail.html" } tipstr = "<img src='http://www.shangshu.com/images/" + imagedir + data[i].imageurl + "' alt='' style='width:100%;max-height:500px;'><div class='caption'><a href='" + hrefurl + "?Ad=" + data[0].Aid + "' target='_blank' style='color:#fff;'><h1>" + data[i].Atitle + "</h1></a><span >" + data[i].jianjie + "</span></div>"; $("#li" + i).html(tipstr) } } }) } function Gethomereadleft() { $.getJSON("../mpage/MPageSer.ashx?m=GethomeActBylitext&ts=1&li=阅读指导", function(data, status) { if (data.length > 0) { var strright = "<img src='http://www.shangshu.com/images/Readpic/Lpic/" + data[0].imageurl + "' style='width:500px' /><div class='item-content'><a href='readinginfo.html?Ad=" + data[0].Aid + "' target='_blank'  style='line-height:40px;font-weight:bold;font-size:25px;'>" + data[0].Atitle + "</a><div class='info'>" + data[0].Atime + " " + data[0].Author + "</div><p>" + data[0].jianjie + "</p></div>"; $("#divhomereadright").html(strright) } }) } function Gethomereadcenter() { $.getJSON("../mpage/MPageSer.ashx?m=GethomeActBylitext&ts=3&li=教育资讯", function(data, status) { if (data.length > 0) { var strcenter = ""; for (var i = 0; i < 3; i++) { strcenter += "<div class='row'><div class='item'><div class='item-content'><a href='readinginfo.html?Ad=" + data[i].Aid + "' target='_blank'  style='line-height:25px;font-weight:bold;font-size:20px;' >" + data[i].Atitle + "</a><div class='info'>" + data[i].Atime + " " + data[i].Author + "</div><p>" + data[i].jianjie + "</p></div></div></div>" } $("#divcenter").html(strcenter) } }) } function Gethomereadright() { $.getJSON("../mpage/MPageSer.ashx?m=GethomeActBylitext&ts=1&li=精选好文", function(data, status) { if (data.length > 0) { var strright = "<a href='readinginfo.html?Ad=" + data[0].Aid + "' target='_blank' style='line-height:40px;font-weight:bold;font-size:25px;'>" + data[0].Atitle + "</a>	<img src='http://www.shangshu.com/images/Readpic/Lpic/" + data[0].imageurl + "' style='width:380px;'/><p>" + data[0].jianjie + "</p>"; $("#divright").html(strright) } }) } function Getbooks6() { $.getJSON("../mpage/MPageSer.ashx?m=Getbooks6", function(data, status) { if (data.length > 0) { var books3 = "", books2 = ""; for (var i = 0; i < 3; i++) { books3 += "<div class='row'><div class='item'><div class='col-1-3'><div class='item-date-box'><div class='item-caption-inner'><div class='item-caption-inner1'>"; books3 += "<img src='http://www.shangshu.com/images/bookcov/Lpic/" + data[i].imageurl + "' alt='' style='height:190px;' /></div></div></div></div>"; books3 += "<div class='col-2-3'><div class='item-content'><a href='booksdetial.html?Ad=" + data[i].Aid + "' target='_blank'  style='line-height:25px;font-weight:bold;font-size:20px;' >" + data[i].Atitle + "</a><div class='info'>" + data[i].Atime + " | " + data[i].Author + "</div><p>" + data[i].jianjie + "</p></div></div><div class='clear'></div></div></div>" } $("#divhomebooks").html(books3); var jianjie3 = data[3].jianjie, jianjie4 = data[4].jianjie; if (jianjie3.length > 28) jianjie3 = jianjie3.substring(0, 30) + "..."; if (jianjie4.length > 28) jianjie4 = jianjie4.substring(0, 30) + "..."; books2 += "<div class='item'><img src='http://www.shangshu.com/images/bookcov/Lpic/" + data[3].imageurl + "' style='height:178px;' /><div class='item-content'><a href='booksdetial.html?Ad=" + data[3].Aid + "'><h3>" + data[3].Atitle + "</h3></a><p>" + jianjie3 + "</p></div></div>"; books2 += "<div class='item'><img src='http://www.shangshu.com/images/bookcov/Lpic/" + data[4].imageurl + "' style='height:178px;' /><div class='item-content'><a href='booksdetial.html?Ad=" + data[4].Aid + "'><h3>" + data[4].Atitle + "</h3></a><p>" + jianjie4 + "</p></div></div>"; $("#divbooks2").html(books2) } }) } function getread2018() { var tops = $("#setops").val(); var listext = $("#txtli").val(); var resdinfo = ""; $.getJSON("../mpage/MPageSer.ashx?m=getread2018&ts=" + tops + "&li=" + listext, function(data, status) { if (data.length > 0) { for (var i = 0; i < data.length; i++) { resdinfo += "<div class='div_m_l_list'><div class='div_m_l_img'><img src='http://www.shangshu.com/images/Readpic/Lpic/" + data[i].imageurl + "' alt=''  /></div><div class='div_m_l_nr'><p><a href='readinginfo.html?Ad=" + data[i].Aid + "' target='_blank' >" + data[i].Atitle + "</a></p><p>" + data[i].Atime + " | " + data[i].Author + "</p><p>" + data[i].jianjie + "</p></div></div>" } $("#divlist").html(resdinfo) } }) } function readingpageload() { $("#setops").val("15"); $("#txtli").val(""); getread2018(); getreadround5() } function Getreadmore() { var tops = $("#setops").val(); var setops = Number(tops) + 15; $("#setops").val(setops); getread2018() } function GETreadbylitext(litext) { $("#txtli").val(litext); $("#setops").val(15); getread2018() } function getreadround5() { $.getJSON("../mpage/MPageSer.ashx?m=getreadround5", function(data, status) { var listr = ""; if (data.length > 0) { for (var i = 0; i < data.length; i++) { listr += "<li><a href='readinginfo.html?Ad=" + data[i].Aid + "' target='_blank'>" + data[i].Atitle + "</a></li>" } $("#ul5tj").html(listr) } }) } function Getreaddetail() { var Aid = GetQueryString("Ad"); $.getJSON("../mpage/MPageSer.ashx?m=Getreadinfo&Aid=" + Aid, function(data, status) { if (data.length > 0) { $("#divtitle").html(data[0].Atitle); $("#divdateauthor").html(data[0].Atime + " | " + data[0].Author); $("#divcontent").html(data[0].AContents) } }) } function bookspageload() { getbooks2018(); getbooksround5() } function getbooks2018() { var tops = $("#setops").val(); var listext = $("#txtli").val(); var booksinfo = ""; $.getJSON("../mpage/MPageSer.ashx?m=getbook2018&ts=" + tops + "&li=" + listext, function(data, status) { if (data.length > 0) { for (var i = 0; i < data.length; i++) { var btitle = data[i].Atitle; if (btitle.length > 18) btitle = btitle.substring(0, 18) + "..."; booksinfo += " <div class='div_book'><a href='booksdetial.html?Ad=" + data[i].Aid + "' target='_blank'> <img src='http://www.shangshu.com/images/bookcov/Lpic/" + data[i].imageurl + "' /><p>" + btitle + "</p></a> </div>" } $("#divbookslist").html(booksinfo) } }) } function Getbooksmore() { var tops = $("#setops").val(); var setops = Number(tops) + 15; $("#setops").val(setops); getbooks2018() } function GETbooksbylitext(litext) { $("#txtli").val(litext); $("#setops").val(15); getbooks2018() } function getbooksround5() { $.getJSON("../mpage/MPageSer.ashx?m=getbooksround5", function(data, status) { var listr = ""; if (data.length > 0) { for (var i = 0; i < data.length; i++) { listr += "<li><a href='booksdetial.html?Ad=" + data[i].Aid + "' target='_blank'>" + data[i].Atitle + "</a></li>" } $("#ul5tj").html(listr) } }) } function Getbookdetail() { var Aid = GetQueryString("Ad"); $.getJSON("../mpage/MPageSer.ashx?m=Getreadinfo&Aid=" + Aid, function(data, status) { if (data.length > 0) { $("#divtitle").html(data[0].Atitle); $("#divdateauthor").html(data[0].Atime + " | " + data[0].Author); $("#divcontent").html(data[0].AContents); $("#spsm").html(data[0].sm); $("#spzz").html(data[0].tszz); $("#spisbn").html(data[0].tsisbn); $("#spcbs").html(data[0].tscbs); $("#spdj").html(data[0].tsjd); $("#spcbsj").html(data[0].tscbsj); $("#divgm").html(" <a href='" + data[0].tsbuyurl + "' target='_blank'>购买</a>"); $("#divimg").html(" <img src='http://www.shangshu.com/images/bookcov/Lpic/" + data[0].imageurl + "' alt='" + data[0].Atitle + "' />") } }) } function submitkhzx() { var d = $("#txtxm").val(); var c = $("#txttel").val(); if ($.trim(d).length == 0) { alert("请问怎么称呼!"); $("#txtxm").focus(); return } if ($.trim(c).length == 0) { alert("请问怎么联系您!"); $("#txttel").focus(); return } var e = "0"; var f = "申请试用云图书馆"; var a = $('input:radio[name="usertype"]:checked').val(); if (a == null) { alert('请选择您的身份'); return } $.get("../mpage/MPageSer.ashx?m=khzx&a=" + a + "&b=&c=" + c + "&d=" + d + "&e=" + e + "&f=" + f, function(data, status) { if (data == "1") { layer.closeAll(); showmsg("申请信息提交成功，我们会尽快与您联系!", "6") } }) } function GetQueryString(name) { var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); var r = window.location.search.substr(1).match(reg); if (r != null) return unescape(r[2]); return null } function showmsg(msginfo, iconcode) { layer.msg(msginfo, { icon: iconcode, time: 2000 }, function() { }) }