<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<spring:url value="/loyaltyCard/" var="loyaltyUrl"/>
<section class="loyaltyCards">
    <div class="container wrapper-2">
        <div class="panel-group">  
            <div class="row">
                <div class="col-md-12">
                    <h5 class="subpage-title"><spring:message code="mainHeader.loyaltyCard"/></h5>
                    <c:forEach var="loyaltyCards" items="${cardsByType}" varStatus="count">
                        <c:set var="x" value="${count.index}"/> 
                        <c:if test="${loyaltyCards.value.size()>0}">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapse${x}">
                                            <spring:message code="loyaltycard.${loyaltyCards.key}"/>                                   
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapse${x}" class="panel-collapse collapse in">
                                    <div class="panel-body">
                                        <div class="row">
                                            <c:forEach var="card" items="${loyaltyCards.value}">
                                                <div class="col-sm-4 receipt-wrapper">
                                                    <a href="${loyaltyUrl}${card.getCardId()}.htm">
                                                        <div class="loyaltyCard">
                                                            <span class="loyaltyCard-icon">
                                                                <i class="icon-credit-card"></i>
                                                            </span>
                                                            <c:if test="${card.getType().equals('categorySavingsCard')}">
                                                                <h4>${card.category.name}</h4>
                                                                <p>${card.points} <spring:message code="loyaltycard.points"/></p>
                                                            </c:if>
                                                            <c:if test="${card.getType().equals('generalSavingsCard')}">
                                                                <h4>${card.store.name}</h4>
                                                                <p>${card.savingPercentage}%</p>
                                                            </c:if>
                                                            <c:if test="${card.getType().equals('productSavingsCard')}">
                                                                <h4>${card.product.name}</h4>
                                                                <p>${card.points} <spring:message code="loyaltycard.points"/></p>
                                                            </c:if>
                                                        </div>
                                                    </a>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </c:if>
                    </c:forEach>  
                </div>
            </div>
        </div>
    </div>
</section>