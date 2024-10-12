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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Anh Tu
 */
public class ProductController extends HttpServlet {

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
            CategoryDAO categoryDao = new CategoryDAO();
            BrandDAO brandDao = new BrandDAO();
            ProductDAO productDao = new ProductDAO();
            VariantDAO variantDao = new VariantDAO();
            String action = request.getParameter("action");
            if (action == null || action.equals("list")) {
                String pSort = request.getParameter("pSort");
                if (pSort == null || pSort.isEmpty()) {
                    pSort = "DESC";
                }
                List<CategoryDTO> categoryList = categoryDao.getAllCategories();
                List<BrandDTO> listAllBrand = brandDao.listAllBrand();
                List<Integer> categoryIdList = new ArrayList<>();
                String[] categoryIdArray = request.getParameterValues("category");
                if (categoryIdArray != null) {
                    for (String categoryId : categoryIdArray) {
                        categoryIdList.add(Integer.parseInt(categoryId));
                    }
                    request.setAttribute("cateF", categoryIdList);
                }
                List<Integer> brandIdList = new ArrayList<>();
                String[] brandIdArray = request.getParameterValues("brand");
                if (brandIdArray != null) {
                    for (String brandId : brandIdArray) {
                        brandIdList.add(Integer.parseInt(brandId));
                    }
                    request.setAttribute("brandF", brandIdList);
                }

                List<VariantDTO> variantList = variantDao.listVariants(300, categoryIdList, brandIdList, pSort);
                request.setAttribute("pSort", pSort);
                request.setAttribute("listAllBrand", listAllBrand);
                request.setAttribute("categoryList", categoryList);
                request.setAttribute("variantList", variantList);
                request.getRequestDispatcher("./allproduct.jsp").forward(request, response);
            } else if (action.equals("detail")) {
                int variantId = Integer.parseInt(request.getParameter("id"));
                List<CategoryDTO> categoryList = categoryDao.getAllCategories();
                List<BrandDTO> listAllBrand = brandDao.listAllBrand();
                request.setAttribute("listAllBrand", listAllBrand);
                request.setAttribute("categoryList", categoryList);
                Integer index = null;
                if (request.getParameter("index") != null) {
                    index = Integer.parseInt(request.getParameter("index"));
                } else {
                    index = 0;
                }

                VariantDTO variant = variantDao.getVariantById(variantId);
                List<VariantDTO> listVariant = variantDao.listVariantByProductId(variant.getProduct().getProductId());
                request.setAttribute("maxIndex", listVariant.size() - 1);
                request.setAttribute("index", index);
                request.setAttribute("listVariant", listVariant);
                request.getRequestDispatcher("productdetail.jsp").forward(request, response);

            } else if (action.equals("productManager")) {
                HttpSession session = request.getSession(false);
                if (session.getAttribute("adminsession") == null) {
                    response.sendRedirect("adminlogin.jsp");
                } else {
                    List<ProductDTO> listAllProduct = productDao.listAllProduct(1000);
                    System.out.println(listAllProduct);
                    List<CategoryDTO> listCategory = categoryDao.getAllCategories();
                    request.setAttribute("listCategory", listCategory);
                    request.setAttribute("listAllProduct", listAllProduct);
                    request.getRequestDispatcher("productmanage.jsp").forward(request, response);
                }
            } else if (action.equals("addNewProduct")) {
                List<BrandDTO> listBrand = brandDao.listPopularBrand(100);
                List<CategoryDTO> listCategory = categoryDao.getAllCategories();
                ProductDTO product = null;
                request.setAttribute("listBrand", listBrand);
                request.setAttribute("product", product);
                request.setAttribute("maxId", productDao.getNextProductId());
                request.setAttribute("listCategory", listCategory);
                RequestDispatcher rd = request.getRequestDispatcher("addproduct.jsp");
                rd.forward(request, response);
            } else if (action.equals("insert")) {
                int productId = Integer.parseInt(request.getParameter("productId"));
                String proName = request.getParameter("proName");
                int brandId = Integer.parseInt(request.getParameter("brandId"));
                int categoryId = Integer.parseInt(request.getParameter("categoryId"));
                String imagePath = request.getParameter("imagePath");
                String description = request.getParameter("description");
                String status = request.getParameter("status");
                List<CategoryDTO> listCategory = categoryDao.getAllCategories();
                request.setAttribute("listCategory", listCategory);
//              http://localhost:8080/DeLuaStore/Product?productId=61&proName=khoa&description=tudi&imagePath=a&categoryId=2&brandId=1&action=insert
                ProductDTO product = new ProductDTO();
                product.setProductId(productId);
                product.setProductName(proName);
                product.setBrand(brandDao.getBrandById(brandId));
                product.setCategory(categoryDao.getCategoryById(categoryId));
                product.setImagePath(imagePath);
                product.setDescription(description);
                product.setStatus(status);
                productDao.insert(product);

                request.setAttribute("listAllProduct", productDao.listAllProduct(1000));

                request.setAttribute("product", product);
                RequestDispatcher rd = request.getRequestDispatcher("productmanage.jsp");
                rd.forward(request, response);

            } else if (action.equals("deleteProduct")) {
                Integer productId = null;
                try {
                    productId = Integer.parseInt(request.getParameter("productId"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }

                if (productId != null) {
                    productDao.deleteProduct(productId);
                }

                List<ProductDTO> listAllProduct = productDao.listAllProduct(1000);
                request.setAttribute("listAllProduct", listAllProduct);
                request.getRequestDispatcher("productmanage.jsp").forward(request, response);

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
