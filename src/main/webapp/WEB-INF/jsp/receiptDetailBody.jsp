<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<!DOCTYPE html>

<spring:url value="/receipts/previous/" var="receiptPrevious"/>
<spring:url value="/receipts/next/" var="receiptNext"/>
<spring:url value="/ProductDetail/" var="productDetailUrl"/>


<section class="receipts">
    <div class="container wrapper-2">
        <h5 class="subpage-title"><spring:message code="receiptDetail.title"/> ${receipt.getDate()}</h5>
            <div class="col-md-4 col-centered receipt-wrapper" style="max-width: 320px">         
                <div class="row">
                    <div class="col-md-6">
                        <form name="previousReceiptForm" action="${receiptPrevious}${receipt.getTicketId()}.htm" method="get" style="float: left">
                            <button id="previousButton" class="btn btn-flat flat-color btn-previous">
                                <spring:message code="general.previous"/>
                            </button>
                        </form> 
                    </div>
                    <div class="col-md-6">
                        <form name="nextReceiptForm" action="${receiptNext}${receipt.getTicketId()}.htm" method="get" style="float: right">
                            <button id="nextButton" class="btn btn-flat btn-next">
                                <spring:message code="general.next"/>
                            </button>
                        </form>
                    </div>
                </div>
                <div class="receipt-detail text-center">
                    <h2>${receipt.getStore().getName()}</h2>
                    <p>
                        ${receipt.getStore().getAddress().getStreet()} ${receipt.getStore().getAddress().getHouseNumber()}<br>
                        ${receipt.getStore().getAddress().getPostalCode()} ${receipt.getStore().getAddress().getCity()}<br>
                        ${receipt.getStore().getPhoneNumber()}
                    </p>
                    ***************************************
                    <p><spring:message code="receiptDetail.number"/> ${receipt.getTicketId()}</p>
                    <p><a href="${pageContext.request.contextPath}/barcode/${receipt.barcode}.png" rel="prettyPhoto"><img style="width: 150px"src="${pageContext.request.contextPath}/barcode/${receipt.barcode}.png"></a></p>
                    <p>${receipt.getDateTime()}</p>
                    <p><spring:message code="receiptDetail.cashdesk"/> ${receipt.cashDesk}<br/>
                       <spring:message code="receiptDetail.operator"/> ${receipt.operator}</p>
                    ***************************************
                    <table class="table-condensed" style="text-align: left; font-size: small; color:black; margin:10px;" align="center">
                    <c:forEach var="line" items="${receipt.getProductLines()}">
                        <tr>
                            <td><a href='${productDetailUrl}${line.getPackingId()}.htm'>${line.getProduct().getName()}</a></td>
                            <td>${line.getAmount()}</td>
                            <td><spring:message code="receiptDetail.pieces"/></td>
                            <td>€</td>
                            <td>${line.getTotalPrice()}</td>
                        </tr>
                    </c:forEach>
                        <tr style="border-top: solid 1px" >
                            <td colspan="3"><b><spring:message code="receiptDetail.total"/></b></td>
                            <td><b>€</b></td>
                            <td><b>${receipt.getTotalPrice()}</b></td>
                        </tr>
                    </table>
                    <p>
                        ***************************************<br/>
                        <spring:message code="receiptDetail.thanks"/>
                        <br/><br/>
                    </p>
                </div>                 
            </div>
        </div>
    </div>
</section>