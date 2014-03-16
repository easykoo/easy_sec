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
    <title><spring:message code="label.profile"/></title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link href="css/admin.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
</head>

<body>

<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header"><spring:message code="label.profile"/></h1>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <div class="row">
        <div class="col-lg-8">
            <form id="profileForm" role="form" class="form-horizontal" method="post" action="profile/password.do">

                <input type="text" name="accountId" value="${currentAccountSecurity.accountId}" hidden>
                <c:if test="${not empty message}">
                    <div class="form-group alert
                        <c:if test="${!message.success}">alert-danger</c:if>
                        <c:if test="${message.success}">alert-success</c:if>
                         fade in">
                        <button id='alert1' type="button" class="close" data-dismiss="alert"
                                aria-hidden="true">&times;</button>
                            ${message.message}
                    </div>
                </c:if>
                <div class="form-group">
                    <label for="currentPassword" class="col-sm-2 control-label"><span style="color: red">*</span>
                        <spring:message
                                code="label.current.password"/></label>

                    <div class="col-sm-6">
                        <input type="password" id="currentPassword" class="form-control" name="currentPassword">
                    </div>
                    <div class="col-sm-4 control-label"></div>
                </div>
                <div class="form-group">
                    <label for="newPassword" class="col-sm-2 control-label"><span style="color: red">*</span>
                        <spring:message
                                code="label.new.password"/></label>

                    <div class="col-sm-6">
                        <input type="password" id="newPassword" class="form-control" name="newPassword">
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
                    <div class="col-sm-offset-2 col-sm-6">
                        <button type="submit" class="btn btn-success btn-block"><spring:message
                                code="label.change"/></button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- /container -->
<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="js/jquery-1.10.2.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.validate.min.js"></script>
<script src="js/jquery.validate.method.js"></script>
<script src="js/jquery.metisMenu.js"></script>
<script src="js/admin.js"></script>
<script src="js/easykoo.js"></script>


<script type="text/javascript">

    $(document).ready(function () {
        $('#profile').toggleClass('active').children('ul').collapse('toggle');
        $('#password').css({"background":"#DDDDDD"});

        $("#profileForm").validate({
            rules: {
                currentPassword: {
                    required: true,
                    minlength: 5,
                    password: true
                },
                newPassword: {
                    required: true,
                    minlength: 5,
                    password: true
                },
                confirmPassword: {
                    required: true,
                    minlength: 5,
                    password: true,
                    equalTo: "#newPassword"
                }
            },
            messages: {
                currentPassword: {
                    required: '<spring:message code="message.error.required"/>',
                    minlength: '<spring:message code="message.error.min.length"/>',
                    password: '<spring:message code="message.error.password.format"/>'
                },
                newPassword: {
                    required: '<spring:message code="message.error.required"/>',
                    minlength: '<spring:message code="message.error.min.length"/>',
                    password: '<spring:message code="message.error.password.format"/>'
                },
                confirmPassword: {
                    required: '<spring:message code="message.error.required"/>',
                    minlength: '<spring:message code="message.error.min.length"/>',
                    password: '<spring:message code="message.error.password.format"/>',
                    equalTo: '<spring:message code="message.error.confirm.password"/>'
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
            },
            submitHandler: function (form) {
                form.submit();
                return false;
            }
        });
        setCheckSession();
    })
</script>
</body>
</html>
