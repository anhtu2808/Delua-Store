/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DeLuaStore.User;

/**
 *
 * @author ADMIN
 */
import DeLuaStore.Address.AddressDTO;
import java.text.SimpleDateFormat;
import java.util.Date;

public class UserDTO {
    private int userId;
    private String name;
    private String username;
    private String password;
    private String email;
    private String phoneNum;
    private Date birthday;
    private Date createDate;
    private String gender;
    private String status;
    private AddressDTO address;
    // Constructors

    public UserDTO() {
    }

    public UserDTO(int userId, String name, String username, String password, String email, String phoneNum, Date birthday, Date createDate, String gender, String status, AddressDTO address) {
        this.userId = userId;
        this.name = name;
        this.username = username;
        this.password = password;
        this.email = email;
        this.phoneNum = phoneNum;
        this.birthday = birthday;
        this.createDate = createDate;
        this.gender = gender;
        this.status = status;
        this.address = address;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public AddressDTO getAddress() {
        return address;
    }

    public void setAddress(AddressDTO address) {
        this.address = address;
    }
     public String getCreateDateWithFormat() {

        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM yyyy");
        return sdf.format(createDate);
    }
    @Override
    public String toString() {
        return "UserDTO{" + "userId=" + userId + ", name=" + name + ", username=" + username + ", password=" + password + ", email=" + email + ", phoneNum=" + phoneNum + ", birthday=" + birthday + ", createDate=" + createDate + ", gender=" + gender + ", status=" + status + ", address=" + address + '}';
    }
  
}
