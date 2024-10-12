/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DeLuaStore.Order;

import DeLuaStore.Address.AddressDAO;
import DeLuaStore.Address.AddressDTO;
import DeLuaStore.User.UserDAO;
import DeLuaStore.User.UserDTO;
import DeLuaStore.utils.DBUtils;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class OrderDAO {

    AddressDAO addressDao = new AddressDAO();
    UserDAO userDao = new UserDAO();

    // viết cho khoa cái hàm listOrder(int numberOfElement nha) câu query có cái select top (?) cái ? đó thay bằng numberOfElement
    public Long addOrder(OrderDTO order) {
        String sql = "INSERT INTO [order] (orderDate, status,  phoneNum, totalPrice, userId) VALUES (?, ?, ?, ?, ?)";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setDate(1, order.getOrderDate());
            ps.setString(2, order.getStatus());

            ps.setString(3, order.getPhoneNum());
            ps.setDouble(4, order.getTotalPrice());
            ps.setInt(5, order.getUser().getUserId());

            ps.executeUpdate();

        } catch (SQLException ex) {
            System.out.println("Add Order error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

    public boolean updateOrder(OrderDTO order) {
        String sql = "UPDATE [order] SET orderDate = ?, status = ?, phoneNum = ?, totalPrice = ?, userId = ? WHERE orderId = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setDate(1, order.getOrderDate());
            ps.setString(2, order.getStatus());

            ps.setString(3, order.getPhoneNum());
            ps.setDouble(4, order.getTotalPrice());
            ps.setInt(5, order.getUser().getUserId());
            ps.setInt(6, order.getOrderId());

            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Update Order error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return false;
    }

    public boolean deleteOrder(int orderId) {
        String sql = "DELETE FROM `order` WHERE orderId = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, orderId);

            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Delete Order error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return false;
    }

    public OrderDTO getOrderById(int orderId) {
        String sql = "SELECT orderId, orderDate, status, phoneNum, totalPrice, userId FROM [order] WHERE orderId = ?";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, orderId);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Date orderDate = rs.getDate("orderDate");
                String status = rs.getString("status");
                String phoneNum = rs.getString("phoneNum");
                double totalPrice = rs.getDouble("totalPrice");
                int userId = rs.getInt("userId");

                AddressDTO address = addressDao.getAddressById(userId);
                UserDTO user = userDao.getUserById(userId);

                OrderDTO order = new OrderDTO();
                order.setOrderId(orderId);
                order.setOrderDate(orderDate);
                order.setStatus(status);
                order.setAddress(address);
                order.setPhoneNum(phoneNum);
                order.setTotalPrice(totalPrice);
                order.setUser(user);

                return order;
            }
        } catch (SQLException ex) {
            System.out.println("Query order error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

    public List<OrderDTO> listNewestOrder(int numberOfOrders) {
        List<OrderDTO> list = new ArrayList<OrderDTO>();

        String sql = "SELECT TOP (?) orderId, orderDate, status, phoneNum, totalPrice, userId FROM [Order]\n"
                + "                ORDER BY orderDate \n"
                + "				DESC";

        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, numberOfOrders);
            ResultSet rs = ps.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int orderId = rs.getInt("orderId");
                    Date orderDate = rs.getDate("orderDate");
                    String status = rs.getString("status");

                    String phoneNum = rs.getString("phoneNum");
                    double totalPrice = rs.getDouble("totalPrice");
                    int userId = rs.getInt("userId");
                    AddressDTO address = addressDao.getAddressById(userId);
                    OrderDTO order = new OrderDTO();
                    order.setOrderId(orderId);
                    order.setOrderDate(orderDate);
                    order.setStatus(status);
                    order.setAddress(address);
                    order.setPhoneNum(phoneNum);
                    order.setTotalPrice(totalPrice);
                    UserDTO user = userDao.getUserById(userId);
                    order = new OrderDTO(orderId, orderDate, status, address, phoneNum, totalPrice, user, null);
                    list.add(order);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
//    List<OrderDTO> listOrderByUserId(int userId)

    public int getNextOrderId() {
        int maxId = 0;
        String sql = "SELECT MAX(orderId) as MaxId FROM [Order] ";
        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                maxId = rs.getInt("maxId");
            }
        } catch (Exception ex) {
            System.out.println("getMaxID error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return maxId + 1;
    }

    public void insertOrder(OrderDTO order) {
        String sql = "INSERT INTO [dbo].[Order] "
                + "([orderId], [orderDate], [status], [phoneNum], [totalPrice], [userId]) "
                + "VALUES (?, ?, ?, ?, ?, ?)";
        Connection con = null;
        PreparedStatement stmt = null;
        try {
            con = DBUtils.getConnection();
            stmt = con.prepareStatement(sql);
            stmt.setInt(1, order.getOrderId());
            stmt.setDate(2, new java.sql.Date(order.getOrderDate().getTime()));
            stmt.setString(3, order.getStatus());
            stmt.setString(4, order.getPhoneNum());
            stmt.setDouble(5, order.getTotalPrice()); // Assuming totalPrice is of type BigDecimal
            stmt.setInt(6, order.getUser().getUserId());

            stmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("Insert Order Error: " + e.getMessage());
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
