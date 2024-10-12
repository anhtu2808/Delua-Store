/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DeLuaStore.Order;

/**
 *
 * @author ADMIN
 */
import DeLuaStore.Address.AddressDTO;
import DeLuaStore.OrderDetail.OrderDetailDTO;
import DeLuaStore.User.UserDTO;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class OrderDTO {

    private int orderId;
    private Date orderDate;
    private String status;
    private AddressDTO address;
    private String phoneNum;
    private double totalPrice;
    private UserDTO user;
    private List<OrderDetailDTO> listOrderDetail;

    public OrderDTO() {
    }

    public OrderDTO(int orderId, Date orderDate, String status, AddressDTO address, String phoneNum, double totalPrice, UserDTO user, List<OrderDetailDTO> listOrderDetail) {
        this.orderId = orderId;
        this.orderDate = orderDate;
        this.status = status;
        this.address = address;
        this.phoneNum = phoneNum;
        this.totalPrice = totalPrice;
        this.user = user;
        this.listOrderDetail = listOrderDetail;
    }

    public String priceFormat() {

        String formattedNumber = String.format("%.2f", totalPrice);
        return formattedNumber;
    }

    public int getOrderId() {
        return orderId;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public String getStatus() {
        return status;
    }

    public AddressDTO getAddress() {
        return address;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public UserDTO getUser() {
        return user;
    }

    public List<OrderDetailDTO> getListOrderDetail() {
        return listOrderDetail;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setAddress(AddressDTO address) {
        this.address = address;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public void setUser(UserDTO user) {
        this.user = user;
    }

    public void setListOrderDetail(List<OrderDetailDTO> listOrderDetail) {
        this.listOrderDetail = listOrderDetail;
    }

    public String getCreateDateWithFormat() {

        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM yyyy");
        return sdf.format(orderDate);
    }

    @Override
    public String toString() {
        return "OrderDTO{" + "orderId=" + orderId + ", orderDate=" + orderDate + ", status=" + status + ", address=" + address + ", phoneNum=" + phoneNum + ", totalPrice=" + totalPrice + ", user=" + user + ", listOrderDetail=" + listOrderDetail + '}';
    }

}
