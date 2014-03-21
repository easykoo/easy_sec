<!DOCTYPE html>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" isELIgnored="false" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<base href="<%=basePath%>">
<html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title><spring:message code="main.title"/> - <spring:message code="label.sign.up"/></title>
    <link rel="shortcut icon" href="img/favicon.ico">
    <link rel="stylesheet" href="css/the-story.min.css">
    <link rel="stylesheet" href="css/p-controls.min.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
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
            <a class="navbar-brand" href="index.do"><spring:message code="main.title"/></a>
        </div>
        <div id="nav-collapse" class="collapse navbar-collapse navbar-ex1-collapse">
            <ul class="nav navbar-nav navbar-right">
                <ul class="nav navbar-nav navbar-right">
                    <li class=""><a class="scroll brand-1" href="index.do"><spring:message
                            code="label.home"/></a></li>
                    <li class=""><a href="about.do" class="scroll brand-3"><spring:message
                            code="label.about.us"/></a></li>
                    <li class=""><a href="product.do" class="scroll fadeto brand-4"><spring:message
                            code="label.product.display"/></a></li>
                    <li class=""><a href="join.do" class="scroll brand-2"><spring:message
                            code="label.join.us"/></a></li>
                    <li class=""><a href="contacts.do" class="scroll brand-2"><spring:message
                            code="label.contact.us"/></a></li>

                <li class="dropdown">
                    <a href="javascript:" class="dropdown-toggle" data-toggle="dropdown"><spring:message
                            code="label.language"/>
                        <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="javascript:changeLanguage('zh_CN')"><span>中文/简体</span></a></li>
                        <li><a href="javascript:changeLanguage('en')"><span>English</span></a></li>
                    </ul>
                </li>
                <li><a href="login.do"><spring:message
                        code="label.sign.in"/></a></li>
            </ul>
        </div>
    </div>
    <!-- /.navbar-container -->
</nav>
<div style="margin-top:100px;margin-bottom:200px;max-width: 700px" class="container">
    <form id="registerForm" role="form" class="form-horizontal" action="register.do" method="post">
        <h2 class="form-signin-heading"><spring:message code="label.sign.up"/></h2>
        <c:if test="${not empty message}">
            <div class="alert alert-danger  fade in">
                <button id='alert1' type="button" class="close" data-dismiss="alert"
                        aria-hidden="true">&times;</button>
                    ${message}
            </div>
        </c:if>
        <div class="form-group">
            <label for="username" class="col-sm-2 control-label"><span style="color: red">*</span> <spring:message
                    code="label.username"/></label>

            <div class="col-sm-6">
                <input type="text" id="username" class="form-control" name="username">
            </div>
            <div class="col-sm-4 control-label"></div>
        </div>
        <div class="form-group">
            <label for="nickname" class="col-sm-2 control-label"><span style="color: red">*</span> <spring:message
                    code="label.nickname"/></label>

            <div class="col-sm-6">
                <input type="text" id="nickname" class="form-control" name="nickname">
            </div>
            <div class="col-sm-4 control-label"></div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label"><span style="color: red">*</span> <spring:message
                    code="label.gender"/></label>

            <div class="col-sm-1">
                <div class="radio">
                    <label>
                        <input type="radio" name="gender" id="gender1" value="1" checked><spring:message
                            code="label.male"/>
                    </label>
                </div>
            </div>
            <div class="col-sm-5">
                <div class="radio">
                    <label>
                        <input type="radio" name="gender" id="gender2" value="0"><spring:message
                            code="label.female"/>
                    </label>
                </div>
            </div>
            <div class="col-sm-4 control-label gender"></div>
        </div>
        <div class="form-group">
            <label for="email" class="col-sm-2 control-label"><span style="color: red">*</span> <spring:message
                    code="label.email"/></label>

            <div class="col-sm-6">
                <input type="text" id="email" class="form-control" name="email">
            </div>
            <div class="col-sm-4 control-label"></div>
        </div>
        <div class="form-group">
            <label for="password" class="col-sm-2 control-label"><span style="color: red">*</span> <spring:message
                    code="label.password"/></label>

            <div class="col-sm-6">
                <input type="password" id="password" class="form-control" name="password">
            </div>
            <div class="col-sm-4 control-label"></div>
        </div>
        <div class="form-group">
            <label for="confirmPassword" class="col-sm-2 control-label"><span style="color: red">*</span>
                <spring:message code="label.confirmPassword"/></label>

            <div class="col-sm-6">
                <input type="password" id="confirmPassword" class="form-control" name="confirmPassword">
            </div>
            <div class="col-sm-4 control-label"></div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-3">
                <input type="text" id="verifyCode" class="form-control" name="verifyCode">
            </div>
            <div class="col-sm-3">
                <img id="verifyCodeImg" onclick="reloadVerifyCode()" src="common/getVerifyCodeImage.do"/>
            </div>
            <div class="col-sm-4 control-label"></div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-6">
                <button type="submit" class="btn btn-default btn-lg"><spring:message
                        code="label.sign.up"/></button>
            </div>
        </div>
    </form>

</div>
<!-- /container -->
<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="js/jquery-1.10.2.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.validate.min.js"></script>
<script src="js/jquery.validate.method.js"></script>
<script src="js/easykoo.js"></script>


<script type="text/javascript">
    var reloadVerifyCode = function () {
        document.getElementById("verifyCodeImg").src="common/getVerifyCodeImage.do";
    }

    $(document).ready(function () {

        $("#registerForm").validate({
            rules: {
                username: {
                    required: true,
                    minlength: 5,
                    username: true,
                    remote: "profile/ajax/checkUsername.do"
                },
                nickname: {
                    required: true,
                    minlength: 4,
                    stringCheck: true
                },
                gender: {
                    required: true
                },
                email: {
                    required: true,
                    email: true,
                    remote: "profile/ajax/checkEmail.do"
                },
                password: {
                    required: true,
                    minlength: 5,
                    password: true
                },
                confirmPassword: {
                    required: true,
                    minlength: 5,
                    password: true,
                    equalTo: "#password"
                },
                verifyCode: {
                    required: true,
                    remote: "common/ajax/checkVerifyCode.do"
                }
            },
            messages: {
                username: {
                    required: '<spring:message code="message.error.required"/>',
                    minlength: '<spring:message code="message.error.min.length"/>',
                    username: '<spring:message code="message.error.username.format"/>',
                    remote: '<spring:message code="message.error.already.exists"/>'
                },
                nickname: {
                    required: '<spring:message code="message.error.required"/>',
                    minlength: '<spring:message code="message.error.min.length"/>',
                    stringCheck: '<spring:message code="message.error.string.check"/>'
                },
                gender: '<spring:message code="message.error.required"/>',
                email: {
                    required: '<spring:message code="message.error.required"/>',
                    email: '<spring:message code="message.error.wrong.email.format"/>',
                    remote: '<spring:message code="message.error.already.exists"/>'
                },
                password: {
                    required: '<spring:message code="message.error.required"/>',
                    minlength: '<spring:message code="message.error.min.length"/>',
                    password: '<spring:message code="message.error.password.format"/>'
                },
                confirmPassword: {
                    required: '<spring:message code="message.error.required"/>',
                    minlength: '<spring:message code="message.error.min.length"/>',
                    password: '<spring:message code="message.error.password.format"/>',
                    equalTo: '<spring:message code="message.error.confirm.password"/>'
                },
                verifyCode: {
                    required: '<spring:message code="message.error.required"/>',
                    remote: '<spring:message code="message.error.wrong.verify.code"/>'
                }
            },
            focusInvalid: true,
            onkeyup: false,
            errorClass: "error",
            errorPlacement: function (error, element) {
                if (element.attr("name") == "verifyCode")
                    error.appendTo(element.parent("div").next("div").next("div"));
                else if (element.attr("name") == "gender") {
                    error.appendTo($(".gender"));
                } else
                    error.appendTo(element.parent("div").next("div"));
            },
            highlight: function (element, errorClass) {
                if ($(element).attr("name") == "gender") {
                    $(".gender").parent("div").addClass("has-error").removeClass("has-success");
                } else
                    $(element).parent("div").parent("div").addClass("has-error").removeClass("has-success");
            },
            success: function (label) {
                label.parent("div").parent("div").removeClass("has-error").addClass("has-success");
            }
        });
    })
</script>
</body>
</html>
