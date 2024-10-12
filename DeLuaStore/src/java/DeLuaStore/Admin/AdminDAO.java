/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DeLuaStore.Admin;

import DeLuaStore.User.UserDTO;
import DeLuaStore.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author ADMIN
 */
public class AdminDAO {

    public AdminDTO getAdmin(String username, String password) {
        AdminDTO admin = null;
        try {
            Connection con = DBUtils.getConnection();
            String sql = "SELECT adminId, username, [password], email FROM Admin WHERE username = ? AND [password] =? ";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password);

            ResultSet rs = stmt.executeQuery();

            if (rs != null) {
                if (rs.next()) {
                    admin = new AdminDTO();
                    admin.setUsername(rs.getString("username"));
                    admin.setEmail(rs.getString("email"));
                }
            }
            con.close();

        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
    
        }
        return admin;
    }
   
}
