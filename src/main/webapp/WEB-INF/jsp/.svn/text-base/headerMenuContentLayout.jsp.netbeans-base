<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en" class="csstransforms csstransforms3d csstransitions">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Ticket Machine">
        <meta name="author" content="Bjorn Vandenbussche">
        <link rel="shortcut icon" href="favicon.ico">
        <title><tiles:getAsString name="title"/></title>
        <link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/css/ui.totop.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/css/prettyPhoto.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/css/stylesheet.css" rel="stylesheet"> 
        <link href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/css/toastr.css" rel="stylesheet">
        <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
        <link href='http://fonts.googleapis.com/css?family=Roboto:900,400,700' rel='stylesheet' type='text/css'>
        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
        <script src="scripts/html5shiv.js"></script>
        <script src="scripts/respond.min.js"></script>
        <![endif]-->
        <style type="text/css"></style><style type="text/css"></style><style>[touch-action="none"]{ -ms-touch-action: none; touch-action: none; }[touch-action="pan-x"]{ -ms-touch-action: pan-x; touch-action: pan-x; }[touch-action="pan-y"]{ -ms-touch-action: pan-y; touch-action: pan-y; }[touch-action="scroll"],[touch-action="pan-x pan-y"],[touch-action="pan-y pan-x"]{ -ms-touch-action: pan-x pan-y; touch-action: pan-x pan-y; }</style>
        
        <script src="${pageContext.request.contextPath}/resources/scripts/jquery-2.0.3.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/scripts/jquery-migrate-1.2.1.min.js"></script> 
    </head>

    <body style="">
        <div class="wrap">
            <tiles:insertAttribute name="header" />

            <tiles:insertAttribute name="body"/>
            <tiles:insertAttribute name="footer"/>
        </div>

        <!-- Placed At The End Of The Document So Page Loads Faster -->
        <script src="${pageContext.request.contextPath}/resources/scripts/jquery-2.0.3.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/scripts/jquery-migrate-1.2.1.min.js"></script>    
        <script src="${pageContext.request.contextPath}/resources/scripts/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/scripts/jquery.prettyPhoto.js"></script> <!-- easy lightbox kind of feature -->
        <script src="${pageContext.request.contextPath}/resources/scripts/easing.js"></script> <!-- eases box fades etc -->
        <script src="${pageContext.request.contextPath}/resources/scripts/jquery.ui.totop.min.js"></script> <!-- go back to top easily if scrolled down -->
        <script src="${pageContext.request.contextPath}/resources/scripts/morris.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/scripts/raphael-min.js"></script>



        <script type="text/javascript">
            var tpj = jQuery;
            tpj.noConflict();
            tpj(document).ready(function() {

                // PrettyPhoto
                tpj("a[rel^='prettyPhoto']").prettyPhoto({
                    theme: 'light_square',
                    social_tools: false
                });

                // jQuery UItoTop
                tpj().UItoTop({easingType: 'easeOutQuart'});

                tpj(".<tiles:getAsString name="mySelectedPage"/>").addClass("active");

                tpj("[rel=tooltip]").tooltip();

            });
        </script>
        <a href="#" id="toTop" style="display: none;"><span id="toTopHover"></span>To Top</a>
    </body>
</html>

