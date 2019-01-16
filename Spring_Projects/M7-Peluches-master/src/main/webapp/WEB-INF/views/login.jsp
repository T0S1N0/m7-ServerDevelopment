<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="sections/head.jsp"/>
    </head>
    <body>
        <jsp:include page="sections/navMenu.jsp"/>
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-md-offset-4">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title"><spring:message code="login.entercredentials"/> </h3>
                        </div>
                        <div class="panel-body">
                            <c:if test="${not empty error}">
                                <div class="alert alert-danger">
                                    <spring:message code="login.wrongcredentials"/>
                                </div>
                            </c:if>
                            <form action="<c:url value= "/j_spring_security_check"> </c:url>" method="post">
                                    <fieldset>
                                        <div class="form-group">
                                            <input class="form-control" placeholder="<spring:message code="login.form.username"/>" name='j_username' type="text">
                                    </div>
                                    <div class="form-group">
                                        <input class="form-control" placeholder="<spring:message code="login.form.password"/>" name='j_password' type="password">
                                    </div>
                                    <input class="btn btn-lg btn-success btn-block" type="submit" value="<spring:message code="login.submit.login"/>">
                                </fieldset>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>