/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DeLuaStore.Controller;

import DeLuaStore.Brand.BrandDAO;
import DeLuaStore.Brand.BrandDTO;
import DeLuaStore.Category.CategoryDAO;
import DeLuaStore.Category.CategoryDTO;
import DeLuaStore.Product.ProductDAO;
import DeLuaStore.Product.ProductDTO;
import DeLuaStore.Variant.VariantDAO;
import DeLuaStore.Variant.VariantDTO;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Anh Tu
 */
public class HomeController extends HttpServlet {

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
            Integer cateId = null;
            BrandDAO brandDao = new BrandDAO();
            CategoryDAO categoryDao = new CategoryDAO();
            VariantDAO variantDao = new VariantDAO();
            if (action == null) {
                List<CategoryDTO> categoryList = categoryDao.getAllCategories();
                List<BrandDTO> listPopularBrand = brandDao.listPopularBrand(5);
                List<BrandDTO> listAllBrand = brandDao.listAllBrand();
                List<VariantDTO> bestSellingVariantList = new ArrayList<VariantDTO>();
                if (request.getParameter("cateId") != null) {
                    cateId = Integer.parseInt(request.getParameter("cateId"));
                    bestSellingVariantList = variantDao.listBestSellingVariantsByCategory(8, cateId);
                } else {
                    bestSellingVariantList = variantDao.listAllBestSellingVariants(8);
                }
                request.setAttribute("listPhoneVariant", variantDao.listBestSellingVariantsByCategory(8, 1));
                request.setAttribute("listTabletVariant", variantDao.listBestSellingVariantsByCategory(8, 2));
                request.setAttribute("listLaptopVariant", variantDao.listBestSellingVariantsByCategory(8, 3));
                request.setAttribute("listAllBrand", listAllBrand);
                request.setAttribute("listPopularBrand", listPopularBrand);
                request.setAttribute("categoryList", categoryList);
                request.setAttribute("bestSellingVariantList", bestSellingVariantList);
                request.getRequestDispatcher("index.jsp").forward(request, response);

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
