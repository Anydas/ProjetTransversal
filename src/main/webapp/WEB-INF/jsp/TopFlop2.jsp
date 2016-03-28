<%@ page language="java" isELIgnored="false"
         pageEncoding="ISO-8859-1" contentType="text/html; charset=UTF-8" %>
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
            <title>Comparer des Pays</title>
        </head>
        <body>
            <br><br>
            <div class="container">

                <div class="tabbed_area">
                    <ul class="nav nav-tabs">
                        <li class="active"><a data-toggle="tab" href="#content_1">Resultat</a></li>
                        <li><a data-toggle="tab" href="#content_2">Recherche</a></li>
                    </ul>
                    <div class="tab-content">
                        <div id="content_1" class="tab-pane fade in active">
                        <c:if test="${empty Countries}">
                            <div class="alert alert-warning" role="alert"><h3>Oops, c'est embarassant, il semblerait qu'il n'y ait pas de valeur en ${Date} pour l'indicateur : ${Indicateur}  </h3></div> 

                        </c:if>

                        <c:if test="${not empty Countries}">
                            <h1>Resultat du ${TopFlop}</h1>
                            <table class="table table-bordered table-striped table-condensed">
                                <caption><h1>${TopFlop} en ${Date} <small>${Indicateur}</small></h1></caption>
                                <thead>
                                    <tr>
                                        <th>Pays</th>
                                        <th>Valeurs en ${UniteeValue}</th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="country" items="${Countries}">
                                        <tr>
                                            <td><c:out value="${country.getCountryName()}"/></td>
                                            <td><c:out value="${country.getValeurIndicateurCheat()}"/></td>

                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </c:if>
                    </div>
                    <div id="content_2" class="tab-pane fade">
                        <caption><h1>Menu Top & Flop</h1></caption>
                        <form action="TopPaysController" role="form">
                            Choisir un indicateur :
                            <div class="form-group">
                                <select name = "Indicateur" id = "Indicateur" class="form-control" >
                                    <c:forEach  var="indic" items="${ListeIndicateur}">
                                        <c:choose>
                                        <c:when test="${indic.getIndicatorName().equals(Indicateur)}">
                                            <OPTION selected=${indic.getIndicatorName()}><c:out value="${indic.getIndicatorName()}"/></option>
                                            </c:when>

                                        <c:otherwise>
                                            <OPTION><c:out value="${indic.getIndicatorName()}"/>
                                            </c:otherwise>
                                        </c:choose>
                                        </c:forEach>
                                </select>
                            </div>
                            Choisir une date :
                            <div class="form-group">
                                <select name = "Date" id = "Date" class="form-control" >
                                    <c:forEach var="Dat" begin="1985" end="2015" >
                                         <c:choose>
                                        <c:when test="${Dat == Date}">
                                            <OPTION selected=${Dat}><c:out value="${Dat}"/></option>                                           
                                            </c:when>
                                            <c:otherwise>
                                             <OPTION> <c:out value="${Dat}"/> 
                                            </c:otherwise>
                                        </c:choose>
                                 
                                        </c:forEach>
                                </select>
                            </div>
                            Choisir un top ou un flop :
                            <div class="form-group">
                                <select name = "TopFlop" id = "TopFlop" class="form-control">
                                    <c:choose>
                                        <c:when test="${TopFlop.equals('Top')}">
                                            <OPTION selected=Top>Top</option>
                                            <OPTION>Flop</option>
                                            </c:when>
                                            <c:otherwise>
                                            <OPTION>Top</option>
                                            <OPTION selected=Flop>Flop</option>
                                            </c:otherwise>
                                        </c:choose>
                                </select>
                            </div>
                            <input type="submit" value="Go" class="btn btn-success">
                        </form> 
                    </div>
                </div>
            </div>
        </div>

    </div>
</body>
</html>
