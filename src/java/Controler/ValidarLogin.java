/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controler;

import Entidades.producto;
import Entidades.usuarios;
import conexion.conexionBD;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Timer;
import java.util.TimerTask;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;

/**
 *
 * @author javie
 */
@WebServlet(name = "ValidarLogin", urlPatterns = {"/ValidarLogin"})
public class ValidarLogin extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    Encriptador e = new Encriptador();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String accion = request.getParameter("accion");
        String Op = request.getParameter("Op");
        if (Op != null) {
            switch (Op) {
                case "CerrarSesion":
                    HttpSession session = request.getSession();
                    session.invalidate();
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                    break;

            }
        } else {

            HttpSession session = request.getSession();
            if (session.getAttribute("user") == null) {
                String user, pass;
                user = request.getParameter("txtUsuario");
                pass = request.getParameter("txtClave");
                //user=admin, clave=1234
                if (ValidarUsuario(user, pass)) {
                    usuarios nuser = new usuarios(user, pass);
                    session.setAttribute("user", nuser);
                    request.getRequestDispatcher("index.jsp").forward(request, response);

                } else {
                    request.getRequestDispatcher("mensaje.jsp").forward(request, response);
                }
            } else {
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
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

    public boolean ValidarUsuario(String user, String password) {
        conexionBD conBD = new conexionBD();
        Connection conn = conBD.Connected();
        PreparedStatement ps;
        ResultSet rs;
        boolean login = false;
        String pase = e.encriptarSHA256(password);

        try {
            String sql = "SELECT * FROM t_usuario where IdUsuario=? and Passwd=?";

            ps = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            ps.setString(1, user);
            ps.setString(2, pase);
            rs = ps.executeQuery();
            if (rs.first()) {
                login = true;
            }

        } catch (SQLException ex) {
            System.out.println("Error de SQL..." + ex.getMessage());
        } finally {
            conBD.Discconet();
        }

        return login;
    }
    
}
