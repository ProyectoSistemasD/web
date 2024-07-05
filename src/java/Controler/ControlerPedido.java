/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controler;

import Entidades.cliente;
import Entidades.detallePedido;
import Entidades.pedido;
import com.sun.org.apache.xerces.internal.impl.dv.xs.DecimalDV;
import conexion.conexionBD;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author javie
 */
@WebServlet(name = "ControlerPedido", urlPatterns = {"/ControlerPedido"})
public class ControlerPedido extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
  

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
        ArrayList<pedido> Lista= new ArrayList<pedido>();
        ArrayList<detallePedido> ListaDet= new ArrayList<detallePedido>();
        conexionBD conBD = new conexionBD();
        Connection conn = conBD.Connected();
        PreparedStatement ps;
        ResultSet rs;
        switch(Op){
            case "Listar":
                try{
                    String sql="SELECT Id_Pedido, A.Id_Cliente, B.Apellidos, B.Nombres, A.Fecha,"+
                               "A.SubTotal, A.TotalVenta FROM t_pedido A inner join t_cliente B on A.Id_Cliente=B.Id_Cliente";
                    //String sql="SELECT * FROM t_pedido";
                    ps= conn.prepareStatement(sql);
                    rs= ps.executeQuery();
                    while(rs.next()){
                        pedido Pedido=new pedido();
                        Pedido.setId_Pedido(rs.getString(1));
                        Pedido.setId_Cliente(rs.getString(2));
                        Pedido.setApellidos(rs.getString(3));
                        Pedido.setNombres(rs.getString(4));
                        Pedido.setFecha(rs.getDate(5));
                        Pedido.setSubTotal(rs.getDouble(6));
                        Pedido.setTotalVenta(rs.getDouble(7));
                        Lista.add(Pedido);
                    }
                    request.setAttribute("Lista", Lista);
                    request.getRequestDispatcher("listarPedido.jsp").forward(request, response);
                }catch(SQLException ex){
                    System.out.println("Error de SQL..."+ex.getMessage());
                }finally{
                    conBD.Discconet();
                }
                break;
            case "Consultar":
                 try {
                    String Id = request.getParameter("Id");
                    String sql = "SELECT A.Id_Pedido, A.Id_Prod, Descripcion, A.Cantidad, A.Precio, TotalDeta, C.Nombres, C.Apellidos "
                            + "FROM t_detalle_pedido A "
                            + "INNER JOIN t_producto B ON A.Id_Prod = B.Id_Prod "
                            + "INNER JOIN t_pedido P ON A.Id_Pedido = P.Id_Pedido "
                            + "INNER JOIN t_cliente C ON P.Id_Cliente = C.Id_Cliente "
                            + "WHERE A.Id_Pedido = ?";
                    ps = conn.prepareStatement(sql);
                    ps.setString(1, Id);
                    rs = ps.executeQuery();

                    double totalVentas = 0.0;

                    while (rs.next()) {
                        detallePedido DetaPed = new detallePedido();
                        DetaPed.setId_Pedido(rs.getString(1));
                        DetaPed.setId_Prod(rs.getString(2));
                        DetaPed.setDescripcion(rs.getString(3));
                        DetaPed.setCantidad(rs.getDouble(4));
                        DetaPed.setPrecio(rs.getDouble(5));
                        DetaPed.setTotalDeta(rs.getDouble(6));
                        ListaDet.add(DetaPed);

                        totalVentas += rs.getDouble(6);

                        // Obtener los nombres del cliente
                        String nombresCliente = rs.getString("Nombres");
                        String apellidosCliente = rs.getString("Apellidos");
                        request.setAttribute("NombresCliente", nombresCliente);
                        request.setAttribute("ApellidosCliente", apellidosCliente);
                    }

                    request.setAttribute("Lista", ListaDet);
                    request.setAttribute("TotalVentas", totalVentas);
                    request.getRequestDispatcher("consultarPedido.jsp").forward(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                } finally {
                    conBD.Discconet();
                }
                break;                   

            case "Eliminar":
                
                break;
            case "Nuevo":
                request.getRequestDispatcher("RegistrarPedido.jsp").forward(request, response);
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
         request.setCharacterEncoding("UTF-8");
        String[] Id_Prod =request.getParameterValues("Id_Prod");       
        String[] precio=request.getParameterValues("precio"); 
        String[] cantidad=request.getParameterValues("cantidad"); 
        String txtSubTotal=request.getParameter("txtSubTotal");
        String txtTotal=request.getParameter("txtTotal");
        String txtCodigoCliente=request.getParameter("txtCodigoCliente");
        
        conexionBD conBD = new conexionBD();
        Connection conn = conBD.Connected();
        PreparedStatement ps;
        ResultSet rs;
        pedido ped = new pedido();
        ped.setId_Cliente(txtCodigoCliente);
        ped.setId_Pedido(NuevoCodigoPedido());
        ped.setSubTotal( Double.parseDouble(txtSubTotal));
        ped.setTotalVenta(Double.parseDouble(txtTotal));
        
        
            String sql="INSERT INTO t_pedido (Id_Pedido, Id_Cliente, Fecha, SubTotal, TotalVenta) VALUES (?, ?, CURDATE(), ?, ?)";

            try{
                /*Algoritmo para autogeneral el código*/
            ps= conn.prepareStatement(sql);
            ps.setString(1, ped.getId_Pedido());
            ps.setString(2, ped.getId_Cliente());
            ps.setDouble(3, ped.getSubTotal());
            ps.setDouble(4, ped.getTotalVenta());
                
                ps.executeUpdate(); 
            }catch(SQLException ex){
                System.out.println("Error actualizando tabla..."+ex.getMessage());
            } finally{
                conBD.Discconet();
            }    
        
        
        for(int i=0;i<Id_Prod.length;i++){
            
             sql="INSERT INTO t_detalle_pedido (Id_Pedido, Id_Prod, cantidad, precio, TotalDeta) VALUES (?, ?, ?, ?, ?)";
         conBD = new conexionBD();
         conn = conBD.Connected();
            try{
                /*Algoritmo para autogeneral el código*/
            ps= conn.prepareStatement(sql);
            ps.setString(1, ped.getId_Pedido());
            ps.setString(2, Id_Prod[i]);
            ps.setInt(3, Integer.parseInt(cantidad[i]));
            ps.setDouble(4, Double.parseDouble(precio[i]));
            ps.setDouble(5, Double.parseDouble(cantidad[i]) * Double.parseDouble(precio[i]));
            ps.executeUpdate(); 
            }catch(SQLException ex){
                System.out.println("Error actualizando tabla..."+ex.getMessage());
            } finally{
                conBD.Discconet();
            } 
            
            ActualizarStock(Id_Prod[i],Integer.parseInt(cantidad[i]));
            
        }
        
        
        
        
        response.sendRedirect("index.jsp");       
        
    }
    
    
     public ArrayList<pedido> ListarPedido(){
            conexionBD conBD = new conexionBD();
        Connection conn = conBD.Connected();
        PreparedStatement ps;
        ResultSet rs;
         ArrayList<pedido> Lista= new ArrayList<pedido>();
                try{
                    String sql="SELECT Id_Pedido, A.Id_Cliente, B.Apellidos, B.Nombres, A.Fecha,"+
                               "A.SubTotal, A.TotalVenta FROM t_pedido A left join t_cliente B on A.Id_Cliente=B.Id_Cliente";
                    //String sql="SELECT * FROM t_pedido";
                    ps= conn.prepareStatement(sql);
                    rs= ps.executeQuery();
                    while(rs.next()){
                        pedido Pedido=new pedido();
                        Pedido.setId_Pedido(rs.getString(1));
                        Pedido.setId_Cliente(rs.getString(2));
                        Pedido.setApellidos(rs.getString(3));
                        Pedido.setNombres(rs.getString(4));
                        Pedido.setFecha(rs.getDate(5));
                        Pedido.setSubTotal(rs.getDouble(6));
                        Pedido.setTotalVenta(rs.getDouble(7));
                        Lista.add(Pedido);
                    }
                   
                }catch(SQLException ex){
                    System.out.println("Error de SQL..."+ex.getMessage());
                }finally{
                    conBD.Discconet();
                }
  
        
        return Lista;
    }
     
     public void ActualizarStock(String Id,int cantidad){
             
   conexionBD conBD = new conexionBD();
        Connection conn = conBD.Connected();
        PreparedStatement ps;
        ResultSet rs;      

String sql="update t_producto set  cantidad=cantidad-? where Id_Prod=?" ;

            try{
                ps= conn.prepareStatement(sql);
                ps.setInt(1, cantidad);
                ps.setString(2, Id);
                ps.executeUpdate(); 
            }catch(SQLException ex){
                System.out.println("Error actualizando tabla..."+ex.getMessage());
            } finally{
                conBD.Discconet();
            } 
     }
     
     
       public String NuevoCodigoPedido(){
        ArrayList<pedido> Lista= new ArrayList<pedido>();
        String CodPedido="";
        
        Lista=ListarPedido();
        
        pedido pedidoMayor = Lista.stream()
                .max(pedido::compareTo)
                .orElse(null);
        
        Integer codeMax=Integer.parseInt(pedidoMayor.getId_Pedido().substring(1));
        
        codeMax++;
            CodPedido = "P" + String.format("%04d", codeMax);
            
        return CodPedido;
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
