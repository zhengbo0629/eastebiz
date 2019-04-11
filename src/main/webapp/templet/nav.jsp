
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <link rel="stylesheet" href="../static/lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="../static/css/main.css">
    <script type="text/javascript" src="../static/lib/jquery/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="../static/lib/bootstrap/js/bootstrap.js"></script>
</head>
<body>
    <header id="nav-header">
        <div id="section-nav">
            <nav class="navbar navbar-default navbar-fixed-top" role="navigation" style=" height:70px; background-color: #f4fff3">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <a href="#" class="navbar-brand" style="font-size:40px;">EastEbiz</a>
                    </div>
                    <div style="float: right; padding-top: 10px;">
                        <div style="font-size: 16px;">
                            <a href="userAccountSetting.jsp" style=""> 欢迎您！

                                zhengbo(Micro)

                            </a>,<a href="logout.jsp" style="">退出</a> | <a
                                href="userAccountSetting.jsp">账户设置</a> |




                            <a href="dnusermanual.jsp">用户手册</a>
                        </div>

                        <div id="datetime" style="font-size: 18px; color: black; padding-top: 3px;">
                            <!-- 方式一<script>
                                 setInterval("document.getElementById('datetime').innerHTML=new Date().toLocaleString();", 1000);
                             </script>-->

                            <script type="text/javascript">
                                window.onload=function(){
                                    setInterval(function(){
                                        var date=new Date();
                                        var year=date.getFullYear(); //获取当前年份
                                        var mon=date.getMonth()+1; //获取当前月份
                                        var da=date.getDate(); //获取当前日
                                        var day=date.getDay(); //获取当前星期几
                                        var h=date.getHours(); //获取小时
                                        var m=date.getMinutes(); //获取分钟
                                        var s=date.getSeconds(); //获取秒
                                        var d=document.getElementById('datetime');
                                        d.innerHTML='当前时间:'+year+'年'+mon+'月'+da+'日'+'星期'+day+' '+h+':'+m+':'+s;  },1000)  }
                            </script>
                        </div>

                        <!-- 原始<div style="font-size: 14px; color: #666666; padding-top: 3px;">

                            Pay Every Two Weeks: Next Payment Date: (M-D-Y) 03-15-2019

                        </div>-->
                    </div>
                    <div
                            style="width: 100%; height: 1px; background-color: #1e4a60; float: left">
                    </div>
                </div>
            </nav>
        </div>
    </header>
</body>
</html>
