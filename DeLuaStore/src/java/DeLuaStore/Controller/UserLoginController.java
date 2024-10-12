/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DeLuaStore.Controller;

import DeLuaStore.User.UserDAO;
import DeLuaStore.User.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Anh Tu
 */
@WebServlet(name = "UserLoginController", urlPatterns = {"/Login"})
public class UserLoginController extends HttpServlet {

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
            String action = request.getParameter("action");
            String username = request.getParameter("user");
            String password = request.getParameter("password");
            UserDAO userDao = new UserDAO();
            if (action == null || action.equals("login")) {

                UserDTO user = userDao.login(username, password);
                if (user != null) {
                    HttpSession session = request.getSession(true);
                    session.setAttribute("usersession", user);
                    response.sendRedirect("./Home");
                } else {
                    request.setAttribute("msg", "Username or password is incorrect");
                    RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                    rd.forward(request, response);
                }
            } else if (action != null && action.equals("logout")) {
                HttpSession session = request.getSession(false);
                if (session != null) {
                    session.invalidate();
//                    request.setAttribute("msg", "Logout successfully");
                    response.sendRedirect("./Home");
                }
            } else if (action.equals("Register")) {

                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String phoneNum = request.getParameter("phoneNum");
                String status = "Active";
                String repassword = request.getParameter("repassword");

//                if (!password.equals(repassword)) {
//                    request.setAttribute("msg", "Passwords do not match.");
//                    RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
//                    rd.forward(request, response);
//                    return;
//                }
                UserDTO newUser = new UserDTO();
                newUser.setUserId(userDao.getNextUserId());
                newUser.setName(name);
                newUser.setUsername(username);
                newUser.setPassword(password);
                newUser.setEmail(email);
                newUser.setPhoneNum(phoneNum);
                newUser.setStatus(status);

                boolean registrationSuccessful = userDao.register(newUser);

                if (registrationSuccessful) {
                    request.setAttribute("msg", "Registration successful! You can now login.");
                    RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                    rd.forward(request, response);
                } else {
                    request.setAttribute("msg", "Registration failed. Please try again.");
                    RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
                    rd.forward(request, response);
                }
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
