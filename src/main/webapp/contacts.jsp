<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<base href="<%=basePath%>">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="shortcut icon" href="img/favicon.ico">
    <title><spring:message code="main.title"/> - <spring:message code="label.contact.us"/></title>

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

    <link rel="stylesheet" type="text/css" href="css/jquery-ui-1.8.4.custom.css"/>
    <link rel="stylesheet" type="text/css" href="css/ui.selectmenu.css"/>
    <script type="text/javascript" language="javascript" src="js/jquery-ui-1.8.4.custom.min.js"></script>
    <script type="text/javascript" language="javascript" src="js/ui.selectmenu.js"></script>
    <script type="text/javascript" language="javascript" src="js/styled.selectmenu.js"></script>
    <script type="text/javascript" src="js/custom.js"></script>
    <script type="text/javascript" src="js/easykoo.js"></script>

</head>

<body>

<div class="header_img">

    <div class="topnav">
        <div class="container_12">

            <div class="logo"><a href="index.jsp"><img src="img/logo.png" alt="<spring:message code="main.title"/>"
                                                       width="157" height="36"
                                                       border="0"/></a></div>

            <!-- topmenu -->
            <div class="menu-header">

                <ul class="topmenu">
                    <li class="first"><a href="index.do"><span><spring:message code="label.home"/></span></a></li>
                    <li><a href="about.do"><span><spring:message code="label.about.us"/></span></a></li>
                    <li><a href="product.do"><span><spring:message code="label.product"/></span></a></li>
                    <li><a href="join.do"><span><spring:message code="label.join.us"/></span></a></li>
                    <li class="last current-menu-item"><a href="contacts.do"><span><spring:message
                            code="label.contact.us"/></span></a></li>
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
        <div class="bar-icon"><img src="img/icon_contact.png" width="64" height="63" alt=""/></div>
        <div class="bar-title">
            <h1><spring:message code="label.get.in.touch"/></h1>

            <div class="breadcrumbs"><a href="index.do"><spring:message code="label.home"/></a> <spring:message
                    code="label.contact.us"/></div>
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

                <div class="text">
                    <p><img src="img/<spring:message code="language" />_contact_map.jpg" width="600" height="380"
                            alt=""/></p>


                    <div class="contact-form">
                        <h2><spring:message code="label.please.fill.form"/>:</h2>

                        <form action="" method="post" class="ajax_form" name="contactForm"
                              enctype="multipart/form-data">

                            <div class="row field_text alignleft">
                                <label><spring:message code="label.your.name"/>:</label>
                                <input name="name" value="" id="name" class="inputtext input_middle required"
                                       size="40" type="text"/>
                            </div>

                            <div class="row field_text alignleft">
                                <label><spring:message code="label.your.email"/>:</label>
                                <input name="email" value="" id="email" class="inputtext input_middle required"
                                       size="40" type="text"/>
                            </div>
                            <div class="clear"></div>

                            <div class="row field_textarea">
                                <label><spring:message code="label.content"/>:</label>
                                <textarea id="content" name="content" class="textarea textarea_middle required"
                                          cols="40" rows="10"></textarea>
                            </div>

                            <div class="clear"></div>

                            <div class="row field_submit">
                                <span class="reset-link"><a href="#"
                                                            onclick="document.contactForm.reset();return false"><spring:message
                                        code="label.reset.form"/></a></span>
                                <input value="<spring:message code="label.send" />" title="send"
                                       class="contact-submit submit" id="send"
                                       type="submit"/>
                            </div>


                        </form>
                    </div>

                </div>

            </div>
        </div>

        <div class="sidebar">
            <div class="inner">

                <!-- widget contacts -->
                <div class="widget-container widget_contact">
                    <h3><spring:message code="label.contact.us"/>:</h3>

                    <div class="contact-address">
                        <div class="address"><spring:message code="label.northen.address" />
                        </div>
                        <br>
                        <div class="phone"><spring:message code="label.phone" />: +86 (551) 6511 4065</div>
                        <div class="fax"><spring:message code="label.fax" />: +86 (551) 6511 4066</div>
                    </div>

                    <div class="contact-maillist">
                        <div class="contact-mail"><a href="mailto:sales@anhuinorthen.com">sales@anhuinorthen.com</a>
                        </div>
                        <div class="contact-mail"><a href="mailto:support@anhuinorthen.com">support@anhuinorthen.com</a>
                        </div>
                    </div>

                    <br/>

                    <div class="social-box">
                        <div class="row social-mail"><a href="mailto:helpdesk@anhuinorthen.com">helpdesk@anhuinorthen.com</a></div>
                        <div class="row social-twitter"><a href="http://twitter.com/ahnorthen">twitter.com/ahnorthen</a></div>
                        <div class="row social-skype"><a href="callto://linghappy915">linghappy915</a></div>
                        <div class="row social-facebook"><a href="http://facebook.com/ahnorthen">facebook.com/ahnorthen</a></div>

                    </div>

                </div>
                <!--/ widget contacts -->


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
</html>
