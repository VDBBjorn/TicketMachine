<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>

<section class="receipts">
    <div class="container wrapper-2">
        <div class="panel-group">  
            <div class="row">
                <div class="col-sm-6">
                    <h5 class="subpage-title"><spring:message code="receipts.title"></spring:message></h5>
                    </div>
                    <div class="col-md-6 sidebar">

                        <div class="row">
                            <div class="col-md-6">
                                <select id="timespan" name="timespan" class="form-control">
                                    <option value="week"><spring:message code="report.dropdown.week"/></option>
                                <option value="month"><spring:message code="report.dropdown.month"/></option>
                                <option value="year"><spring:message code="report.dropdown.year"/></option>
                            </select>
                        </div>
                        <div class="col-md-3"><input type="button" class="btn btn-flat flat-default btn-sm" onclick="expenseReportClick();" value="<spring:message code="receipts.expenseReport"/>" style="float: right"/></div>
                        <div class="col-md-3"><input type="button" class="btn btn-flat flat-default btn-sm" onclick="nutritionalReportClick();" value="<spring:message code="receipts.nutritionalReport"/>" style="float: right;margin-right: 5px;"/></div>

                    </div>
                </div>                     
            </div>            
        </div>

        <spring:url value="/receipts/" var="receiptUrl"/>
        <c:choose>
            <c:when test="${not empty receipts}">
                <c:forEach var="r" items="${receipts}">
                    <div class="col-sm-2 receipt-wrapper">
                        <a href="${receiptUrl}${r.ticketId}.htm">
                            <div class="receipt">
                                <div class="receipt-thumb">
                                    <img src="resources/images/code93.gif" class="img-responsive" alt="Receipt">
                                    <div class="overlay"></div>
                                </div>
                                <div class="receipt-info">
                                    <h5>${r.getDate()}</h5>
                                    <span>€ ${r.getTotalPrice()}</span>
                                </div>
                            </div>
                        </a>
                    </div>
                </c:forEach>        
            </c:when>
            <c:otherwise>
                <div class="row">
                    <div class="col-sm-12">
                        <h5><spring:message code="receipts.notfound"/></h5>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>

        <div class="row">
            <div class="col-md-2 col-md-offset-10 sidebar">
                <c:if test="${period == 'last'}">
                    <input type="button" class="btn btn-flat flat-default btn-sm" onclick="location.href = 'receipts/all';" value="<spring:message code="receipts.allReceipts"/>" style="float: right"/>
                </c:if>
                <c:if test="${period == 'all'}">    
                    <input type="button" class="btn btn-flat flat-default btn-sm" onclick="location.href = 'receipts/last';" value="<spring:message code="receipts.lastReceipts"/>" style="float: right"/>
                </c:if>
            </div>
        </div>
    </div>
</div>
</section>

<script type="text/javascript">
    function expenseReportClick() {
        var timespan = document.getElementById("timespan").value;
        window.location.href = "expenseReport/" + timespan + "/all.htm";
    }

    function nutritionalReportClick() {
        var timespan = document.getElementById("timespan").value;
        window.location.href = "nutritionalReport/" + timespan + "/all.htm";
    }

</script>







