/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.udb.sv.vista;

import com.udb.sv.controlador.AlumnosCtrl;
import com.udb.sv.controlador.GruposAlumnosCtrl;
import com.udb.sv.controlador.GruposCtrl;
import com.udb.sv.modelo.Alumnos;
import com.udb.sv.modelo.Grupos;
import com.udb.sv.modelo.GruposAlumnos;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Laboratorio
 */
@WebServlet(name = "GruposAlumnosServ", urlPatterns = {"/GruposAlumnosServ"})
public class GruposAlumnosServ extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        boolean esValido = request.getMethod().equals("POST");
        if(esValido)
        {
            String mens = "";
            String CRUD = request.getParameter("CursBton");
            if(CRUD.equals("Guardar"))
            {
                GruposAlumnos obje = new GruposAlumnos();
                char c = 1;
                obje.setEstaGrupAlum(c);
                Alumnos alumn = new AlumnosCtrl().get(Integer.parseInt((request.getParameter("cmbalumno"))));
                obje.setCodiAlum(alumn);
                Grupos grup = new GruposCtrl().get(Integer.parseInt((request.getParameter("cmbgrupo"))));
                obje.setCodiGrup(grup);
                mens = new GruposAlumnosCtrl().guar(obje) ? "Datos guardados exitosamente" : "Datos NO guardados";
            }
            else if(CRUD.equals("Consultar"))
            {
                int codiGrup = Integer.parseInt(request.getParameter("grupo"));
                    request.setAttribute("Grupo", codiGrup);
            }
            request.setAttribute("mensAler", mens);
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
        else
        {
            response.sendRedirect(request.getContextPath() + "/index.jsp");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
