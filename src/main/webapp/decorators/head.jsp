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
            <au:test uri="/admin/allFeedbackView.do">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:">
                        <span id="feedbackCount" class="badge"></span>
                        <i class="fa fa-envelope fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul id="feedback_notification" class="dropdown-menu dropdown-messages">
                    </ul>
                    <!-- /.dropdown-messages -->
                </li>
            </au:test>
            <!-- /.dropdown -->
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:">
                    ${currentAccountSecurity.username} <i class="fa fa-user fa-fw"></i><i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <au:test uri="/admin/settings.do">
                        <li><a href="admin/settings.do"><i class="fa fa-gear fa-fw"></i><spring:message
                                code="label.settings"/></a>
                        </li>
                    </au:test>
                    <au:test uri="/admin/profile.do">
                        <li><a href="admin/profile.do"><i class="fa fa-user fa-fw"></i><spring:message
                                code="label.profile"/></a>
                        </li>
                    </au:test>
                    <li class="divider"></li>
                    <li><a href="account/logout.do"><i class="fa fa-sign-out fa-fw"></i><spring:message
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
<script src="js/head.js" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function () {

        <au:test uri="/admin/allFeedbackView.do">
        getFeedbackCount();
        setInterval(getFeedbackCount, 10000);
        getTop5Feedback();
        setInterval(getTop5Feedback, 10000);
        </au:test>
    });
</script>
</html>