<%-- 
    Document   : index
    Created on : 08-10-2016, 05:01:54 PM
    Author     : Laboratorio
--%>
<%@page import="com.udb.sv.controlador.GruposAlumnosCtrl"%>
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
                    <h3 class="light italic">Grupos de Alumnos</h3>
                </div>
                <div class="row col s12"><blockquote class="bold">${mensAler}</blockquote></div>
                <form class="" method="post" action="GruposAlumnosServ" name="FrmLuga">
                <div class="col s12">
                    <div class="col s12 m5 l6">
                        <div class="input-field center-align ">
                          <select name="cmbalumno" id="cmbalumno">
                          <jsp:useBean id="beanAlumnosCtrl" class="com.udb.sv.controlador.AlumnosCtrl" scope="page"/>
                          <c:forEach items="${beanAlumnosCtrl.ConsTodo()}" var="fila">
                              <c:choose>
                                  <c:when test="${fila.codiAlum eq cmbalumno}">
                                      <option name="codi_alum" value="${fila.codiAlum}" selected="">${fila.nombAlum}</option>
                                  </c:when>
                                  <c:otherwise>
                              <option name="codi_alum" value="${fila.codiAlum}">${fila.nombAlum}</option>
                                  </c:otherwise>
                              </c:choose>
                          </c:forEach>
                          </select>
                        </div>
                      </div>
                      <div class="col s12 m5 l6">
                        <div class="input-field center-align ">
                          <select name="cmbgrupo" id="cmbgrupo">
                          <jsp:useBean id="beanGruposCtrl" class="com.udb.sv.controlador.GruposCtrl" scope="page"/>
                          <c:forEach items="${beanGruposCtrl.ConsTodo()}" var="fila">
                              <c:choose>
                                  <c:when test="${fila.codiGrup eq cmbgrupo}">
                                      <option name="codi_grup" value="${fila.codiGrup}" selected="">${fila.nombGrup}</option>
                                  </c:when>
                                  <c:otherwise>
                              <option name="codi_grup" value="${fila.codiGrup}">${fila.nombGrup}</option>
                                  </c:otherwise>
                              </c:choose>
                          </c:forEach>
                          </select>
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
                <div class="row" id="table" >
                <form method="POST" name="Frm" action="">
                <% request.setAttribute( "demoAttr", new GruposAlumnosCtrl().ConsTodo()); %>
                <display:table id="Persona" name="demoAttr" class="bordered highlight centered">
                    <display:column property="codiAlum.nombAlum"  title="Alumno" sortable="true"/>
                    <display:column property="codiGrup.nombGrup" title="Grupo" sortable="true"/>
                    <display:column title="Seleccionar" sortable="true">
                        <input type="radio" name="codiPersRadio" id="${Persona.codiGrupAlum}" value="${Persona.codiGrupAlum}"/><label for="${Persona.codiGrupAlum}"></label>
                    </display:column>
                </display:table>
                </form>
                        <br/><br/><br/>
                     <h3>CONSULTAR</h3>
                        <form method="POST" name="FrmGrupo" action="GruposAlumnosServ">
                            <div class="form-group">
                                <label>Grupo</label>
                                <select name="grupo" class="form-control">
                                    <jsp:useBean id="grupo1" class="com.udb.sv.controlador.GruposCtrl" scope="page"/>
                                    <c:forEach items="${grupo1.ConsTodo()}" var="fila">
                                        <c:choose>
                                            <c:when test="${fila.codiGrup eq Grupo}">
                                                <option value="${fila.codiGrup}" selected="">${fila.nombGrup}</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="${fila.codiGrup}">${fila.nombGrup}</option>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="row">
                                <div class="col s12">
                                   <div class="col s12" id="buton"><button class="btn waves-effect waves-light teal darken-3 col s12" type="submit" name="CursBton" value="Consultar">Consultar</button></div>
                                </div>
                            </div>
                        </form>              
                    <% Object Codi = request.getAttribute("Grupo");
                    %>
                <% request.setAttribute( "demoAttr", new GruposAlumnosCtrl().ConsoTodo(Codi)); %>
                <display:table id="Persona" name="demoAttr" class="table table-hover">
                    <display:column property="codiAlum.nombAlum" title="Alumno" sortable="true"/>
                    <display:column property="codiAlum.apelAlum" title="Apellido" sortable="true"/>
                    <display:column property="codiGrup.nombGrup" title="Grupo" sortable="true"/>
                </display:table>
                <form method="POST" name="Frm" action="Script/report1.jsp">
                    <div class="form-group">
                        <label>Grupo</label>
                        <select name="grup" class="form-control">
                            <jsp:useBean id="grup" class="com.udb.sv.controlador.GruposCtrl" scope="page"/>
                            <c:forEach items="${grup.ConsTodo()}" var="fila">
                                <c:choose>
                                    <c:when test="${fila.codiGrup eq Grupo}">
                                        <option value="${fila.codiGrup}" selected="">${fila.nombGrup}</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="${fila.codiGrup}">${fila.nombGrup}</option>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </select>
                    </div>
                   <div class="col s12" id="buton"><button class="btn waves-effect waves-light teal darken-3 col s12" type="submit" name="CursBton" value="Reporte">Ver Reporte</button></div> 
                </form>
            </div>
            </div>
        </div>
        <jsp:include page="footer.jsp" />