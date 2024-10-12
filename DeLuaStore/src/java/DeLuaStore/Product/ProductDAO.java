/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DeLuaStore.Product;

import DeLuaStore.Brand.BrandDAO;
import DeLuaStore.Brand.BrandDTO;
import DeLuaStore.Category.CategoryDAO;
import DeLuaStore.Category.CategoryDTO;
import DeLuaStore.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Anh Tu
 */
public class ProductDAO {

    BrandDAO brandDao = new BrandDAO();
    CategoryDAO categoryDao = new CategoryDAO();

    public List<ProductDTO> listTopProductsByCategory(int numberOfElement, int catagoryId) {
        List<ProductDTO> list = new ArrayList<ProductDTO>();

        try {
            Connection con = DBUtils.getConnection();
            String sql = "SELECT productId, proName, brandId, categoryId, imagePath, [description],status \n"
                    + "FROM Product \n"
                    + "WHERE productId IN (\n"
                    + "    SELECT TOP (?) p.productId\n"
                    + "    FROM Product p \n"
                    + "    JOIN Variant v ON p.productId = v.productId\n"
                    + "    JOIN OrderDetail od ON v.variantId = od.variantId\n"
                    + "    JOIN [Order] o ON od.orderId = o.orderId\n"
                    + "    WHERE p.categoryId = (?) AND o.[status] = 'Shipped'\n"
                    + "    GROUP BY p.productId\n"
                    + "    ORDER BY COUNT(od.variantId) DESC\n"
                    + ") ";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, numberOfElement);
            ps.setInt(2, catagoryId);
            ResultSet rs = ps.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int productId = rs.getInt("productId");
                    String proName = rs.getString("proName");
                    int brandId = rs.getInt("brandId");

                    BrandDTO brand = brandDao.getBrandById(brandId);

                    CategoryDTO category = categoryDao.getCategoryById(catagoryId);
                    String imagePath = rs.getString("imagePath");
                    String description = rs.getString("description");
                    String status = rs.getString("status");
                    ProductDTO product = new ProductDTO(productId, proName, brand, category, imagePath, description, status);
                    list.add(product);
                    System.out.println(list);
                }

            }
            System.out.println(list);
            con.close();
        } catch (Exception ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return list;
    }

    public List<ProductDTO> listAllProduct(int numberOfElement) {
        List<ProductDTO> list = new ArrayList<ProductDTO>();
        try {
            Connection con = DBUtils.getConnection();
            String sql = "SELECT TOP (?) productId, proName, brandId, categoryId, imagePath, [description],status  FROM Product WHERE status = 'enable' ";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, numberOfElement);
            ResultSet rs = ps.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int productId = rs.getInt("productId");
                    String proName = rs.getString("proName");
                    int brandId = rs.getInt("brandId");

                    BrandDTO brand = brandDao.getBrandById(brandId);
                    int categoryId = rs.getInt("categoryId");
                    CategoryDTO category = categoryDao.getCategoryById(categoryId);
                    String imagePath = rs.getString("imagePath");
                    String description = rs.getString("description");
                    String status = rs.getString("status");
                    ProductDTO product = new ProductDTO(productId, proName, brand, category, imagePath, description, status);
                    list.add(product);
                    System.out.println(list);
                }

            }
        } catch (Exception ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return list;
    }

    public ProductDTO getProductByVariantId(int variantId) {
        ProductDTO product = new ProductDTO();
        try {

            String sql = "SELECT p.productId,\n"
                    + "       p.proName,\n"
                    + "       p.brandId,\n"
                    + "       p.categoryId,\n"
                    + "       p.imagePath,\n"
                    + "       p.description\n"
                    + "       p.status \n"
                    + "FROM Variant v\n"
                    + "JOIN Product p ON v.productId = p.productId\n"
                    + "WHERE v.variantId = ? ;";
            Connection con = DBUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, variantId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int productId = rs.getInt("productId");
                String proName = rs.getString("proName");
                int brandId = rs.getInt("brandId");
                BrandDTO brand = brandDao.getBrandById(brandId);
                int categoryId = rs.getInt("categoryId");
                CategoryDTO category = categoryDao.getCategoryById(categoryId);
                String imagePath = rs.getString("imagePath");
                String description = rs.getString("description");
                String status = rs.getString("status");
                product = new ProductDTO(productId, proName, brand, category, imagePath, description,status);

            }
        } catch (Exception ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return product;
    }

    public ProductDTO getProductByProductId(int productId) {
        ProductDTO product = new ProductDTO();
        try {
            String sql = "SELECT productId, proName, brandId, categoryId, imagePath, description,status FROM Product WHERE productId = ? AND status='enable' ";
            Connection con = DBUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String proName = rs.getString("proName");
                int brandId = rs.getInt("brandId");
                BrandDTO brand = brandDao.getBrandById(brandId);
                int categoryId = rs.getInt("categoryId");
                CategoryDTO category = categoryDao.getCategoryById(categoryId);
                String imagePath = rs.getString("imagePath");
                String description = rs.getString("description");
                String status = rs.getString("status");
                product = new ProductDTO(productId, proName, brand, category, imagePath, description,status);
            }
        } catch (Exception ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return product;
    }

    public Integer insert(ProductDTO product) {
        String sql = "INSERT INTO product(productId, proName, brandId, categoryId, imagePath, description,status)"
                + "VALUES (?, ?, ?, ?, ?, ? , 'enable' )";
        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, product.getProductId());
            ps.setString(2, product.getProductName());
            ps.setInt(3, product.getBrand().getBrandId());
            ps.setInt(4, product.getCategory().getCategoryId());
            ps.setString(5, product.getImagePath());
            ps.setString(6, product.getDescription());

            ps.executeUpdate();
            con.close();
            return product.getProductId();
        } catch (SQLException e) {
            System.out.println("Insert product eror!" + e.getMessage());
            e.printStackTrace();
        }
        return null;
    }

    public int getNextProductId() {
        int maxId = 0;
        String sql = "SELECT MAX(productId) as maxId FROM Product";
        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                maxId = rs.getInt("maxId");
            }
            con.close();
        } catch (Exception ex) {
            System.out.println("getMaxID error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return maxId + 1;

    }

    public boolean deleteProduct(int productId) {
         String sql = "UPDATE [Product]  SET [status] = 'disable' WHERE productId = ? ";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, productId);
            ps.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.out.println("Delete product error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return false;
    }

   
}
