<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html><section class="vouchers">
    <div class="container wrapper-2">
        <div class="panel-group">  
            <c:if test="${not empty ok}">
                <div class="alert alert-success">
                    <spring:message code='vouchers.succes'/>
                    <a class="close" data-dismiss="alert" href="#" aria-hidden="true">&times;</a>   
                </div>
            </c:if>
            <c:if test="${not empty error}">
                <div class="alert alert-danger">
                    <spring:message code='vouchers.error'/>
                    <a class="close" data-dismiss="alert" href="#" aria-hidden="true">&times;</a>   
                </div>
            </c:if>
            <div class="row">
                <div class="col-md-4 col-md-offset-8 sidebar">
                    <form class="contact-form" action="addVoucher.htm" method="POST">
                        <input class="btn btn-flat flat-default btn-sm" type="submit" value="<spring:message code='vouchers.add'/>" style="float: right" />
                        <div style="overflow: hidden; padding-right: .5em;">
                            <input class="form-control" placeholder="<spring:message code="vouchers.add.placeholder"/>" name="voucherId" style="float: right"/> 
                        </div>
                    </form>
                </div>
            </div>
            <c:forEach var="vouchers" items="${vouchersByType}" varStatus="count">
                <c:set var="x" value="${count.index}"/> 
                <c:if test="${vouchers.value.size()>0}">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapse${x}">
                                    <spring:message code="vouchers.${vouchers.key}"/> : ${vouchers.value.size()}                                           
                                </a>
                            </h4>
                        </div>
                        <div id="collapse${x}" class="panel-collapse collapse in">
                            <div class="panel-body">
                                <div class="row">
                                    <spring:url value="/vouchers/" var="voucherUrl"/>
                                    <c:forEach var="v" items="${vouchers.value}">
                                        <div class="col-md-3 receipt-wrapper">
                                            <a href="${voucherUrl}${v.voucherId}.htm">
                                                <div class="voucher">
                                                    <span class="voucher-icon">
                                                        <i class="icon-gift"></i>
                                                    </span>
                                                    <h4>€ ${v.getRemainingValue()}</h4>
                                                    <p><spring:message code="vouchers.validUntil"/> ${v.getExpiryDate()}</p>
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
</section>




