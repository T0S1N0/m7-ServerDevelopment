<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

        <link type="text/css" rel="stylesheet" href="../stylesheets/styles.css" />
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">

<div class="container-fluid ">
    <div class="col-lg-8">
        <h2><spring:message code="navMenu.teddies"/></h2>
    </div>
    <div class="col-lg-4 text-right">
        <div class="btn-group ">
            <a href="?language=es" class="btn btn-default"><spring:message code="navMenu.language.spanish"/></a>
            <a href="?language=en" class="btn btn-default"><spring:message code="navMenu.language.english"/></a>
            <a href="?language=cat" class="btn btn-default"><spring:message code="navMenu.language.catala"/></a>
        </div> 
    </div>
</div>
<div>
    <nav class="navbar navbar-default" data-spy="affix" data-offset-top="75">
        <ul class="nav navbar-nav">
            <li class="${activeCatalog}"><a href="<spring:url value='/'/>"><spring:message code="navMenu.catalog"/></a></li>
        </ul>
        <sec:authorize access="hasAnyRole('ROLE_USER')">
            <sec:authentication var="user" property="principal" />
            <ul class="nav navbar-nav navbar-right">
                <li>

                    <div class="dropdown" style="margin: 8px 30px 0px 0px">
                        <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" ><spring:message code="navMenu.dropdown.settings"/></button>
                        
                        <div class="dropdown-menu">
                            <a class="${activeUserData}"><a href="<spring:url value='/secured/updateUser'/>"><spring:message code="navMenu.dropdown.userdata"/></a>
                                <br/>
                                <a href="<spring:url value='/secured/orders'/>"><spring:message code="navMenu.dropdown.orders"/></a>
                                <br/>
                                <div class="dropdown-divider"></div>
                                <a href="<spring:url value='/logout'/>"><span class="glyphicon glyphicon-log-out"></span><spring:message code="navMenu.dropdown.logout"/></a>
                        </div>
                    </div>
                </li>
            </ul>
        </sec:authorize>
        <sec:authorize access="!hasAnyRole('ROLE_USER')" >
            <ul class="nav navbar-nav navbar-right">
                <li><a href="<spring:url value='/signUp'/>"><span class="glyphicon glyphicon-user"></span><spring:message code="navMenu.nav.singup"/></a></li>
                <li>
                    <a href="<spring:url value='/login'/>" style="margin-right: 30px;"><span class="glyphicon glyphicon-log-in"></span><spring:message code="navMenu.nav.login"/></a>
                </li>
            </ul>
        </sec:authorize>
    </nav>
</div>
