<%@ page import="org.springframework.web.servlet.support.RequestContextUtils" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="au" uri="authorize-tag" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<base href="<%=basePath%>">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="shortcut icon" href="img/favicon.ico">
    <title><spring:message code="main.title"/> - <spring:message code="label.news"/></title>

    <link href="css/styles.css" media="screen" rel="stylesheet" type="text/css"/>

    <!--[if lte IE 7]>
    <link rel="stylesheet" type="text/css" href="css/styles_ie.css"/>
    <![endif]-->

    <link href="css/gray.css" media="screen" rel="stylesheet" type="text/css"/>

    <script type="text/javascript" language="javascript" src="js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" language="javascript" src="js/jquery.tools.min.js"></script>

    <link rel="stylesheet" href="css/prettyPhoto.css" type="text/css" media="screen"/>
    <script src="js/jquery.prettyPhoto.js" type="text/javascript"></script>

    <script type="text/javascript" language="javascript" src="js/general.js"></script>
    <script type="text/javascript" src="js/easykoo.js"></script>

</head>

<body>

<div class="header_img">

    <div class="topnav">
        <div class="container_12">

            <div class="logo"><a href="index.do"><img src="img/logo.png" alt="<spring:message code="main.title"/>"
                                                      width="157" height="36"
                                                      border="0"/></a></div>

            <!-- topmenu -->
            <div class="menu-header">

                <ul class="topmenu">
                    <li class="first"><a href="index.do"><span><spring:message code="label.home"/></span></a></li>
                    <li><a href="about.do"><span><spring:message code="label.about.us"/></span></a></li>
                    <li class="current-menu-item"><a href="news.do"><span><spring:message
                            code="label.news.center"/></span></a></li>
                    <li><a href="product.do"><span><spring:message code="label.product.display"/></span></a></li>
                    <li><a href="join.do"><span><spring:message code="label.join.us"/></span></a></li>
                    <li class="last"><a href="contacts.do"><span><spring:message code="label.contact.us"/></span></a>
                    </li>
                    <li>
                        <a href="javascript:" class="dropdown-toggle" data-toggle="dropdown"><span><spring:message
                                code="label.language"/></span>
                            <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="javascript:changeLanguage('zh_CN')"><span>中文/简体</span></a></li>
                            <li><a href="javascript:changeLanguage('en')"><span>English</span></a></li>
                        </ul>
                    </li>
                    <c:choose>
                        <c:when test="${not empty currentAccountSecurity.nickname}">
                            <li class="parent">
                                <a href="javascript:" class="dropdown-toggle"
                                   data-toggle="dropdown"><span>${currentAccountSecurity.nickname}</span>
                                    <b class="caret"></b></a>
                                <ul class="sub-menu">
                                    <au:check test="/admin/dashboard.do">
                                        <li><a href="admin/dashboard.do"><span><i class="fa fa-dashboard fa-fw"></i>
                                        <spring:message
                                                code="label.dashboard"/></span></a></li>
                                    </au:check>
                                        <%--<au:check test="/admin/settings.do">
                                            <li><a href="admin/settings.do"><i class="fa fa-gear fa-fw"></i> <spring:message
                                                    code="label.settings"/></a></li>
                                        </au:check>--%>
                                    <au:check test="/profile/profile.do">
                                        <li><a href="profile/profile.do"><span><i
                                                class="fa fa-user fa-fw"></i> <spring:message
                                                code="label.profile"/></span></a></li>
                                    </au:check>
                                    <li><a href="logout.do"><span><i class="fa fa-sign-out fa-fw"></i> <spring:message
                                            code="label.logout"/></span></a></li>
                                </ul>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li><a href="login.do?url=<%=request.getHeader("Referer")%>"><span><spring:message
                                    code="label.sign.in"/></span></a></li>
                            <%--<li><a href="register.do"><span><spring:message code="label.sign.up"/></span></a></li>--%>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>
            <!--/ topmenu -->
        </div>
    </div>
    <!--/ header -->
</div>

<div class="welcome_bar">
    <!-- bar -->
    <div class="container_12 bar">
        <div class="bar-icon"><img src="img/icon_typography.png" width="64" height="64" alt=""/></div>
        <div class="bar-title">
            <h1><span><spring:message code="label.news"/></span></h1>

            <div class="breadcrumbs"><a href="index.do"><spring:message code="label.home"/></a> <spring:message
                    code="label.news.center"/></div>
        </div>
        <div class="clear"></div>
    </div>
    <!--/ bar -->
</div>

<!-- middle body -->
<div class="middle" id="sidebar_right">
    <div class="container_12">

        <div class="wrapper">
            <div class="content">
                <c:if test="${not empty newsList}">
                    <ul>
                    <c:forEach items="${newsList}" var="news">
                        <li style="list-style:none;background-image: url('img/lineH.gif');  background-position: 50% bottom;  background-repeat: repeat-x;  background-repeat-x: repeat;   background-repeat-y: no-repeat;">
                            <div style="padding-bottom: 5px"><a href="news/showNews.do?id=${news.newsId}">${news.title}</a> <span style="color:#7e8496;font-size: 8; float: right;">${news.createDateStr}</span></div>
                        </li>
                    </c:forEach>
                    </ul>
                </c:if>

                <c:if test="${empty newsList}">
                    <spring:message code="message.error.no.record"/>
                </c:if>

                <!--/ gallery list, 1 col -->
                <c:if test="${page.totalPage > 1}">
                    <div align="center" class="clearpagination">
                        <span class="pagination">
                            <span class="inner">
                                <a class="page_prev" href="javascript:previousPage()">&nbsp;</a>
                                <c:forEach begin="1" step="1" end="${page.totalPage}" var="pageNo">
                                    <c:if test="${pageNo == page.pageNo}">${pageNo}</c:if>
                                    <c:if test="${pageNo != page.pageNo}">
                                        <c:choose>
                                            <c:when test="${pageNo < page.pageNo - 5}">
                                                <c:choose>
                                                    <c:when test="${pageNo == page.pageNo - 6}">...</c:when>
                                                    <c:when test="${pageNo == 1}"><a
                                                            href="javascript:goPage(${pageNo})">${pageNo}</a></c:when>
                                                </c:choose>
                                            </c:when>
                                            <c:when test="${pageNo > page.pageNo + 5}">
                                                <c:choose>
                                                    <c:when test="${pageNo == page.pageNo + 6}">...</c:when>
                                                    <c:when test="${pageNo == page.totalPage}"><a
                                                            href="javascript:goPage(${pageNo})">${pageNo}</a></c:when>
                                                </c:choose>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="javascript:goPage(${pageNo})">${pageNo}</a>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:if>
                                </c:forEach>
                                <a class="page_next" href="javascript:nextPage()">&nbsp;</a>
                            </span>
                        </span>
                    </div>
                </c:if>
                <div class="clear"></div>
            </div>
        </div>

        <div class="sidebar">
            <div class="inner">

                <div class="widget-container widget_categories">
                    <ul>
                        <li><a href="news.do"><spring:message code="label.all"/></a></li>
                        <%--<li><a href="news.do?categoryId=${child.categoryId}">${child.cnDescription}</a></li>--%>
                    </ul>
                </div>
            </div>
        </div>

        <div class="clear"></div>
    </div>
</div>
<!--/ middle body -->

<div class="footer">
    <div class="footer_bg">
        <div class="container_12">

            <div class="col_2_3 col">
                <div class="inner">
                    <a href="http://twitter.com/ahnorthen" class="link-twitter" title="Twitter">Twitter</a>
                    <a href="http://facebook.com/ahnorthen" class="link-fb" title="Facebook">Facebook</a>
                </div>
            </div>
            <div class="col_1_3 col">
                <div class="inner">
                    <p class="copyright">&copy; 2014 Anhui Northen. All rights reserved!</p>
                </div>
            </div>
            <div class="clear"></div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    var pageNo = '${page.pageNo}';
    var pageSize = '${page.pageSize}';

    var previousPage = function () {
        var url = 'news.do?pageNo=' + (parseInt(pageNo) - 1) + '&pageSize=' + pageSize;
        window.location.href = url;
    }

    var refresh = function () {
        var url = 'news.do?pageNo=' + parseInt(pageNo) + '&pageSize=' + pageSize;
        window.location.href = url;
    }

    var nextPage = function () {
        var url = 'news.do?pageNo=' + (parseInt(pageNo) + 1) + '&pageSize=' + pageSize;
        window.location.href = url;
    }

    var goPage = function (pageNo) {
        var url = 'news.do?pageNo=' + pageNo + '&pageSize=' + pageSize;
        window.location.href = url;
    }

</script>
</html>
