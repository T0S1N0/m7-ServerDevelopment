<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="sections/head.jsp"/>
        <link type="text/css" rel="stylesheet" href="../stylesheets/styles.css" />
    </head>
    <body>
        <c:set var="activeCatalog" value="active" scope="request" />
        <jsp:include page="sections/navMenu.jsp"/>



        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-8">
                    <c:forEach items="${catalogo}" var="article">
                        <div class="col-lg-4 col-sm-6 col-md-3" style="padding-bottom: 15px">
                            <div class="thumbnail">
                                <div class="caption">
                                    <h4>${article.name}</h4> 
                                </div>
                                <img src="<spring:url value="/images/${article.image}"/>" class="img-responsive">
                                <div class="panel panel-default">
                                    <div class="panel-body" style="height: 100%; width: 100%; overflow-y: auto;">
                                        ${article.description}
                                    </div>
                                </div>
                                <p>${article.price} €</p>
                                <a class="bnt btn-info btn-md" href="<spring:url value="/addToCart?reference=${article.reference}"/>">
                                    <button class="btn btn-light btn-lg btnImage addToCart">AddToCart</button>
                                </a>

                            </div>   
                        </div>  
                    </c:forEach>
                </div>



            <div id="shoppingCart" class="col-lg-4" style="float: right;">
                <c:forEach items="${shoppingCart.articles}" var="article">
                    <img src="<spring:url value="/images/${article.key.image}"/> " class="img-responsive">
                    <h4>${article.key.name}</h4>
                    <div>
                        <p>${article.key.description}</p>
                    </div>
                    <div>
                        <a href="<spring:url value="/decreaseFromCart?reference=${article.key.reference}"/>">
                            <input type="button" class="btn btn-light btn-lg btnImage dropOfCart">
                        </a>
                        ${article.value}
                        <a href="<spring:url value="/addToCart?reference=${article.key.reference}"/>">
                            <input type="button" class="btn btn-light btn-lg btnImage addToCart">
                        </a>
                    </div>

                    <h4>Precio/Unidad = ${article.key.price}</h4>
                    <h4>Precio de ${article.value} Unidades = ${article.key.price * article.value}</h4>
                    <div> 
                        <a href="<spring:url value="/removeFromCart?reference=${article.key.reference}"/>">
                            <input type="button" value="Eliminar" class="btn btn-danger">
                    </div>
                </c:forEach>
                <h2>Total a pagar: ${shoppingCart.getTotalPrice()}</h2>
            </div>
        </div>
                        </div>
        <!--FMT: PARA FORMAT NUMBER EN JSTL-->

    </body>
</html>