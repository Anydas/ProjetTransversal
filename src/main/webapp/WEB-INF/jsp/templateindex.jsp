<%-- 
    Document   : templateindex
    Created on : 27 mars 2016, 16:54:34
    Author     : valentin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
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
          <p>Les personnes pauvres n’ont pas les moyens de se sortir de la 
              pauvreté. Accroître leur productivité en investissant dans
              leur éducation et dans leur santé est souvent la meilleure manière
              d’améliorer leur bien-être. Le secteur public est le principal 
              fournisseur de services de soins de santé dans les pays en développement.
              Pour réduire les inégalités, bon nombre de pays mettent l’accent sur
              les soins de santé primaires, notamment l’immunisation, la 
              fourniture d’assainissement, l’accès à de l’eau potable et des
              initiatives pour une maternité sans risques. Les données de cette 
              page portent sur les systèmes de santé, la qualité et la 
              couverture de la prévention des maladies, la santé reproductive,
              la nutrition et la dynamique des populations. Les données 
              sont fournies par la Division de la population des Nations Unies,
              l’Organisation mondiale de la Santé, le Fonds des Nations Unies pour
              l’enfance, le Programme commun des Nations Unies sur le VIH/SIDA 
              et diverses autres sources.</p>
          
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4">
          <img class="img-circle" src="resources/Image/education.gif" alt="Generic placeholder image" width="140" height="140">
          <h2>Education</h2>
          <p>L’éducation est l’un des instruments les plus puissants qui existent
              pour réduire la pauvreté et les inégalités et elle pose les bases 
              d’une croissance économique soutenue. La Banque mondiale compile 
              les données sur les facteurs de production, la participation,
              l’efficience et les résultats dans le domaine de l’éducation.
              Les données sur l’éducation sont compilées par l’Institut de 
              statistiques de l’Organisation des Nations Unies pour l’éducation,
              la science et la culture (UNESCO) et proviennent de réponses 
              officielles à des sondages et de rapports fournis par les autorités
              en matière d’éducation de chaque pays.</p>
          
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4">
          <img class="img-circle" src="resources/Image/technologie.jpg" alt="Generic placeholder image" width="140" height="140">
          <h2>Technologie</h2>
          <p>L’innovation technologique, souvent stimulée par les pouvoirs 
             publics, est l’élément moteur de la croissance industrielle et aide
             à améliorer les niveaux de vie. Les données présentées ici visent à
             mettre en lumière l’infrastructure technologique des pays : recherche
             et développement, articles de journaux scientifiques et techniques, 
             exportations de haute technologie, redevances et droits de licence, 
             et brevets et marques déposées. Les sources proviennent notamment de
             l’Institut de statistique de l’UNESCO, du conseil américain National 
             Science Board, de la Division de statistique de l’ONU, du Fonds 
             Monétaire international et de l'Organisation mondiale de la 
             propriété intellectuelle.</p>
          
        </div><!-- /.col-lg-4 -->
      </div><!-- /.row -->
          <!-- Placed at the end of the document so the pages load faster -->
    </center>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
    </body>
</html>
