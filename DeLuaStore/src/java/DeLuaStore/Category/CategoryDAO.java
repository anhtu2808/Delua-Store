/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DeLuaStore.Category;

import DeLuaStore.utils.DBUtils;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Anh Tu
 */
public class CategoryDAO {

    public List<CategoryDTO> getAllCategories() {
        List<CategoryDTO> list = new ArrayList<CategoryDTO>();

        try {
            String sql = "SELECT categoryId, categoryName FROM Category ";
            Connection con = DBUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int categoryId = rs.getInt("categoryId");
                    String categoryName = rs.getString("categoryName");
                    CategoryDTO category = new CategoryDTO(categoryId, categoryName);

                    list.add(category);
                }

            }
            con.close();
        } catch (Exception ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return list;
    }

    public CategoryDTO getCategoryById(int categoryId) {
        String sql = "SELECT categoryId,categoryName FROM Category WHERE categoryId = ?";
        CategoryDTO category = null;

        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, categoryId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                categoryId = rs.getInt("categoryId");
                String categoryName = rs.getString("categoryName");
                category = new CategoryDTO(categoryId, categoryName);

            }
        } catch (Exception ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return category;
    }
}
