<%@ page import="com.easykoo.util.ConfigUtils" %>
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
    <title><spring:message code="label.publish.news"/></title>
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
            <h1 class="page-header"><spring:message code="label.publish.news"/></h1>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <div class="row">
        <div class="col-lg-8">
            <form id="newsForm" role="form" class="form-horizontal" enctype="multipart/form-data" method="post"
                  action="news/publishNews.do">
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
                    <label for="priority" class="col-sm-2 control-label"><span style="color: red">*</span> <spring:message
                            code="label.priority"/></label>

                    <div class="col-sm-6">
                        <select id="priority" class="form-control" name="priority">
                            <option value="5">5</option>
                            <option value="4">4</option>
                            <option value="3">3</option>
                            <option value="2">2</option>
                            <option value="1">1</option>
                        </select>
                    </div>
                    <div class="col-sm-4 control-label"></div>
                </div>
                <div class="form-group">
                    <label for="lang" class="col-sm-2 control-label"><span style="color: red">*</span> <spring:message
                            code="label.language"/></label>

                    <div class="col-sm-6">
                        <select id="lang" class="form-control" name="lang">
                            <option value="en">English</option>
                            <option value="zh_CN">中文</option>
                        </select>
                    </div>
                    <div class="col-sm-4 control-label"></div>
                </div>
                <div class="form-group">
                    <label for="title" class="col-sm-2 control-label"><span style="color: red">*</span> <spring:message
                            code="label.title"/></label>

                    <div class="col-sm-6">
                        <input type="text" id="title" class="form-control" name="title">
                    </div>
                    <div class="col-sm-4 control-label"></div>
                </div>
                <div class="form-group">
                    <label for="content" class="col-sm-2 control-label"><span style="color: red">*</span>
                        <spring:message
                                code="label.content"/></label>

                    <div class="col-sm-6">
                        <textarea id="content" name="content" rows="10" class="form-control"/></textarea>
                    </div>
                    <div class="col-sm-4 control-label"></div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-6">
                        <button type="submit" class="btn btn-success btn-block"><spring:message
                                code="label.publish"/></button>
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
        $('#news').toggleClass('active').children('ul').collapse('toggle');
        $('#publishNews').css({"background": "#DDDDDD"});

        $("#newsForm").validate({
            rules: {
                title: "required",
                priority: "required",
                lang: "required",
                content: "required"
            },
            messages: {
                title: '<spring:message code="message.error.required"/>',
                priority: '<spring:message code="message.error.required"/>',
                lang: '<spring:message code="message.error.required"/>',
                content: '<spring:message code="message.error.required"/>'
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
