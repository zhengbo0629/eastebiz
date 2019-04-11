<%@ page import="com.eastebiz.entity.EbizUser" %>
<%@ page import="com.eastebiz.entity.EbizCompany" %>
<%@ page import="com.eastebiz.entity.Admin" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/lib/bootstrap-table/bootstrap-table.css">
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



    </script>

</head>
<body>

<%
    Admin admin = (Admin) session.getAttribute("Admin");
    if (admin != null) {
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
                                ${sessionScope.EbizCompany.owerName},${sessionScope.EbizCompany.companyName}
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
                    <h3>更新用户信息</h3>
                </div>



                <div class="row">
                    <div class="col-md-1 "></div>
                    <div class="col-md-10 ">


                        <form id="userloginForm"   action="${pageContext.request.contextPath}/Product/registerProductAndAmendbProduct" method="post" >
                            <div class="row">
                            <div class="col-md-4">
                               基本信息：
                                <div class="row">
                                    <div class="col-md-4 text-right"><span></span>公司ID:</div>
                                     <div class="col-md-8 text-left">
                                        <input type="text" class="form-control" name="id" value="${sessionScope.EbizCompany.id}" >
                                     </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-4 text-right"><span></span>登录名:</div>
                                    <div class="col-md-8 text-left">
                                        <input type="text" class="form-control" name="owerName" value="${sessionScope.EbizCompany.owerName}" >
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-4 text-right"><span></span>联系电话:</div>
                                    <div class="col-md-8 text-left">
                                        <input type="text" class="form-control" name="phoneNumber" value="${sessionScope.EbizCompany.phoneNumber}" >
                                    </div>
                                </div>


                                <div class="row">
                                    <div class="col-md-4 text-right"><span></span>邮箱:</div>
                                    <div class="col-md-8 text-left">
                                        <input type="text" class="form-control" name="email" value="${sessionScope.EbizCompany.email}" >
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-4 text-right"><span></span>地址:</div>
                                    <div class="col-md-8 text-left">
                                        <input type="text" class="form-control" name="address" value="${sessionScope.EbizCompany.address}" >
                                    </div>
                                </div>



                                <div class="row">
                                    <div class="col-md-4 text-right"><span></span>公司名字:</div>
                                    <div class="col-md-8 text-left">
                                        <input type="text" class="form-control" name="companyName" value="${sessionScope.EbizCompany.companyName}" >
                                    </div>
                                </div>





                             </div>
                            <div class="col-md-4">
                                修改信息：

                                <div class="row">
                                    <div class="col-md-4 text-right"><span></span>密码:</div>
                                    <div class="col-md-8 text-left">
                                        <input type="password" class="form-control" name="password"  value="${sessionScope.EbizCompany.password}" >
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4 text-right"><span></span>用户状态:</div>
                                    <div class="col-md-8 text-left">
                                        <select class="form-control" name="status" >
                                            <option selected="selected" value="Active">${sessionScope.EbizCompany.status}</option>
                                            <option value="UnActive">UnActive</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4 text-right"><span></span>余额:</div>
                                    <div class="col-md-8 text-left">
                                        <input type="text" class="form-control" name="balance" value="${sessionScope.EbizCompany.balance}" >
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                设置公司应用范围：
                                <div class="checkbox">
                                    <label><input type="checkbox" name="" value=""></label>
                                </div>
                                <div class="checkbox">
                                    <label><input type="checkbox" name="" value=""></label>
                                </div>
                                <div class="checkbox">
                                    <label><input type="checkbox" name="" value=""></label>
                                </div>
                                <div class="checkbox">
                                    <label><input type="checkbox" name="" value=""></label>
                                </div>
                                <div class="checkbox">
                                    <label><input type="checkbox" name="" value=""></label>
                                </div>
                                <div class="checkbox">
                                    <label><input type="checkbox" name="" value=""></label>
                                </div>
                                <div class="checkbox">
                                    <label><input type="checkbox" name="" value=""></label>
                                </div>
                                <div class="checkbox">
                                    <label><input type="checkbox" name="" value=""></label>
                                </div>
                                <div class="checkbox">
                                    <label><input type="checkbox" value=""></label>
                                </div>
                                <div class="checkbox">
                                    <label><input type="checkbox" value=""></label>
                                </div>
                            </div>
                            </div>
                        </form>
                    </div>
                    <div class="col-md-1 "></div>
                </div>

            </div>


            <%-- 菜单栏 --%>
            <div class="col-md-2 text-left"  style="background-color: #aeffc8">
                <!--右侧栏-->
                <div id="wrapperSideBar">

                    <div class="col-md-12">
                        网站业务管理
                    </div>

                    <div class="col-md-12"><a class="mobile-link" href='${pageContext.request.contextPath}/admin/queryAllCompany.jsp'>主账号管理</a></div>
                    <div class="col-md-12"><a class="mobile-link" href=''>收费管理</a></div>
                </div>
            </div>

</section>

</body>
</html>
