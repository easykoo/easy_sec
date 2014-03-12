<!DOCTYPE html>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" isELIgnored="false" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<base href=" <%=basePath%>">
<html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title><spring:message code="main.title"/> - <spring:message code="label.sign.in"/></title>
    <link rel="shortcut icon" href="img/favicon.ico">
    <link rel="stylesheet" href="css/the-story.min.css">
    <link rel="stylesheet" href="css/p-controls.min.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.js"></script>
    <script src="js/PIE.js"></script>
    <![endif]-->
</head>
<body>

<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="navbar-container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                <span class="sr-only">Toggle navigation</span>
                <i class="fa fa-bars"></i>
            </button>
            <a class="navbar-brand" href="#">Easy Security</a>
        </div>
        <div id="nav-collapse" class="collapse navbar-collapse navbar-ex1-collapse">
            <ul class="nav navbar-nav navbar-right">
                <li class=""><a title="Home page" class="scroll brand-1" href="#home"><spring:message
                        code="label.home"/></a></li>
                <li class=""><a title="Check out our awesome services" href="#features"
                                class=" scroll brand-4"><spring:message code="label.features"/></a></li>
                <li class=""><a title="Themes assets" href="#assets" class="scroll brand-3"><spring:message
                        code="label.assets"/></a></li>
                <li class=""><a title="Who we are" href="#about" class="scroll fadeto brand-4"><spring:message
                        code="label.about.us"/></a></li>
                <li class=""><a title="Get in touch!" href="#contact" class="scroll brand-2"><spring:message
                        code="label.contact.us"/></a></li>

                <li class="dropdown">
                    <a href="javascript:" class="dropdown-toggle" data-toggle="dropdown"><spring:message
                            code="label.language"/>
                        <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="loginView.do?url=http://localhost/&locale=zh_CN">中文/简体</a></li>
                        <li><a href="loginView.do?url=http://localhost/&locale=en">English</a></li>
                    </ul>
                </li>
                <li><a href="registerView.do"><spring:message code="label.sign.up"/></a></li>
            </ul>
        </div>
    </div>
    <!-- /.navbar-container -->
</nav>
<div style="margin-top:100px;margin-bottom:200px;max-width: 400px" class="container">

    <form role="form" action="login.do" method="post">
        <h2 class="form-signin-heading"><spring:message code="label.please.sign.in"/></h2>
        <c:if test="${not empty message}">
        <div class="alert alert-danger  fade in">
            <button id='alert1' type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
            ${message.message}
        </div>
        </c:if>
        <div class="form-group">
            <%--<label class="control-label" for="username"><spring:message code="label.username"/></label>--%>
            <input type="text" class="form-control" id="username" placeholder="<spring:message code="label.username"/>" name="username" required>
        </div>
        <div class="form-group">
            <%--<label class="control-label" for="password"><spring:message code="label.password"/></label>--%>
            <input type="password" class="form-control" id="password" placeholder="<spring:message code="label.password"/>" name="password" required>
        </div>
<%--        <div class="form-group">
            <input type="password" class="form-group" placeholder="" name="verifyCode" required>
            <img id="verifyCodeImage" onclick="reloadVerifyCode()" src="common/getVerifyCodeImage.do"/><br/>
        </div>--%>
        <div class="checkbox">
            <label>
                <input type="checkbox" name="rememberMe" value="1"> <spring:message code="label.remember.username"/>
            </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit"><spring:message code="label.sign.in"/></button>
    </form>


</div>
<!-- /container -->
<script type="text/javascript">
    function Test()
    {
        $("#alert1").alert('close');
    }
</script>
<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="js/jquery-1.10.2.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="js/bootstrap.min.js"></script>
</body>
</html>
