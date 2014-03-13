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
            <au:check test="/admin/dashboard.do">
                <li id="dashboard">
                    <a href="admin/dashboard.do"><i class="fa fa-dashboard fa-fw"></i> <spring:message
                            code="label.dashboard"/></a>
                </li>
            </au:check>
            <au:check test="/admin/settings.do">
                <li id="settings">
                    <a href="admin/settings.do"><i class="fa fa-gear fa-fw"></i> <spring:message
                            code="label.settings"/></a>
                </li>
            </au:check>
            <au:check test="/admin/allAccount.do">
                <li id="account">
                    <a href="admin/allAccount.do"><i class="fa fa-users fa-fw"></i> <spring:message
                            code="label.all.account"/></a>
                </li>
            </au:check>
            <au:check test="/admin/allFeedback.do">
                <li id="feedback">
                    <a href="/admin/allFeedback.do"><i class="fa fa-edit fa-fw"></i><spring:message
                            code="label.all.feedback"/></a>
                </li>
            </au:check>
            <au:check test="/admin/allNotice.do">
                <li id="notice">
                    <a href="javascript:"><i class="fa fa-volume-up fa-fw"></i> <spring:message
                            code="label.notice"/><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level collapse">
                        <au:check test="/admin/allNotice.do">
                            <li id="allAnnouncement">
                                <a href="admin/allNotice.do"><spring:message
                                        code="label.all.notice"/></a>
                            </li>
                        </au:check>
                        <au:check test="/notice/publishNotice.do">
                            <li id="announce">
                                <a href="/admin/publishNotice.do"><spring:message
                                        code="label.publish.notice"/></a>
                            </li>
                        </au:check>
                    </ul>
                    <!-- /.nav-second-level -->
                </li>
            </au:check>
            <au:check test="/admin/allProduct.do">
                <li id="product">
                    <a href="javascript:"><i class="fa fa-lightbulb-o fa-fw"></i> <spring:message
                            code="label.product"/><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level collapse">
                        <au:check test="/admin/allProduct.do">
                            <li id="allProduct">
                                <a href="admin/allProduct.do"><spring:message
                                        code="label.all.product"/></a>
                            </li>
                        </au:check>
                        <au:check test="/product/publishProduct.do">
                            <li id="createProduct">
                                <a href="/product/publishProduct.do"><spring:message
                                        code="label.publish.product"/></a>
                            </li>
                        </au:check>
                        <au:check test="/admin/allCategory.do">
                            <li id="category">
                                <a href="/admin/allCategory.do"><spring:message
                                        code="label.category"/></a>
                            </li>
                        </au:check>
                    </ul>
                    <!-- /.nav-second-level -->
                </li>
            </au:check>
            <au:check test="/admin/profile.do">
                <li id="profile">
                    <a href="javascript:"><i class="fa fa-wrench fa-fw"></i> <spring:message
                            code="label.profile"/><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level collapse">
                        <li id="changeProfile">
                            <a href="admin/profile.do"><spring:message
                                    code="label.change.profile"/></a>
                        </li>
                        <li id="preferences">
                            <a href="admin/preferences.do"><spring:message
                                    code="label.preferences"/></a>
                        </li>
                        <li id="password">
                            <a href="/admin/password.do"><spring:message
                                    code="label.change.password"/></a>
                        </li>
                            <%--<li>
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
                            </li>--%>
                    </ul>
                    <!-- /.nav-second-level -->
                </li>
            </au:check>
        </ul>
        <!-- /#side-menu -->
    </div>
    <!-- /.sidebar-collapse -->
</nav>
<sitemesh:write property="body"/>
</body>
</html>