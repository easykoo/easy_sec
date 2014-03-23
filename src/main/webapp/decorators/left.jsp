<!DOCTYPE html>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" isELIgnored="false" %>

<%@ taglib prefix="au" uri="authorize" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<base href="<%=basePath%>">
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
            <au:check test="/account/allAccount.do">
                <li id="account">
                    <a href="account/allAccount.do"><i class="fa fa-users fa-fw"></i> <spring:message
                            code="label.all.account"/></a>
                </li>
            </au:check>
            <au:check test="/feedback/allFeedback.do">
                <li id="feedback">
                    <a href="/feedback/allFeedback.do"><i class="fa fa-edit fa-fw"></i> <spring:message
                            code="label.all.feedback"/></a>
                </li>
            </au:check>
            <%--<au:check test="/notice/allNotice.do">
                <li id="notice">
                    <a href="javascript:"><i class="fa fa-volume-up fa-fw"></i> <spring:message
                            code="label.notice"/><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level collapse">
                        <au:check test="/notice/allNotice.do">
                            <li id="allAnnouncement">
                                <a href="notice/allNotice.do"> <spring:message
                                        code="label.all.notice"/></a>
                            </li>
                        </au:check>
                        <au:check test="/notice/publishNotice.do">
                            <li id="announce">
                                <a href="/notice/publishNotice.do"> <spring:message
                                        code="label.publish.notice"/></a>
                            </li>
                        </au:check>
                    </ul>
                    <!-- /.nav-second-level -->
                </li>
            </au:check>--%>
            <au:check test="/product/allProduct.do">
                <li id="product">
                    <a href="javascript:"><i class="fa fa-lightbulb-o fa-fw"></i> <spring:message
                            code="label.product"/><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level collapse">
                        <au:check test="/product/allProduct.do">
                            <li id="allProduct">
                                <a href="product/allProduct.do"> <spring:message
                                        code="label.all.product"/></a>
                            </li>
                        </au:check>
                        <au:check test="/product/publishProduct.do">
                            <li id="publishProduct">
                                <a href="/product/publishProduct.do"> <spring:message
                                        code="label.publish.product"/></a>
                            </li>
                        </au:check>
                        <au:check test="/product/createCategory.do">
                            <li id="editCategory">
                                <a href="/product/editCategory.do"> <spring:message
                                        code="label.manage.category"/></a>
                            </li>
                            <li id="createCategory">
                                <a href="/product/createCategory.do"> <spring:message
                                        code="label.create.category"/></a>
                            </li>
                        </au:check>
                    </ul>
                    <!-- /.nav-second-level -->
                </li>
            </au:check>
            <au:check test="/news/allNews.do">
                <li id="news">
                    <a href="javascript:"><i class="fa fa-lightbulb-o fa-fw"></i> <spring:message
                            code="label.news"/><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level collapse">
                        <au:check test="/news/allNews.do">
                            <li id="allNews">
                                <a href="news/allNews.do"> <spring:message
                                        code="label.all.news"/></a>
                            </li>
                        </au:check>
                        <au:check test="/news/publishNews.do">
                            <li id="publishNews">
                                <a href="/news/publishNews.do"> <spring:message
                                        code="label.publish.news"/></a>
                            </li>
                        </au:check>
                        <%--<au:check test="/news/allNotice.do">
                            <li id="allNotice">
                                <a href="/news/allNotice.do"> <spring:message
                                        code="label.all.notice"/></a>
                            </li>
                            <li id="publishNotice">
                                <a href="/news/publishNotice.do"> <spring:message
                                        code="label.publish.notice"/></a>
                            </li>
                        </au:check>--%>
                    </ul>
                    <!-- /.nav-second-level -->
                </li>
            </au:check>
            <au:check test="/profile/profile.do">
                <li id="profile">
                    <a href="javascript:"><i class="fa fa-wrench fa-fw"></i> <spring:message
                            code="label.profile"/><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level collapse">
                        <li id="changeProfile">
                            <a href="profile/profile.do"> <spring:message
                                    code="label.change.profile"/></a>
                        </li>
                        <%--<li id="preferences">
                            <a href="profile/preferences.do"> <spring:message
                                    code="label.preferences"/></a>
                        </li>--%>
                        <li id="password">
                            <a href="/profile/password.do"> <spring:message
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
            <au:check test="/settings/settings.do">
                <li id="settings">
                    <a href="settings/settings.do"><i class="fa fa-gear fa-fw"></i> <spring:message
                            code="label.settings"/></a>
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