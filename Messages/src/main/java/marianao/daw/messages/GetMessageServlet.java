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

        String msgSelected = request.getParameter("msgSelected");
        
        String date = msgSelected.substring(0, 19);
//        esto quita los ultimos 4 caracteres del nombre del archivo para poder sacar el nombre del usuario
        int exception = msgSelected.length() - 4;
        
        String userName = msgSelected.substring(20, exception);
        
        System.out.println(date);
        System.out.println(userName);

        String folder = request.getParameter("folder");

        String msgRoute = session.getAttribute("dirRoute") + File.separator + session.getAttribute("user") + File.separator + folder + File.separator + msgSelected;

        String msgContent = findSelectedMsg(msgRoute);
        
        response.sendRedirect(request.getContextPath() + "/showReceivedMsg.jsp?msgCotent=" + msgContent + "&user=" + userName + "&date=" + date);
    }

    protected String findSelectedMsg(String msgRoute) {
        BufferedReader reader = null;
        String msgContent = "";
        try {
            File file = new File(msgRoute);
            reader = new BufferedReader(new FileReader(file));

            String line;
            while ((line = reader.readLine()) != null) {
                msgContent += line + "\n";
                System.out.println(msgContent);
            }

        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                reader.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
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
