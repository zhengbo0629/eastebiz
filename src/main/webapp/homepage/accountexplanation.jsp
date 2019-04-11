
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <link rel="stylesheet" href="../static/lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="../static/css/main.css?v=<%=System.currentTimeMillis()%>">
    <script type="text/javascript" src="../static/lib/jquery/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="../static/lib/bootstrap/js/bootstrap.js"></script>
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
<!-- 上面空的 -->
<section id="section-space1">
</section>
<!-- 黑字 -->
<section id="section-font">
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6 text-center"><h2 class="Welcome">账号说明</h2></div>
        <div class="col-md-3"></div>
    </div>
</section>
<!-- 下面空的 -->
<section id="section-space2">
</section>
<!-- 账号说明 -->

<section id="section-explain">
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6 "><h5 class="Welcome">账号说明:</h5></div>
        <div class="col-md-3"></div>
    </div>
</section>
<!-- 第一种账号 -->
<div class="row">
    <div class="col-md-3"></div>
    <div class="col-md-6 "><span>第一种账号：公司账号，可以进行用户账号管理，库存管理。 具备发shipping label，发deal，支付，deal 等管理功能。需要填写公司英文名称来作为公司的唯一标志代码。
    </span></div>
    <div class="col-md-3"></div>
</div>
<!-- 空隙 -->
<section class="section"></section>

<!-- 第二种账号 -->
<div class="row">
    <div class="col-md-3"></div>
    <div class="col-md-6 "><span>第二种账号：用户账号。
    </span></div>
    <div class="col-md-3"></div>
</div>

<section id="section-returnHomepage">
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6 text-center">
            <form action="${pageContext.request.contextPath}/homepage/homepage.jsp">
                <button type="submit" class="btn btn-default"><h5>返回首页</h5></button>
            </form>
        </div>
        <div class="col-md-3"></div>
    </div>
</section>
</body>
</html>
