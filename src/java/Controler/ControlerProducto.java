/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controler;

import Entidades.producto;
import conexion.conexionBD;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonArrayBuilder;
import javax.json.JsonObject;
import javax.json.JsonObjectBuilder;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author javie
 */
@WebServlet(name = "ControlerProducto", urlPatterns = {"/ControlerProducto"})
public class ControlerProducto extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
   /* protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
          /*  out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControlerProducto</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControlerProducto at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }/*

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
       // processRequest(request, response);
        
        String Op =request.getParameter("Op");
        ArrayList<producto> Lista= new ArrayList<producto>();
        conexionBD conBD = new conexionBD();
        Connection conn = conBD.Connected();
        PreparedStatement ps;
        ResultSet rs;
        switch(Op){
            case "Listar":
                 Lista=ListarProductos();
                  request.setAttribute("Lista", Lista);
                    request.getRequestDispatcher("listarProducto.jsp").forward(request, response);
                
                break;
            case "Consultar":
                try{
                    String Id=request.getParameter("Id");
                    String sql="select * from t_producto where Id_Prod=?";
                    ps= conn.prepareStatement(sql);
                    ps.setString(1, Id);
                    rs= ps.executeQuery();
                    producto product=new producto();
                    while(rs.next()){
                        product.setId(rs.getString("Id_Prod"));
                        product.setDescripcion(rs.getString("Descripcion"));
                        product.setCosto(rs.getFloat("costo"));
                        product.setPrecio(rs.getFloat("precio"));
                        product.setCantidad(rs.getInt("cantidad"));
                        Lista.add(product);
                    }
                    request.setAttribute("Lista", Lista);
                    request.getRequestDispatcher("consultarProducto.jsp").forward(request, response);
                }catch(SQLException ex){
                    System.out.println("Error de SQL..."+ex.getMessage());
                } finally{
                    conBD.Discconet();
                }                
                break;    
            case "Modificar":
                try{
                    String Id=request.getParameter("Id");
                    String sql="select * from t_producto where Id_Prod=?";
                    ps= conn.prepareStatement(sql);
                    ps.setString(1, Id);
                    rs= ps.executeQuery();
                    producto product=new producto();
                    while(rs.next()){
                        
                        product.setId(rs.getString("Id_Prod"));
                        product.setDescripcion(rs.getString("Descripcion"));
                        product.setCosto(rs.getFloat("costo"));
                        product.setPrecio(rs.getFloat("precio"));
                        product.setCantidad(rs.getInt("cantidad"));
                        Lista.add(product);
                    }
                    request.setAttribute("Lista", Lista);
                    request.getRequestDispatcher("modificarProducto.jsp").forward(request, response);
                }catch(SQLException ex){
                    System.out.println("Error de SQL..."+ex.getMessage());
                } finally{
                    conBD.Discconet();
                }                 
                
                break;
            case "Eliminar":
                try{
                    String Id=request.getParameter("Id");
                    String sql="delete from t_producto where Id_Prod=?";
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
                request.getRequestDispatcher("NuevoProducto.jsp").forward(request, response);
                break; 
            case "ListarJson":
                 Lista=ListarProductos();
                 JsonArrayBuilder jsonArrayBuilder = Json.createArrayBuilder();
                for (producto p : Lista) {
                    JsonObjectBuilder jsonObjectBuilder = Json.createObjectBuilder();
                    jsonObjectBuilder.add("Id_Prod", p.getId()); 
                    jsonObjectBuilder.add("Descripcion",p.getDescripcion());
                    jsonObjectBuilder.add("precio", p.getPrecio());
                    jsonObjectBuilder.add("cantidad", p.getCantidad());

                    JsonObject jsonObject = jsonObjectBuilder.build();
                    jsonArrayBuilder.add(jsonObject);
                }
                JsonArray jsonArray = jsonArrayBuilder.build();
                String json = jsonArray.toString();
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
                 
                
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
        String Id =request.getParameter("Id");       
        String Descripcion=request.getParameter("descripcion"); 
        Float Costo= Float.parseFloat(request.getParameter("costo").toString());
        Float Precio=Float.parseFloat(request.getParameter("precio").toString()); 
        Integer Cantidad=Integer.parseInt(request.getParameter("cantidad").toString()); 
        producto product=new producto();
        
        product.setId(Id);
        product.setDescripcion(Descripcion);
        product.setCosto(Costo);
        product.setPrecio(Precio);
        product.setCantidad(Cantidad);
       
        
        conexionBD conBD = new conexionBD();
        Connection conn = conBD.Connected();
        PreparedStatement ps;
        ResultSet rs;        
        
        
        
        
        
        if(Id.isEmpty()){
            String sql="insert into t_producto(Id_Prod, Descripcion, costo, precio, cantidad) values(?, ?, ?, ?, ?)";

            try{
              
           String Id_Prod=NuevoCodigoProducto();
                ps= conn.prepareStatement(sql);
                ps.setString(1, Id_Prod);
                ps.setString(2, product.getDescripcion());
                ps.setFloat(3, product.getCosto());
                ps.setFloat(4, product.getPrecio());
                ps.setInt(5, product.getCantidad());
                
                ps.executeUpdate(); 
            }catch(SQLException ex){
                System.out.println("Error actualizando tabla..."+ex.getMessage());
            } finally{
                conBD.Discconet();
            }               
        }else{
            String sql="update t_producto set Descripcion=?, costo=?, precio=?, cantidad=? where Id_Prod=?" ;

            try{
                ps= conn.prepareStatement(sql);
                ps.setString(1, product.getDescripcion());
                ps.setFloat(2, product.getCosto());
                ps.setFloat(3, product.getPrecio());
                ps.setInt(4, product.getCantidad());
                ps.setString(5, product.getId());
               
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

    
    public ArrayList<producto> ListarProductos(){
                conexionBD conBD = new conexionBD();
        Connection conn = conBD.Connected();
        PreparedStatement ps;
        ResultSet rs;
         ArrayList<producto> Lista= new ArrayList<producto>();
             try{
                    String sql="SELECT * FROM t_producto";
                    ps= conn.prepareStatement(sql);
                    rs= ps.executeQuery();
                    while(rs.next()){
                        producto product=new producto();
                        product.setId(rs.getString("Id_Prod"));
                        product.setDescripcion(rs.getString("Descripcion"));
                        product.setCosto(rs.getFloat("costo"));
                        product.setPrecio(rs.getFloat("precio"));
                        product.setCantidad(rs.getInt("cantidad"));
                        Lista.add(product);
                    }
                    
                }catch(SQLException ex){
                    System.out.println("Error de SQL..."+ex.getMessage());
                } finally{
                    conBD.Discconet();
                }
             
             return Lista;
    }
    
    
    public String NuevoCodigoProducto(){
         ArrayList<producto> Lista= new ArrayList<producto>();
         String CodProducto="";
         
         Lista=ListarProductos();
        
        producto productoMayor = Lista.stream()
                .max(producto::compareTo)
                .orElse(null);
         
       Integer codeMax=Integer.parseInt(productoMayor.getId().substring(1));
        
          codeMax++;
            CodProducto = "P" + String.format("%05d", codeMax); // Crear el nuevo valor con el formato deseado

         
         
         return CodProducto;
    }
    
    
}
