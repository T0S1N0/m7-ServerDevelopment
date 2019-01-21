<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="sections/head.jsp"/>
    </head>
    <body>
        <c:set var="activeCatalog" value="active" scope="request" />

        <jsp:include page="sections/navMenu.jsp"/>

        <!--PARA SABER SI TENEMOS UNA SESION INICIADA O NO-->
        <sec:authorize access="!hasAnyRole('ROLE_USER')">
            <c:set var="readonly" value="false" scope="request"></c:set>
        </sec:authorize>

        <sec:authorize access="hasAnyRole('ROLE_USER')">
            <c:set var="readonly" value="true" scope="request"></c:set>
        </sec:authorize>

        <form:form modelAttribute="newUser" class="form-horizontal">


            <fieldset class="text-center" style="width: 25%; margin-left: 35%; background-color: blanchedalmond; -webkit-border-radius: 20px;
                      -moz-border-radius: 20px;
                      border-radius: 20px;">
                <img class="mb-4" src="https://insolitonoticias.com/wp-content/uploads/2013/09/Fugglers-04.jpg" alt="" width="72" height="72" style="-webkit-border-radius: 50px;
                     -moz-border-radius: 50px;
                     border-radius: 50px; ">
                <h1 class="h3 mb-3 font-weight-normal">Please Sign up</h1>

                <label for="username" class="sr-only"><spring:message code="user.form.label.username"/></label>
                <form:input id="username" type="email" path="username" class="form-control" readonly="${readonly}" value="${user.username}"
                            placeholder="Email" autofocus="" required="required"/>
                <br/>
                <label for="password" class="sr-only"><spring:message code="user.form.label.password"/></label>
                <form:input id="password" path="password" type="password" class="form-control" value="${user.password}" placeholder="Password" required="required"/>
                <br/>

                <label for="firstName" class="sr-only"><spring:message code="user.form.label.firstName"/></label>
                <form:input id="firstName" path="firstName" type="text" class="form-control" value="${user.firstName}" placeholder="FirstName" required="required"/>
                <br/>

                <label for="lastName" class="sr-only"><spring:message code="user.form.label.lastName"/></label>
                <form:input id="lastName" path="lastName" type="text" class="form-control" value="${user.lastName}" placeholder="LastName" required="required"/>
                <br/>


                <sec:authorize access="!hasAnyRole('ROLE_USER')">
                    <button id="btnAdd" class="btn btn-lg btn-success btn-block" type="submit" 
                            value="<spring:message code="user.form.submit.singUp"/>">Submit</button>
                </sec:authorize>

                <sec:authorize access="hasAnyRole('ROLE_USER')">
                    <button id="btnAdd" class="btn btn-lg btn-primary btn-block" type="submit" 
                            value="<spring:message code="user.form.submit.update"/>">SignIn</button>
                </sec:authorize>

                <p class="mt-5 mb-3 text-muted">© 2018-2019</p>
            </fieldset>

        </form:form> 
    </body>
</html>