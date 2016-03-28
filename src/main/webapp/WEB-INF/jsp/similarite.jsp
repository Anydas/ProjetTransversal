<%-- 
    Document   : similarite
    Created on : 27 mars 2016, 17:50:04
    Author     : Ut
--%>

<%@ page language="java" isELIgnored="false"
         pageEncoding="ISO-8859-1" contentType="text/html; charset=UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <spring:url value="/resources/css/main.css" var="mainCSS" />
        <spring:url value="/resources/css/bootstrap.css" var="bootCSS" />

        <link href="${bootCSS}" rel="stylesheet" />
        <link href="${mainCSS}" rel="stylesheet" /> 
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
        <jsp:include page="Menu.jsp" ></jsp:include>  

            <title>Similarité</title>
        </head>
        <body>
            <br>
            <br>
            <div class="container">


                <div class="tabbed_area">
                    <ul class="nav nav-tabs">
                        <li class="active"><a data-toggle="tab" href="#content_1">Resultat</a></li>
                        <li><a data-toggle="tab" href="#content_2">Recherche</a></li>
                    </ul>
                    <div class="tab-content">
                        <div id="content_1" class="tab-pane fade in active">
                            <table class="table table-bordered table-striped table-condensed">
                                L'indice de Gover est calculé par apport à ces trois indices :
                                Plus l'indice est grand, plus les pays se ressemblent !

                                <br>
                                Indicateur 1 : ${indic1}<br>
                            Indicateur 2 : ${indic2}<br>
                            Indicateur 3 : ${indic3}
                            <thead>
                                <tr>
                                    <th></th>
                                    <th>${pays1}</th>
                                    <th>${pays2}</th>
                                    <th>${pays3}</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>${pays1}</td>
                                    <td>${val1et1}</td>
                                    <td>${val2et1}</td>
                                    <td>${val3et1}</td>
                                </tr>
                                <tr>
                                    <td>${pays2}</td>
                                    <td>${val1et2}</td>
                                    <td>${val2et2}</td>
                                    <td>${val3et2}</td>
                                </tr>
                                <tr>
                                    <td>${pays3}</td>
                                    <td>${val1et3}</td>
                                    <td>${val2et3}</td>
                                    <td>${val3et3}</td>

                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <div id="content_2" class="tab-pane fade">

                        <form action="similarite" role="form">
                            Choisir les pays et les critères         

                            <div class="form-group">
                                <p>Pays 1 :</p>
                                <SELECT name="pays1" id="pays1" class="form-control">

                                    <c:forEach var="pays" items="${listePays}">
                                        <c:choose>
                                            <c:when test="${pays.getCountryName().equals(pays1)}">
                                                <OPTION selected=${pays.getCountryName()}><c:out value="${pays.getCountryName()}"/></option>
                                                </c:when>

                                            <c:otherwise>
                                                <OPTION><c:out value="${pays.getCountryName()}"/>
                                                </c:otherwise>
                                            </c:choose>

                                        </c:forEach>
                                </SELECT>
                            </div>
                            <div class="form-group">
                                <p>Pays 2 :</p>
                                <SELECT name="pays2" id="pays2" class="form-control">

                                    <c:forEach var="pays" items="${listePays}">
                                        <c:choose>
                                            <c:when test="${pays.getCountryName().equals(pays2)}">
                                                <OPTION selected=${pays.getCountryName()}><c:out value="${pays.getCountryName()}"/></option>
                                                </c:when>

                                            <c:otherwise>
                                                <OPTION><c:out value="${pays.getCountryName()}"/>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                </SELECT>
                            </div>
                            <p>Pays 3 :</p>
                            <SELECT name="pays3" id="pays3" class="form-control">

                                <c:forEach var="pays" items="${listePays}">
                                    <c:choose>
                                        <c:when test="${pays.getCountryName().equals(pays3)}">
                                            <OPTION selected=${pays.getCountryName()}><c:out value="${pays.getCountryName()}"/></option>
                                            </c:when>

                                        <c:otherwise>
                                            <OPTION><c:out value="${pays.getCountryName()}"/>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                            </SELECT>
                            <div class="form-group">
                                <p>Indicateur 1 :</p>
                                <SELECT name="indicateur1" id="indicateur1" class="form-control">

                                    <c:forEach var="indic" items="${listeIndicateurs}">
                                        <c:choose>
                                            <c:when test="${indic.getIndicatorName().equals(indic1)}">
                                                <OPTION selected=${indic.getIndicatorName()}><c:out value="${indic.getIndicatorName()}"/></option>
                                                </c:when>

                                            <c:otherwise>
                                                <OPTION><c:out value="${indic.getIndicatorName()}"/>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                </SELECT>
                            </div>
                            <div class="form-group">
                                <p>Indicateur 2 :</p>
                                <SELECT name="indicateur2" id="indicateur2" class="form-control">

                                    <c:forEach var="indic" items="${listeIndicateurs}">
                                        <c:choose>
                                            <c:when test="${indic.getIndicatorName().equals(indic2)}">
                                                <OPTION selected=${indic.getIndicatorName()}><c:out value="${indic.getIndicatorName()}"/></option>
                                                </c:when>

                                            <c:otherwise>
                                                <OPTION><c:out value="${indic.getIndicatorName()}"/>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                </SELECT>
                            </div>
                            <p>Indicateur 3 :</p>
                            <SELECT name="indicateur3" id="indicateur3" class="form-control">

                                <c:forEach var="indic" items="${listeIndicateurs}">
                                    <c:choose>
                                        <c:when test="${indic.getIndicatorName().equals(indic3)}">
                                            <OPTION selected=${indic.getIndicatorName()}><c:out value="${indic.getIndicatorName()}"/></option>
                                            </c:when>

                                        <c:otherwise>
                                            <OPTION><c:out value="${indic.getIndicatorName()}"/>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                            </SELECT>
                            <p>Période :</p>
                            <div class="form-group">
                                <select name = "Periode" id = "Date" class="form-control" >
                                    <OPTION>1995-2005
                                    <OPTION>2005-2015 
                                </select>
                            </div>
                            <input type="submit" value="Lancer la recherche" class="btn btn-success">
                        </form> 

                    </div>
                </div>
            </div>
        </div>
    </body>
    <jsp:include page="footer.jsp" ></jsp:include>

</html>
