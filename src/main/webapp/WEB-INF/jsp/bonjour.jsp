<%-- 
    Document   : index
    Created on : 6 mars 2016, 11:38:38
    Author     : val41
--%>
<%@ page language="java" isELIgnored="false"
         pageEncoding="ISO-8859-1" contentType="text/html; charset=UTF-8" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
          <spring:url value="/resources/css/bootstrap.css" var="bootCSS" />
        <spring:url value="/resources/css/main.css" var="mainCSS" />           
         <link href="${bootCSS}" rel="stylesheet" />
         <link href="${mainCSS}" rel="stylesheet" />
         <jsp:include page="Menu.jsp" ></jsp:include>  
        <title>Index</title>
    </head>
    <body>
             
      <div id="wrap">
         <jsp:include page="templateindex.jsp" ></jsp:include>  
    </div>
     </body>
         <jsp:include page="footer.jsp" ></jsp:include>  
        
   
</html>