/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DeLuaStore.OrderDetail;

/**
 *
 * @author ADMIN
 */
import DeLuaStore.Variant.VariantDTO;


public class OrderDetailDTO {

    private VariantDTO variant;
    private int orderId;
    private int quantity;
    private double price;
    private int discount;

   
    public OrderDetailDTO() {
    }

    public OrderDetailDTO(VariantDTO variant, int orderId, int quantity, double price, int discount) {
        this.variant = variant;
        this.orderId = orderId;
        this.quantity = quantity;
        this.price = price;
        this.discount = discount;
    }

    public VariantDTO getVariant() {
        return variant;
    }

    public int getOrderId() {
        return orderId;
    }

    public int getQuantity() {
        return quantity;
    }

    public double getPrice() {
        return price;
    }

    public int getDiscount() {
        return discount;
    }

    public void setVariant(VariantDTO variant) {
        this.variant = variant;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    @Override
    public String toString() {
        return "OrderDetailDTO{" + "variant=" + variant + ", orderId=" + orderId + ", quantity=" + quantity + ", price=" + price + ", discount=" + discount + '}';
    }
    
}
