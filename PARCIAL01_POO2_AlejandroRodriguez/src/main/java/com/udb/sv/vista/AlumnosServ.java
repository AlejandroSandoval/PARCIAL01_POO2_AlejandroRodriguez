/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.udb.sv.vista;

import com.udb.sv.controlador.AlumnosCtrl;
import com.udb.sv.modelo.Alumnos;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Locale;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Laboratorio
 */
@WebServlet(name = "AlumnosServ", urlPatterns = {"/AlumnosServ"})
public class AlumnosServ extends HttpServlet {

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
                Alumnos obje = new Alumnos();
                obje.setNombAlum(request.getParameter("nomb"));
                obje.setApelAlum(request.getParameter("apel"));
                obje.setDireAlum(request.getParameter("dire"));
                char c = request.getParameter("gene").charAt(0);
                obje.setGeneAlum(c);
                obje.setMailAlum(request.getParameter("mail"));
                obje.setTeleAlum(request.getParameter("tele"));
                obje.setFechNaciAlum(new Date());
                mens = new AlumnosCtrl().guar(obje) ? "Datos guardados exitosamente" : "Datos NO guardados";
            }
            request.setAttribute("mensAler", mens);
            request.getRequestDispatcher("/tipodocu.jsp").forward(request, response);
        }
        else
        {
            response.sendRedirect(request.getContextPath() + "/tipodocu.jsp");
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
