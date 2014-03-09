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
    <title><spring:message code="label.sign.up"/></title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
</head>

<body>

<div style="margin-top:100px;margin-bottom:200px;max-width: 600px" class="container">
    <form id="registerForm" role="form" class="form-horizontal" action="account/registerAccount.do" method="post">
        <%--<input type="hidden" name="token" value="/common/getFormToken.do">--%>

        <h2 class="form-signin-heading"><spring:message code="label.sign.up"/></h2>
        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger  fade in">
                <button id='alert1' type="button" class="close" data-dismiss="alert"
                        aria-hidden="true">&times;</button>
                    ${errorMessage}
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
                        <input type="radio" name="gender" id="gender2" value="2"><spring:message
                            code="label.female"/>
                    </label>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label for="email" class="col-sm-2 control-label"><spring:message code="label.email"/></label>

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
                <spring:message
                        code="label.confirmPassword"/></label>

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
                <img id="verifyCodeImage" onclick="reloadVerifyCode()" src="common/getVerifyCodeImage.do"/>
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
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.validate.min.js"></script>
<script src="js/jquery.validate.method.js"></script>
<%--<script src="js/bootstrap3-validation.js"></script>--%>


<script type="text/javascript">

    $(document).ready(function () {

        $("#registerForm").validate({
            rules: {
                username: {
                    required: true,
                    minlength: 5,
                    username: true,
                    remote:"ajax/checkUsername.do"
           /*         {
                        url: "ajax/checkUsername.do",
                        type: "post",
                        dataType: 'json',
                        data: {
                            username: function () {
                                return $("#username").val();
                            }
                        }
                    }*/
                },
                nickname: {
                    required: true,
                    minlength: 4,
                    stringCheck: true
                },
                email: {
                    email: true,
                    remote: {                         //自带远程验证存在的方法
                        url: "ajax/checkEmail.do",
                        type: "post",
                        dataType: "json",
                        data: {
                            email: function () {
                                return $("#email").val();
                            }
                        },
                        dataFilter: function (data, type) {
                            if (data == "true")
                                return true;
                            else
                                return false;
                        }
                    }
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
                    required: true
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
                email: {
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
                    required: '<spring:message code="message.error.required"/>'
                }
            },
            focusInvalid: true,
            onkeyup: false,
            errorClass: "error",
            errorPlacement: function (error, element) {
                error.appendTo(element.parent("div").next("div"));
            },
            highlight: function (element, errorClass) {
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
