/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DeLuaStore.User;

import DeLuaStore.Address.AddressDAO;
import DeLuaStore.Address.AddressDTO;
import DeLuaStore.utils.DBUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class UserDAO {

    UserDTO user = new UserDTO();
    AddressDAO addressDao = new AddressDAO();

    public List<UserDTO> listAllUser() {
        List<UserDTO> list = new ArrayList<>();
        try {
            Connection con = DBUtils.getConnection();
            String sql = "SELECT userId, [name], username, [password], email, phoneNum, birthday, createDate, gender, [status]\n"
                    + "FROM [User];";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int userId = rs.getInt("userId");
                    String name = rs.getString("name");
                    String username = rs.getString("username");
                    String password = rs.getString("password");
                    String email = rs.getString("email");
                    String phoneNum = rs.getString("phoneNum");
                    Date birthday = rs.getDate("birthday");
                    Date createDate = rs.getDate("createDate");
                    String gender = rs.getString("gender");
                    String status = rs.getString("status");
                    AddressDTO address = addressDao.getAddressById(userId);
                    user = new UserDTO(userId, name, username, password, email, phoneNum, birthday, createDate, gender, status, address);
                    list.add(user);
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

    public UserDTO getUserById(int userId) {

        try {

            String sql = "SELECT userId, [name], username, [password], email, phoneNum, birthday, createDate, gender, [status]\n"
                    + "FROM [User]\n"
                    + "WHERE userId = ?;";
            Connection con = DBUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String name = rs.getString("name");
                String username = rs.getString("username");
                String password = rs.getString("password");
                String email = rs.getString("email");
                String phoneNum = rs.getString("phoneNum");
                Date birthday = rs.getDate("birthday");
                Date createDate = rs.getDate("createDate");
                String gender = rs.getString("gender");
                String status = rs.getString("status");
                AddressDTO address = addressDao.getAddressById(userId);
                user = new UserDTO(userId, name, username, password, email, phoneNum, birthday, createDate, gender, status, address);

            }
        } catch (Exception ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return user;
    }

    public UserDTO login(String username, String password) {
        UserDTO user = null;
        try {
            Connection con = DBUtils.getConnection();
            String sql = "SELECT userId, [name], username, [password], email, phoneNum, birthday, createDate, gender, [status] FROM [User] ";
            sql += "WHERE username = ? AND password = ?";

            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                int userId = rs.getInt("userId");
                String name = rs.getString("name");
                username = rs.getString("username");
                password = rs.getString("password");
                String email = rs.getString("email");
                String phoneNum = rs.getString("phoneNum");
                Date birthday = rs.getDate("birthday");
                Date createDate = rs.getDate("createDate");
                String gender = rs.getString("gender");
                String status = rs.getString("status");
                AddressDTO address = addressDao.getAddressById(userId);
                user = new UserDTO(userId, name, username, password, email, phoneNum, birthday, createDate, gender, status, address);

            }
            con.close();

        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();

        }
        return user;

    }

    public boolean changeUserStatus(int userId, String currentStatus) {
        String sql = "UPDATE [User]  SET [status] = ? WHERE userId = ? ";
        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            if (currentStatus.equals("Active")) {
                ps.setString(1, "Disable");

            } else {
                ps.setString(1, "Active");

            }
            ps.setInt(2, userId);
            ps.executeUpdate();
            con.close();
        } catch (Exception e) {
            System.out.println("Update Stundent Error" + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }

    public void update(UserDTO user) {
        String sql = "UPDATE [dbo].[User]\n"
                + "   SET [userId] =? \n"
                + "      ,[name] = ?\n"
                + "      ,[username] = ?\n"
                + "      ,[password] = ?\n"
                + "      ,[email] = ?\n"
                + "      ,[phoneNum] = ?\n"
                + "      ,[birthday] = ?\n"
                + "      ,[createDate] = ?\n"
                + "      ,[gender] = ?\n"
                + "      ,[status] = ?\n"
                + " WHERE  [userId]= ?";
        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, user.getUserId());
            stmt.setString(2, user.getName());
            stmt.setString(3, user.getUsername());
            stmt.setString(4, user.getPassword());
            stmt.setString(5, user.getEmail());
            stmt.setString(6, user.getPhoneNum());
            stmt.setDate(7, (java.sql.Date) user.getBirthday());
            stmt.setDate(8, (java.sql.Date) user.getCreateDate());
            stmt.setString(9, user.getGender());
            stmt.setString(10, user.getStatus());
            stmt.setInt(11, user.getUserId());

            stmt.executeUpdate();
            con.close();
        } catch (Exception e) {
            System.out.println("Update User Error" + e.getMessage());
            e.printStackTrace();
        }

    }

    public boolean register(UserDTO newUser) {
        // Check if username already exists
        UserDTO existingUser = getUserByUsername(newUser.getUsername());
        if (existingUser != null) {
            // Username exists, return false or handle accordingly
            return false;
        }

        // Prepare SQL statement for insert
        String sql = "INSERT INTO [User] (userId, [name], username, [password], email, phoneNum, birthday, createDate, gender, [status]) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, newUser.getUserId()); // Set userId if needed, assuming it's auto-generated
            ps.setString(2, newUser.getName());
            ps.setNString(3, newUser.getUsername());
            ps.setString(4, newUser.getPassword());
            ps.setString(5, newUser.getEmail());
            ps.setString(6, newUser.getPhoneNum());
            ps.setDate(7, newUser.getBirthday() != null ? new java.sql.Date(newUser.getBirthday().getTime()) : null);
            ps.setDate(8, newUser.getCreateDate() != null ? new java.sql.Date(newUser.getCreateDate().getTime()) : null);
            ps.setString(9, newUser.getGender());
            ps.setString(10, newUser.getStatus());

            int rowsAffected = ps.executeUpdate();
            con.close();

            return rowsAffected > 0;
        } catch (SQLException ex) {
            System.out.println("Error registering user: " + ex.getMessage());
            ex.printStackTrace();
        }
        return false;
    }

    private UserDTO getUserByUsername(String username) {
        UserDTO user = null;
        String sql = "SELECT * FROM [User] WHERE username = ?";
        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int userId = rs.getInt("userId");
                String name = rs.getString("name");
                String password = rs.getString("password");
                String email = rs.getString("email");
                String phoneNum = rs.getString("phoneNum");
                Date birthday = rs.getDate("birthday");
                Date createDate = rs.getDate("createDate");
                String gender = rs.getString("gender");
                String status = rs.getString("status");

                user = new UserDTO(userId, name, username, password, email, phoneNum, birthday, createDate, gender, status, null);
            }
            con.close();
        } catch (SQLException ex) {
            System.out.println("Error retrieving user by username: " + ex.getMessage());
            ex.printStackTrace();
        }
        return user;
    }

    public int getNextUserId() {
        int maxId = 0;
        String sql = "SELECT MAX(userId) as MaxId FROM [User] ";
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

}
