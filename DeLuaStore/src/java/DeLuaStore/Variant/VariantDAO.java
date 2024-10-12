/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DeLuaStore.Variant;

import DeLuaStore.Product.ProductDAO;
import DeLuaStore.Product.ProductDTO;
import DeLuaStore.utils.DBUtils;
import java.math.BigDecimal;
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
public class VariantDAO {
     ProductDAO productDao = new ProductDAO();

    public List<VariantDTO> listBestSellingVariantsByCategory(int numberOfElement, int categoryId) {
        List<VariantDTO> list = new ArrayList<>();

        try {
            Connection con = DBUtils.getConnection();
            String sql = "SELECT TOP (?) v.variantId, v.productId, v.color, v.imagePath, v.display, v.stock, v.ram, v.storage, v.price, v.discount\n"
                    + "FROM OrderDetail od\n"
                    + "JOIN Variant v ON od.variantId = v.variantId\n"
                    + "JOIN Product p ON v.productId = p.productId\n"
                    + "WHERE p.categoryId = (?) AND p.status = 'enable' \n"
                    + "GROUP BY v.variantId, v.productId, v.color, v.imagePath, v.display, v.stock, v.ram, v.storage, v.price, v.discount\n"
                    + "ORDER BY SUM(od.quantity) DESC  ";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, numberOfElement);
            ps.setInt(2, categoryId);
            ResultSet rs = ps.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int variantId = rs.getInt("variantId");
                    int productId = rs.getInt("productId");
                    ProductDTO product = productDao.getProductByProductId(productId);
                    String color = rs.getString("color");
                    String imagePath = rs.getString("imagePath");
                    int display = rs.getInt("display");
                    int stock = rs.getInt("stock");
                    int ram = rs.getInt("ram");
                    int storage = rs.getInt("storage");
                    double price = rs.getDouble("price");
                    int discount = rs.getInt("discount");

                    VariantDTO variant = new VariantDTO(variantId, product, color, imagePath, display, stock, ram, storage, price, discount);
                    list.add(variant);
                }
            }
            con.close();
        } catch (Exception ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return list;
    }

    public List<VariantDTO> listVariants(int numberOfElement, List<Integer> categoryIdList, List<Integer> brandIdList, String pSort) {
        List<VariantDTO> list = new ArrayList<>();

        try {
            Connection con = DBUtils.getConnection();
            String sql = " SELECT TOP (?) V.variantId, V.productId, V.color, V.imagePath, V.display, V.stock, V.ram, V.storage, V.price, V.discount\n"
                    + "FROM Variant V JOIN Product P ON V.productId = P.productId ";
            int flag = 0; // bien diem so luong filter by

            //truong hop có cate khong có brand
            if (!categoryIdList.isEmpty()) {
                sql += "WHERE P.status= 'enable' AND categoryId in (  ";
                flag++;
                for (int i = 0; i < categoryIdList.size(); i++) {
                    sql += "? ,";

                }
                sql = sql.replaceFirst(".$", ") ");
            }
            if (!brandIdList.isEmpty() && flag != 0) {
                sql += " AND brandId in ( ";
                for (int i = 0; i < brandIdList.size(); i++) {
                    sql += "? ,";

                }
                sql = sql.replaceFirst(".$", ") ");

            } else if (!brandIdList.isEmpty() && flag == 0) {
                sql += "WHERE  P.status= 'enable' AND brandId in (  ";
                flag++;
                for (int i = 0; i < brandIdList.size(); i++) {
                    sql += "? ,";

                }
                sql = sql.replaceFirst(".$", ") ");
            }
            if (brandIdList.isEmpty() && categoryIdList.isEmpty()) {
                sql += "Where P.status = 'enable' ";
            }
            sql += "ORDER BY V.price " + pSort;
            System.out.printf(sql);
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, numberOfElement);
            int index = 1;
            //truong hop có cate khong có brand
            if (!categoryIdList.isEmpty()) {
                for (int cateId : categoryIdList) {

                    index++;
                    ps.setInt(index, cateId);

                }
            }
            if (!brandIdList.isEmpty() && flag != 0) {
                for (int brandId : brandIdList) {

                    index++;
                    ps.setInt(index, brandId);

                }

            } else if (!brandIdList.isEmpty() && flag == 0) {
                index = 2;
                for (int brandId : brandIdList) {

                    index++;
                    ps.setInt(index, brandId);

                }
            }

            ResultSet rs = ps.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int variantId = rs.getInt("variantId");
                    int productId = rs.getInt("productId");
                    ProductDTO product = productDao.getProductByProductId(productId);
                    String color = rs.getString("color");
                    String imagePath = rs.getString("imagePath");
                    int display = rs.getInt("display");
                    int stock = rs.getInt("stock");
                    int ram = rs.getInt("ram");
                    int storage = rs.getInt("storage");
                    double price = rs.getDouble("price");
                    int discount = rs.getInt("discount");
                    VariantDTO variant = new VariantDTO(variantId, product, color, imagePath, display, stock, ram, storage, price, discount);
                    list.add(variant);
                }
            }
            con.close();
        } catch (Exception ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return list;
    }

    public List<VariantDTO> listVariantByProductId(int productId) {
        List<VariantDTO> list = new ArrayList<>();
        String sql = "SELECT variantId, productId, color, imagePath, display, stock, ram, storage, price, discount FROM Variant WHERE productId = ? ";
        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int variantId = rs.getInt("variantId");
                    productId = rs.getInt("productId");
                    ProductDTO product = productDao.getProductByProductId(productId);
                    String color = rs.getString("color");
                    String imagePath = rs.getString("imagePath");
                    int display = rs.getInt("display");
                    int stock = rs.getInt("stock");
                    int ram = rs.getInt("ram");
                    int storage = rs.getInt("storage");
                    double price = rs.getDouble("price");
                    int discount = rs.getInt("discount");

                    VariantDTO variant = new VariantDTO(variantId, product, color, imagePath, display, stock, ram, storage, price, discount);
                    list.add(variant);
                }
            }
            con.close();
        } catch (Exception ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return list;
    }
 
    public List<VariantDTO> listAllBestSellingVariants(int numberOfElement) {
        List<VariantDTO> list = new ArrayList<>();

        try {
            Connection con = DBUtils.getConnection();
            String sql = "SELECT TOP (?) v.variantId, v.productId, v.color, v.imagePath, v.display, v.stock, v.ram, v.storage, v.price, v.discount\n"
                    + "FROM OrderDetail od\n"
                    + "JOIN Variant v ON od.variantId = v.variantId\n"
                    + "JOIN Product p ON v.productId = p.productId\n"
                    + "WHERE P.status='enable' "
                    + "GROUP BY v.variantId, v.productId, v.color, v.imagePath, v.display, v.stock, v.ram, v.storage, v.price, v.discount\n"
                    + "ORDER BY SUM(od.quantity) DESC  ";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, numberOfElement);
            ResultSet rs = ps.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int variantId = rs.getInt("variantId");
                    int productId = rs.getInt("productId");
                    ProductDTO product = productDao.getProductByProductId(productId);
                    String color = rs.getString("color");
                    String imagePath = rs.getString("imagePath");
                    int display = rs.getInt("display");
                    int stock = rs.getInt("stock");
                    int ram = rs.getInt("ram");
                    int storage = rs.getInt("storage");
                    double price = rs.getDouble("price");
                    int discount = rs.getInt("discount");
                    VariantDTO variant = new VariantDTO(variantId, product, color, imagePath, display, stock, ram, storage, price, discount);
                    list.add(variant);
                }
            }
            con.close();
        } catch (Exception ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return list;
    }

    public VariantDTO getVariantById(int variantId) {
        String sql = "SELECT variantId, productId, color, imagePath, display, stock, ram, storage, price, discount\n"
                + "FROM Variant\n"
                + "WHERE variantId = ? ";
        VariantDTO variant = new VariantDTO();
        try {
            Connection con = DBUtils.getConnection();

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, variantId);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                variantId = rs.getInt("variantId");
                int productId = rs.getInt("productId");
                ProductDTO product = productDao.getProductByProductId(productId);
                String color = rs.getString("color");
                String imagePath = rs.getString("imagePath");
                int display = rs.getInt("display");
                int stock = rs.getInt("stock");
                int ram = rs.getInt("ram");
                int storage = rs.getInt("storage");
                double price = rs.getDouble("price");
                int discount = rs.getInt("discount");
                variant = new VariantDTO(variantId, product, color, imagePath, display, stock, ram, storage, price, discount);

            }

        } catch (Exception e) {
        }
        return variant;
    }

    public boolean deleteVariantByVariantId(int variantId) {
        String sql = "DELETE Variant WHERE variantId = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, variantId);
            ps.executeUpdate();
            return true;
        } catch (SQLException ex) {
            System.out.println("Delete Order error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return false;
    }
    public List<VariantDTO> listAllVariant(){
        List<VariantDTO> list = new ArrayList<>();
        try {
            Connection con = DBUtils.getConnection();
            String sql = "SELECT variantId, productId, color, imagePath, display, stock, ram, storage, price, discount \n" 
                    + "FROM [Variant]";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if(rs != null){
                while(rs.next()){
                    int variantId = rs.getInt("variantId");
                    int productId = rs.getInt("productId");
                    ProductDTO product = productDao.getProductByProductId(productId);
                    String color = rs.getString("color");
                    String imagePath = rs.getString("imagePath");
                    int display = rs.getInt("display");
                    int stock = rs.getInt("stock");
                    int ram = rs.getInt("ram");
                    int storage = rs.getInt("storage");
                    double price = rs.getInt("price");
                    int discount = rs.getInt("discount");
                    
                    
                    VariantDTO variant = new VariantDTO(variantId, product, color, imagePath, display, stock, ram, storage, price, discount);
                    list.add(variant);
                    
                }
            }
        } catch (Exception ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return list;
    }
    

}
