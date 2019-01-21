<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="sections/head.jsp"/>
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
                                    <button class="btn btn-primary btn-lg btnImage addToCart">AddToCart</button>
                                </a>

                            </div>   
                        </div>  
                    </c:forEach>
                </div>

                <div id="shoppingCart" class="col-lg-4" style="float: right;" >
                    <table id="cart" class="table table-hover table-condensed">
                        <c:forEach items="${shoppingCart.articles}"  var="article" >

                            <thead>
                                <tr>
                                    <th style="width:50%">Producto</th>
                                    <th style="width:10%" class="text-center">Precio</th>
                                    <th style="width:10%">Unidades</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td data-th="Product">
                                        <div class="row">
                                            <div class="col-sm-3 hidden-xs"><img src="<spring:url value="/images/${article.key.image}"/> " style="width: 100%; height: 100%"/></div>
                                            <p>${article.key.description}   </p>
                                            <div class="col-sm-10">
                                                <h4 class="nomargin">${article.key.name}</h4>                                             
                                            </div>
                                        </div>
                                    </td>
                                    <td data-th="Price" class="text-center">${article.key.price} $</td>
                                    <td data-th="Subtotal" class="text-center">${article.value}</td>
                                    <td class="actions" data-th="">
                                        <a href="<spring:url value="/removeFromCart?reference=${article.key.reference}"/>">
                                            <button value="Eliminar" class="btn btn-danger btn-sm"><i class="fa fa-trash-o"></i></button>								
                                        </a>
                                    </td>
                                </tr>
                            </tbody>
                        </c:forEach>

                        <tfoot>
                            <tr class="visible-xs">
                        <td class="text-center"><h1>${shoppingCart.getTotalPrice()} $</h1></td>
                        </tr>
                        <tr>
                            <td class="hidden-xs text-center"><strong>Total ${shoppingCart.getTotalPrice()} $</strong></td>
                            <td><a href="<spring:url value='/secured/orders'/>" class="btn btn-success btn-block"><spring:message code="catalog.checkout"/></a></td>
                        </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>