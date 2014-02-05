<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<section>
    <div class="container wrapper-2">
        <div class="row">
            <div class="col-md-12">
                <h5 class="subpage-title"><spring:message code="settings.change"/></h5>
                <c:if test="${not empty success}">
                    <div class="alert alert-success">
                        <spring:message code="profile.success"/>
                        <a class="close" data-dismiss="alert" href="#" aria-hidden="true">&times;</a>   
                    </div>
                </c:if>
                <c:if test="${not empty error}">
                    <div class="alert alert-danger">
                        <spring:message code="profile.error"/>
                        <a class="close" data-dismiss="alert" href="#" aria-hidden="true">&times;</a>   
                    </div>
                </c:if>
                <form:form id="personal-form" class="contact-form" method="POST" action="savePersonalSettings.htm" commandName="address">
                    <div class="row">
                        <div class="col-md-6">
                            <form:input id="street" path="street" class="form-control" placeholder="Straat" type="text"/>
                            <form:errors path="street" cssClass="error" />
                        </div>
                        <div class="col-md-1">
                            <form:input id="housenumber" path="houseNumber" class="form-control" placeholder="Nr" type="text"/>
                            <form:errors path="houseNumber" cssClass="error" />
                        </div>
                    </div>
                    <br/>
                    <div class="row">
                        <div class="col-md-2">
                            <form:input id="postalCode" path="postalCode" class="form-control" placeholder="Postcode" type="text"/>
                            <form:errors path="postalCode" cssClass="error" />
                        </div>
                        <div class="col-md-5">
                            <form:input id="city" path="city" class="form-control" placeholder="Gemeente" type="text"/>
                            <form:errors path="City" cssClass="error" />
                        </div>
                    </div>
                    <br/>
                    <div class="row">
                        <div class="col-md-7">
                            <form:input id="country" path="country" class="form-control" placeholder="Land" type="text"/>  
                            <form:errors path="Country" cssClass="error" />
                        </div>
                    </div>
                    <br/>
                    <div class="row">
                        <div class="col-md-5">
                            <button class="btn btn-flat flat-color"><spring:message code="settings.save"/></button>
                        </div>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</div>
</section>