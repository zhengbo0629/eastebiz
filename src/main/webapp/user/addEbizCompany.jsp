<%@ page import="com.eastebiz.entity.EbizUser" %>
<%@ page import="com.eastebiz.entity.EbizCompany" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <link rel="stylesheet" href="../static/lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="../static/lib/bootstrap-table/bootstrap-table.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/main.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/lib/jquery/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="../static/lib/bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript" src="../static/lib/bootstrap-table/bootstrap-table.js"></script>

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


        // 判断用户名是否存在
        $(function () {
            $("#Ebiz-companyName").blur(function () {
                var name = $("#Ebiz-companyName").val();
                $.ajax({
                    type:"post",
                    url:"${pageContext.request.contextPath}/EbizCompany/queryOneCompanyName",
                    data:"companyName="+name,
                    success:function (obj) {
                        if (name == obj.companyName) {
                            $("#companyName-span").text("");
                        } else {
                            $("#companyName-span").text("用户不存在！");
                            $("#Ebiz-companyName").val("");
                        }
                    }
                });

            })
        });

        $(function () {
            $("#Ebiz-companyName").blur(function () {
                var cname = $("#Ebiz-companyName").val();
                $.ajax({
                    type:"post",
                    url:"${pageContext.request.contextPath}/EbizRelationo/queryOneCompanyName",
                    data:"companyName="+cname,
                    success:function (obj) {
                        if (obj!=1) {
                            $("#companyName-span1").text("用户已经添加过不能再添加！");
                            $("#Ebiz-companyName").val("");
                        } else {
                            $("#companyName-span1").text("");

                        }
                    }
                });

            })
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

<%--  --%>
<section id="section-space2">
</section>





<section id="menu-section">
    <div class="menu-div">
        <div class="row">
            <div class="col-md-10 ">
                <div class="col-md-12 text-center">
                    <h3>添加新公司</h3>
                </div>

                <section class="section">
                </section>

                <section class="section">
                </section>


                <form id="userloginForm" action="${pageContext.request.contextPath}/EbizRelationo/userAddEbizRelationoPerations" method="post" >
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-4"></div>
                            <div class="col-md-2 text-right"><span>CompanyName:</span></div>
                            <div class="col-md-3 ">
                                <input type="text" class="form-control" name="companyName" id="Ebiz-companyName" placeholder="CompanyName" autofocus required>
                            </div>
                            <div class="col-md-1"><font color="#ff3b25"><span id="companyName-span"></span></font></div>
                            <div class="col-md-1"><font color="#ff3b25"><span id="companyName-span1"></span></font></div>

                            <div class="col-md-1"></div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-4"></div>
                            <div class="col-md-2"><span></span></div>
                            <div class="col-md-4 ">
                                <input type="text" class="form-control" name="addStatus" hidden  value="UserAndCompany" autofocus required>
                            </div>
                            <div class="col-md-2"></div>
                        </div>
                    </div>

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
            </div>


            <%-- 菜单栏 --%>
            <div class="col-md-2 text-left"  style="background-color: #aeffc8">
                <!--右侧栏-->
                <div id="wrapperSideBar">


                    <div class="col-md-12">
                        添加公司操作
                    </div>
                    <div class="col-md-12"><a class="mobile-link" href='${pageContext.request.contextPath}/user/userMain.jsp'>已激活的所有公司</a></div>
                    <div class="col-md-12"><a class="mobile-link" href='${pageContext.request.contextPath}/user/addEbizCompany.jsp'>添加新公司</a></div>
                    <div class="col-md-12"><a class="mobile-link" href='${pageContext.request.contextPath}/user/addUnActive.jsp'>添加未激活</a></div>
                    <div class="col-md-12"><a class="mobile-link" href='${pageContext.request.contextPath}/user/userAdding.jsp'>收到新请求</a></div>
                </div>
                <%--<div class="col-md-1 "></div>--%>
            </div>
        </div>
    </div>
</section>

</body>
</html>
