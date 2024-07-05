/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controler;

import Entidades.cliente;
import conexion.conexionBD;
import java.io.IOException;
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
import java.util.List;
import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonArrayBuilder;
import javax.json.JsonObject;
import javax.json.JsonObjectBuilder;
/**
 *
 * @author javie
 */
@WebServlet(name = "ControlerCliente", urlPatterns = {"/ControlerCliente"})
public class ControlerCliente extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
/*    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
           /* out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControlerCliente</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControlerCliente at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }*/

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
        //processRequest(request, response);
        String Op =request.getParameter("Op");
        ArrayList<cliente> Lista= new ArrayList<cliente>();
        conexionBD conBD = new conexionBD();
        Connection conn = conBD.Connected();
        PreparedStatement ps;
        ResultSet rs;
        switch(Op){
            case "Listar":
                try{
                    String sql="SELECT * FROM t_cliente";
                    ps= conn.prepareStatement(sql);
                    rs= ps.executeQuery();
                    while(rs.next()){
                        cliente client=new cliente();
                        client.setId(rs.getString("Id_Cliente"));
                        client.setApellidos(rs.getString("Apellidos"));
                        client.setNombres(rs.getString("Nombres"));
                        client.setDNI(rs.getString("DNI"));
                        client.setDireccion(rs.getString("Direccion"));
                        client.setTelefono(rs.getString("Telefono"));
                        client.setMovil(rs.getString("Movil"));
                        Lista.add(client);
                    }
                    request.setAttribute("Lista", Lista);
                    request.getRequestDispatcher("listar.jsp").forward(request, response);
                }catch(SQLException ex){
                    System.out.println("Error de SQL..."+ex.getMessage());
                } finally{
                    conBD.Discconet();
                }
                break;
            case "Consultar":
                try{
                    String Id=request.getParameter("Id");
                    String sql="select * from t_cliente where Id_Cliente=?";
                    ps= conn.prepareStatement(sql);
                    ps.setString(1, Id);
                    rs= ps.executeQuery();
                    cliente client=new cliente();
                    while(rs.next()){
                        client.setId(rs.getString("Id_Cliente"));
                        client.setApellidos(rs.getString("Apellidos"));
                        client.setNombres(rs.getString("Nombres"));
                        client.setDNI(rs.getString("DNI"));
                        client.setDireccion(rs.getString("Direccion"));
                        client.setTelefono(rs.getString("Telefono"));
                        client.setMovil(rs.getString("Movil"));
                        Lista.add(client);
                    }
                    request.setAttribute("Lista", Lista);
                    request.getRequestDispatcher("consultar.jsp").forward(request, response);
                }catch(SQLException ex){
                    System.out.println("Error de SQL..."+ex.getMessage());
                } finally{
                    conBD.Discconet();
                }                
                break;    
            case "Modificar":
                try{
                    String Id=request.getParameter("Id");
                    String sql="select * from t_cliente where Id_Cliente=?";
                    ps= conn.prepareStatement(sql);
                    ps.setString(1, Id);
                    rs= ps.executeQuery();
                    cliente client=new cliente();
                    while(rs.next()){
                        client.setId(rs.getString("Id_Cliente"));
                        client.setApellidos(rs.getString("Apellidos"));
                        client.setNombres(rs.getString("Nombres"));
                        client.setDNI(rs.getString("DNI"));
                        client.setDireccion(rs.getString("Direccion"));
                        client.setTelefono(rs.getString("Telefono"));
                        client.setMovil(rs.getString("Movil"));
                        Lista.add(client);
                    }
                    request.setAttribute("Lista", Lista);
                    request.getRequestDispatcher("modificar.jsp").forward(request, response);
                }catch(SQLException ex){
                    System.out.println("Error de SQL..."+ex.getMessage());
                } finally{
                    conBD.Discconet();
                }                 
                
                break;
            case "Eliminar":
                try{
                    String Id=request.getParameter("Id");
                    String sql="delete from t_cliente where Id_Cliente=?";
                    ps= conn.prepareStatement(sql);
                    ps.setString(1, Id);
                    ps.executeUpdate();
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }catch(SQLException ex){
                    System.out.println("Error de SQL..."+ex.getMessage());
                } finally{
                    conBD.Discconet();
                }                          
                break;
            case "Nuevo":
                request.getRequestDispatcher("nuevo.jsp").forward(request, response);
                break;
            case "ConsultarJson":
                try{
                    String Id=request.getParameter("DNI");
                    String sql="select * from t_cliente where DNI=?";
                    ps= conn.prepareStatement(sql);
                    ps.setString(1, Id);
                    rs= ps.executeQuery();
                      JsonObjectBuilder jsonObjectBuilder = Json.createObjectBuilder();    
                    while(rs.next()){
                     jsonObjectBuilder.add("Id_Cliente", rs.getString("Id_Cliente")); // Reemplaza "propiedad1" con los nombres de tus propiedades
                     jsonObjectBuilder.add("Nombres", rs.getString("Nombres"));
                       jsonObjectBuilder.add("Apellidos", rs.getString("Apellidos"));
                    }
                    JsonObject jsonObject = jsonObjectBuilder.build();
                    String json = jsonObject.toString();
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    response.getWriter().write(json);                    
                }catch(Exception ex){
                    System.out.println("Error de SQL..."+ex.getMessage());
                } finally{
                    conBD.Discconet();
                }                
                break;    
        }        
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
        //processRequest(request, response);
        request.setCharacterEncoding("UTF-8");
        String Id =request.getParameter("Id");       
        String Apellidos=request.getParameter("apellidos"); 
        String Nombres=request.getParameter("nombres"); 
        String DNI=request.getParameter("DNI");
        String Direccion=request.getParameter("direccion"); 
        String Telefono=request.getParameter("telefono"); 
        String Movil=request.getParameter("movil"); 
        cliente client=new cliente();
        
        client.setId(Id);
        client.setApellidos(Apellidos);
        client.setNombres(Nombres);
        client.setDNI(DNI);
        client.setDireccion(Direccion);
        client.setTelefono(Telefono);
        client.setMovil(Movil);     
        
        conexionBD conBD = new conexionBD();
        Connection conn = conBD.Connected();
        PreparedStatement ps;
        ResultSet rs;        
        if(Id.isEmpty()){
            String sql="insert into t_cliente(Id_Cliente, apellidos, nombres, DNI, direccion, telefono, movil) values(?, ?, ?, ?, ?, ?, ?)";

            try{
                /*Algoritmo para autogeneral el código*/
                String Id_Cliente=NuevoCodigoCliente();
                ps= conn.prepareStatement(sql);
                ps.setString(1, Id_Cliente);
                ps.setString(2, client.getApellidos());
                ps.setString(3, client.getNombres());
                ps.setString(4, client.getDNI());
                ps.setString(5, client.getDireccion());
                ps.setString(6, client.getTelefono());
                ps.setString(7, client.getMovil());
                
                ps.executeUpdate(); 
            }catch(SQLException ex){
                System.out.println("Error actualizando tabla..."+ex.getMessage());
            } finally{
                conBD.Discconet();
            }               
        }else{
            String sql="update t_cliente set apellidos=?, nombres=?, DNI=?, direccion=?, telefono=?, movil=? where Id_Cliente=?";

            try{
                ps= conn.prepareStatement(sql);
                ps.setString(1, client.getApellidos());
                ps.setString(2, client.getNombres());
                ps.setString(3, client.getDNI());
                ps.setString(4, client.getDireccion());
                ps.setString(5, client.getTelefono());
                ps.setString(6, client.getMovil());
                ps.setString(7, client.getId());
                ps.executeUpdate(); 
            }catch(SQLException ex){
                System.out.println("Error actualizando tabla..."+ex.getMessage());
            } finally{
                conBD.Discconet();
            }               
        }
        
        response.sendRedirect("index.jsp");       
        
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

    public ArrayList<cliente> ListarCliente(){
        conexionBD conBD = new conexionBD();
        Connection conn = conBD.Connected();
        PreparedStatement ps;
        ResultSet rs;
        ArrayList<cliente> Lista= new ArrayList<cliente>();
        try {
            String sql="SELECT * FROM t_cliente";
            ps= conn.prepareStatement(sql);
            rs= ps.executeQuery();
            while(rs.next()){
                cliente client = new cliente();
                client.setId(rs.getString("Id_Cliente"));
                client.setApellidos(rs.getString("Apellidos"));
                client.setNombres(rs.getString("Nombres"));
                client.setDNI(rs.getString("DNI"));
                client.setDireccion(rs.getString("Direccion"));
                client.setTelefono(rs.getString("Telefono"));
                client.setMovil(rs.getString("Movil"));
                Lista.add(client);
            }
        } catch (Exception e) {
            System.out.println("Error de SQL..."+e.getMessage());
        } finally {
            conBD.Discconet();
        }
        
        return Lista;
    }
    
    public String NuevoCodigoCliente(){
        ArrayList<cliente> Lista= new ArrayList<cliente>();
        String CodCliente="";
        
        Lista=ListarCliente();
        
        cliente clienteMayor = Lista.stream()
                .max(cliente::compareTo)
                .orElse(null);
        
        Integer codeMax=Integer.parseInt(clienteMayor.getId().substring(1));
        
        codeMax++;
            CodCliente = "C" + String.format("%05d", codeMax);
            
        return CodCliente;
    }
}
