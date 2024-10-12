/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DeLuaStore.Brand;

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
public class BrandDAO {

    public List<BrandDTO> listPopularBrand(int numberOfElement) {
        List<BrandDTO> list = new ArrayList<BrandDTO>();

        try {
            Connection con = DBUtils.getConnection();
            String sql = "SELECT TOP (?) brandId, brandName, createDate, imagePath FROM Brand ";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, numberOfElement);
            ResultSet rs = ps.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int brandId = rs.getInt("brandId");
                    String brandName = rs.getString("brandName");
                    Date createDate = rs.getDate("createDate");
                    String imagePath = rs.getString("imagePath");
                    BrandDTO brand = new BrandDTO(brandId, brandName, createDate, imagePath);
                    list.add(brand);
                }

            }
            con.close();
        } catch (Exception ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return list;
    }

    public List<BrandDTO> listAllBrand() {
        List<BrandDTO> list = new ArrayList<BrandDTO>();

        try {
            Connection con = DBUtils.getConnection();
            String sql = "SELECT brandId, brandName, createDate, imagePath FROM Brand ";
            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int brandId = rs.getInt("brandId");
                    String brandName = rs.getString("brandName");
                    Date createDate = rs.getDate("createDate");
                    String imagePath = rs.getString("imagePath");
                    BrandDTO brand = new BrandDTO(brandId, brandName, createDate, imagePath);
                    list.add(brand);
                }

            }
            con.close();
        } catch (Exception ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        System.out.println(list);
        return list;
    }

    public BrandDTO getBrandById(int brandId) {
        String sql = "SELECT  brandId, brandName, createDate, imagePath FROM Brand Where BrandId = (?) ";
        BrandDTO brand = null;

        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, brandId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                brandId = rs.getInt("brandId");
                String brandName = rs.getString("brandName");
                Date createDate = rs.getDate("createDate");
                String imagePath = rs.getString("imagePath");
                brand = new BrandDTO(brandId, brandName, createDate, imagePath);

            }
        } catch (Exception ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return brand;
    }
}
