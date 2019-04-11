
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/main.css?v=<%=System.currentTimeMillis()%>">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/lib/jquery/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/lib/bootstrap/js/bootstrap.js"></script>
</head>
<body>
<!-- 顶部 -->
    <header id="header">
        <div class="topbar">
            <div class="container">
                <div class="row">
                    <div class="col-md-12"><a class="mobile-link" href="homepage.jsp"><span class="eastebiz">EastEbiz</span></a></div>
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
<!-- 上面空的 -->
<section id="section-space1">
</section>
<!-- 黑字 -->
<section id="section-font">
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6 text-center"><h1 class="Welcome">Welcome To EastEbiz</h1></div>
        <div class="col-md-3"></div>
    </div>
</section>
<!-- 下面空的 -->
<section id="section-space2">
</section>
 <!-- 登陆和注册 -->
    <section id="section-userLogin">
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6 text-center">
                <form action="${pageContext.request.contextPath}/homepage/login.jsp">
                    <button type="submit" style="width: 200px; height: 60px;background-color: #D3D3D3" class="btn btn-default"><h3>登陆</h3></button>
                </form>
            </div>
            <div class="col-md-3"></div>
        </div>
    </section>

    <section class="section">
    </section>

    <section id="section-userRegister">
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6 text-center">
            <form action="${pageContext.request.contextPath}/homepage/register.jsp">
                <button type="submit" style="width: 200px; height: 60px;background-color: #D3D3D3" class="btn btn-default"><h3>注册</h3></button>
            </form>
        </div>
        <div class="col-md-3"></div>
    </div>
    </section>



</body>
</html>
