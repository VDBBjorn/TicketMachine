<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<spring:url value="/ProductDetail/" var="ShoppingListProductDetailUrl"/>
<spring:url value="/ShoppingList/Add/" var="ShoppingListAddUrl"/>

<section class="productDetail">

    <div class="container wrapper-2">
        <div>
            <h5 class="subpage-title" style="margin-left: 15px; margin-bottom: 25px;">
                ${Product.getName()}
            </h5>
        </div>
        <div class="row">
            <div class="col-md-3">
                <div class="wrapper-2">
                    <div class="product-image">
                        <img src="${pageContext.request.contextPath}/${Product.pictureUrl}" class="img-responsive"/>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <form name="addProductForm" action="${ShoppingListAddUrl}${Product.getPackingId()}.htm" method="get">
                    <button style="margin-top: 15px; margin-left:10px;" class="btn btn-flat btn-success"><i class='icon-ok'></i><spring:message code="vouchers.add"/></button>
                </form>
                <table class="table table-responsive" cellpadding="10px" style="border:0px;" >

                    <tr>
                        <th><spring:message code="productDetailBody.name"/></th>
                        <td>
                            <p>${Product.getName()}</p>
                        </td>
                    </tr>
                    <tr>
                        <th><spring:message code="productDetailBody.price"/></th>
                        <td>
                            <p>€ ${Product.getUnitPrice()}</p>
                        </td>
                    </tr>
                    <tr>
                        <th><spring:message code="productDetailBody.description"/></th>
                        <td>
                            <p>${Product.getDescription()}</p>
                        </td>
                    </tr>
                    <tr>
                        <th><spring:message code="productDetailBody.brand"/></th>
                        <td>
                            <p>${Product.getBrand()}</p>
                        </td>
                    </tr>
                </table>
                <div class="row">
                    <div class="col-md-6">
                        <form class="">
                            <select class="form-control">
                                <option value="Colruyt Gent"><spring:message code='locateStore'/> Colruyt Gent</option>
                                <option value="Okay Gent"><spring:message code='locateStore'/> Okay Gent</option>
                            </select>
                        </form>
                    </div>
                    <div class="col-md-1">
                        <a href="${pageContext.request.contextPath}/resources/images/floor plan.jpg" rel="prettyPhoto">
                            <button class="btn btn-flat btn-color"><i class="icon-search"></i></button>
                        </a> 
                    </div>
                </div>
            </div>

            <div class="col-md-3">
                <div class="well" style="margin-top:30px;">
                    <div class="productDetailPromotions">
                        <c:if test="${empty Product.promotions}">
                            <spring:message code="productDetailBody.noPromotions"/>
                        </c:if>
                        <c:if test="${not empty Product.promotions}">
                            <h4><spring:message code="productDetailBody.promotions"/></h4>
                            <ol class="productDetailPromotionsList">
                                <c:forEach var="p" items="${Product.getPromotions()}"> 
                                    <h5>
                                        <li>${p.getPromotionDescription()}
                                        </li>
                                    </h5>
                                </c:forEach>
                            </ol>
                        </c:if>
                    </div>
                </div>

                <div class="well" > 

                    <c:if test="${empty loyaltyCards}">
                        <spring:message code="productDetailBody.noDiscounts"/>
                    </c:if>

                    <c:if test="${not empty loyaltyCards}">
                        <c:forEach var="l" items="${loyaltyCards}">
                            <c:if test="${Product.packingId == l.product.productId}">
                                <h4><spring:message code="productDetailBody.discounts"/></h4>
                                <ol>
                                    <h6>
                                        <li>
                                            <spring:message code="productDetailBody.pointsInfo"/>
                                            ${l.points} 
                                            <spring:message code="productDetailBody.ofThe"/>
                                            ${l.pointsToSave}
                                            <spring:message code="productDetailBody.pointsEnd"/>
                                    </h6>
                                    </li>
                                    </h6>
                                </ol>   
                            </c:if>

                        </c:forEach>
                    </c:if>
                </div>
            </div>

        </div>



        <!--carousel--------------------------------------------------------------------------------------------------------------------------------------------------------------->
        <div class="wrapper-1 container">
            <h5 class="subpage-title" id="carouselTitle">
                <span><spring:message code="productDetailBody.relatedProducts"/></span>
                <!-- Controls -->
                <span id="product-next" class="next black" style="display: block;"><i class="icon-angle-right"></i></span>
                <span id="product-prev" class="prev black" style="display: block;"><i class="icon-angle-left"></i></span>
            </h5>
            <div class="row">
                <div class="caroufredsel_wrapper">
                    <div id="caroufredsel-product-container">
                        <c:forEach var="p" items="${foundProductsByCategory}">
                            <div class="col-sm-6 col-md-3">
                                <div class="product">
                                    <div class="product-thumb">
                                        <a href="${ShoppingListProductDetailUrl}${p.packingId}">
                                            <img src="${pageContext.request.contextPath}/${p.pictureUrl}" class="img-responsive" alt="${p.name}">
                                        </a>
                                    </div>
                                    <div class="product-info">
                                        <table class="table-responsive" style="width: 100%; border: 0px;">
                                            <tr>
                                                <td><h4><a href="${ShoppingListProductDetailUrl}${p.packingId}">${p.name}</a></h4></td>
                                                <td rowspan="2" style="text-align: right; padding: 10px"><a href="${ShoppingListAddUrl}/${p.packingId}">
                                                        <button class="btn btn-flat btn-success"><i class="icon-ok"></i><spring:message code="vouchers.add"/></button>
                                                    </a></td>
                                            </tr>
                                            <tr>
                                                <td><span class="price">€ ${p.unitPrice}</span></td>
                                            </tr>
                                        </table> 
                                    </div>
                                </div>
                                <!-- /.product -->
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
</section>


<script type="text/javascript">
    $(document).ready(function() {
        var caroufredsel = function() {
            $('#caroufredsel-product-container').carouFredSel({
                responsive: true,
                scroll: 1,
                circular: true,
                infinite: false,
                items: {
                    visible: {
                        min: 1,
                        max: 4
                    },
                    height: "300px"
                },
                prev: {
                    button: '#product-prev'
                },
                next: {
                    button: '#product-next'
                },
                auto: {
                    play: true,
                    timeoutDuration: 5000
                }
            });
        };
        $(window).load(function() {
            caroufredsel();
        });
        $(window).resize(function() {
            caroufredsel();
        });
    });
</script>
<script src="${pageContext.request.contextPath}/resources/scripts/jquery.carouFredSel-6.2.1.js"></script>