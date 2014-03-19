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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>ENVISION - Typography</title>

<link href="styles.css" media="screen" rel="stylesheet" type="text/css" />

<!--[if lte IE 7]>
<link rel="stylesheet" type="text/css" href="styles_ie.css" />
<![endif]--> 

<link href="styles/gray.css" media="screen" rel="stylesheet" type="text/css" />

<script type="text/javascript" language="javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" language="javascript" src="js/jquery.tools.min.js"></script>

<link rel="stylesheet" href="css/prettyPhoto.css" type="text/css" media="screen" />
<script src="js/jquery.prettyPhoto.js" type="text/javascript"></script>

<script type="text/javascript" language="javascript" src="js/general.js"></script>

</head>

<body>

<div class="header_img">
	
    <div class="topnav">
    <div class="container_12">
		<div class="logo"><a href="index.html"><img src="images/logo.png" alt="ENVISION" width="157" height="36" border="0" /></a></div>

<!-- topmenu -->            
        <div class="menu-header">
        
	        <ul class="topmenu">
				<li class="parent first"><a href="#"><span>Sliders</span></a>
                	<ul class="sub-menu">
                        <li class="first"><a href="index.html"><span>Main slider</span></a></li>
                        <li><a href="index-slider-images.html"><span>Nivo slider</span></a></li>
                        <li><a href="index-slider-text.html"><span>Text / Video slider</span></a></li>                        
                    </ul>
                </li>
              	<li class="parent"><a href="#"><span>Pages</span></a>
                    <ul class="sub-menu">
                        <li class="first"><a href="page-sidebar-r.html"><span>Pages with Sidebar</span></a></li>
                        <li class="parent"><a href="#"><span>Portfolio pages</span></a>
                        	<ul class="sub-menu">
                            	<li class="first"><a href="portfolio.html"><span>1 column with Sidebar</span></a></li>
                            	<li><a href="portfolio-2cols.html"><span>2 columns with Sidebar</span></a></li>
                                <li><a href="portfolio-3cols.html"><span>3 columns Full Width</span></a></li>
                                <li class="last"><a href="portfolio-4cols.html"><span>4 columns Full Width</span></a></li>
                             </ul>
                        </li>
                        <li class="last"><a href="page-pricing.html"><span>Pricing page</span></a></li>
                    </ul>
              </li>
              <li class="parent"><a href="#"><span>Styles</span></a>
              		<ul class="sub-menu">
                        <li class="first"><a href="styles-columns.html"><span>Column Shortcodes</span></a></li>
                        <li class="current-menu-item"><a href="styles-typography.html"><span>Typography</span></a></li>
						<li class="last"><a href="styles-shortcodes.html"><span>HTML Shortcodes</span></a></li>                        
                    </ul>
              </li>
              <li class="parent"><a href="#"><span>Portfolio</span></a>
					<ul class="sub-menu">
                        <li class="first parent"><a href="#"><span>With sidebar</span></a>
                        	<ul class="sub-menu">
                            	<li class="first"><a href="portfolio.html"><span>1 column</span></a></li>
                            	<li class="last"><a href="portfolio-2cols.html"><span>2 columns</span></a></li>
                             </ul>
                        </li>
                        <li class="parent last"><a href="#"><span>Full width</span></a>	
                        	<ul class="sub-menu">
                                <li><a href="portfolio-3cols.html"><span>3 columns</span></a></li>
                                <li class="last"><a href="portfolio-4cols.html"><span>4 columns</span></a></li>
                             </ul>
						</li>										
                    </ul>
              </li>
              <li><a href="blog.html"><span>Blog</span></a></li>
              <li class="last"><a href="contacts.html"><span>Contact</span></a></li>
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
        <div class="bar-icon"><img src="images/icon_typography.png" width="64" height="64" alt="" /></div>
        <div class="bar-title">
            <h1>Page with <span>Typography</span> examples</h1>
            <div class="breadcrumbs"><a href="index.html">Homepage</a> <a href="styles.html">Styles</a> Typography</div>
        </div>
        <div class="bar-right">
        	
            <div id="search-2" class="widget-container widget_search">
                <form method="get" id="searchform" action="">
                    <div>
                        <label class="screen-reader-text" for="s">Search for:</label>
                        <input type="text" name="s" id="s" value="Search" onfocus="if (this.value == 'Search') {this.value = '';}" onblur="if (this.value == '') {this.value = 'Search';}" />
                        <input type="submit" id="searchsubmit"  value="Search" onfocus="if (this.value == 'Search') {this.value = '';}" onblur="if (this.value == '') {this.value = 'Search';}" />
                    </div>
                </form>
            </div>
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
                        
						<h1>Typography & paragraph styles (h1)</h1>
                        
                      <blockquote>
                        <div class="inner">
                        <p>I've gotten burned over Cheryl Tiegs, blown up for Raquel Welch. But when I end up in the hay it's only hay, hey hey. I might jump an open drawbridge, or Tarzan from a vine. 'Cause I'm the unknown stuntman that makes Eastwood look so fine.</p>
                        </div>
                      </blockquote>
                        
					<h2>Subtitle of the paragraph (h2)</h2>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod   tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim   veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea   commodo consequat.Duis aute irure dolor in reprehenderit in voluptate   velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint   occaecat cupidatat non proident, sunt in culpa qui officia deserunt   mollit anim id est laborum.</p>
                        
					<h3>Example of h3 tag</h3>
                    
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod   tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim   veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea   commodo consequat.Duis aute irure dolor in reprehenderit in voluptate   velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint   occaecat cupidatat non proident, sunt in culpa qui officia deserunt   mollit anim id est laborum.</p>                        
                        
                    <h4>Example of h4 tag</h4>
                    <h5>Example of h5 tag</h5>
                    <h6>Example of h6 tag</h6>
                    <p>Duis aute irure dolor in reprehenderit in voluptate   velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint   occaecat cupidatat non proident, sunt in culpa qui officia deserunt   mollit anim id est laborum.</p>
                    
                    <h2>Drop Caps & Pull Quotes</h2>
                    
                    <p><span class="dropcap2">H</span>ey there where ya goin', not exactly knowin', who says you have to call just one place home. He's goin' everywhere, B.J. McKay and his best friend Bear. He just keeps on movin', ladies keep improvin', every day is better than the last. New dreams and lorem ipsum better scenes. <span class="quote_right">80 days around the world, we'll find a pot of gold just sitting where the rainbow's ending white wings of the wind.</span> At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. </p>
                        <p>Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae.</p>
                      <p> Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.</p>
                        
                        <h2>Text Styles</h2>
                        <p><em>Example of emphasised text</em><br />
                          <strong>Example of strong text</strong><br />
                          <a href="#">Example of link text</a><br />
                        <span class="text_deleted">Example of deleted text</span></p>
                        
                        <h2>Example of Unordered List</h2>
                        
                        <ul>
	                        <li>Example af List element</li>
                            <li>Example af List element</li>
                            <li>Example af List element</li>
						</ul>  
                        
                        <h2>Example of Ordered List</h2>
                        
                        <ol>
	                        <li>Example af List element</li>
                            <li>Example af List element</li>
                            <li>Example af List element</li>
						</ol>                                                    
                        
                                                
                  </div>
                </div>
            </div>
            
            <div class="sidebar">
            	<div class="inner">
	            	
                   
                    <div class="widget-container widget_categories">
                    	<h3>Styles:</h3>
                        <ul>
                        	<li><a href="styles-typography.html">Typography</a></li>
                            <li><a href="styles-shortcodes.html">HTML Shortcodes</a></li>
                            <li><a href="styles-columns.html">Column Layouts</a></li>
                            <li><a href="styles-colors.html">Colors</a>
                            	<ul>
                                	<li><a href="#">Blue</a></li>
                                    <li><a href="#">Orange</a></li>
                                    <li><a href="#">Green</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    
                    
                   
                    
					<a href="contacts.html" class="button_link large_button"><span>Contact us for a quote</span></a>                    
                  
                    
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
                <a href="#" class="link-rss" title="RSS Feed">RSS Feed</a>            </div>
        </div>
        
        <div class="col_1_3 col">
	        <div class="inner">
            	<p class="copyright">&copy; 2013 <a href="http://phpjz.cn/" target="_blank">phpjz.cn</a>. Please don’t steal!</p>
          </div>
        </div>
        <div class="clear"></div>
    </div>
</div>
</div>

<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
</html>
