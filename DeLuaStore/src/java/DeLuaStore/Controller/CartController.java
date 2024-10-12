/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DeLuaStore.Controller;

import DeLuaStore.Address.AddressDAO;
import DeLuaStore.Brand.BrandDAO;
import DeLuaStore.Brand.BrandDTO;
import DeLuaStore.Category.CategoryDAO;
import DeLuaStore.Category.CategoryDTO;
import DeLuaStore.Order.OrderDAO;
import DeLuaStore.Order.OrderDTO;
import DeLuaStore.OrderDetail.OrderDetailDTO;
import DeLuaStore.User.UserDTO;
import DeLuaStore.Variant.VariantDAO;
import DeLuaStore.Variant.VariantDTO;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.console;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author hongh
 */
public class CartController extends HttpServlet {

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
            HttpSession session = request.getSession(false);
            System.out.println(action);
            VariantDAO variantDao = new VariantDAO();
            CategoryDAO categoryDao = new CategoryDAO();
            BrandDAO brandDao = new BrandDAO();
            List<CategoryDTO> categoryList = categoryDao.getAllCategories();
            List<BrandDTO> listAllBrand = brandDao.listAllBrand();
            request.setAttribute("listAllBrand", listAllBrand);
            request.setAttribute("categoryList", categoryList);
            //check login

            if (session == null || session.getAttribute("usersession") == null) {
                request.setAttribute("msg", "You need login before using cart.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
//                response.sendRedirect("login.jsp");
                return;
            }
            //end check login

            if (action != null && action.equals("addToCart")) {
                int variantId = Integer.parseInt(request.getParameter("id"));
                VariantDTO variant = new VariantDTO();
                variant = variantDao.getVariantById(variantId);
                session = request.getSession(false);
                List<OrderDetailDTO> cartList = (List<OrderDetailDTO>) session.getAttribute("cartList");
                System.out.println(variantId);
                if (variant != null) {
                    //gio hang chua co gi
                    if (cartList == null) {

                        cartList = new ArrayList<>();
                        OrderDetailDTO item = new OrderDetailDTO(variant, 1, 1, variant.getPrice(), variant.getDiscount());
                        cartList.add(item);

                    } else {//da ton tai gio hang

                        //check xem san pham da ton tai trong gio hang chua
                        boolean check = false;
                        for (OrderDetailDTO item : cartList) {
                            if (item.getVariant().getVariantId() == variantId) {
                                check = true;
                                //System.out.println("okkkkk");
                                item.setQuantity(item.getQuantity() + 1);
                            }
                        }
                        if (check == false) {
                            OrderDetailDTO item = new OrderDetailDTO(variant, 1, 1, variant.getPrice(), variant.getDiscount());
                            cartList.add(item);
                        }
                    }
                }
                session.setAttribute("cartList", cartList);
               
                request.getRequestDispatcher("cart.jsp").forward(request, response);
            } else if (action.equals("viewCart")) {
                session = request.getSession(false);
                List<VariantDTO> cartList = (List<VariantDTO>) session.getAttribute("cartList");
                if (cartList == null) {
                    cartList = new ArrayList<>();
                }
                request.setAttribute("cartList", cartList);
                request.getRequestDispatcher("cart.jsp").forward(request, response);
            } else if (action.equals("increaseQuantity")) {
                session = request.getSession(false);
                int index = Integer.parseInt(request.getParameter("index"));
                List<OrderDetailDTO> cartList = (List<OrderDetailDTO>) session.getAttribute("cartList");
                cartList.get(index).setQuantity(cartList.get(index).getQuantity() + 1);
                // System.out.println(cartList.get(index).getQuantity());
//                if( cartList.get(index).getQuantity() == 0)
//                {
//                    System.out.println("okkkkk");
//                  //  request.getRequestDispatcher("./Cart?index=${cartList.get(index).getQuantity()}&action=delete").forward(request, response);
//                }
                request.getRequestDispatcher("cart.jsp").forward(request, response);

            } else if (action.equals("decreaseQuantity")) {
                session = request.getSession(false);
                int index = Integer.parseInt(request.getParameter("index"));
                List<OrderDetailDTO> cartList = (List<OrderDetailDTO>) session.getAttribute("cartList");
                cartList.get(index).setQuantity(cartList.get(index).getQuantity() - 1);
                if (cartList.get(index).getQuantity() == 0) {
                    cartList.remove(index);
                    //  String url=./Cart?index+
                    //request.getRequestDispatcher("./Cart?index=${index}&action=delete").forward(request, response);
                }
                request.getRequestDispatcher("cart.jsp").forward(request, response);

            } else if (action.equals("delete")) {
                session = request.getSession(false);
                int index = Integer.parseInt(request.getParameter("index"));
                List<OrderDetailDTO> cartList = (List<OrderDetailDTO>) session.getAttribute("cartList");

                cartList.remove(index);

                request.getRequestDispatcher("cart.jsp").forward(request, response);

            } else if (action.equals("checkout")) {
                session = request.getSession(false);
                UserDTO user = (UserDTO) session.getAttribute("usersession");
                OrderDAO orderDao = new OrderDAO();
                AddressDAO addressDao = new AddressDAO();

                List<OrderDetailDTO> cartList = (List<OrderDetailDTO>) session.getAttribute("cartList");
                double total = Double.parseDouble(request.getParameter("total"));
                request.setAttribute("maxOrderId", orderDao.getNextOrderId());
                request.setAttribute("cartList", cartList);
                java.util.Date utilDate = new java.util.Date();
                java.sql.Date orderDate = new java.sql.Date(utilDate.getTime());
                
              
                request.getRequestDispatcher("checkout.jsp").forward(request, response);
            };
            //session -> orderDTO order 
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
