<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>

<spring:url value="/ProductDetail/" var="productDetailUrl"/>

<section class="expenseReport">
    <div class="container wrapper-2">
        <div class="row">
            <div class="col-sm-8">
                <h5 class="subpage-title">
                    <c:if test="${timespan!='year'}">
                        <spring:message code="expenseReport.title"/>         
                    </c:if>
                    <c:if test="${timespan=='year'}">
                        <spring:message code="expenseReport.title.year"/> 
                    </c:if>
                    <spring:message code="report.${timespan}"/> 
                </h5>
            </div>
            <div class="col-sm-4 sidebar">
                <input type="button" class="btn btn-flat flat-default btn-sm" onclick="expenseReportClick();" value="<spring:message code="receipts.expenseReport"/>" style="float: right" />
                <div style="overflow: hidden; padding-right: .5em;">
                    <select id="timespan" name="timespan" class="form-control">
                        <option value="week" ${timespan=="week" ? "selected" : ""}><spring:message code="report.dropdown.week"/></option>
                        <option value="month" ${timespan=="month" ? "selected" : ""}><spring:message code="report.dropdown.month"/></option>
                        <option value="year" ${timespan=="year" ? "selected" : ""}><spring:message code="report.dropdown.year"/></option>
                    </select>                    
                </div>
            </div>
        </div>        
        <div class="row">
            <div class="col-md-3 visible-sm visible-xs"  >
                <div id="categoryWell" class="well well-small">
                    <ul>
                        <li class="wellHeader"><spring:message code="report.stores"/></li>
                        <li class="categoryItem">
                            <a href="../${timespan}/all.htm"><i ${storeName=='all' ? "class='icon-ok'" : ""}></i><spring:message code="report.all"/></a>
                        </li>
                        <c:forEach var="store" items="${stores}">
                            <li class="categoryItem">
                                <a href="../${timespan}/${store.getName()}.htm"><i ${storeName=='all' || storeName==store.getName() ? "class='icon-ok'" : ""}></i>${store.getName()}</a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
                <br/>
            </div>
            <div class="col-sm-9"    >    
                <c:if test="${productLinesByCategory.size()==0}">
                    <spring:message code="report.noReport"/>
                </c:if>
                <c:if test="${productLinesByCategory.size()>0}">
                    <spring:message code="expenseReport.chart"/>                    
                    <div id="barChart" style="height: 250px;margin-bottom: 50px;"></div>
                </c:if>
                <div class="panel-group" id="accordion">
                    <c:forEach var="productCat" items="${productLinesByCategory}" varStatus="count">
                        <c:set var="x" value="${count.index}"/> 

                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapse${x}">
                                        ${productCat.key.getName()} : € ${costsPerCategory.get(productCat.key)}                                      
                                    </a>
                                </h4>
                            </div>
                            <div id="collapse${x}" class="panel-collapse collapsed collapse">
                                <div class="panel-body">
                                        <table class="table table-responsive" style="text-align: left; font-size: small; color:black">
                                            <tr>
                                                <th><spring:message code="report.date"/></th>
                                                <th><spring:message code="report.product"/></th>
                                                <th class="hidden-sm hidden-xs"><spring:message code="report.amount"/></th>
                                                <th><spring:message code="expenseReport.cost"/></th>
                                            </tr>
                                            <c:forEach var="line" items="${productCat.value}">
                                                <tr>
                                                    <td>${line.getDate()}</td>
                                                    <td><a href='${productDetailUrl}${line.getPackingId()}.htm'>${line.getProduct().getName()}</a></td>
                                                    <td class="hidden-sm hidden-xs">${line.getAmount()} <spring:message code="receiptDetail.pieces"/></td>
                                                    <td>€${line.getTotalPrice()}</td>
                                                </tr>
                                            </c:forEach>
                                        </table>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div class="col-md-3 hidden-sm hidden-xs" >
                <div id="categoryWell" class="well well-small">
                    <ul>
                        <li class="wellHeader"><spring:message code="report.stores"/></li>
                        <li class="categoryItem">
                            <a href="../${timespan}/all.htm"><i ${storeName=='all' ? "class='icon-ok'" : ""}></i><spring:message code="report.all"/></a>
                        </li>
                        <c:forEach var="store" items="${stores}">
                            <li class="categoryItem">
                                <a href="../${timespan}/${store.getName()}.htm"><i ${storeName=='all' || storeName==store.getName() ? "class='icon-ok'" : ""}></i>${store.getName()}</a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>
                        
<script type="text/javascript">
    function expenseReportClick() {
        var timespan=document.getElementById("timespan").value;
        window.location.href="../"+timespan+"/${storeName}.htm";
    }

    $(document).ready(function() {
    // Morris Bar Chart
    Morris.Bar({
    element: 'barChart',
            data: [
    <c:forEach items="${costsPerCategory.keySet()}" var="plc" varStatus="count">
        <c:set var="x" value="${count.index}"/>
            {category: '${plc.getName()}', amount: ${costsPerCategory.get(plc)}}${!count.last ? ', ' : ''}
    </c:forEach>
            ],
            xkey: 'category',
            ykeys: ['amount'],
            barRatio: 0.4,
            hideHover: 'auto',
            barColors: ["#d2322d"],
            labels: ['<spring:message code="receiptDetail.total"/>: €']
    });
            
    });

</script>

