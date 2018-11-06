/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package marianao.daw.uploadfiles;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author mmartin
 */
@WebServlet(name = "uploadFilesServlet", urlPatterns = {"uploadFilesServlet"})
@MultipartConfig(location = "/C:\\Users\\mmartin\\mail")

public class UploadFilesServlet extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CarregaFitxerServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Càrrega de Fitxers</h1>");
            Part p = request.getPart("fitxer");
            p.write(p.getSubmittedFileName());
            out.println("<p>S'ha pujat el fitxer.</p>");
            out.println("</body>");
            out.println("</html>");
        }
    }

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
