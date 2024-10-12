/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DeLuaStore.Controller;

import DeLuaStore.Admin.AdminDAO;
import DeLuaStore.User.UserDAO;
import DeLuaStore.User.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "UserManagerController", urlPatterns = {"/UserManager"})
public class UserManagerController extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            String action = request.getParameter("action");
            //check login
            HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("adminsession") == null) {
                response.sendRedirect("adminlogin.jsp");
                return;
            }
            //end check login
          
            UserDAO userDao = new UserDAO();

            if (action == null) {
                List<UserDTO> listAllUser = userDao.listAllUser();

                request.setAttribute("listAllUser", listAllUser);

                request.getRequestDispatcher("usermanager.jsp").forward(request, response);

            }else if(action.equals("changeUserStatus")){
                Integer userId = null;
                try {
                   userId = Integer.parseInt(request.getParameter("userId"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }
                String currentStatus = request.getParameter("currentStatus");
                UserDTO user = null;
                if(userId != null){
                    user = userDao.getUserById(userId);
                    
                }
                userDao.changeUserStatus(userId, user.getStatus());
                List<UserDTO> listAllUser = userDao.listAllUser();

                request.setAttribute("listAllUser", listAllUser);

                request.getRequestDispatcher("usermanager.jsp").forward(request, response);
                        
               
            
        }
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
