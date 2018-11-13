/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package marianao.daw.messages;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author mique
 */
public class WriteNewMessageServlet extends HttpServlet {

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
        
        HttpSession session = request.getSession();
        String dirRoute = (String) session.getAttribute("dirRoute");
      
        newMessage(request.getParameter("userSelected"), request.getParameter("content"), dirRoute );       
        
        response.sendRedirect(request.getContextPath());
        
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
    
    
   protected void newMessage(String user, String content, String dirRoute) throws IOException{
                      
       DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd-HH.mm.ss");
       Date date = new Date();
       
       String parentFolderStr = dirRoute + File.separator + user;
       File parentFolder = new File(parentFolderStr);
       
       if (!parentFolder.exists()) {
           buildDirectories(parentFolderStr);
       }
           
        try (Writer writer = new BufferedWriter(new OutputStreamWriter(
                new FileOutputStream(dirRoute + File.separator + user + File.separator + "Received" + File.separator + dateFormat.format(date) + ".MSG"), "utf-8"))) {
            writer.write(content);
        }
             
        try (Writer writer = new BufferedWriter(new OutputStreamWriter(
                new FileOutputStream(dirRoute + File.separator + user + File.separator + "Sent" + File.separator + dateFormat.format(date) + ".MSG"), "utf-8"))) {
            writer.write(content);
        }
    }
   
   protected void buildDirectories(String parentFolder) {
        new File(parentFolder).mkdir();
        new File(parentFolder + File.separator + "Received").mkdir();
        new File(parentFolder + File.separator + "Sent").mkdir();
    }

}
