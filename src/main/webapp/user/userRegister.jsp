<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <link rel="stylesheet" href="../static/lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="../static/css/main.css?v=<%=System.currentTimeMillis()%>">
    <script type="text/javascript" src="../static/lib/jquery/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="../static/lib/bootstrap/js/bootstrap.js"></script>

    <script type="text/javascript">

        // 判断用户名是否存在

        $(function () {
            $("#EbizUser-userName").blur(function () {
                var name = $("#EbizUser-userName").val();
                console.log(name)
                    $.ajax({
                        type:"post",
                        url:"${pageContext.request.contextPath}/EbizUser/queryEbizUser",
                        data:"userName="+name,
                        success:function (obj) {
                            if (name == obj.userName) {
                                $("#EbizUser-span").text("用户名已存在！");
                                $("#EbizUser-userName").val("");
                            } else {
                                $("#EbizUser-span").text("");
                            }
                        }
                    })

            })
        });

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


        // 判断公司名是否存在

        $(function () {
            $("#EbizCompany-companyName").blur(function () {
                var name = $("#EbizCompany-companyName").val();
                $.ajax({
                    type:"post",
                    url:"${pageContext.request.contextPath}/EbizCompany/queryOneCompanyName",
                    data:"companyName="+name,
                    success:function (obj) {
                        if (name == obj.companyName) {
                            $("#companyName-span").text("");
                        } else {
                            $("#companyName-span").text("公司不存在！");
                            $("#EbizCompany-companyName").val("");
                        }
                    }
                })

            })
        });

    </script>


</head>
<body>

<!-- 顶部 -->
<header id="header">
    <div class="topbar">
        <div class="container">
            <div class="row">
                <div class="col-md-12"><a class="mobile-link" href="${pageContext.request.contextPath}/homepage/homepage.jsp"><span class="eastebiz">EastEbiz</span></a></div>
            </div>
        </div>
    </div>
</header>

<!-- 导航 -->
<section id="section">
    <div class="nav">
        <div class="container">
            <div class="row">
                <!-- text-center  左右居中-->
                <div class="col-md-1 text-center"><a class="mobile-link" href="${pageContext.request.contextPath}/homepage/homepage.jsp"><span class="span">Home</span></a></div>
                <div class="col-md-2 text-center"><a class="mobile-link" href="${pageContext.request.contextPath}/homepage/login.jsp"><span class="span">登录</span></a></div>
                <div class="col-md-2 text-center"><a class="mobile-link" href="${pageContext.request.contextPath}/homepage/register.jsp"><span class="span">注册</span></a></div>
                <div class="col-md-2 text-center"><a class="mobile-link" href="${pageContext.request.contextPath}/homepage/accountexplanation.jsp"><span class="span">使用说明</span></a></div>
                <div class="col-md-2 text-center"><a class="mobile-link" href="${pageContext.request.contextPath}/homepage/contactinfor.jsp"><span class="span">联系方式</span></a></div>
            </div>
        </div>
    </div>
</section>


<!-- 空隙 -->
<section class="section"></section>

<!-- 黑字 -->
<section id="section-font">
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6 text-center"><h2 class="Welcome">用户注册</h2></div>
        <div class="col-md-3"></div>
    </div>
</section>

<!-- 空隙 -->
<section class="section"></section>


<!-- 注册表单 -->

<section id="section-userRegister">
    <form id="companyRegisterForm"   action="${pageContext.request.contextPath}/Register/registerNurse" method="post" >

        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-1 text-right">
                <h5>账户信息:</h5>
            </div>
            <div class="col-md-8"></div>
        </div>
        <!-- Name   --->
        <div class="form-group">
            <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-1"><span>登录名:</span></div>
                <div class="col-md-4">
                    <input type="text" class="form-control" name="userName" id="EbizUser-userName" placeholder="userName" autofocus required>
                </div>
                <div class="col-md-1"><font color="#ff3b25"><span id="EbizUser-span"></span></font></div>
            </div>
        </div>

        <!-- password --->

        <div class="form-group">
            <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-1"><span>密码:</span></div>
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
                <div class="col-md-1"><span>确认密码:</span></div>
                <div class="col-md-4">
                    <input type="password" class="form-control" name="confirmPassword" id="EbizUser-confirmPassword" placeholder="ConfirmPassword" autofocus required>
                </div>
                <div class="col-md-1"><font color="#ff3b25"><span id="ConfirmPassword-span"></span></font></div>
                <div class="col-md-2"></div>
            </div>
        </div>



        <!-- 姓 --->

        <div class="form-group">
            <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-1"><span>姓:</span></div>
                <div class="col-md-4">
                    <input type="text" class="form-control" name="lastName" placeholder="lastName" autofocus required>
                </div>
                <div class="col-md-3"></div>
            </div>
        </div>

        <%-- 名 --%>

        <div class="form-group">
            <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-1"><span>名:</span></div>
                <div class="col-md-4">
                    <input type="text" class="form-control" name="firstName" placeholder="firstName" autofocus required>
                </div>
                <div class="col-md-3"></div>
            </div>
        </div>

        <%-- 电话 --%>
        <div class="form-group">
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-2 text-right"><span>个人联系电话:</span></div>
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
                <div class="col-md-1"><span>个人地址:</span></div>
                <div class="col-md-4">
                    <input type="text" class="form-control" name="address" placeholder="Address" autofocus required>
                </div>
                <div class="col-md-3"></div>
            </div>
        </div>

        <!-- zipCode --->
        <div class="form-group">
            <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-1"><span>邮编:</span></div>
                <div class="col-md-4">
                    <input type="text" class="form-control" name="zipCode" placeholder="ZipCode" autofocus required>
                </div>
                <div class="col-md-3"></div>
            </div>
        </div>

        <!--email --->
        <div class="form-group">
            <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-1"><span>邮箱:</span></div>
                <div class="col-md-4">
                    <input type="text" class="form-control" name="email" placeholder="Email" autofocus required>
                </div>
                <div class="col-md-3"></div>
            </div>
        </div>

        <!-- companyName  --->

        <div class="form-group">
            <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-1"><span>公司名称:</span></div>
                <div class="col-md-4">
                    <input type="text" class="form-control" name="companyName"  id="EbizCompany-companyName" placeholder="CompanyName" autofocus required>
                </div>
                <div class="col-md-1"><font color="#ff3b25"><span id="companyName-span"></span></font></div>
                <div class="col-md-2"></div>
                <div class="col-md-2"></div>
            </div>
        </div>







        <!-- 空隙 -->
        <section class="section"></section>

        <div class="form-group">
            <div class="row">
                <div class="col-md-5"></div>
                <div class="col-md-2 text-center">
                    <button type="submit" style="width: 200px; height: 60px;background-color: #D3D3D3" class="btn btn-default"><h4>注册</h4></button>
                </div>
                <div class="col-md-5"></div>
            </div>
        </div>
    </form>
</section>

</body>
</html>

