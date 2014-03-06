<!DOCTYPE html>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<base href=" <%=basePath%>">
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title><spring:message code="main.title"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Easy Security">
    <meta name="author" content="easykoo.com">

    <%--<link href='http://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css'>--%>
    <%--<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>--%>
    <!-- Load The Story -->
    <link id="the-story-css-file" rel="stylesheet" href="css/the-story.min.css" type="text/css">

    <link rel="stylesheet" href="css/p-controls.min.css" type="text/css">
    <%--<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">--%>
    <!-- Favicon -->
    <link rel="shortcut icon" href="img/favicon.ico">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.js"></script>
    <![endif]-->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
</head>

<!-- activate scrollspy -->

<body id="top" data-spy="scroll" data-target=".navbar" data-offset="50">
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="navbar-container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                <span class="sr-only">Toggle navigation</span>
                <i class="fa fa-bars"></i>
            </button>
            <a class="navbar-brand" href="#">Easy Security</a>
        </div>
        <div id="nav-collapse" class="collapse navbar-collapse navbar-ex1-collapse">
            <ul class="nav navbar-nav navbar-right">
                <li class=""><a title="Home page" class="scroll brand-1" href="#home"><spring:message
                        code="label.home"/></a></li>
                <li class=""><a title="Check out our awesome services" href="#features"
                                class=" scroll brand-4"><spring:message code="label.features"/></a></li>
                <li class=""><a title="Themes assets" href="#assets" class="scroll brand-3"><spring:message
                        code="label.assets"/></a></li>
                <li class=""><a title="Who we are" href="#about" class="scroll fadeto brand-4"><spring:message
                        code="label.about.us"/></a></li>
                <li class=""><a title="Get in touch!" href="#contact" class="scroll brand-2"><spring:message
                        code="label.contact.us"/></a></li>

                <li class="dropdown">
                    <a href="javascript:" class="dropdown-toggle" data-toggle="dropdown"><spring:message
                            code="label.language"/>
                        <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="index.do?locale=zh_CN">中文/简体</a></li>
                        <li><a href="index.do?locale=en">English</a></li>
                    </ul>
                </li>
                <c:choose>
                    <c:when test="${not empty currentAccountSecurity.nickname}">
                        <li class="dropdown">
                            <a href="javascript:" class="dropdown-toggle"
                               data-toggle="dropdown">${currentAccountSecurity.nickname}
                                <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="admin/dashboard.do"><i class="fa fa-dashboard fa-fw"></i> <spring:message
                                        code="label.dashboard"/></a></li>
                                <li><a href="account/profile.do"><i class="fa fa-user fa-fw"></i> <spring:message
                                        code="label.profile"/></a></li>
                                <li><a href="account/settings.do"><i class="fa fa-gear fa-fw"></i> <spring:message
                                        code="label.settings"/></a></li>
                                <li><a href="account/logout.do"><i class="fa fa-sign-out fa-fw"></i> <spring:message
                                        code="label.logout"/></a></li>
                            </ul>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="account/loginView.do?url=<%=request.getRequestURL()%>"><spring:message code="label.sign.in"/></a></li>
                        <%--<li><button type="button" class="btn btn-default"><spring:message code="label.sign.in"/></button></li>--%>
                        <li><a href="account/registerAccountView.do"><spring:message code="label.sign.up"/></a></li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </div>
    <!-- /.navbar-container -->
</nav>

<!-- Home Page -->
<div id="home" class="page color-1">
    <div class="inner-page">
        <h2 class="page-headline large">Tell your projects awesome story.</h2>
    </div>
    <div class="row inner-page">
        <div class="col-md-8 col-md-push-4 lazy-container loaded">
            <img class="lazy" alt="Looks great on every device" src="img/home.png" data-original="img/home.png"
                 style="display: block;">
        </div>
        <div class="col-md-4 col-md-pull-8">
            <ul class="big-list">
                <li><i class="fa fa-check"></i> Flat design</li>
                <li><i class="fa fa-tablet"></i> Responsive</li>
                <li><i class="fa fa-cloud"></i> Bootstrap 3</li>
                <li><i class="fa fa-cog"></i> Built with LESS</li>
            </ul>
            <br>
            <a href="#features" title="Check out more freatures!"
               class="scroll btn btn-primary btn-centered"><i class="fa fa-caret-down"></i> Learn more</a>
        </div>
    </div>
</div>
<!-- /#home -->

<!-- Sign up -->
<div class="sign-up color-2 visible-lg">
    <div class="row inner-page">
        <div class="col-md-12">
            <h4 class="pull-left">They say visitors prefer scrolling rather than clicking. We combined both.</h4>
            <a href="#features" class="scroll btn btn-primary pull-right" title="Check out more freatures!"><i
                    class="fa fa-caret-down"></i> Scroll down</a>
        </div>
    </div>
</div>
<!-- /.sign-up -->

<!-- Feature page-->
<div id="features" class="page color-4">
    <div class="inner-page">
        <h2 class="page-headline">Why should you choose The Story</h2>
    </div>

    <div class="inner-page row">
        <ul class="features list-inline">
            <li>
                <h3><i class="fa fa-cog"></i> Make it your own</h3>

                <p>Easily change every color, by changing just few variables. Add or remove pages, and choose from 600+
                    fonts.</p>
            </li>
            <li>
                <h3><i class="fa fa-heart"></i> Page speed</h3>

                <p>The theme is optimized to ensure fast loading time by lazy-loading of images and beeing minimal by
                    design.</p>
            </li>
            <li>
                <h3><i class="fa fa-tablet"></i> For every device.</h3>

                <p>
                    <strong>The Story</strong>is built to look great on every device. Custom menu for mobile devices, to
                    ensure the best expierence.</p>
            </li>
        </ul>
    </div>

    <div class="row inner-page">
        <div class="col-md-6 lazy-container loaded">
            <img class="figurette lazy" src="img/two-phones.png" data-original="img/two-phones.png" alt="Zombie ipsum"
                 style="display: block;">
        </div>
        <div class="col-md-6">
            <h3>All artwork included</h3>

            <p class="lead">Present your project properly. Create your own art from included templates</p>
            <ul class="list-wide">
                <li><i class="fa fa-check"></i> More than 300 awesome icons from <a
                        href="http://fortawesome.github.io/Font-Awesome/" title="awesome font, awesome">Font-awesome</a>
                </li>
                <li><i class="fa fa-check"></i> Browser icons</li>
                <li><i class="fa fa-check"></i> Phone, tablet, laptop, desktop vectors (SVG)</li>
                <li><i class="fa fa-check"></i> 5 Layered PSD files.</li>
            </ul>
        </div>
    </div>

    <hr>

    <!-- Video -->
    <div class="row inner-page">
        <div class="col-md-6 col-md-push-6">
            <div class="btn-container figurette">
                <img src="img/video.png" alt="Play video">
                <a class="lightbox iframe btn-play" target="_blank" href="http://vimeo.com/61693087"><i
                        class="fa fa-play"></i></a>
            </div>
        </div>
        <div class="col-md-6 col-md-pull-6">
            <ul class="big-list">
                <li><i class="fa fa-check"></i> Always latest bootstrap</li>
                <li><i class="fa fa-play"></i> Responsive video</li>
                <li><i class="fa fa-expand"></i> Adaptive, smart lightbox</li>
                <li><i class="fa fa-desktop"></i> All modern browsers supported</li>
            </ul>
            <br>
            <a href="#assets" class="scroll btn btn-primary btn-centered"><i class="fa fa-caret-down"></i> Even
                more features</a>
        </div>
    </div>
</div>
<!-- /#features -->

<!-- Assets page -->
<div id="assets" class="page color-3">
    <div class="inner-page">
        <h2 class="page-headline">Page assets</h2>
    </div>

    <!-- Vectors -->
    <div class="row inner-page">
        <div class="col-md-6 lazy-container loaded">
            <img class="figurette lazy" alt="Original vectors" src="img/responsive-vectors.png"
                 data-original="img/responsive-vectors.png" style="display: block;">
        </div>
        <div class="col-md-6">
            <h3>5 vectors included</h3>

            <p class="lead">Zombie ipsum
                <abbr title="HyperText Markup Language" class="initialism">HTML</abbr>reversus ab viral inferno, nam
                rick grimes malum cerebro. De carne lumbering animata corpora quaeirtis.</p>

            <p>The voodoo sacerdos flesh eater, suscitat mortuos comedere carnem virus. Zonbi tattered for solum oculi
                eorum defunctis go lum cerebro..</p>
        </div>
    </div>
    <!-- /vectors -->

    <hr>

    <!-- Big laptop -->
    <div class="row inner-page">
        <div class="col-md-offset-1 col-md-10">
            <div class="lazy-container lazy-large btn-container loaded">
                <div class="btn-container">
                    <img class="figurette lazy " src="img/laptop-blue@2x.png" data-original="img/laptop-blue@2x.png"
                         alt="view image in lightbox" style="display: inline;">
                    <a href="img/superman.jpg" class="lightbox btn-play" target="_blank">
                        <i class="fa fa-search-plus"></i>
                    </a>
                </div>
            </div>
        </div>
    </div>

    <!-- Clients -->
    <div class="clients color-1">
        <div class="inner-page">
            <h2 class="page-headline">Who's using stories.</h2>
        </div>
        <div class="inner-page row">
            <ul class="clients list-inline">
                <li><i class="fa fa-globe"></i> Earth</li>
                <li><i class="fa fa-heart"></i> Love</li>
                <li><i class="fa fa-leaf"></i> Leaves</li>
                <li><i class="fa fa-cloud"></i> Clouds</li>
            </ul>
        </div>
    </div>
</div>
<!-- /#assets -->

<!-- About page -->
<div id="about" class="page color-4">
    <div class="inner-page">
        <h2 class="page-headline">Who are we and how it all got started. Our story.</h2>
    </div>
    <div class="row inner-page">
        <div class="col-md-6  lazy-container loaded">
            <img class="figurette lazy" src="img/green-office.png" data-original="img/green-office.png"
                 alt="Our workspace" style="display: block;">
        </div>
        <div class="col-md-6">
            <h3>Zonbi tattered for solum.</h3>

            <p class="lead">The voodoo sacerdos flesh eater, suscitat mortuos comedere carnem virus. Zonbi tattered for
                solum oculi eorum defunctis go lum cerebro.</p>

            <p>Zombie ipsum reversus ab viral inferno, nam rick grimes malum cerebro. De carne lumbering animata corpora
                quaeritis. Summus brains sit​​, morbo vel maleficia? De apocalypsi gorger omero undead survivor dictum
                mauris. Hi mindless mortuis soulless creaturas, imo evil stalking monstra adventus resi dentevil vultus
                comedat cerebella viventium.</p>
        </div>
    </div>

    <hr>

    <!-- Team -->
    <div class="row inner-page team">
        <div class="col-md-6">
            <img class="pull-left" src="img/co1.png" alt="A cookie">
            <h4>Steven Wang</h4>

            <p>Zombie ipsum reversus ab viral inferno, nam rick grimes malum cerebro. De carne lumbering animata corpora
                quaeritis.</p>
            <ul>
                <li><i class="fa fa-home"></i> <a href="easykoo.com">http://easykoo.com</a>
                </li>
                <li><i class="fa fa-envelope-o"></i> <a href="easykooc@gmail.com">easykooc@gmail.com</a>
                </li>
                <li class="social">
                    <a href="#about"><i class="fa fa-facebook-square"></i></a>
                    <a href="#about"><i class="fa fa-twitter"></i></a>
                    <a href="#about"><i class="fa fa-github-square"></i></a>
                </li>
            </ul>
        </div>
        <div class="col-md-6 team2">
            <img class="pull-left" src="img/cookies.png" alt="A cookie">
            <h4>John Doe</h4>

            <p>Zombie ipsum reversus ab viral inferno, nam rick grimes malum cerebro. De carne lumbering animata corpora
                quaeritis.</p>
            <ul>
                <li><i class="fa fa-home"></i> <a href="prettystrap.com">http://prettystrap.com</a>
                </li>
                <li><i class="fa fa-envelope-o"></i> <a href="info@email.com">info@email.com</a>
                </li>
                <li class="social">
                    <a href="#about"><i class="fa fa-facebook-square"></i></a>
                    <a href="#about"><i class="fa fa-twitter"></i></a>
                    <a href="#about"><i class="fa fa-github-square"></i></a>
                </li>
            </ul>
        </div>
    </div>
</div>
<!-- /#about -->

<!-- Contact page -->
<div id="contact" class="page color-2">
    <div class="inner-page">
        <h2 class="page-headline"><spring:message code="label.touch.and.update"/></h2>
    </div>
    <div class="row inner-page contact">
        <div class="col-md-6">
            <h3><spring:message code="label.leave.message"/></h3>

            <form role="form" id="contact-form" action="common/addFeedback.do" method="post">
                <input id="name" name="name" type="text" class="form-control"
                       placeholder="<spring:message code="label.name" />">
                <input id="email" name="email" type="text" class="form-control"
                       placeholder="<spring:message code="label.email.format" />">
                <textarea id="content" name="content" rows="6" class="form-control"
                          placeholder="<spring:message code="label.your.feedback" />"></textarea>
                <button type="button" id="feedback_btn" class="btn btn-primary btn-centered"><spring:message
                        code="label.send"/></button>
            </form>
        </div>
        <div class="col-md-6">
            <div class="btn-container centered lazy-container text-center loaded">
                <img src="img/map.png" class="lazy figurette" alt="Open the map" data-original="img/map.png"
                     style="display: block;">
                <a class="lightbox iframe  btn-map" target="blank" title="Open google maps"
                   href="https://maps.google.com/maps?q=Stationsplein,+1012+Centrum,+Amsterdam,+Noord-Holland,+The+Netherlands&hl=en"><i
                        class="pull-left fa fa-map-marker"></i>

                    <div>xxxxxxx, 1012 AB,<br>xxxxxx,<br> The Netherlands</div>
                </a>
            </div>
        </div>
    </div>
</div>
<!-- /#contact -->

<!-- Newsletter -->
<div class="newsletter color-1">
    <div class="inner-page row">

        <form role="form" id="subscribe-form" action="common/addFeedback.do" method="post">
            <div class="col-md-4">
                <h4><spring:message code="label.subscribe.last.news"/></h4>
            </div>
            <div class="col-md-6">
                <input id="subscribe_mail" type="email" placeholder="xxx@xxx.xxx" name="EMAIL" class="subscribe">
            </div>
            <div class="col-md-2">
                <button id="subscribe_btn" type="submit" class="btn btn-primary pull-right btn-block"><spring:message
                        code="label.subscribe"/></button>
            </div>
        </form>
    </div>
</div>
<!-- /newsletter -->

<!-- The footer, social media icons, and copyright -->
<footer class="page color-5">
    <div class="inner-page row">
        <div class="col-md-6 social">
            <a href="#contact"><i class="fa fa-twitter"></i></a>
            <a href="#contact"><i class="fa fa-github-square"></i></a>
            <a href="#contact"><i class="fa fa-facebook-square"></i></a>
            <a href="#contact"><i class="fa fa-google-plus-square"></i></a>
        </div>
        <div class="col-md-6 text-right copyright">
            © 2014 <a href="http://easykoo.com/" title="twitter bootstrap themes">easykoo.com</a> | all rights
            reserved | <a href="#top" title="Got to top" class="scroll">To top <i
                class="fa fa-caret-up"></i></a>
        </div>
    </div>
</footer>
<script src="js/jquery-1.10.2.js"></script>
<script src="js/jquery.validate.min.js"></script>

<!-- JQUERY END -->
<script src="js/p-controls.min.js"></script>
<!--Main js file. -->
<script src="js/the-story.min.js"></script>

<script type="text/javascript">

    $(document).ready(function () {
        $("#contact-form").validate({
            rules: {
                name: "required",
                email: {
                    required: true,
                    email: true
                },
                content: {
                    required: true,
                    minength: 5
                }
            },
            messages: {
                name: "请输入姓名",
                email: {
                    required: "请输入Email地址",
                    email: "请输入正确的email地址"
                },
                content: {
                    required: "请输入内容",
                    minlength: jQuery.format("内容不能小于{0}个字符")
                }
            },
            highlight: function (element) {
                $(element).closest('.control-group').removeClass('success').addClass('error');
            },
            success: function (element) {
//                element.text('OK!').addClass('valid')
//                        .closest('.control-group').removeClass('error').addClass('success');
                element.addClass('valid')
                        .closest('.control-group').removeClass('error').addClass('success');
            },
            submitHandler:function(form){
                alert("submitted");
                form.submit();
            }
        });

        /*$('#feedback_btn').click(function () {
            $.ajax('ajax/addFeedback.do', {
                dataType: 'json',
                data: $("#contact-form").serialize(),
                success: function (data) {
                    if (data == 'true') {
                        alert('发表成功!');
                    }
                }
            });
        });*/

        function isEmail(email) {
            var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
            return regex.test(email);
        };
        $('#subscribe_btn').click(function () {
            var mail = $('#subscribe_mail').val();
            if (isEmail(mail)) {
                $.ajax('ajax/subscribe.do', {
                    dataType: 'json',
                    data: {
                        email: mail
                    },
                    success: function (data) {
                        if (data == 'true') {
                            alert('订阅成功!');
                        }
                    }
                });
            } else {
                alert('请输入正确的email格式');
            }
        })
    })
</script>
</body>
</html>