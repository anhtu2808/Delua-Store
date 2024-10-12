/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DeLuaStore.Address;

/**
 *
 * @author ADMIN
 */
public class AddressDTO {
    private int userId;
    private String street;
    private String state;
    private String city;
   

    // Constructor không tham số
    public AddressDTO() {}

    public AddressDTO(int userId, String street, String state, String city) {
        this.userId = userId;
        this.street = street;
        this.state = state;
        this.city = city;
    }

    

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    @Override
    public String toString() {
        return "AddressDTO{" + "street=" + street + ", state=" + state + ", city=" + city + ", userId=" + userId + '}';
    }

    
}

