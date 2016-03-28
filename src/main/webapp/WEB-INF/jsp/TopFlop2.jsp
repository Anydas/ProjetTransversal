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
        <jsp:include page="Menu.jsp" ></jsp:include>  
            <title>Comparer des Pays</title>
        </head>
        <body>
            <br><br>
            <div class="container">
            <c:if test="${empty Countries}">
                 <div class="alert alert-warning" role="alert"><h3>Oops, c'est embarassant, il semblerait qu'il n'y ait pas de valeur en ${Date} pour l'indicateur : ${Indicateur}  </h3></div> 
                
            </c:if>
            
            <c:if test="${not empty Countries}">
                <table class="table table-bordered table-striped table-condensed">
                    <caption><h1>${TopFlop} en ${Date} <small>${Indicateur}</small></h1></caption>
                    <thead>
                        <tr>
                            <th>Pays</th>
                            <th>Valeurs</th>

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
    </body>
</html>
