<%-- 
    Document   : tipodocu
    Created on : 08-27-2016, 08:14:28 PM
    Author     : aleso
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://displaytag.sf.net/el" prefix="display" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

        <jsp:include page="header.jsp" />
        <div class="container">
            <div class="row">
                <div class="col s12">
                    <h3 class="light italic">Alumnos</h3>
                </div>
                <div class="row col s12"><blockquote class="bold">${mensAler}</blockquote></div>
                <form class="" method="post" action="AlumnosServ">
                <div class="col s12">
                    <div class="col s12">
                        <input type="hidden" name="CodiAlum" value="${CodiAlum}"/>
                        <label for="date2">Nombre:</label>
                        <input type="text" name="nomb" id="nombLuga" value="${nomb}">
                        <label for="date2">Apellido:</label>
                        <input type="text" name="apel" id="nombLuga" value="${apel}">
                        <label for="date2">Direccion:</label>
                        <input type="text" name="dire" id="nombLuga" value="${dire}">
                        <label for="date2">Telefono:</label>
                        <input type="text" name="tele" id="nombLuga" value="${tele}">
                        <label for="date2">Correo:</label>
                        <input type="text" name="mail" id="nombLuga" value="${mail}">
                        <label for="date2">Fecha de Nacimiento:</label>
                        <input type="text" name="fechNaci" id="nombLuga" value="${fechNaci}">
                        <div class="input-field col s12">
                            <select name="gene">
                              <option value="M">Masculino</option>
                              <option value="F">Femenino</option>
                            </select>
                            <label>Genero</label>
                          </div>
                    </div>
                </div>
                <br/>
                <div class="row">
                    <div class="col s12">
                        <div class="col s12 m4 l4" id="buton"><button class="btn waves-effect waves-light teal darken-3 col s12" type="submit" name="CursBton" value="Guardar">Guardar</button></div>
                    </div>
                </div>
                </form>
                <br>
            </div>
        </div>
        <jsp:include page="footer.jsp" />