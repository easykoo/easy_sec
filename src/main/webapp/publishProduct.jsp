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
            <h1 class="page-header"><spring:message code="label.publish.product"/></h1>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <div class="row">
        <div class="col-lg-5">
            <form id="productForm" role="form" class="form-horizontal" enctype="multipart/form-data" method="post"
                  action="product/publishProduct.do">

                <input type="text" name="accountId" hidden>
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
                    <label for="categoryIdd" id="test" class="col-sm-2 control-label"><span style="color: red">*</span>
                        <spring:message
                                code="label.category"/></label>

                    <div class="col-sm-6">
                        <input id="categoryId" name="categoryId" hidden/>
                        <select id="categoryIdd" class="form-control" name="categoryIdd">
                            <option><spring:message code="label.please.select"/></option>
                        </select>
                    </div>
                    <div class="col-sm-4 control-label"></div>
                </div>
                <div class="form-group">
                    <label for="name" class="col-sm-2 control-label"><span style="color: red">*</span> <spring:message
                            code="label.product.name"/></label>

                    <div class="col-sm-6">
                        <input type="text" id="name" class="form-control" name="name">
                    </div>
                    <div class="col-sm-4 control-label"></div>
                </div>
                <div class="form-group">
                    <label for="image" class="col-sm-2 control-label"><span style="color: red">*</span> <spring:message
                            code="label.image"/></label>

                    <div class="col-sm-6">
                        <input type="file" id="image" class="form-control" name="image">
                    </div>
                    <div class="col-sm-4 control-label"></div>
                </div>
                <div class="form-group">
                    <label for="description" class="col-sm-2 control-label"><span style="color: red">*</span>
                        <spring:message
                                code="label.description"/></label>

                    <div class="col-sm-6">
                        <textarea id="description" name="description" rows="6" class="form-control"/></textarea>
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


<script type="text/javascript">


    var checkOption = function (obj, data) {

        if (obj.val() != null && obj.val() != ''){
            $('#categoryId').val(obj.val());
        }
        if (data.children.length != 0) {
            var select = $('<select class="form-control"></select>');
            var option1 = $('<option>' + '<spring:message code="label.please.select"/>' + '</option>');
            select.append(option1);
            $.each(data.children, function (i, category) {
                var option = $('<option value="' + category.categoryId + '">' + category.description + '</option>')
                option.on('click', function () {
                    checkOption(option, category);
                });
                select.append(option);
            });
            select.on('change', function () {
                changeSelect(select);
            });
            $(obj).parent().nextAll().remove();
            $(obj).parent().parent().append(select);
        }
    }

    var changeSelect = function (select) {
        var option = select.children('option:selected');
        $(option).click();
    };

    $(document).ready(function () {
        $('#product').toggleClass('active').children('ul').collapse('toggle');
        $('#publishProduct').css({"background": "#DDDDDD"});
        var categories = null;
        $.ajax({
            cache: true,
            type: "POST",
            dataType: 'json',
            url: "product/ajax/getTopLevelCategory.do",
            error: function (request) {
                alert("Connection error");
            },
            success: function (data) {
                if (data.success) {
                    categories = data.obj;
                    if (categories.length != 0) {
                        $.each(categories, function (i, category) {
                            var option = $('<option value="' + category.categoryId + '">' + category.description + '</option>');
                            $("#categoryIdd").append(option);
                            $(option).on('click', function () {
                                checkOption(option, category);
                            });
                        });
                    }
                }
            }
        });

        $('#categoryIdd').on('change', function () {
            var option = $(this).children('option:selected');
            $(this).nextAll().remove();
            $(option).click();
        });

        $("#productForm").validate({
            rules: {
                categoryIdd: "required",
                name: "required",
                image: "required",
                description: "required"
            },
            messages: {
                categoryIdd: '<spring:message code="message.error.required"/>',
                name: '<spring:message code="message.error.required"/>',
                image: '<spring:message code="message.error.required"/>',
                description: '<spring:message code="message.error.required"/>'
            },
            focusInvalid: true,
            onkeyup: false,
            errorClass: "error",
            errorPlacement: function (error, element) {
                error.appendTo(element.parent("div").next("div"));
            },
            highlight: function (element, errorClass) {
                if ($(element).attr("name") == "category") {
                    $("#category").parent("div").parent("div").addClass("has-error").removeClass("has-success");
                } else
                    $(element).parent("div").parent("div").addClass("has-error").removeClass("has-success");
            },
            success: function (label) {
                label.parent("div").parent("div").removeClass("has-error").addClass("has-success");
            },
            submitHandler: function (form) {
                alert($('#categoryId').val())
                form.submit();
                return false;
            }
        });
        setCheckSession();
    })
</script>
</body>
</html>
