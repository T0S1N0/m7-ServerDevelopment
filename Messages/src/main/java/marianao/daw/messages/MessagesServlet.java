/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package marianao.daw.messages;


import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
    }

    protected void mainMethod(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        user = request.getUserPrincipal().getName();
        String parentFolder = dirRoute + File.separator + user;

        buildDirectories(parentFolder);

        saveSession(request);

        response.sendRedirect(request.getContextPath() + "/welcomePage.jsp");
        
    }

    protected void buildDirectories(String parentFolder) {
        new File(parentFolder).mkdir();
        new File(parentFolder + File.separator + "Received").mkdir();
        new File(parentFolder + File.separator + "Sent").mkdir();
    }

    protected String[] listFilesInFolder(String receivedOrSent) {
        
        File folder = new File(dirRoute + File.separator + user + File.separator + receivedOrSent);//File.separator hace referencia al caracter "/"
        File[] listOfFiles = folder.listFiles();
        String[] listOfMsgArray = new String[listOfFiles.length];

        for (int i = 0; i < listOfFiles.length; i++) {
            if (listOfFiles[i].isFile()) {
                listOfMsgArray[i] = listOfFiles[i].getName();
            }
        }
        return listOfMsgArray;
    }


    protected void logOut() {
    }
    
    protected void saveSession(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.setAttribute("user", user);
        session.setAttribute("dirRoute", dirRoute);
        session.setAttribute("receivedMSG", listFilesInFolder("Received"));
        session.setAttribute("sentMSG", listFilesInFolder("Sent"));
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
        mainMethod(request, response);
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
        mainMethod(request, response);
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
