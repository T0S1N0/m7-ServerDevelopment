/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package marianao.daw.messages;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author mmartin
 */
public class MessagesServlet extends HttpServlet {
    private String dirRoute;
    private String user;
    
    

    @Override
    public void init() throws ServletException {
        dirRoute = getServletConfig().getInitParameter("route");  
        new File(dirRoute).mkdirs();
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
  
    
    protected void pageGenerator(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
           user = request.getUserPrincipal().getName(); 
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Mensajes de  " + user + "</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<header>");
            out.println("<h1>¡Hola " + user + "! Estos son tus mensajes</h1>");
            out.println("<div>");
            out.println("<a>Log out</a>");
            out.println("</div>");
            out.println("</header>");
            out.println("<a> Nuevo mensaje </a>");
            out.println("<div>");
            out.println("Aqui se muestran todos los mensajes.");
            out.println("</div>");
            out.println("</body>");
            out.println("</html>");
        }
    }
    
    protected void newMessage(){
        
    }
    protected void deleteMessage(){
    }
    protected void logOut(){
    }
    protected void saveSession(){
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
        pageGenerator(request, response);
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
        pageGenerator(request, response);
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
