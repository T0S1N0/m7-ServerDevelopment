/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package marianao.daw.messages;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FilenameFilter;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Path;
import java.nio.file.Paths;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author mique
 */
public class GetMessageServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        String selectedMsg = request.getParameter("selectedMsg");
        
        String msgDate = selectedMsg.substring(0, 19);
//        esto quita los ultimos 4 caracteres del nombre del archivo para poder sacar el nombre del usuario
        int exception = selectedMsg.length() - 4;
        
        String userName = selectedMsg.substring(20, exception);

        String folder = request.getParameter("folder");

        String msgRoute = session.getAttribute("dirRoute") + File.separator + session.getAttribute("user") + File.separator + folder + File.separator + selectedMsg;

        String msgContent = readingMsg(msgRoute);
        
       //response.sendRedirect(request.getContextPath() + "/showReceivedMsg.jsp?msgCotent=" + msgContent + "&user=" + userName + "&date=" + msgDate);
       
      
       request.setAttribute("msgContent", msgContent);
       request.setAttribute("user", userName);
       request.setAttribute("date", msgDate);
       request.getRequestDispatcher("/show" + folder + "Msg.jsp").forward(request, response);
    }

    protected String readingMsg(String msgRoute) throws IOException {
        BufferedReader reader = null;
        String msgContent = "";
            File file = new File(msgRoute);
            reader = new BufferedReader(new FileReader(file));

            String line;
            while ((line = reader.readLine()) != null) {
                msgContent += line;
            }
        reader.close();
        
        return msgContent;
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
