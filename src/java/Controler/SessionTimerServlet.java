/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controler;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Timer;
import java.util.TimerTask;
/**
 *
 * @author PC1
 */

@WebServlet("/session-timer")
public class SessionTimerServlet extends HttpServlet {
    private Timer timer;

    @Override
    public void init() throws ServletException {
        super.init();
        timer = new Timer();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        TimerTask tarea = new TimerTask() {
            @Override
            public void run() {
             try {
                    session.invalidate();
                    response.sendRedirect("pagina-de-cierre.jsp"); // Página a la que se redirigirá al cerrar la sesión
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        };

        long tiempoDeEspera = 10000; // 60 segundos
        timer.schedule(tarea, tiempoDeEspera);

        // Resto del código del servlet...
    }

    @Override
    public void destroy() {
        super.destroy();
        timer.cancel();
    }
}
