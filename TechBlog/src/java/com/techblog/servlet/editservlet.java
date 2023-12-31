
package com.techblog.servlet;

import com.techblog.dao.userdao;
import com.techblog.entities.Message;
import com.techblog.entities.User;
import com.techblog.helper.connectionprovider;
import com.techblog.helper.helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class editservlet extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet editservlet</title>");
            out.println("</head>");
            out.println("<body>");

// fetch all data from the edit profile..
            String userName = request.getParameter("user_name");
            String userEmail = request.getParameter("user_email");
            String userPassword = request.getParameter("user_password");
            String userAbout = request.getParameter("user_about");
            Part part = request.getPart("image");
            String imageName = part.getSubmittedFileName();

            //get the user from the session...
            HttpSession s = request.getSession();

            User user = (User) s.getAttribute("currentUser");

            user.setAbout(userAbout);
            user.setEmail(userEmail);
            user.setName(userName);
            user.setPassword(userPassword);
            
            String oldfile =user.getProfile();
            user.setProfile(imageName);

            userdao u = new userdao(connectionprovider.getConnection());

            boolean ans = u.updateuser(user);

            if (ans) {

                String path = request.getRealPath("/") + "pics" + File.separator + user.getProfile();

              
                
                      String oldpath = request.getRealPath("/") + "pics" + File.separator + oldfile;
                      
                      
                      if(!oldpath.equals("default.png")){
                        helper.deleteFile(oldpath);
                      }
                if (helper.saveFile(part.getInputStream(), path)) {

                    out.println("profilephoto updated");

                    Message msg = new Message("profilephoto updated", "success", "alert-success");
                    

                    s.setAttribute("msg", msg);

                } else {

                    out.println("not update");
                    Message msg = new Message("something wrong", "error", "alert-danger");
                    

                    s.setAttribute("msg", msg);
                }

                response.sendRedirect("profile.jsp");
            }

            out.println("</body>");
            out.println("</html>");
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
