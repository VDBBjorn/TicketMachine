<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<section>
    <div class="container wrapper-2">
        <div class="row">
            <div class="col-md-12">
                <h5 class="subpage-title">
                    <spring:message code="emailUs"/>
                </h5>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">

                <form action="succesContact.htm" method="post">
                    <select class="form-control" >
                        <c:forEach var="s" items="${stores}" varStatus="count">
                            <option value="${s.getName()}">${s.getName()}</option>
                        </c:forEach>
                    </select>
                    <br/>
                    <div class="row">
                        <div class="col-md-6">
                            <input class="form-control" name="voornaam" placeholder="Voornaam" required="true" value="${firstname}">
                        </div>
                        <div class="col-md-6">
                            <input class="form-control" name="achternaam" placeholder="Achternaam" required="true" value="${lastname}">
                        </div>
                    </div>
                    <br/>


                    <input class="form-control" type="email" placeholder="<spring:message code='email'/>" required="true">
                    <br/>
                    <textarea class="form-control" rows="4" cols="35" placeholder="<spring:message code='message'/>" required="true"></textarea>
                    <br/>
                    <input class="btn btn-flat btn-color" type="submit" value="<spring:message code='send'/>">

                </form>
            </div>
        </div>
    </div>
</section>

