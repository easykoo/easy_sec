<!DOCTYPE html>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" isELIgnored="false" %>

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
<body style="margin-top: 80px">
<div class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index.jsp"><strong><spring:message code="main.title"/></strong></a>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li><a href="index.jsp"><spring:message code="label.home" /></a></li>
                <%--<li class="active"><a href="javascript:">Home</a></li>--%>
                <li><a href="index.jsp#about"><spring:message code="label.about.us" /></a></li>
                <li><a href="index.jsp#contact"><spring:message code="label.contact.us" /></a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <%--<li class="active"><a href="../navbar/">Default</a></li>
                <li><a href="../navbar-static-top/">Static top</a></li>--%>
                <c:choose>
                    <c:when test="${not empty currentAccountSecurity.nickname}">
                        <li class="dropdown">
                            <a href="javascript:" class="dropdown-toggle" data-toggle="dropdown">${currentAccountSecurity.nickname}
                                <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="admin/dashboard.do"><i class="fa fa-dashboard fa-fw"></i> <spring:message code="label.dashboard" /></a></li>
                                <li><a href="account/profile.do"><i class="fa fa-user fa-fw"></i> <spring:message code="label.profile" /></a></li>
                                <li><a href="account/settings.do"><i class="fa fa-gear fa-fw"></i> <spring:message code="label.settings" /></a></li>
                                <li><a href="account/logout.do"><i class="fa fa-sign-out fa-fw"></i> <spring:message code="label.logout" /></a></li>
                            </ul>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="account/login.do"><spring:message code="label.sign.in"/></a></li>
                    <li><a href="account/registerAccountView.do"><spring:message code="label.sign.up"/></a></li></c:otherwise>
                </c:choose>
                <li class="dropdown">
                    <a href="javascript:" class="dropdown-toggle" data-toggle="dropdown"><spring:message code="label.language"/>
                        <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="index.do?locale=zh_CN">中文/简体</a></li>
                        <li><a href="index.do?locale=zh_TW">中文/繁体</a></li>
                        <li><a href="index.do?locale=en">English</a></li>
                        <%--<li class="divider"></li>
                        <li class="dropdown-header">Nav header</li>
                        <li><a href="javascript:">Separated link</a></li>
                        <li><a href="javascript:">One more separated link</a></li>--%>
                    </ul>
                </li>
            </ul>
        </div>
        <!--/.navbar-collapse -->
    </div>
</div>
<sitemesh:write property="body"/>
</body>
</html>