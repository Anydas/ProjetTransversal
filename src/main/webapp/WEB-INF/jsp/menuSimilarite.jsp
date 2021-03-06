<%-- 
    Document   : similarite
    Created on : 27 mars 2016, 17:20:15
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
        <jsp:include page="Menu.jsp" ></jsp:include>  
            <title>Similarité</title>
        </head>
        <body>
             <div id="wrap">
            <div class="container">
        <title>Similarité</title>
        <br>
        <br>
         <center><h1>Menu de la similarité</h1></center>
        <form action="similarite" role="form">
                   

            <div class="form-group">
                    <p>Choisir pays 1 :</p>
                    <SELECT name="pays1" id="pays1" class="form-control">
                    <c:forEach var="pays" items="${listePays}">
                        <OPTION><c:out value="${pays.getCountryName()}"/>
                        </c:forEach>
                </SELECT>
            </div>
            <div class="form-group">
                <p>Choisir pays 2 :</p>
                <SELECT name="pays2" id="pays2" class="form-control">
                    <c:forEach var="pays" items="${listePays}">
                        <OPTION><c:out value="${pays.getCountryName()}"/>
                        </c:forEach>
                </SELECT>
            </div>
            <p>Choisir pays 3 :</p>
            <SELECT name="pays3" id="pays3" class="form-control">
                <c:forEach var="pays" items="${listePays}">
                    <OPTION><c:out value="${pays.getCountryName()}"/>
                    </c:forEach>
            </SELECT>
            <div class="form-group">
                <p>Choisir indicateur 1 :</p>
                <SELECT name="indicateur1" id="indicateur1" class="form-control">
                    <c:forEach var="indic" items="${listeIndicateurs}">
                        <OPTION><c:out value="${indic.getIndicatorName()}"/>
                        </c:forEach>
                </SELECT>
            </div>
            <div class="form-group">
                <p>Choisir indicateur 2 :</p>
                <SELECT name="indicateur2" id="indicateur2" class="form-control">
                    <c:forEach var="indic" items="${listeIndicateurs}">
                        <OPTION><c:out value="${indic.getIndicatorName()}"/>
                        </c:forEach>
                </SELECT>
            </div>
            <p>Choisir indicateur 3 :</p>
            <SELECT name="indicateur3" id="indicateur3" class="form-control">
                <c:forEach var="indic" items="${listeIndicateurs}">
                    <OPTION><c:out value="${indic.getIndicatorName()}"/>
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
             </body>
         <jsp:include page="footer.jsp" ></jsp:include>
   
</html>