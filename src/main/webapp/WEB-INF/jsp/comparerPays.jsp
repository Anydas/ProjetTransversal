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
                    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);
 
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
 
          ['Année', '${Valeur.getIndicatorCode()}'],
          <c:forEach var="Valeur" items="${ListeValeurs1}">
          [${Valeur.getDate()},  ${Valeur.getValeur()}],
          </c:forEach>  
 
        ]);
 
 
        var options = {
          title: '${Valeur.getIndicatorCode()}',
          curveType: 'function',
          legend: { position: 'bottom' }
        };
 
        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));
 
        chart.draw(data, options);
      }
    </script>
        </head>
        <body>

            <br>
            <br>
            <div class="container">

                <div class="tabbed_area">
                    <ul class="nav nav-tabs">
                        <li class="active"><a data-toggle="tab" href="#content_1">Resultat</a></li>
                        <li><a data-toggle="tab" href="#content_2">Recherche</a></li>
                        <li><a data-toggle="tab" href="#content_3">Tableau pays 1, indicateur 1</a></li>
                        <li><a data-toggle="tab" href="#content_4">Tableau pays 1, indicateur 2</a></li>
                        <li><a data-toggle="tab" href="#content_5">Tableau pays 2, indicateur 1</a></li>
                        <li><a data-toggle="tab" href="#content_6">Tableau pays 2, indicateur 2</a></li>
                    </ul>
                    <div class="tab-content">
                        <div id="content_1" class="tab-pane fade in active">
                            <center><h1>Resultat de la comparaison</h1></center>
                            <ul>
                                <li>Nombre de Pays : ${nbPays} |  Nombre d'indicateurs : ${nbIndic}</li>
                            <li>Pays 1 : ${pays1} </li>
                            <li>Pays 2 : ${pays2}  </li>
                            <li>Indicateur1 : ${indic1}  </li>
                            <li>Indicateur2 : ${indic2} </li>
                            <li>Erreur : ${errorCode}</li>
                        </ul>
                       
                            <div id="curve_chart" style="width: 900px; height: 500px">
                            </div>
                        </div>
                    <div id="content_2" class="tab-pane fade">
                        <center><h1>Menu de la comparaison</h1></center>
                        <form action="comparer" role="form">
                            <div class="form-group">
                                <p>Choisir pays 1 :</p>
                                <SELECT name="pays1" id="pays1" class="form-control" selected=${pays1}>

                                    <c:forEach var="pays" items="${listePays}">

                                        <c:choose>
                                            <c:when test="${pays.getCountryName().equals(pays1)}">
                                                <OPTION selected=${pays.getCountryName()}><c:out value="${pays.getCountryName()}"/></option>
                                                </c:when>

                                            <c:otherwise>
                                                <OPTION><c:out value="${pays.getCountryName()}"/></option>
                                                </c:otherwise>
                                            </c:choose>

                                    </c:forEach>                                       
                                </SELECT>
                            </div>
                            <div class="form-group">
                                <p>Choisir pays 2 :</p>
                                <SELECT name="pays2" id="pays2" class="form-control">

                                    <c:forEach var="pays" items="${listePays}">
                                        <c:choose>
                                            <c:when test="${pays.getCountryName().equals(pays2)}">
                                                <OPTION selected=${pays.getCountryName()}><c:out value="${pays.getCountryName()}"/></option>
                                                </c:when>

                                            <c:otherwise>
                                                <OPTION><c:out value="${pays.getCountryName()}"/></option>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                </SELECT>
                            </div>
                            <div class="form-group">
                                <p>Choisir indicateur 1 :</p>
                                <SELECT name="indicateur1" id="indicateur1" class="form-control">

                                    <c:forEach var="indic" items="${listeIndicateurs}">
                                        <c:choose>
                                            <c:when test="${indic.getIndicatorName().equals(indic1)}">
                                                <OPTION selected=${indic.getIndicatorName()}><c:out value="${indic.getIndicatorName()}"/></option>
                                                </c:when>

                                            <c:otherwise>
                                                <OPTION><c:out value="${indic.getIndicatorName()}"/></option>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                </SELECT>
                            </div>
                            <div class="form-group">
                                <p>Choisir indicateur 2 :</p>
                                <SELECT name="indicateur2" id="indicateur2" class="form-control">

                                    <c:forEach var="indic" items="${listeIndicateurs}">
                                        <c:choose>
                                            <c:when test="${indic.getIndicatorName().equals(indic2)}">
                                                <OPTION selected=${indic.getIndicatorName()}><c:out value="${indic.getIndicatorName()}"/></option>
                                                </c:when>

                                            <c:otherwise>
                                                <OPTION><c:out value="${indic.getIndicatorName()}"/></option>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                </SELECT>
                            </div>
                            <p>             </p>
                            <input type="submit" class="btn btn-success" value="GO !">
                        </form>

                    </div>
                    <div id="content_3" class="tab-pane fade">
                        <table class="table table-bordered table-striped table-condensed">
                            <thead>
                                <tr>
                                    <th>Pays</th>
                                    <th>Indicateur</th>
                                    <th>Valeur</th>
                                    <th>Année</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="Valeur" items="${Valeurs}">
                                    <tr>
                                        <c:if test="${Valeur.getCountryCode().equals(pays1)}">
                                             <c:if test="${Valeur.getIndicatorCode().equals(indic1)}">
                                            <td><c:out value="${Valeur.getCountryCode()}"/></td>
                                            <td><c:out value="${Valeur.getIndicatorCode()}"/></td>
                                            <td><c:out value="${Valeur.getValeur()}"/></td>
                                            <td><c:out value="${Valeur.getDate()}"/></td>
                                        </c:if>
                                        </c:if>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <br>


                    </div>
                    <div id="content_4" class="tab-pane fade">
                        <table class="table table-bordered table-striped table-condensed">
                            <thead>
                                <tr>
                                    <th>Pays</th>
                                    <th>Indicateur</th>
                                    <th>Valeur</th>
                                    <th>Année</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="Valeur" items="${Valeurs}">
                                    <tr>
                                        <c:if test="${Valeur.getCountryCode().equals(pays1)}">
                                             <c:if test="${Valeur.getIndicatorCode().equals(indic2)}">
                                            <td><c:out value="${Valeur.getCountryCode()}"/></td>
                                            <td><c:out value="${Valeur.getIndicatorCode()}"/></td>
                                            <td><c:out value="${Valeur.getValeur()}"/></td>
                                            <td><c:out value="${Valeur.getDate()}"/></td>
                                             </c:if>
                                        </c:if>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div id="content_5" class="tab-pane fade">
                        <table class="table table-bordered table-striped table-condensed">
                            <thead>
                                <tr>
                                    <th>Pays</th>
                                    <th>Indicateur</th>
                                    <th>Valeur</th>
                                    <th>Année</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="Valeur" items="${Valeurs}">
                                    <tr>
                                        <c:if test="${Valeur.getCountryCode().equals(pays2)}">
                                             <c:if test="${Valeur.getIndicatorCode().equals(indic1)}">
                                            <td><c:out value="${Valeur.getCountryCode()}"/></td>
                                            <td><c:out value="${Valeur.getIndicatorCode()}"/></td>
                                            <td><c:out value="${Valeur.getValeur()}"/></td>
                                            <td><c:out value="${Valeur.getDate()}"/></td>
                                        </c:if>
                                        </c:if>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div id="content_6" class="tab-pane fade">
                        <table class="table table-bordered table-striped table-condensed">
                            <thead>
                                <tr>
                                    <th>Pays</th>
                                    <th>Indicateur</th>
                                    <th>Valeur</th>
                                    <th>Année</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="Valeur" items="${Valeurs}">
                                    <tr>
                                        <c:if test="${Valeur.getCountryCode().equals(pays2)}">
                                             <c:if test="${Valeur.getIndicatorCode().equals(indic2)}">
                                            <td><c:out value="${Valeur.getCountryCode()}"/></td>
                                            <td><c:out value="${Valeur.getIndicatorCode()}"/></td>
                                            <td><c:out value="${Valeur.getValeur()}"/></td>
                                            <td><c:out value="${Valeur.getDate()}"/></td>
                                        </c:if>
                                        </c:if>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
           
                                

    </body>

    <jsp:include page="footer.jsp" ></jsp:include>
</html>
