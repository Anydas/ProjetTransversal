<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
         pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <spring:url value="/resources/css/bootstrap.css" var="bootCSS" />
        <spring:url value="/resources/css/main.css" var="mainCSS" />           
        <link href="${bootCSS}" rel="stylesheet" />
        <link href="${mainCSS}" rel="stylesheet" />
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
        <jsp:include page="Menu.jsp" ></jsp:include>  
            <title>Liste des pays</title>
        </head>
        <body>    
            <div id="wrap">
                <br>
                <br>
                <div class="container">
                    <div class="tabbed_area">
                        <ul class="nav nav-tabs">
                            <li class="active"><a data-toggle="tab" href="#content_1">A à E</a></li>
                            <li><a data-toggle="tab" href="#content_2">F à J</a></li>
                            <li><a data-toggle="tab" href="#content_3">K à O</a></li>
                            <li><a data-toggle="tab" href="#content_4">P à T</a></li>
                            <li><a data-toggle="tab" href="#content_5">U à Z</a></li>
                        </ul>
                        <div class="tab-content">
                            <div id="content_1" class="tab-pane fade in active">

                                <center><h1>Liste des pays de A à E</h1></center>
                                <table class="table table-bordered table-striped table-condensed">
                                    <thead>
                                        <tr>
                                            <th>Pays</th>
                                            <th>Code</th>
                                            <th>Region</th>
                                            <th>PIB</th>
                                            <th>IDH</th>
                                            <th>Population</th>
                                            <th>Superficie</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="country" items="${abcde}">
                                        <tr>
                                            <td><c:out value="${country.getCountryName()}"/></td>
                                            <td><c:out value="${country.getCountryCode()}"/></td>
                                            <td><c:out value="${country.getRegion()}"/></td>
                                            <td><c:out value="${country.getPIB()}"/></td>
                                            <td><c:out value="${country.getIDH()}"/></td>
                                            <td><c:out value="${country.getPopulation()}"/></td>
                                            <td><c:out value="${country.getSuperficie()}"/></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>

                        </div>
                        <div id="content_2" class="tab-pane fade">
                            <center><h1>Liste des pays de F à J</h1></center>
                            <table class="table table-bordered table-striped table-condensed">
                                <thead>
                                    <tr>
                                        <th>Pays</th>
                                        <th>Code</th>
                                        <th>Region</th>
                                        <th>PIB</th>
                                        <th>IDH</th>
                                        <th>Population</th>
                                        <th>Superficie</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="country" items="${fghij}">
                                        <tr>
                                            <td><c:out value="${country.getCountryName()}"/></td>
                                            <td><c:out value="${country.getCountryCode()}"/></td>
                                            <td><c:out value="${country.getRegion()}"/></td>
                                            <td><c:out value="${country.getPIB()}"/></td>
                                            <td><c:out value="${country.getIDH()}"/></td>
                                            <td><c:out value="${country.getPopulation()}"/></td>
                                            <td><c:out value="${country.getSuperficie()}"/></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                             <div id="content_3" class="tab-pane fade">
                            <center><h1>Liste des pays de K à O</h1></center>
                            <table class="table table-bordered table-striped table-condensed">
                                <thead>
                                    <tr>
                                        <th>Pays</th>
                                        <th>Code</th>
                                        <th>Region</th>
                                        <th>PIB</th>
                                        <th>IDH</th>
                                        <th>Population</th>
                                        <th>Superficie</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="country" items="${klmno}">
                                        <tr>
                                            <td><c:out value="${country.getCountryName()}"/></td>
                                            <td><c:out value="${country.getCountryCode()}"/></td>
                                            <td><c:out value="${country.getRegion()}"/></td>
                                            <td><c:out value="${country.getPIB()}"/></td>
                                            <td><c:out value="${country.getIDH()}"/></td>
                                            <td><c:out value="${country.getPopulation()}"/></td>
                                            <td><c:out value="${country.getSuperficie()}"/></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                             <div id="content_4" class="tab-pane fade">
                            <center><h1>Liste des pays de P à T</h1></center>
                            <table class="table table-bordered table-striped table-condensed">
                                <thead>
                                    <tr>
                                        <th>Pays</th>
                                        <th>Code</th>
                                        <th>Region</th>
                                        <th>PIB</th>
                                        <th>IDH</th>
                                        <th>Population</th>
                                        <th>Superficie</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="country" items="${pqrst}">
                                        <tr>
                                            <td><c:out value="${country.getCountryName()}"/></td>
                                            <td><c:out value="${country.getCountryCode()}"/></td>
                                            <td><c:out value="${country.getRegion()}"/></td>
                                            <td><c:out value="${country.getPIB()}"/></td>
                                            <td><c:out value="${country.getIDH()}"/></td>
                                            <td><c:out value="${country.getPopulation()}"/></td>
                                            <td><c:out value="${country.getSuperficie()}"/></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                             <div id="content_5" class="tab-pane fade">
                            <center><h1>Liste des pays de U à Z</h1></center>
                            <table class="table table-bordered table-striped table-condensed">
                                <thead>
                                    <tr>
                                        <th>Pays</th>
                                        <th>Code</th>
                                        <th>Region</th>
                                        <th>PIB</th>
                                        <th>IDH</th>
                                        <th>Population</th>
                                        <th>Superficie</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="country" items="${uvwxyz}">
                                        <tr>
                                            <td><c:out value="${country.getCountryName()}"/></td>
                                            <td><c:out value="${country.getCountryCode()}"/></td>
                                            <td><c:out value="${country.getRegion()}"/></td>
                                            <td><c:out value="${country.getPIB()}"/></td>
                                            <td><c:out value="${country.getIDH()}"/></td>
                                            <td><c:out value="${country.getPopulation()}"/></td>
                                            <td><c:out value="${country.getSuperficie()}"/></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    </div>
                </div>

                </div>
                </body>
                <jsp:include page="footer.jsp" ></jsp:include>

                </html>