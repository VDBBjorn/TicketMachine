<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>

<spring:url value="/vouchers/previous/" var="voucherPrevious"/>
<spring:url value="/vouchers/next/" var="voucherNext"/>
        
<section class="vouchers">
    <div class="container wrapper-2">
        <h5 class="subpage-title"><spring:message code="voucherDetail.title"/></h5>
        <div class="row"> 
            <div class="col-md-3 col-centered receipt-wrapper" style="max-width: 280px">    
                <div class="row">
                    <div class="col-md-6">
                        <form name="previousVoucherForm" action="${voucherPrevious}${voucher.getVoucherId()}.htm" method="get" style="float: left">
                            <button id="previousButton" class="btn btn-flat btn-previous">
                                <spring:message code="general.previous"/>
                            </button>
                        </form> 
                    </div>
                    <div class="col-md-6">
                        <form name="nextVoucherForm" action="${voucherNext}${voucher.getVoucherId()}.htm" method="get" style="float: right">
                            <button id="nextButton" class="btn btn-flat btn-next">
                                <spring:message code="general.next"/>
                            </button>
                        </form>
                    </div>
                </div>
                <div class="receipt-detail text-center">
                    <h2>${voucher.getStore().getName()}</h2>
                    <p>
                        ${voucher.getStore().getAddress().getStreet()} ${voucher.getStore().getAddress().getHouseNumber()}<br>
                        ${voucher.getStore().getAddress().getPostalCode()} ${voucher.getStore().getAddress().getCity()}<br>
                        ${voucher.getStore().getPhoneNumber()}
                    </p>
                    ***************************************
                    <p><spring:message code="vouchers.${voucher.getVoucherType()}"/></p>
                    <h5 style="color:black"><b><spring:message code="voucherDetail.value"/> € ${voucher.getRemainingValue()}</b></h5>
                    <p><spring:message code="voucherDetail.validUntil"/> ${voucher.getExpiryDate()}</p>
                    <p><a href="${pageContext.request.contextPath}/barcode/${voucher.barcode}.png" rel="prettyPhoto"><img style="width: 150px"src="${pageContext.request.contextPath}/barcode/${voucher.barcode}.png"></a></p>

                    <p>
                        ***************************************<br/>
                        <spring:message code="voucherDetail.goodbye"/>
                        <br/><br/>
                    </p>
                </div>  
            </div> 
        </div>
    </div>
</section>