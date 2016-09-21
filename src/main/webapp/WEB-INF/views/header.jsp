<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="icon" href="resources/img/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="resources/img/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="resources/css/bootstrap.css" type="text/css" media="screen">
<link rel="stylesheet" href="resources/css/responsive.css" type="text/css" media="screen">
<link rel="stylesheet" href="resources/css/style.css" type="text/css" media="screen">
<link rel="stylesheet" href="resources/css/image.css" type="text/css" media="screen">
<link rel="stylesheet" href="resources/css/touchTouch.css" type="text/css" media="screen">
<link rel="stylesheet" href="resources/css/kwicks-slider.css" type="text/css" media="screen">
<link rel="stylesheet" href="css/normalize.css">
<link rel="stylesheet" href="resources/css/mystyle.css" type="text/css" media="screen">
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300' rel='stylesheet' type='text/css'>
<script src="resources/js/jquery.js"></script>
<script src="resources/js/superfish.js"></script>
<script src="resources/js/jquery.flexslider-min.js"></script>
<script src="resources/js/jquery.kwicks-1.5.1.js"></script>
<script src="resources/js/jquery.easing.1.3.js"></script>
<script src="resources/js/jquery.cookie.js"></script>
<script src="resources/js/touchTouch.jquery.js"></script>
<script>
if ($(window).width() > 1024) {
    document.write("<" + "script src='resources/js/jquery.preloader.js'></" + "script>");
}
</script>
<script>

jQuery(window).load(function () {
    $x = $(window).width();
    if ($x > 1024) {
        jQuery("#content .row").preloader();
    }
    jQuery('.magnifier').touchTouch();
    jQuery('.spinner').animate({
        'opacity': 0
    }, 1000, 'easeOutCubic', function () {
        jQuery(this).css('display', 'none')
    });
});
</script>
<title>CASA MOBEL</title>
</head>
<body style="background-image: url('resources/img/bg-content.jpg');">
<div class="container clearfix">
    <div class="row">
      <div class="span12">
        <div class="navbar navbar_">
          <div class="container">
            <h1 class="brand brand_"><a href="index.jsp"><img alt="" src="resources/img/logo.jpg"> </a></h1>
            <a class="btn btn-navbar btn-navbar_" data-toggle="collapse" data-target=".nav-collapse_">Menu <span class="icon-bar"></span> </a>
            <div class="nav-collapse nav-collapse_  collapse">
              <ul class="nav sf-menu">
              <c:choose>
    			<c:when test="${sessionScope.UserLoggedIn == null}">
       				<li><a href="index.jsp">Home</a></li>
                	<li><a href="about">About</a></li>
                	<li><a href="contactus">Contact</a></li>
                	<li><a href="ppage">Products</a></li>
	                <li><a href="Login">LogIn</a></li>
    			</c:when>
    			<c:when test="${sessionScope.UserLoggedIn !='Administrator'}">
    				<li><a href="index.jsp">Home</a></li>
                	<li><a href="about">About</a></li>
                	<li><a href="contactus">Contact</a></li>
                	<li><a href="ppage">Products</a></li>
                	<li><a href="restpass">change</a></li>
                	<li><a href="cart" id="cart"><img src="resources/img/shopping-cart-icon-515.png" height="25" width="25" /></a></li>                	
                	<li><a href="perform_Logout">LogOut</a></li>
                </c:when>
    			<c:otherwise>
        			<li class="sub-menu"><a href="admin">Catagory</a>
		<ul>
			<li><a href="addcatagory">Add</a></li>
    		<li><a href="catagory">Show</a></li>                    
    	</ul>
	</li>                
    <li class="sub-menu"><a href="admin">Seller</a>
        <ul>
            <li><a href="addseller">Add</a></li>
            <li><a href="seller">Show</a></li>                    
        </ul>
     </li>
     <li class="sub-menu"><a href="admin">Product</a>
         <ul>
              <li><a href="addproduct">Add</a></li>
              <li><a href="product">Show</a></li>                    
         </ul>
     </li>  
     <li class="sub-menu"><a href="admin">User</a>
     <ul>
     	  <li><a href="#">Show</a></li>                    
     </ul>
     </li>
     <li class="sub-menu"><a href="perform_Logout">LogOut</a></li>
    			</c:otherwise>
				</c:choose>
				</ul>
				<h5><p>${sessionScope.UserLoggedIn}</p></h5>
             </div>
          </div>
        </div>
          </div>
    </div>
  </div>
    <script src="resources/WebContent/js/bootstrap.js"></script>
