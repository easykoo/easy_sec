<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<base href=" <%=basePath%>">
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
                    <li><a href="javascript:"><span><spring:message code="label.product"/></span></a></li>
                    <li><a href="javascript:"><span><spring:message code="label.about.us"/></span></a></li>
                    <li class="last current-menu-item"><a href="contacts.do"><span><spring:message
                            code="label.contact.us"/></span></a></li>
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
            <h1>Get in <span>touch</span> with us!</h1>

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
                        <h2>Please fill in the form below:</h2>

                        <form action="" method="post" class="ajax_form" name="contactForm"
                              enctype="multipart/form-data">

                            <div class="row field_text alignleft">
                                <label>Your name (required):</label>
                                <input name="yourname" value="" id="name" class="inputtext input_middle required"
                                       size="40" type="text"/>
                            </div>

                            <div class="row field_text alignleft">
                                <label>Your email (required):</label>
                                <input name="email" value="" id="email" class="inputtext input_middle required"
                                       size="40" type="text"/>
                            </div>
                            <div class="clear"></div>

                            <div class="row field_select alignleft">
                                <label>Category:</label>
                                <select class="select_styled" name="contact_select_1" id="contact_select_1">
                                    <option value="1">Billing Support</option>
                                    <option value="2">Pre purchase querstion</option>
                                    <option value="3">I’ve lost my tranzaction ID</option>
                                    <option value="4">Dedicated Support Question</option>
                                </select>
                            </div>

                            <div class="row field_text alignleft">
                                <label>Subject:</label>
                                <input name="subject" value="" id="subject" class="inputtext input_middle" size="40"
                                       type="text"/>
                            </div>
                            <div class="clear"></div>

                            <div class="row field_textarea">
                                <label>Subject:</label>
                                <textarea id="message" name="message" class="textarea textarea_middle required"
                                          cols="40" rows="10"></textarea>
                            </div>

                            <div class="clear"></div>

                            <div class="row field_submit">
                                <span class="reset-link"><a href="#"
                                                            onclick="document.contactForm.reset();return false">reset
                                    all fields</a></span>
                                <input value="Send Message" title="send" class="contact-submit submit" id="send"
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
                    <h3>Contact us:</h3>

                    <div class="contact-address">
                        <div class="address">1502, Building A, No 1, Fengle Century Mansion <br/>499# West Changjiang
                            Road, Hefei <br/>Anhui 230031, China
                        </div>
                        <div class="phone">Phone: +86 (551) 6511 4065</div>
                        <div class="fax">Fax: +86 (551) 6511 4066</div>
                    </div>

                    <div class="contact-maillist">
                        <div class="contact-mail"><a href="mailto:sales@anhuinorthen.com">sales@anhuinorthen.com</a>
                        </div>
                        <div class="contact-mail"><a href="mailto:support@anhuinorthen.com">support@anhuinorthen.com</a>
                        </div>
                    </div>

                    <br/>

                    <div class="social-box">
                        <div class="row social-mail"><a href="#">help@anhuinorthen.com</a></div>
                        <div class="row social-twitter"><a href="#">twitter.com/anhuinorthen</a></div>
                        <div class="row social-skype"><a href="#">anhuinorthen</a></div>
                        <div class="row social-facebook"><a href="#">facebook.com/anhuinorthen</a></div>

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

            <div class="col_1_4 col">
                <div class="inner">
                    <h3>What we do</h3>
                    <ul>
                        <li><a href="#">Interactive Technology</a></li>
                        <li><a href="#">Online Marketing</a></li>
                        <li><a href="#">Website Design</a></li>
                        <li><a href="#">Strategy &amp; Analysis</a></li>
                        <li><a href="#">E-Learning</a></li>
                    </ul>
                </div>
            </div>

            <div class="col_1_4 col">
                <div class="inner">
                    <h3>Who We Are</h3>
                    <ul>
                        <li><a href="#">About us</a></li>
                        <li><a href="#">Our History</a></li>
                        <li><a href="#">Vision that drives us</a></li>
                        <li><a href="#">The Mission</a></li>
                    </ul>
                </div>
            </div>

            <div class="col_1_4 col">
                <div class="inner">
                    <h3>Featured work</h3>
                    <ul>
                        <li><a href="#">Silicon App</a></li>
                        <li><a href="#">Art Gallery</a></li>
                        <li><a href="#">Bon Apetit </a></li>
                        <li><a href="#">Exquisite Works</a></li>
                        <li><a href="#">Clean Classy Corp</a></li>
                    </ul>
                </div>
            </div>

            <div class="col_1_4 col">
                <div class="inner">
                    <h3>From our Blog</h3>
                    <ul>
                        <li><a href="#">Just released WS 2.3</a></li>
                        <li><a href="#">Not going to support IE6...</a></li>
                        <li><a href="#">Great feedback from...</a></li>
                        <li><a href="#">Don’t ask when!</a></li>
                        <li><a href="#">Best tutorial on jQuery</a></li>
                    </ul>
                </div>
            </div>
            <div class="divider_space"></div>

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
