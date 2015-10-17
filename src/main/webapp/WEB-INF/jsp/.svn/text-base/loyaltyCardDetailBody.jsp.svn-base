<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<head>
    <script src="../../resources/scripts/jquery.min.js"></script></head>
<!DOCTYPE html>
<spring:url value="/loyaltyCard/previous/" var="previousCard"/>
<spring:url value="/loyaltyCard/next/" var="nextCard"/>
<spring:url value="/ProductDetail/" var="productdetailURL"/>
<section class="loyaltyCardDetail">
    <div class="container wrapper-2">
        <h5 class="subpage-title"><spring:message code="loyaltycard.loyaltycardDetail"/></h5>
        <div class="col-md-4 col-centered" style="max-width: 320px">
            <div class="row">
                <div class="col-md-6">
                    <form name="previousReceiptForm" action="${previousCard}${loyaltycard.cardId}.htm" method="get" style="float: left">
                        <button id="previousButton" class="btn btn-flat flat-color btn-previous">
                            <spring:message code="general.previous"/>
                        </button>
                    </form> 
                </div>
                <div class="col-md-6">
                    <form name="nextReceiptForm" action="${nextCard}${loyaltycard.cardId}.htm" method="get" style="float: right">
                        <button id="nextButton" class="btn btn-flat btn-next">
                            <spring:message code="general.next"/>
                        </button>
                    </form>
                </div>
            </div>
            <!----------------------------------------------------------------->
            <div class="row">
                <div class="bubble text-center">
                    <div class="rectangle">
                        <h2>
                            <c:choose>
                                <c:when test="${loyaltycard.getType().equals('categorySavingsCard')}">
                                    ${loyaltycard.category.name}
                                </c:when>
                                <c:when test="${loyaltycard.getType().equals('productSavingsCard')}">
                                    <a href="${productdetailURL}${loyaltycard.product.productId}">${loyaltycard.product.name}</a>
                                </c:when>
                                <c:otherwise>
                                    ${loyaltycard.store.name}   
                                </c:otherwise>
                            </c:choose>
                        </h2>
                    </div>
                    <div class="triangle-l"></div>
                    <div class="triangle-r"></div>
                    <div class="info">
                        <p>${loyaltycard.getCreationDateText()} <spring:message code="loyaltycard.until"/> ${loyaltycard.getExpiryDateText()}</p>
                        <c:if test="${loyaltycard.getType().equals('generalSavingsCard')}">
                            <div class="circle col-centered">
                                <div id="percentage" class="centered">${loyaltycard.savingPercentage}%</div>
                            </div>
                        </c:if>
                        <c:if test="${loyaltycard.getType()!='generalSavingsCard'}">
                            <table class="center-table">
                                <tr>

                                    <c:forEach begin="1" end="${loyaltycard.pointsToSave}" varStatus="counter">
                                        <c:if test="${counter.count<=loyaltycard.points}">
                                            <td style="padding:5px;"><i class="fa fa-square" style="font-size: 40px"></i></td>
                                            </c:if>
                                            <c:if test="${counter.count>loyaltycard.points}">
                                            <td style="padding:5px"><i class="fa fa-square-o" style="font-size: 40px"></i></td>
                                            </c:if>
                                            <c:if test="${counter.count%5==0}">
                                        </tr>
                                        <tr>
                                        </c:if>
                                    </c:forEach>
                                </tr>        
                            </table>

                        </c:if>
                        <p><a href="${pageContext.request.contextPath}/barcode/${loyaltycard.barcode}.png" rel="prettyPhoto"><img style="width: 150px"src="${pageContext.request.contextPath}/barcode/${loyaltycard.barcode}.png"></a></p>
                        <p>
                        <h5><spring:message code="loyaltycard.conditions"/></h5>
                        <p>${loyaltycard.comments}</p>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>



<script type="text/javascript">
    $(document).ready(function() {
        document.getElementsByClassName("updateButton")[0].click();
    });
</script>