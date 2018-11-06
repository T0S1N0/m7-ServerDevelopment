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
import java.io.PrintWriter;
import java.io.Writer;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
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
    }

    protected void pageGenerator(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        buildDirectories(request);

        newMessage();

        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<script></script>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Messages</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<header>");
            out.println("<h1>Your Messages " + user + "</h1>");
            out.println("<button onclick=\"window.location.replace('http://localhost:8080/Messages/writeNewMessageForm.jsp');\"> Write New </button>");
            out.println("<div>");
            out.println("<h3>Inbox</h3>");
            out.println("<a>"+ listFilesInFolder() +"</a>");
            out.println("<h3>Sent</h3>");
            out.println("<a>Enviados</a>");
            out.println("</div>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    protected void buildDirectories(HttpServletRequest request) {
        user = request.getUserPrincipal().getName();
        String parentFolder = dirRoute + "\\" + user;
        new File(parentFolder).mkdir();
        new File(parentFolder + "\\Received").mkdir();
        new File(parentFolder + "\\Sent").mkdir();

    }

    protected String listFilesInFolder() {
        File folder = new File(dirRoute + "\\" + user + "\\Received");
        File[] listOfFiles = folder.listFiles();

        for (int i = 0; i < listOfFiles.length; i++) {
            if (listOfFiles[i].isFile()) {
                System.out.println("File " + listOfFiles[i].getName());
            }
        }
        return null;
    }

    protected void newMessage() throws IOException {

        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd-HH:mm");
        Date date = new Date();
        System.out.println(dateFormat.format(date));

        try (Writer writer = new BufferedWriter(new OutputStreamWriter(
                new FileOutputStream(dirRoute + "\\" + user + "\\" + dateFormat.format(date) + ".msg"), "utf-8"))) {
            writer.write("something");
        }
    }

    protected void deleteMessage() {
    }

    protected void logOut() {
    }

    protected void saveSession() {
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
