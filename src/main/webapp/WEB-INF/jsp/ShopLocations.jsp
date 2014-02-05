<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<section>
    <div class="container wrapper-2">
        <div class="row">
            <div class="col-md-12">
                <h5 class="subpage-title"><spring:message code="storesAvailable"/></h5>       
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="panel-group" id="accordion">
                    <c:forEach var="s" items="${stores}" varStatus="count">
                        <c:set var="x" value="${count.index}"/> 
                        <c:if test="${stores.size()>0}">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a onclick="codeAddress('${s.getAddress().getCountry()}' + ' ' + '${s.getAddress().getCity()}' + ' ' + '${s.getAddress().getStreet()}' + ' ' + '${s.getAddress().getHouseNumber()}')" 
                                           class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapse${x}">
                                            <span> ${s.getName()} ${s.getAddress().getCity()}  </span>                                     
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapse${x}" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <div class="row">
                                            <span> ${s.getAddress().getStreet()} ${s.getAddress().getHouseNumber()} </span>
                                            <br>
                                            <span>${s.getAddress().getPostalCode()} ${s.getAddress().getCity()}</span>
                                            <br>
                                            <span>${s.getAddress().getCountry()}</span>
                                            <br>
                                            <span> ${s.getPhoneNumber()}</span>
                                            <br><br>
                                            <spring:message code="openingHours"/><br> 
                                            Ma: 9.00 - 18.30 uur <br>
                                            Di: 9.00 - 18.30 uur <br>
                                            Wo: 9.00 - 18.30 uur <br>
                                            Do: 9.00 - 18.30 uur <br>
                                            Vr: 9.00 - 20.00 uur <br>
                                            Za: 9.00 - 20.00 uur <br>
                                            Zo: gesloten <br>
                                            <br>
                                            <p><a href="contact.htm"><spring:message code="contactStore"/></a></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
            <div class="col-md-8">
                <div id="map-canvas" style="height: 50%"/>
            </div>
        </div>
    </div>
</section>
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&region=GB">
</script>



<script type="text/javascript">
    var geocoder;
    var directionsDisplay;
    var directionsService = new google.maps.DirectionsService();
    var map;
    function initialize() {
        geocoder = new google.maps.Geocoder();
        var mapOptions = {
            zoom: 13
        };
        map = new google.maps.Map(document.getElementById('map-canvas'),
                mapOptions);
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(function(position) {
                var pos = new google.maps.LatLng(position.coords.latitude,
                        position.coords.longitude);
                var infowindow = new google.maps.InfoWindow({
                    map: map,
                    position: pos
                });
                map.setCenter(pos);
                var infowindow = new google.maps.InfoWindow({
                    map: map,
                    position: pos,
                    content: 'Uw locatie'
                });
            }, function() {
                handleNoGeolocation(true);
            });
        } else {
            // Browser doesn't support Geolocation
            handleNoGeolocation(false);
        }
    }
    function handleNoGeolocation(errorFlag) {
        if (errorFlag) {
            var content = 'Error: The Geolocation service failed.';
        } else {
            var content = 'Error: Your browser doesn\'t support geolocation.';
        }
        var options = {
            map: map,
            position: new google.maps.LatLng(60, 105),
            content: content
        };
        var infowindow = new google.maps.InfoWindow(options);
        map.setCenter(options.position);
    }
    function codeAddress(adr) {
        if (adr == null) {
            var address = document.getElementById('address').value;
        }
        if (adr != null)
        {
            var address = adr;
        }
        geocoder.geocode({'address': address}, function(results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                map.setCenter(results[0].geometry.location);
                var marker = new google.maps.Marker({
                    map: map,
                    position: results[0].geometry.location
                });
                var infoWindowOptions = {
                    content: adr
                };
                var infoWindow = new google.maps.InfoWindow(infoWindowOptions);
                google.maps.event.addListener(marker, 'click', function(e) {
                    infoWindow.open(map, marker);
                });
            } else {
                alert('Geocode was not successful for the following reason: ' + status);
            }
        });
    }
    google.maps.event.addDomListener(window, 'load', initialize);
</script>

<script src="${pageContext.request.contextPath}/resources/scripts/toastr.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
    <c:if test="${succesContacted}">
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
        toastr.success("<spring:message code='messageSend'/>", '')

    </c:if>
    });
</script>