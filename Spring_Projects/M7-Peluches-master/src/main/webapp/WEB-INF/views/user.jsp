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
            <fieldset>
                <div class="form-group"> 
                    <label for="username"><spring:message code="user.form.label.username"/></label>
                    <form:input id="username" path="username" type="text" class="form:input-large" readonly="${readonly}" value="${user.username}"/>   
                </div>
                <div class="form-group">
                    <label for="password"><spring:message code="user.form.label.password"/></label>
                    <form:input id="password" path="password" type="password" class="form:input-large" value="${user.password}"/>
                </div>
                <div class="form-group">
                    <label for="firstName"><spring:message code="user.form.label.firstName"/></label>
                    <form:input id="firstName" path="firstName" type="text" class="form:input-large" value="${user.firstName}"/>
                </div>
                <div class="form-group">
                    <label for="lastName"><spring:message code="user.form.label.lastName"/></label>
                    <form:input id="lastName" path="lastName" type="text" class="form:input-large" value="${user.lastName}"/>
                </div>
                <div class="form-group">
                    <sec:authorize access="!hasAnyRole('ROLE_USER')">
                        <input type="submit" id="btnAdd" class="btn btn-primary"
                               value ="<spring:message code="user.form.submit.singUp"/>"/>
                    </sec:authorize>
                    <sec:authorize access="hasAnyRole('ROLE_USER')">
                        <input type="submit" id="btnAdd" class="btn btn-primary"
                               value ="<spring:message code="user.form.submit.update    "/>"/>
                    </sec:authorize>


                </div>
            </fieldset> 
        </form:form> 
    </body>
</html>