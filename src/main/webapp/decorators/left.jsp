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
    <title><sitemesh:write property="title"/></title>
    <sitemesh:write property="head"/>
</head>
<body>
<nav class="navbar-default navbar-static-side" role="navigation">
    <div class="sidebar-collapse">
        <ul class="nav" id="side-menu">
            <li class="sidebar-search">
                <div class="input-group custom-search-form">
                    <input type="text" class="form-control"/>
                            <span class="input-group-btn">
                                <button class="btn btn-default" type="button">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                </div>
                <!-- /input-group -->
            </li>
            <au:test uri="/admin/dashboard.do">
                <li>
                    <a href="javascript:"><i class="fa fa-dashboard fa-fw"></i> <spring:message code="label.dashboard"/></a>
                </li>
            </au:test>
            <au:test uri="/admin/allAccountView.do">
                <li id="allAccount">
                    <a href="admin/allAccountView.do"><i class="fa fa-users fa-fw"></i> <spring:message
                            code="label.all.account"/></a>
                </li>
            </au:test>
            <au:test uri="/admin/allFeedbackView.do">
                <li>
                    <a href="/admin/allFeedbackView.do"><i class="fa fa-edit fa-fw"></i><spring:message
                            code="label.all.feedback"/></a>
                </li>
            </au:test>
            <au:test uri="/admin/settings.do">
                <li id="settings">
                    <a href="javascript:"><i class="fa fa-wrench fa-fw"></i> <spring:message
                            code="label.settings"/><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level collapse">
                        <au:test uri="/admin/profile.do">
                            <li>
                                <a href="admin/profile.do"><spring:message
                                        code="label.profile"/></a>
                            </li>
                        </au:test>
                        <li>
                            <a href="/admin/changePasswordView.do"><spring:message
                                    code="label.change.password"/></a>
                        </li>
                        <li>
                            <a href="javascript:">Third Level <span class="fa arrow"></span></a>
                            <ul class="nav nav-third-level collapse">
                                <li>
                                    <a href="javascript:">Third Level Item</a>
                                </li>
                                <li>
                                    <a href="javascript:">Third Level Item</a>
                                </li>
                            </ul>
                            <!-- /.nav-third-level -->
                        </li>
                    </ul>
                    <!-- /.nav-second-level -->
                </li>
            </au:test>
        </ul>
        <!-- /#side-menu -->
    </div>
    <!-- /.sidebar-collapse -->
</nav>
<sitemesh:write property="body"/>
</body>
</html>