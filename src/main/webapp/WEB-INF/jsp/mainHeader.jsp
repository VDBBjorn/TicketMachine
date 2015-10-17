<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<header class="header">
    <nav class="navbar navbar-default" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="${pageContext.request.contextPath}/index.html">Ticket<span>Machine</span></a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav">
                    <li class="home"><a href="${pageContext.request.contextPath}/index.html"><spring:message code="mainHeader.home"/></a></li>
                    <li class="receipts"><a href="${pageContext.request.contextPath}/receipts/last.htm"><spring:message code="mainHeader.receipts"/></a></li>
                    <li class="vouchers"><a href="${pageContext.request.contextPath}/vouchers.htm"><spring:message code="mainHeader.vouchers"/></a></li>
                    <li class="loyaltyCards"><a href="${pageContext.request.contextPath}/loyaltyCard.htm"><spring:message code="mainHeader.loyaltyCard"/></a></li>
                    <li class="shoppingList"><a href="${pageContext.request.contextPath}/shoppingList.htm"><spring:message code="mainHeader.shoppingList"/></a></li>
                    <li class="dropdown settings">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><spring:message code="mainHeader.options"/></a>
                        <ul class="dropdown-menu">
                            <li><a href="${pageContext.request.contextPath}/shoplocations.htm"><spring:message code="mainHeader.stores"/></a></li>
                            <li><a href="${pageContext.request.contextPath}/contact.htm">Contact</a></li>
                            <li><a href="${pageContext.request.contextPath}/personalSettings.htm"><spring:message code="mainHeader.profileSettings"/></a></li>
                            <li><a href="<c:url value="${pageContext.request.contextPath}/j_spring_security_logout" />"><spring:message code="mainHeader.logout"/></a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</header>
