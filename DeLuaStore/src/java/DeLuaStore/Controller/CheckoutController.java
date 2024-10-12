/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DeLuaStore.Controller;

import DeLuaStore.Address.AddressDAO;
import DeLuaStore.Address.AddressDTO;
import DeLuaStore.Order.OrderDAO;
import DeLuaStore.Order.OrderDTO;
import DeLuaStore.OrderDetail.OrderDetailDAO;
import DeLuaStore.OrderDetail.OrderDetailDTO;
import DeLuaStore.User.UserDAO;
import DeLuaStore.User.UserDTO;
import DeLuaStore.Variant.VariantDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ADMIN
 */
public class CheckoutController extends HttpServlet {

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

            HttpSession session = request.getSession(false);
            String action = request.getParameter("action");
            AddressDAO addressDao = new AddressDAO();
             OrderDAO orderDao = new OrderDAO();
             OrderDetailDAO orderDetailDAo= new  OrderDetailDAO();
            UserDAO userDao = new UserDAO();
            if (session == null || session.getAttribute("usersession") == null) {
                request.setAttribute("msg", "You need login before Checkout.");
                request.getRequestDispatcher("login.jsp").forward(request, response);

                return;
            }

            if (action == null) {
                 UserDTO user = (UserDTO) session.getAttribute("usersession");
                  List<OrderDetailDTO> cartList = (List<OrderDetailDTO>) session.getAttribute("cartList");
                 AddressDTO add=user.getAddress();
                // update address truoc
                
                String street=request.getParameter("street");
                String city=request.getParameter("city");
                String state=request.getParameter("state");
                add.setStreet(street);
                add.setCity(city);
                add.setState(state);
                //update databse
                addressDao.update(add);
                
                //update name va gmail
                String name = request.getParameter("name");
                String userName = request.getParameter("userName");
                String email = request.getParameter("email");
                System.out.println(request.getParameter("total"));
                float total=Float.parseFloat(request.getParameter("total"));
                
               
                user.setName(name);
                user.setEmail(email);
                user.setAddress(add);
                //update databse
                userDao.update(user);
                //them vao databse
                for(OrderDetailDTO o:cartList)
                orderDetailDAo.insertOrderDetail(o);
               
                //// tao order
                java.util.Date utilDate = new java.util.Date();
                java.sql.Date orderDate = new java.sql.Date(utilDate.getTime());
               
                
                 OrderDTO order = new OrderDTO(
                        orderDao.getNextOrderId(),
                        orderDate,
                        "pending",
                        addressDao.getAddressById(user.getUserId()),
                        user.getPhoneNum(),
                        total,
                        user,
                        cartList);
               
                 //them vao data base
                  orderDao.insertOrder(order);
                  
                request.setAttribute("order",order);
                //get thont tin addres trong bang parametter truyen tu checkout
                //update lại address (    gọi updateAddressbyUserId(int userId)    )
                //bắt orderId từ CartController -> ?action=checkout
                // gọi orderId = getNextOrderId
                // goi insertOrder trong orderDao
                //
                // chạy vòng for(trong cartList) gọi insertOrderDetail( OrderDetailDTO orderDetail,  orderId)
                // getOrderbyId tring orderDao hiển thị lên
                //dispatcher  qua trackorder
                session.removeAttribute("cartList");
                request.getRequestDispatcher("trackorder.jsp").forward(request, response);
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
