<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<spring:url value="vouchers.htm" var="voucherUrl"/>
<section class="services">
    <div class="container wrapper-2">

        <h5 class="subpage-title"><spring:message code="home.welcome"/>, ${firstname} ${lastname}</h5>

        <div class="row">
            <div id="myToastClass"></div>
            <div class="col-sm-6 ">
                <a href="receipts/last.htm">
                    <div class="service">
                        <span class="service-icon">
                            <i class="icon-ticket"></i>
                        </span>
                        <h4><spring:message code="home.receipts.title"/></h4>
                        <p><spring:message code="home.receipts.desc"/><br></p>
                    </div>
                </a>
            </div>
            <div class="col-sm-6">
                <a href="vouchers.htm">
                    <div class="service">
                        <span class="service-icon">
                            <i class="icon-gift"></i>
                        </span>
                        <h4><spring:message code="home.vouchers.title"/></h4>
                        <p><spring:message code="home.vouchers.desc"/><br></p>
                    </div>
                </a>
            </div>
            <div class="col-sm-6">
                <a href="loyaltyCard.htm">
                    <div class="service">
                        <span class="service-icon">
                            <i class="icon-credit-card"></i>
                        </span>
                        <h4><spring:message code="home.loyaltyCard.title"/></h4>
                        <p><spring:message code="home.loyaltyCard.desc"/><br></p>
                    </div>
                </a>
            </div>


            <div class="col-sm-6">
                <a href="shoppingList.htm">
                    <div class="service">
                        <span class="service-icon">
                            <i class="icon-shopping-cart"></i>
                        </span>
                        <h4><spring:message code="home.shoppingList.title"/></h4>
                        <p><spring:message code="home.shoppingList.desc"/><br></p>
                    </div>
                </a>
            </div>

        </div>
    </div>
</section>

<script src="${pageContext.request.contextPath}/resources/scripts/toastr.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        <c:if test="${vouchersToExpire.size()>0}">
            toastr.options = {
                "closeButton": true,
                "debug": false,
                "positionClass": "toast-top-right",
                "showDuration": "300",
                "hideDuration": "1000",
                "timeOut": "0",
                "extendedTimeOut": "0",
                "showEasing": "swing",
                "hideEasing": "linear",
                "showMethod": "fadeIn",
                "hideMethod": "fadeOut"
            };
            <c:forEach var="voucher" items="${vouchersToExpire}">
                toastr.warning('<spring:message code="vouchers.${voucher.getVoucherType()}"/> ${voucher.getBarcode()} <spring:message code="home.warning.vouchers.part1"/> <b>${voucher.getDaysToExpire()}</b> <c:if test="${voucher.getDaysToExpire()==1}"><spring:message code="home.warning.vouchers.day"/></c:if><c:if test="${voucher.getDaysToExpire()>1}"><spring:message code="home.warning.vouchers.days"/></c:if> <spring:message code="home.warning.vouchers.part2"/>', '', {onclick: function() {
                window.location.href = "${pageContext.request.contextPath}/vouchers/${voucher.voucherId}.htm";}});
            </c:forEach>
            
        </c:if>
    });
</script>

