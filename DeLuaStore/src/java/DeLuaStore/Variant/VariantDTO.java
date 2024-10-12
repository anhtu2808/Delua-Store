/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DeLuaStore.Variant;

/**
 *
 * @author ADMIN
 */
import DeLuaStore.Product.ProductDTO;
import java.io.Serializable;


public class VariantDTO implements Serializable {
    private int variantId;
    private ProductDTO product;
    private String color;
    private String imagePath;
    private int display;
    private int stock;
    private int ram;
    private int storage;
    private double price;
    private int discount;

    // Constructor không tham số
    public VariantDTO() {}

    public VariantDTO(int variantId, ProductDTO product, String color, String imagePath, int display, int stock, int ram, int storage, double price, int discount) {
        this.variantId = variantId;
        this.product = product;
        this.color = color;
        this.imagePath = imagePath;
        this.display = display;
        this.stock = stock;
        this.ram = ram;
        this.storage = storage;
        this.price = price;
        this.discount = discount;
    }

    public void setVariantId(int variantId) {
        this.variantId = variantId;
    }

    public void setProduct(ProductDTO product) {
        this.product = product;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public void setDisplay(int display) {
        this.display = display;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public void setRam(int ram) {
        this.ram = ram;
    }

    public void setStorage(int storage) {
        this.storage = storage;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public int getVariantId() {
        return variantId;
    }

    public ProductDTO getProduct() {
        return product;
    }

    public String getColor() {
        return color;
    }

    public String getImagePath() {
        return imagePath;
    }

    public int getDisplay() {
        return display;
    }

    public int getStock() {
        return stock;
    }

    public int getRam() {
        return ram;
    }

    public int getStorage() {
        return storage;
    }

    public double getPrice() {
        return price;
    }

    public int getDiscount() {
        return discount;
    }

    @Override
    public String toString() {
        return "VariantDTO{" + "variantId=" + variantId + ", product=" + product + ", color=" + color + ", imagePath=" + imagePath + ", display=" + display + ", stock=" + stock + ", ram=" + ram + ", storage=" + storage + ", price=" + price + ", discount=" + discount + '}';
    }

   

   
}
