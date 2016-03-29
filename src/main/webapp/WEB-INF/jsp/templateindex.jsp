<%-- 
    Document   : templateindex
    Created on : 27 mars 2016, 16:54:34
    Author     : valentin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" isELIgnored="false"
         pageEncoding="ISO-8859-1" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>JSP Page</title>
    </head>
    <body>
       
        
        
            <!-- Carousel
    ================================================== -->
   <div class="bs-example">
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <!-- Carousel indicators -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>
        <!-- Wrapper for carousel items -->
        <div class="carousel-inner">
            <div class="item active">
                <img src="resources/Image/slide1.jpg" alt="First Slide" >
            </div>
            <div class="item">
                <img src="resources/Image/slide2.jpg" alt="Second Slide" >
            </div>
            <div class="item">
                <img src="resources/Image/slide3.jpg" alt="Third Slide" >
            </div>
        </div>
        <!-- Carousel controls -->
        <a class="carousel-control left" href="#myCarousel" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left"></span>
        </a>
        <a class="carousel-control right" href="#myCarousel" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right"></span>
        </a>
    </div>
</div>

            <br>
            <br>

    <!-- Marketing messaging and featurettes
    ================================================== -->
    <!-- Wrap the rest of the page in another container to center all the content. -->
    <center>
    <div class="container marketing">

      <!-- Three columns of text below the carousel -->
      <div class="row">
        <div class="col-lg-4">
          <img class="img-circle" src="resources/Image/sante.jpg" alt="Generic placeholder image" width="140" height="140">
          <h2>Santé</h2>
          <p>La santé joue un rôle clé dans l'augmentation du niveau de vie des habitants. En mettant l'accent sur les soins de santé primaires (tels que les vaccins, assainissement des eaux et accès à celle-ci ...), bons nombre de pays en difficulté tentent de faire disparaître les inégalités.</p>
          
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4">
          <img class="img-circle" src="resources/Image/education.gif" alt="Generic placeholder image" width="140" height="140">
          <h2>Education</h2>
          <p>Dans un deuxième temps, l'éducation est un moteur puissant de la croissance économique. En effet, on remarque que les pays améliorant leur système éducatif augmentent sur le long terme une croissance économique. Mais de nombreuses inégalités subsistent, notamment dans l'accès des filles dans les pays en voie de développement.</p>
          
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4">
          <img class="img-circle" src="resources/Image/technologie.jpg" alt="Generic placeholder image" width="140" height="140">
          <h2>Technologie</h2>
          <p>Enfin, l'innovation technologique, souvent stimulée par les pouvoirs publics, est l'élément moteur de la croissance industrielle et aide à améliorer les niveaux de vie. En corrélation avec le secteur de la santé et de l'éducation, on peut voir comment ces trois domaines sont étroitement liés.</p>
          
        </div><!-- /.col-lg-4 -->
      </div><!-- /.row -->
          <!-- Placed at the end of the document so the pages load faster -->
    </center>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
    </body>
</html>
