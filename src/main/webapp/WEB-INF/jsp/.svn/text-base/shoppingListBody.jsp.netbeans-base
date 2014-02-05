<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<section class="shoppingList">

    <div class="container wrapper-2">

        <spring:url value="/ShoppingList/Remove/" var="ShoppingListUrl"/>
        <spring:url value="/ShoppingList/Search" var="ShoppingListSearchUrl"/>
        <spring:url value="/ShoppingList/Add/" var="ShoppingListAddUrl"/>
        <spring:url value="/ShoppingList/RemoveAll/" var="ShoppingListRemoveAllUrl"/>
        <spring:url value="/ProductDetail/" var="ShoppingListProductDetailUrl"/>
        <spring:url value="/ShoppingList/CategoryShow/" var="ShoppingListCategoryUrl"/>
        <div class="row">
            <div class="col-md-4" >
                <h5 class="subpage-title"><spring:message code="shoppingListBody.title"/></h5>
                <table class="table" id="shoppinglist">
                    <tr>
                        <th>     
                        </th>
                        <th>
                            <spring:message code="shoppingListBody.productName"/>
                        </th>
                        <th style="min-width: 60px">
                            <spring:message code="shoppingListBody.productPrice"/>
                        </th>
                        <th style="padding: 10px">

                        </th>
                    </tr>
                    <c:if test="${empty ShoppingList.getProducts()}">
                        <tr>
                            <td style="padding:13px">

                            </td>
                            <td>
                                <br><spring:message code="shoppingListBody.shoppingList"/><br/><br>
                            </td>
                        </tr>
                    </c:if>
                    <c:forEach var="r" items="${ShoppingList.getProducts()}">
                        <tr>
                            <td style="padding-left: 5px; padding-right: 5px">
                                <form style="display: inline" action="${ShoppingListUrl}${r.packingId}.htm" method="get">
                                    <button id="deleteButton" class="btn btn-seeTrough" >  <i class="icon-remove"></i> </button>
                                </form>
                            </td>
                            <td>
                                <a href="${ShoppingListProductDetailUrl}${r.packingId}">${r.name}</a>
                            </td>
                            <td>
                                € ${r.getUnitPrice()}
                            </td>
                            <td style="text-align: center">  
                                <!-- promoties -->
                                <c:if test="${not empty r.promotions}">
                                    <a rel="tooltip" data-toggle="tooltip" data-animation="true" data-placement="bottom" title="
                                       <c:forEach var="pp" items="${r.getPromotions()}">
                                           ${pp.promotionDescription}
                                       </c:forEach>"> 
                                        <i class="icon-exclamation-sign" style="font-size: 14px;"></i></a>
                                    </c:if>
                                <!-- Productsavingcardpromoties -->
                                <c:if test="${ not empty loyaltyCards}">
                                    <c:forEach var="l" items="${loyaltyCards}">
                                        <c:if test="${(l.getType()=='productSavingsCard' && r.getProductId() == l.product.productId) || (l.getType()=='categorySavingsCard' && r.getCategory().categoryId == l.category.categoryId)}">
                                            <a rel="tooltip" data-toggle="tooltip" data-animation="true" data-placement="bottom" title="

                                               <spring:message code="shoppingListBody.pointsInfo"/>
                                               ${l.points}
                                               <spring:message code="shoppingListBody.ofThe"/>
                                               ${l.pointsToSave-points}
                                               <spring:message code="shoppingListBody.pointsEnd"/> 
                                               "> 
                                                <i class="icon-credit-card" style="font-size: 14px;"></i></a>
                                            </c:if>
                                        </c:forEach>
                                    </c:if>


                            </td>
                        </tr>
                    </c:forEach>
                </table>
                <br/>
                <button class="btn btn-flat flat-danger" style="margin-bottom: 20px" data-toggle="modal" data-target="#myModal"><spring:message code="shoppingListBody.deleteEverything"/> </button>
            </div>
            <div class="col-md-8">
                <div class="row">
                    <div class="col-md-12">
                        <h5 class="subpage-title"><spring:message code="shoppingListBody.addProducts"/></h5>

                        <!-- <form name="searchForm" class="contact-form" action="${ShoppingListSearchUrl}.htm" method="post"></form> -->
                        <div id="errorsBySearch" class="hidden">
                            <h5 class="red"><spring:message code="shoppingListBody.requiredSearchField"/></h5>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <select id="stores" name="stores" class="form-control">
                                    <c:forEach var="s" items="${stores}">
                                        <option <c:if test="${s.getName()==selectedStore}">selected=""</c:if> value="${s.id}">${s.name}</option>
                                    </c:forEach>
                                </select>
                            </div>                            
                            <div class="col-sm-6">
                                <input id="searchField" name="searchField" type="text" class="form-control" placeholder="<spring:message code="shoppingListBody.searchTerm"/>"/> 
                            </div>
                            <div class="col-sm-2">
                                <button id="searchButton" class="btn btn-flat flat-default btn-sm" onclick="searchClick();" style="width: 100%">
                                    <i class="icon-refresh"></i> &nbsp; <spring:message code="shoppingListBody.search"/>
                                </button>
                            </div>
                        </div>
                        <br>
                    </div>
                    <div class="row small-container">      
                        <div class="col-md-3 hidden-sm hidden-md hidden-lg">
                            <div id="categoryWell" class="well well-small">
                                <ul>
                                    <li class="wellHeader"><spring:message code="shoppingListBody.categories"/></li>

                                    <c:forEach var="c" items="${categories}">
                                        <li class="categoryItem">
                                            <a href="${ShoppingListCategoryUrl}${c.getCategoryId()}"><i class="icon-arrow-right"></i> ${c.getName()}</a>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-9">
                            <div class="row">
                                <div class="col-xs-12">
                                    <table class="table table-hover table-responsive">
                                        <c:if test="${not empty foundProducts}">
                                            <c:forEach var="fp" items="${foundProducts}">
                                                <tr>
                                                    <td>
                                                        <a href="${ShoppingListProductDetailUrl}${fp.packingId}" data-toggle="tooltip" data-animation="true" data-placement="bottom" title="${fp.description}">${fp.name}</a>
                                                    </td>
                                                    <td>
                                                        &euro;
                                                        ${fp.getUnitPrice()}
                                                    </td>
                                                    <td>
                                                        <c:if test="${ not empty fp.promotions}">
                                                            <a rel="tooltip" data-toggle="tooltip" data-animation="true" data-placement="bottom" title="
                                                               <c:forEach var="pp" items="${fp.getPromotions()}">
                                                                   ${pp.promotionDescription}
                                                               </c:forEach>"> 
                                                                <i class="icon-exclamation-sign" style="font-size: 20px;"></i></a>
                                                            </c:if>
                                                    </td>
                                                    <td>
                                                        <c:if test="${ not empty loyaltyCards}">
                                                            <c:forEach var="l" items="${loyaltyCards}">
                                                                <c:if test="${l.getType()=='productSavingsCard'}">
                                                                    <c:if test="${fp.productId == l.product.productId}">
                                                                        <a rel="tooltip" data-toggle="tooltip" data-animation="true" data-placement="bottom" title="
                                                                        <spring:message code="shoppingListBody.pointsInfo"/>
                                                                        ${l.points}
                                                                        <spring:message code="shoppingListBody.ofThe"/>
                                                                        ${l.pointsToSave-points}
                                                                        <spring:message code="shoppingListBody.pointsEnd"/> 
                                                                        "> 
                                                                        <i class="icon-credit-card" style="font-size: 20px;"></i></a>
                                                                    </c:if>
                                                                </c:if>
                                                                <c:if test="${l.getType()=='categorySavingsCard'}">
                                                                    <c:if test="${fp.category.categoryId == l.category.categoryId}">
                                                                        <a rel="tooltip" data-toggle="tooltip" data-animation="true" data-placement="bottom" title="
                                                                        <spring:message code="shoppingListBody.pointsInfo"/>
                                                                        ${l.points}
                                                                        <spring:message code="shoppingListBody.ofThe"/>
                                                                        ${l.pointsToSave-points}
                                                                        <spring:message code="shoppingListBody.pointsEnd"/> 
                                                                        "> 
                                                                        <i class="icon-credit-card" style="font-size: 20px;"></i></a>
                                                                    </c:if>
                                                                </c:if>
                                                            </c:forEach>
                                                        </c:if>
                                                    </td>
                                                    <td style="text-align: right">
                                                        <form name="addProductForm" action="${ShoppingListAddUrl}${fp.packingId}.htm" method="get">
                                                            <button class="btn btn-flat btn-sm btn-success">
                                                                <div class="hidden-xs"><i class='icon-ok'></i> <spring:message code="shoppingListBody.add"/></div>
                                                                <div class="hidden-sm hidden-md hidden-lg"><i class='icon-ok'></i></div></input>
                                                        </form>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </c:if>
                                        <c:if test="${empty foundProducts}">
                                            <spring:message code="shoppingListBody.noProductsFound"/>
                                        </c:if>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 hidden-xs">
                            <div id="categoryWell" class="well well-small">
                                <ul>
                                    <li class="wellHeader"><spring:message code="shoppingListBody.categories"/></li>

                                    <c:forEach var="c" items="${categories}">
                                        <li class="categoryItem">
                                            <a href="${ShoppingListCategoryUrl}${c.getCategoryId()}"><i class="icon-arrow-right"></i> ${c.getName()}</a>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                    </div>


                </div>
            </div> 

        </div><!-- EINDE CONTAINER DIV -->

        <!-- Modal -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-body">
                        <h4><spring:message code="shoppingListBody.confirmationDeleteAll"/></h4>
                    </div>
                    <div class="modal-footer">
                        <table style="display: inline">
                            <tr>
                                <td>
                                    <form>
                                        <button type="button" class="btn btn-default" data-dismiss="modal"><spring:message code="shoppingListBody.stillDoubting"/></button>
                                    </form
                                </td>
                                <td>
                                    <form id="deleteAllForm" action="${ShoppingListRemoveAllUrl}.htm" method="get">
                                        <button  type="submit" class="btn btn-primary btn-success" ><spring:message code="shoppingListBody.Sure"/></button>
                                    </form>
                                </td>                              
                            </tr>
                        </table>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->




</section>
<!-- Font of shoppinglist -->
<script type="text/javascript">
    WebFontConfig = {
        google: {families: ['Coming+Soon::latin']}
    };
    (function() {
        var wf = document.createElement('script');
        wf.src = ('https:' == document.location.protocol ? 'https' : 'http') +
                '://ajax.googleapis.com/ajax/libs/webfont/1/webfont.js';
        wf.type = 'text/javascript';
        wf.async = 'true';
        var s = document.getElementsByTagName('script')[0];
        s.parentNode.insertBefore(wf, s);
    })();
</script>

<script type="text/javascript">
    function searchClick() {
        var stores = document.getElementById("stores").value;
        var searchField = document.getElementById("searchField").value;
        if (searchField)
        {
            window.location.href = "searchClick/" + searchField + "/" + stores + ".htm";
        } else
        {
            $('#errorsBySearch').removeClass('hidden');
        }

    }
</script>

<script type="text/javascript">
    $(document).ready(function() {
        var index = ${selectedStore};
        document.getElementById("stores").selectedIndex = index;
    });
</script>

<script src="${pageContext.request.contextPath}/resources/scripts/toastr.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
    <c:if test="${not empty addedProduct}">
        toastr.options = {
            "closeButton": true,
            "debug": false,
            "positionClass": "toast-top-right",
            "showDuration": "300",
            "hideDuration": "1000",
            "timeOut": "5000",
            "extendedTimeOut": "7000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
        };
        toastr.success('Product ${addedProduct} <spring:message code="shoppingListBody.added"/>', '')

    </c:if>
    <c:if test="${not empty removedProduct}">
        toastr.options = {
            "closeButton": true,
            "debug": false,
            "positionClass": "toast-top-right",
            "showDuration": "300",
            "hideDuration": "1000",
            "timeOut": "5000",
            "extendedTimeOut": "7000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
        };
        toastr.success('Product ${removedProduct} <spring:message code="shoppingListBody.removed"/>', '')

    </c:if>
    });
</script>

