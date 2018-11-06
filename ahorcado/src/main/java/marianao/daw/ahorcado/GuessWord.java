/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package marianao.daw.ahorcado;

import java.io.IOException;
import java.util.Arrays;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author mmartin
 */
public class GuessWord extends HttpServlet {

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

        String letter = request.getParameter("userLetter").toUpperCase();
        //Realizamos el cast de las variables de sesion(Objects) para poder utilizarlas
        String secretWord = (String) session.getAttribute("secretWord");
        char[] hiddenWord = (char[]) session.getAttribute("hiddenWord");
        //Guardamos el parametro de inicio 'tries' como cadena en una variable int para poder operar con el
        int tries = new Integer(session.getAttribute("tries").toString());

        if (secretWord.contains(letter)) {
            for (int i = 0; i < secretWord.length(); i++) {
                if (hiddenWord[i] == '-' && (secretWord.charAt(i) == letter.charAt(0))) {
                    hiddenWord[i] = letter.charAt(0);
                }
            }
        } else {
            tries--;
        }

        updateSession(request, secretWord, hiddenWord, tries);

        checkStatus(secretWord, hiddenWord, tries, request, response);
    }

    protected void updateSession(HttpServletRequest request, String secretWord, char[] hiddenWord, int tries) {
        HttpSession session = request.getSession();
        session.setAttribute("secretWord", secretWord);
        session.setAttribute("hiddenWord", hiddenWord);
        //Transformar la array de chars a String para que el usuario la pueda leer en pantalla
        String hiddenWordString = new String(hiddenWord);
        session.setAttribute("hiddenWordString", hiddenWordString);
        session.setAttribute("tries", tries);
    }

    protected void checkStatus(String secretWord, char[] hiddenWord, int tries, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        //Transforma el String secretWord en una cadena de chars para poder compararlo con la palabra encriptada
        if (Arrays.equals(secretWord.toCharArray(), hiddenWord)) {
            response.sendRedirect(request.getContextPath() + "/youWin.jsp");
        } else if (tries == 0) {
            response.sendRedirect(request.getContextPath() + "/gameOver.jsp");
        } else {
            //Como vamos a seguir en la misma vista usaremos foreward
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/guessWord.jsp");
            dispatcher.forward(request, response);
        }
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
