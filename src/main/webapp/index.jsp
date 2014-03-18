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
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="shortcut icon" href="img/favicon.ico">
    <title><spring:message code="main.title"/> - <spring:message code="label.home"/></title>

    <link href="css/styles.css" media="screen" rel="stylesheet" type="text/css"/>

    <!--[if lte IE 7]>
    <link rel="stylesheet" type="text/css" href="css/styles_ie.css"/>
    <![endif]-->

    <link href="css/gray.css" media="screen" rel="stylesheet" type="text/css"/>

    <script type="text/javascript" language="javascript" src="js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" language="javascript" src="js/jquery.tools.min.js"></script>
    <script type="text/javascript" language="javascript" src="js/general.js"></script>
    <script type="text/javascript" language="javascript" src="js/jquery.easing.1.3.js"></script>

    <link rel="stylesheet" href="css/prettyPhoto.css" type="text/css" media="screen"/>
    <script src="js/jquery.prettyPhoto.js" type="text/javascript"></script>


    <link rel="stylesheet" type="text/css" href="css/home.css"/>
    <script type="text/javascript" language="javascript" src="js/home.js"></script>
    <script type="text/javascript" src="js/easykoo.js"></script>
</head>

<body onload="load_animations()">
<div class="header_img" id="aside2">

    <div class="topnav">
        <div class="container_12">

            <div class="logo"><a href="index.do"><img src="img/logo.png" alt="<spring:message code="main.title"/>"
                                                      width="157" height="36"
                                                      border="0"/></a></div>

            <!-- topmenu -->
            <div class="menu-header">

                <ul class="topmenu">
                    <li class="first current-menu-item"><a href="#"><span><spring:message code="label.home"/></span></a>
                    </li>
                    <li><a href="product.do"><span><spring:message code="label.product"/></span></a></li>
                    <li><a href="about.do"><span><spring:message code="label.about.us"/></span></a></li>
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
                            <li><a href="login.do?url=<%=request.getRequestURL()%>"><span><spring:message
                                    code="label.sign.in"/></span></a></li>
                            <li><a href="register.do"><span><spring:message code="label.sign.up"/></span></a></li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>
            <!--/ topmenu -->
        </div>
    </div>
    <!--/ header -->

    <!-- slider -->

    <div class="container_12">
        <div class="slider">

            <div id="header_images">
                <img src="img/slider1_image_1.jpg" class="header_image" color="#040203" alt="" link="#link1"/>
                <img src="img/slider1_image_2.jpg" class="header_image" color="#2A0413" alt="" link="#link2"/>
                <img src="img/slider1_image_3.jpg" class="header_image" color="#163570" alt="" link="#link3"/>
                <img src="img/slider1_image_4.jpg" class="header_image" color="#000000" alt="" link="#link4"/>
            </div>
            <div class="header_controls">
                <a href="javascript:" id="header_controls_left">Previous</a>
                <a href="javascript:" id="header_controls_right">Next</a></div>
            <div id="overlay_bg"></div>
        </div>
    </div>

    <!--/ slider -->
</div>


<div class="welcome_bar">
    <!-- bar -->
    <div class="container_12 bar">
        <div class="bar-icon"><img src="img/icon_rss.png" width="80" height="80" alt=""/></div>
        <div class="bar-title">
            <h1>Welcome to <span>Envision</span>, the interactive agency!</h1>

            <div class="sub-text">We have a passion for pixel perfect design. But don’t take our word for it, look for
                yourself:
            </div>
        </div>
        <div class="bar-right">
            <a href="javascript:void(0);" class="button_link large_button"><span>View Portfolio</span></a></div>
        <div class="clear"></div>
    </div>
    <!--/ bar -->
</div>


<!-- middle body -->
<div class="middle homepage">
    <div class="container_12">

        <div class="col col_1_3">
            <div class="inner">
                <h2>Multiple Colors &amp; Slider options</h2>

                <p> Sliders in all forms &amp; colors: Javascript, Flash, you<img src="img/temp_img_1.png" alt=""
                                                                                  width="93" height="76"
                                                                                  class="alignright"/> name it! We’ve
                    got it! But the best part is that they can be easily modified to fit your company’s look &amp; feel.
                </p>
                <a href="javascript:" class="link-more">more details</a></div>
        </div>

        <div class="col col_1_3">
            <div class="inner">
                <h2>Award winning design &amp; coding</h2>

                <p>These three icons below the text paragraphs<img src="img/temp_img_2.png" alt="" width="93"
                                                                   height="76" class="alignright"/> are custom created
                    for the Envision theme &amp; the included PSD files contain all the layers needed to edit them. </p>
                <a href="javascript:" class="link-more">more details</a></div>
        </div>
        <div class="col col_1_3">
            <div class="inner">
                <h2>Great support in just 24 hours</h2>

                <p> If you buy this theme we offer 24 hours <img src="img/temp_img_3.png" width="80" height="76"
                                                                 class="alignright" alt=""/>response time on our
                    dedicated support forums. That’s “best in class” support offer, it just can’t get better &amp;
                    faster than this!</p>
                <a href="javascript:" class="link-more">more details</a></div>
        </div>
        <div class="divider_space"></div>

        <div class="box box_white">

            <div class="col col_2_3">
                <div class="inner">
                    <div class="quoteBox-big">
                        <div class="quote-title"><strong>WHAT OTHERS SAY ABOUT US:</strong></div>
                        <div class="quote-text">Over the last eighteen months our sales have increased three-fold since
                            the launch of our new web site. We have to say it has made us delighted we chose Envision.
                        </div>
                        <div class="quote-author"><span class="violet">George Mansion,</span> founder Silicon App Inc
                        </div>
                    </div>
                </div>
            </div>

            <div class="col col_1_3">
                <div class="inner">

                    <!-- newsletter -->
                    <div class="newsletterBox">
                        <div class="bg">
                            <div class="ribbon"></div>
                            <h2>Stay in touch with us!</h2>

                            <div class="before-text">Sign up for our weekly newsletter to receive updates, news, and
                                interesting tidbits.
                            </div>
                            <form action="" method="post">
                                <input type="text" value="" name="" class="inputField"/>
                                <input type="submit" value="" name="" class="btn-submit"/>

                                <div class="clear"></div>
                            </form>
                        </div>
                    </div>
                    <!--/ newsletter -->
                </div>
            </div>

            <div class="clear"></div>
        </div>

        <div class="divider_space"></div>

        <div class="col col_1_2">
            <div class="inner">

                <!-- tab box -->
                <div class="tabBox">
                    <div class="tabTitle"><h3>Services:</h3></div>
                    <ul class="tabs">
                        <li><a href="#tabcontent1"><img src="img/icon_1.png" width="51" height="42" alt=""/></a></li>
                        <li><a href="#tabcontent2"><img src="img/icon_2.png" width="51" height="42" alt=""/></a></li>
                        <li><a href="#tabcontent3"><img src="img/icon_3.png" width="51" height="42" alt=""/></a></li>
                    </ul>

                    <div class="tabcontent">
                        <div class="inner">
                            <img src="img/temp_img_1.jpg" alt="" width="230" height="143" class="alignleft"/>

                            <h3>Creative webdesign</h3>

                            <p>The point of using Lorem Ipsum is that it has a near “more-or-less” normal and
                                distribution of letters.</p>

                            <div class="clear"></div>
                        </div>
                    </div>
                    <div class="tabcontent">
                        <div class="inner">
                            <img src="img/temp_img_2.jpg" alt="" width="230" height="143" class="alignleft"/>

                            <h3>Apps for Mobile phones</h3>

                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod . <a
                                    href="#tabcontent1">Jump to first tab.</a></p>

                            <div class="clear"></div>
                        </div>
                    </div>
                    <div class="tabcontent">
                        <div class="inner">
                            <img src="img/temp_img_3.jpg" alt="" width="230" height="143" class="alignright"/>

                            <h3>Statistics</h3>

                            <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
                                commodo consequat. </p>

                            <div class="clear"></div>
                        </div>
                    </div>
                </div>
                <!--/ tab box -->
            </div>
        </div>

        <div class="col col_1_2">
            <div class="inner">

                <!-- tab box -->
                <div class="tabBox">
                    <div class="tabTitle"><h3>Solutions:</h3></div>
                    <ul class="tabs">
                        <li><a href="#tabcontent1"><img src="img/icon_5.png" width="51" height="42" alt=""/></a></li>
                        <li><a href="#tabcontent2"><img src="img/icon_4.png" width="51" height="42" alt=""/></a></li>
                        <li><a href="#tabcontent3"><img src="img/icon_6.png" width="51" height="42" alt=""/></a></li>
                    </ul>

                    <div class="tabcontent">
                        <div class="inner">
                            <img src="img/temp_img_3.jpg" alt="" width="230" height="143" class="alignleft"/>

                            <h3>Apps for Mobile phones</h3>

                            <p>The point of using Lorem Ipsum is that it has a near “more-or-less” normal and
                                distribution of letters.</p>

                            <div class="clear"></div>
                        </div>
                    </div>
                    <div class="tabcontent">
                        <div class="inner">
                            <h3>Everything for your need!</h3>

                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
                                incididunt ut labore et dolore magna aliqua. </p>

                            <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
                                commodo consequat. </p>

                            <div class="clear"></div>
                        </div>
                    </div>
                    <div class="tabcontent">
                        <div class="inner">
                            <img src="img/temp_img_2.jpg" alt="" width="230" height="143" class="alignleft"/>

                            <h3>Weather</h3>

                            <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
                                commodo consequat. </p>

                            <div class="clear"></div>
                        </div>
                    </div>
                </div>
                <!--/ tab box -->
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
                    <a href="#" class="link-twitter" title="Twitter">Twitter</a>
                    <a href="#" class="link-fb" title="Facebook">Facebook</a>
                    <a href="#" class="link-flickr" title="Flickr">Flickr</a>
                    <a href="#" class="link-da" title="deviantART">deviantART</a>
                    <a href="#" class="link-rss" title="RSS Feed">RSS Feed</a></div>
            </div>

            <div class="col_1_3 col">
                <div class="inner">
                    <p class="copyright">&copy; 2014 <a href="http://easykoo.com/" target="_blank">easykoo.com</a>. All
                        rights reserved!</p>
                </div>
            </div>
            <div class="clear"></div>
        </div>
    </div>
</div>
</body>
</html>
