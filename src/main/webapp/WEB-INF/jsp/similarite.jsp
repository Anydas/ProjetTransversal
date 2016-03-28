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
<!--         <link href="${mainCSS}" rel="stylesheet" />-->
        <jsp:include page="Menu.jsp" ></jsp:include>  
        
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        
        
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
    </body>
</html>
