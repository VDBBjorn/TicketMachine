<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title><tiles:getAsString name="title"/></title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/loginStyle.css">
        <!--[if lt IE 9]>
          <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
        <link rel="shortcut icon" href="favicon.ico">
        <link href='http://fonts.googleapis.com/css?family=Roboto:900,400,700' rel='stylesheet' type='text/css'><!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <style type="text/css"></style><style type="text/css"></style><style>[touch-action="none"]{ -ms-touch-action: none; touch-action: none; }[touch-action="pan-x"]{ -ms-touch-action: pan-x; touch-action: pan-x; }[touch-action="pan-y"]{ -ms-touch-action: pan-y; touch-action: pan-y; }[touch-action="scroll"],[touch-action="pan-x pan-y"],[touch-action="pan-y pan-x"]{ -ms-touch-action: pan-x pan-y; touch-action: pan-x pan-y; }</style></head>

    <body>
        <div class="container">
            <div id="login-wrapper">
                <form class="form login-form" name='f' action="<c:url value='j_spring_security_check' />" method='POST' role="form">
                    <legend><a class="brand">Ticket<span class="red">Machine</span></a></legend>

                    <div class="body">
                        <c:if test="${not empty message}">
                            <div class="alert alert-success">
                                <spring:message code="login.message.logout"/>
                                <a class="close" data-dismiss="alert" href="#" aria-hidden="true">&times;</a>                                
                            </div>
                        </c:if>
                        <c:if test="${not empty error}">
                            <div class="alert alert-danger">
                                <spring:message code="login.error"/>
                                <a class="close" data-dismiss="alert" href="#" aria-hidden="true">&times;</a>   
                            </div>
                        </c:if>
                        <input class="form-control" type='text' name='j_username' autofocus="true" placeholder="<spring:message code='login.clientnumber'/>"/>
                        <br/>
                        <input class="form-control" type='password' name='j_password' placeholder="<spring:message code='login.password'/>" />
                    </div>

                    <div class="footer">
                        <label class="checkbox inline">
                            <input type="checkbox" id="inlineCheckbox1" value="true" name="_spring_security_remember_me"> <spring:message code='login.remember'/>
                        </label>
                        <br/><br/>
                        <input class="btn" name="submit" type="submit" value="<spring:message code='login.submit'/>" />
                    </div>
                    <div class="language">
                        <a href="?language=en">en</a> | <a href="?language=nl">nl</a>
                    </div>
                </form>
            </div>            
        </div>

        <!-- Placed at the end of the document so the pages load faster -->
        <script src="${pageContext.request.contextPath}/resources/scripts/jquery-2.0.3.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/scripts/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/scripts/jquery.backstretch.min.js"></script>
        <script type="text/javascript">
            var tpj = jQuery;
            tpj.noConflict();
            tpj(document).ready(function() {

                tpj.backstretch([
                    "${pageContext.request.contextPath}/resources/images/login_wallpaper.png"
                ], {duration: 3000, fade: 750});

            });
        </script>
    </body>
</html>