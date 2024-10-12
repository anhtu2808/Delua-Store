/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DeLuaStore.OrderDetail;

import DeLuaStore.Variant.VariantDAO;
import DeLuaStore.Variant.VariantDTO;
import DeLuaStore.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class OrderDetailDAO {
    public Long addOrderDetail(OrderDetailDTO orderDetail) {
        String sql = "INSERT INTO orderDetail (variantId, orderId, quantity, price, discount)"
                    +"VALUES (?, ?, ?, ?, ?)";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql); 
            
            ps.setInt(1, orderDetail.getVariant().getVariantId());
            ps.setInt(2, orderDetail.getOrderId());
            ps.setInt(3, orderDetail.getQuantity());
            ps.setDouble(4, orderDetail.getPrice());
            ps.setDouble(5, orderDetail.getDiscount());

            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Add OrderDetail error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }
   //hàm update này phải là update theo 2 cái ID m truyền vô chứ ta
    // t thay no check 2 cai id luon r ma ta z chắc là đúng á oce out di m =))) de t lam cho
    
    public boolean updateOrderDetail (OrderDetailDTO orderDetail) {
        String sql = "UPDATE orderDetail SET quantity = ?, price = ?, discount = ? WHERE variantId = ? AND orderId = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql); 
            
            ps.setInt(1, orderDetail.getQuantity());
            ps.setDouble(2, orderDetail.getPrice());
            ps.setDouble(3, orderDetail.getDiscount());
            ps.setInt(4, orderDetail.getVariant().getVariantId());
            ps.setInt(5, orderDetail.getOrderId());
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Update OrderDetail error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return false;
    }
    public boolean deleteOrderDetail(int variantId, int orderId) {
        String sql = "DELETE FROM orderDetail WHERE variantId = ? AND orderId = ?";
        try {
            // Id khong phải ID  m test câu quêry trước khi code nha code z tới hồi bug k biết đường fix
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);                      
            
            ps.setInt(1, variantId);
            ps.setInt(2, orderId);
            
            ps.executeUpdate();
           
        }
        catch (SQLException ex) {
            System.out.println("Delete OrderDetail error!" + ex.getMessage());
            ex.printStackTrace();
        }       
        return false;
        
    }
    
    public OrderDetailDTO getOrderDetailById(int variantId, int orderId) {
        String sql = "SELECT variantId, orderId, quantity, price, discount FROM orderDetail WHERE variantId = ? AND orderId = ?";
        try {
            
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);                      
            ps.setInt(1, variantId);
            ps.setInt(2, orderId);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                    int quantity = rs.getInt("quantity");
                    double price = rs.getDouble("price");
                    int discount = rs.getInt("discount");

                    OrderDetailDTO orderDetail = new OrderDetailDTO();
                    orderDetail.getVariant().setVariantId(variantId);
                    orderDetail.setOrderId(orderId);
                    orderDetail.setQuantity(quantity);
                    orderDetail.setPrice(price);
                    orderDetail.setDiscount(discount);
                    
                    return orderDetail;
            }
        }
        catch (SQLException ex) {
            System.out.println("Query OrderDetail error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }
    
    public List<OrderDetailDTO> getAllOrderDetails() {
        List<OrderDetailDTO> list = new ArrayList<OrderDetailDTO>();
    
        String sql = "SELECT variantId, orderId, quantity, price, discount FROM orderDetail";
        try {
            Connection con = DBUtils.getConnection();     
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs != null){
            while (rs.next()) {
                int variantId = rs.getInt("variantID"); // Chữ Id khong phải ID
                int orderId = rs.getInt("orderId");
                int quantity = rs.getInt("quantity");
                double price = rs.getDouble("price");
                int discount = rs.getInt("discount");
                
                OrderDetailDTO orderDetail = new OrderDetailDTO();
                VariantDAO variantDao = new VariantDAO();
                //ngay đay gọi hàm getVariantByid xog nhét cái variantId vô
                VariantDTO variant = variantDao.getVariantById(variantId);
                //hình dạnh nó z nè
                
                  
                //phần này m phải yêu cầu t viết scho m cái getVariantByid hiểu chưa m hieu r nha  h để t viêý cái hàm cho xài
                
                    orderDetail.setVariant(variant);
                    orderDetail.setOrderId(orderId);
                    orderDetail.setQuantity(quantity);
                    orderDetail.setPrice(price);
                    orderDetail.setDiscount(discount);
                    
                    list.add(orderDetail);
            }
            }
            con.close();
        } catch (Exception ex) {
             ex.printStackTrace();
        }
           return getAllOrderDetails();
        }
    
    
    public void insertOrderDetail(OrderDetailDTO orderDetail) {
    String sql = "INSERT INTO [dbo].[OrderDetail] "
               + "([variantId], [orderId], [quantity], [price], [discount]) "
               + "VALUES (?, ?, ?, ?, ?)";
    Connection con = null;
    PreparedStatement stmt = null;
    try {
        con = DBUtils.getConnection();
        stmt = con.prepareStatement(sql);
        stmt.setInt(1, orderDetail.getVariant().getVariantId()); // Assuming VariantDTO has getVariantId() method
        stmt.setInt(2, orderDetail.getOrderId());
        stmt.setInt(3, orderDetail.getQuantity());
        stmt.setDouble(4, orderDetail.getPrice());
        stmt.setInt(5, orderDetail.getDiscount());

        stmt.executeUpdate();
    } catch (Exception e) {
        System.out.println("Insert Order Detail Error: " + e.getMessage());
        e.printStackTrace();
    } finally {
        try {
            if (stmt != null) {
                stmt.close();
            }
            if (con != null) {
                con.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
        
}
