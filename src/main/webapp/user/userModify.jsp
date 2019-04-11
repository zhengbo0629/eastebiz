<%@ page import="com.eastebiz.entity.EbizUser" %>
<%@ page import="com.eastebiz.entity.EbizCompany" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <link rel="stylesheet" href="../static/lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="../static/css/main.css">
    <script type="text/javascript" src="../static/lib/jquery/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="../static/lib/bootstrap/js/bootstrap.js"></script>

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
                d.innerHTML='当前时间:'+year+'年'+mon+'月'+da+'日'+'星期'+day+' '+h+':'+m+':'+s;  },1000)
        }


        /*两次密码*/
        $(function () {
            $("#EbizUser-confirmPassword").blur(function () {
                var password = $("#EbizUser-password").val();
                var confirmPassword = $("#EbizUser-confirmPassword").val();
                if(password!=confirmPassword){
                    $("#ConfirmPassword-span").text("两次密码不一致！");
                    $("#EbizUser-confirmPassword").val("");
                }else {
                    $("#ConfirmPassword-span").text("");
                }
            });
        });

    </script>


</head>
<body>
<%
    EbizUser ebizUserbizUser = (EbizUser) session.getAttribute("EbizUser");
    EbizCompany ebizCompany = (EbizCompany) session.getAttribute("EbizCompany");
    if (ebizUserbizUser != null || ebizCompany!= null) {
    }else{
        response.sendRedirect(request.getContextPath()+"/homepage/homepage.jsp");
        return;
    }

%>


<!-- 顶部 -->
<header id="header-main">
    <div class="main-topbar">
        <div class="container">
            <div class="row">
                <div class="col-md-2 "><a class="mobile-link" href="${pageContext.request.contextPath}/DropOut/dropOut"><h1 class="eastebiz">EastEbiz</h1></a></div>
                <div class="col-md-4"></div>
                <div class="col-md-6 text-right">
                    <span>
                        <div style="float: right; padding-top: 10px;">
                        <div style="font-size: 12px;">
                             <a class="mobile-link" href="userAccountSetting.jsp" style=""> 欢迎您！
                                ${sessionScope.EbizUser.userName},${sessionScope.EbizCompany.companyName}
                             </a>,
                            <a class="mobile-link" href="${pageContext.request.contextPath}/DropOut/dropOut" style="">退出</a> |
                            <a class="mobile-link" href="userAccountSetting.jsp">账户设置</a> |
                            <a class="mobile-link" href="dnusermanual.jsp">用户手册</a>
            </div>

            <div id="datetime" style="font-size: 12px; color: black; padding-top: 3px;">
                <!-- 方式一<script>
                     setInterval("document.getElementById('datetime').innerHTML=new Date().toLocaleString();", 1000);
                 </script>-->
            </div>
                            <!-- 原始<div style="font-size: 14px; color: #666666; padding-top: 3px;">
                                        Pay Every Two Weeks: Next Payment Date: (M-D-Y) 03-15-2019

                            </div>-->
        </div>

                    </span>
                </div>
            </div>
        </div>
    </div>
</header>
<!-- 空隙 -->
<section class="section"></section>
<!-- 空隙 -->
<section class="section"></section>
<!-- 黑字 -->
<section id="section-font">
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6 text-center"><h2 class="Welcome">用户修改</h2></div>
        <div class="col-md-3"></div>
    </div>
</section>

<!-- 空隙 -->
<section class="section"></section>
<!-- 空隙 -->
<section class="section"></section>
<!-- 空隙 -->
<section class="section"></section>

<!-- 修改表单 -->

<section id="section-modifyEbizUser">
    <form id="modifyEbizUserForm"   action="${pageContext.request.contextPath}/EbizUser/modifyEbizUser" method="post" >

        <%--  id --%>

        <div class="form-group">
            <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-1"></div>
                <div class="col-md-4">
                    <input type="text" class="form-control"  id="EbizUser-id" name="id" hidden readonly placeholder="id" value="${sessionScope.EbizUser.id}" >

                </div>
                <div class="col-md-3"></div>
            </div>
        </div>
        <!--userName --->

        <div class="form-group">
            <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-1"><span>UserName:</span></div>
                <div class="col-md-4">
                    <input type="text" class="form-control"   readonly name="userName" placeholder="username"value="${sessionScope.EbizUser.userName}">
                </div>
                <div class="col-md-3"></div>
            </div>
        </div>

        <!-- firstName --->

        <div class="form-group">
            <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-1"><span>FirstName:</span></div>
                <div class="col-md-4">
                    <input type="text" class="form-control" name="firstName" readonly  value="${sessionScope.EbizUser.firstName}" >
                </div>
                <div class="col-md-3"></div>
            </div>
        </div>

        <!-- lastName --->

        <div class="form-group">
            <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-1"><span>LastName:</span></div>
                <div class="col-md-4">
                    <input type="text" class="form-control" name="lastName" readonly   value="${sessionScope.EbizUser.lastName}" >
                </div>
                <div class="col-md-3"></div>
            </div>
        </div>

        <!-- password --->

        <div class="form-group">
            <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-1"><span>Password:</span></div>
                <div class="col-md-4">
                    <input type="password" class="form-control" name="password"  id="EbizUser-password" placeholder="Password" autofocus required>
                </div>
                <div class="col-md-3"></div>
            </div>
        </div>

        <!-- confirmPassword --->

        <div class="form-group">
            <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-1"><span>ConfirmPassword:</span></div>
                <div class="col-md-4">
                    <input type="password" class="form-control"  id="EbizUser-confirmPassword" placeholder="ConfirmPassword" autofocus required>
                </div>
                <div class="col-md-1"><font color="#ff3b25"><span id="ConfirmPassword-span"></span></font></div>
                <div class="col-md-2"></div>
            </div>
        </div>

        <!--email --->

        <div class="form-group">
            <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-1"><span>Email:</span></div>
                <div class="col-md-4">
                    <input type="text" class="form-control" name="email" placeholder="Email" autofocus required>
                </div>
                <div class="col-md-3"></div>
            </div>
        </div>

        <!-- phoneNumber --->

        <div class="form-group">
            <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-1"><span>PhoneNumber:</span></div>
                <div class="col-md-4">
                    <input type="text" class="form-control" name="phoneNumber" placeholder="PhoneNumber" autofocus required>
                </div>
                <div class="col-md-3"></div>
            </div>
        </div>

        <!-- address --->

        <div class="form-group">
            <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-1"><span>Address:</span></div>
                <div class="col-md-4">
                    <input type="text" class="form-control" name="address" placeholder="Address" autofocus required>
                </div>
                <div class="col-md-3"></div>
            </div>
        </div>

        <!-- introducer --->

        <div class="form-group">
            <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-1"><span>Introducer:</span></div>
                <div class="col-md-4">
                    <input type="text" class="form-control" name="introducer" placeholder="Introducer" autofocus required>
                </div>
                <div class="col-md-3"></div>
            </div>
        </div>

        <!-- 空隙 -->
        <section class="section"></section>

        <div class="form-group">
            <div class="row">
                <div class="col-md-5"></div>
                <div class="col-md-2 text-center">
                    <button type="submit" class="btn btn-default"><h4>submit</h4></button>
                </div>
                <div class="col-md-5"></div>
            </div>
        </div>
    </form>
</section>


</body>
</html>

