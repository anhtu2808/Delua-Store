/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DeLuaStore.Address;

import DeLuaStore.Order.OrderDTO;
import DeLuaStore.utils.DBUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.sql.ResultSet;
import java.util.List;

/**
 *
 * @author hongh
 */
public class AddressDAO {

    //getAddressbyId
    
    public AddressDTO getAddressById(int userId) {
       String sql="SELECT userId, street, [state], city FROM Address WHERE userId = (?) ";
       AddressDTO address=null;
       try{
           Connection con=DBUtils.getConnection();
           PreparedStatement ps=con.prepareStatement(sql);
           ps.setInt(1, userId);
           ResultSet rs=ps.executeQuery();
           if(rs.next())
           {
               userId =rs.getInt("userId");
               String street= rs.getString("street");
               String state= rs.getString("state");
               String city= rs.getString("city");
               address= new AddressDTO(userId, street, state, city);      
           }
           
       }catch (Exception ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
       return address;
       
       
    }

    
   public List<AddressDTO> listAddress(int num)
   {
       List<AddressDTO> list= new ArrayList<>();
      
       
       try{
            String sql="SELECT TOP(?) userId, street, [state], city FROM Address";
            Connection con=DBUtils.getConnection();
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setInt(1, num);
            ResultSet rs=ps.executeQuery();
            if(rs!=null)
            {
                while(rs.next())
                {
                    
                   int userId =rs.getInt("userId");
                   String street= rs.getString("street");
                   String state= rs.getString("state");
                   String city= rs.getString("city");
                   AddressDTO address= new AddressDTO(userId, street, state, city);      
                    list.add(address);
                }
            }
           
           
       }catch (Exception ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
       return list;
              
   }
   public void update(AddressDTO add)
   {
        String sql = "UPDATE [dbo].[Address]\n"
                + "   SET [userId] = ?\n"
                + "      ,[street] = ?\n"
                + "      ,[state] = ?\n"
                + "      ,[city] = ?\n"
                + " WHERE [userId] =? \n";
        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, add.getUserId());
            stmt.setString(2,add.getStreet());
            stmt.setString(3, add.getState());
            stmt.setString(4,add.getCity());
            stmt.setInt(5, add.getUserId());
          stmt.executeUpdate();
            con.close();
        } catch (Exception e) {
            System.out.println("Update User Error" + e.getMessage());
            e.printStackTrace();
        }
   }
    
    
   // list all(truyen num, select  top ) (bo dau cham hoi trong (?)
    

}
