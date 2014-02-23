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
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title><spring:message code="label.no.permission"/></title>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/sb-admin.css" rel="stylesheet">
    <link href="../css/font-awesome.min.css" rel="stylesheet">
</head>
<body>
<div style="margin-top:100px;margin-bottom:200px;max-width: 400px" class="container">

    <div class="row">
        <div class="col-md-12 page-500">
            <div class="alert alert-danger">
                <div class=" number">
                    <h1>403</h1>
                </div>
                <div class=" details">
                    <h3><spring:message code="label.no.permission"/></h3>

                    <p>
                        Please contact the administrator.<br>
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /container -->
</body>
<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<%--<script src="js/jquery.min.js"></script>--%>
<script src="../js/jquery-1.10.2.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="../js/bootstrap.min.js"></script>
</html>


