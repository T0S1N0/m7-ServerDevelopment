/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package marianao.daw.ahorcado;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author mmartin
 */
public class SaveWord extends HttpServlet {

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
        //response.setContentType("text/html;charset=UTF-8");
        
        String secretWord = request.getParameter("secretWord");
        
        char[] hiddenWord = new char[secretWord.length()];
        for (int i = 0; i < secretWord.length(); i++) {
            hiddenWord[i] = '-';//comillas = char | comillas dobles = string
        }

        createSession(request, secretWord, hiddenWord);

        response.sendRedirect(request.getContextPath() + "/guessWord.jsp");

//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet SaveWord</title>");
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet SaveWord at " + hiddenWord + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
    }

    protected void createSession(HttpServletRequest request, String secretWord, char[] hiddenWord) {
        HttpSession session = request.getSession();
        session.setAttribute("secretWord", secretWord);
        session.setAttribute("hiddenWord", hiddenWord);
        //Transformar la array de chars a String para que el usuario la pueda leer en pantalla
            String hiddenWordString = new String(hiddenWord);
            session.setAttribute("hiddenWordString", hiddenWordString);
        session.setAttribute("intentos", getServletContext().getInitParameter("intentos"));
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
