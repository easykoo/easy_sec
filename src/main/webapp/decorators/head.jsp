<!DOCTYPE html>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" isELIgnored="false" %>

<%@ taglib prefix="au" uri="authorize" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<base href=" <%=basePath%>">
<head>
    <title><spring:message code="main.title"/> - <sitemesh:write property="title"/></title>
    <link rel="shortcut icon" href="img/favicon.ico">
    <sitemesh:write property="head"/>
</head>
<body>
<div id="wrapper">
    <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index.jsp"><strong><spring:message code="main.title"/></strong></a>
        </div>
        <!-- /.navbar-header -->

        <ul class="nav navbar-top-links navbar-right">
            <li class="dropdown">
                <a href="javascript:" class="dropdown-toggle" data-toggle="dropdown"><spring:message
                        code="label.language"/>
                    <b class="caret"></b></a>
                <ul class="dropdown-menu">
                    <li><a href="javascript:changeLanguage('zh_CN')">中文/简体</a></li>
                    <li><a href="javascript:changeLanguage('en')">English</a></li>
                </ul>
            </li>
            <au:check test="/feedback/allFeedback.do">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:">
                        <span id="feedbackCount" class="badge"></span>
                        <i class="fa fa-envelope fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul id="feedback_notification" class="dropdown-menu dropdown-messages">
                    </ul>
                    <!-- /.dropdown-messages -->
                </li>
            </au:check>
            <!-- /.dropdown -->
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:">
                    ${currentAccountSecurity.username} <i class="fa fa-user fa-fw"></i><i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <au:check test="/admin/settings.do">
                        <li><a href="admin/settings.do"><i class="fa fa-gear fa-fw"></i><spring:message
                                code="label.settings"/></a>
                        </li>
                    </au:check>
                    <au:check test="/profile/profile.do">
                        <li><a href="profile/profile.do"><i class="fa fa-user fa-fw"></i><spring:message
                                code="label.profile"/></a>
                        </li>
                    </au:check>
                    <li class="divider"></li>
                    <li><a href="logout.do"><i class="fa fa-sign-out fa-fw"></i><spring:message
                            code="label.logout"/></a>
                    </li>
                </ul>
                <!-- /.dropdown-user -->
            </li>
            <!-- /.dropdown -->
        </ul>
        <!-- /.navbar-top-links -->

    </nav>
    <sitemesh:write property="body"/>
</div>
</body>
<%--<script src="js/head.js" type="text/javascript"></script>--%>
<script type="text/javascript">

    var feedbacks = null;

    var getTop5Feedback = function () {
        $.ajax({
            dataType: "json",
            type: "POST",
            url: 'feedback/ajax/getTop5Feedback.do',
            data: null,
            success: function (data) {
                $('#feedback_notification').empty();
                var html = '';
                if (data != null) {
                    feedbacks = data;
                    $.each(data, function (index, feedback) {
                        html += '<li>'
                                + '<a href="javascript:readFeedbackWithCallback(' + feedback.feedbackId + ',getTop5Feedback, getFeedbackCount)">'
                                + '<div>'
                                + '<strong>' + (feedback.name.length <= 5 ? feedback.name : (feedback.name.substr(0, 5) + '... ')) + '</strong>'
                                + '<span class="pull-right text-muted">'
                                + '<em>' + timeStamp2String(feedback.createDate) + '</em>'
                                + '</span>'
                                + '</div>'
                                + '<div>' + (feedback.content.length <= 30 ? feedback.content : (feedback.content.substr(0, 30) + '... ')) + '</div>'
                                + '</a>'
                                + '</li>'
                                + '<li class="divider"></li>'
                    });

                    html += '<li>'
                            + '<a class="text-center" href="javascript:viewAllFeedback()">'
                            + '<strong><spring:message code="label.view.all.message"/></strong>'
                            + ' <i class="fa fa-angle-right"></i>'
                            + '</a>'
                            + '</li>'
                    $('#feedback_notification').html(html);
                }
            }
        });
    };

    var getFeedbackCount = function () {
        $.ajax({
            dataType: "json",
            type: "POST",
            url: 'feedback/ajax/getFeedbackCount.do',
            data: null,
            success: function (data) {
                if (data == 0) {
                    $('#feedbackCount').empty();
                } else {
                    $('#feedbackCount').text(data);
                }
            }
        });
    };

    var timeStamp2String = function (time) {
        var datetime = new Date();
        datetime.setTime(time);
        var year = datetime.getFullYear();
        var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
        var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
        var hour = datetime.getHours() < 10 ? "0" + datetime.getHours() : datetime.getHours();
        var minute = datetime.getMinutes() < 10 ? "0" + datetime.getMinutes() : datetime.getMinutes();
        var second = datetime.getSeconds() < 10 ? "0" + datetime.getSeconds() : datetime.getSeconds();
        return hour + ":" + minute + ":" + second + " " + month + "/" + date + "/" + year;
    };

    var readFeedbackWithCallback = function (id, fnCallback1, fnCallback2) {
        $.each(feedbacks, function (index, feedback) {
            if (feedback.feedbackId == id) {
                bootbox.dialog({
                    message: feedback.content,
                    title: feedback.name,
                    buttons: {
                        success: {
                            label: "OK",
                            className: "btn-success",
                            callback: function () {
                                $.ajax({
                                    dataType: "json",
                                    type: "POST",
                                    url: 'feedback/ajax/readFeedback.do',
                                    data: {id: id},
                                    success: function (data) {
                                        if (data.success) {
                                            if (fnCallback1 != null)fnCallback1();
                                            if (fnCallback2 != null)fnCallback2();
                                        }
                                    }
                                });
                            }
                        }
                    }
                });
            }
        });
    };

    var viewAllFeedback = function () {
        location.href = "feedback/allFeedback.do";
    }

    $(document).ready(function () {

        <au:check test="/feedback/allFeedback.do">
        getFeedbackCount();
        setInterval(getFeedbackCount, 10000);
        getTop5Feedback();
        setInterval(getTop5Feedback, 10000);
        </au:check>
    });

</script>
</html>