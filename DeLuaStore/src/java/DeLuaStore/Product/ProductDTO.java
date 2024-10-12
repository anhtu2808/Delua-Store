/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DeLuaStore.Product;

import DeLuaStore.Brand.BrandDTO;
import DeLuaStore.Category.CategoryDTO;
import java.io.Serializable;
import java.math.BigDecimal;

/**
 *
 * @author ADMIN
 */
public class ProductDTO implements Serializable {

    private int productId;
    private String productName;
    private BrandDTO brand;
    private CategoryDTO category;
    private String imagePath;
    private String description;
    private String status;

    public ProductDTO() {
    }

    public ProductDTO(int productId, String productName, BrandDTO brand, CategoryDTO category, String imagePath, String description, String status) {
        this.productId = productId;
        this.productName = productName;
        this.brand = brand;
        this.category = category;
        this.imagePath = imagePath;
        this.description = description;
        this.status = status;
    }

    public int getProductId() {
        return productId;
    }

    public String getProductName() {
        return productName;
    }

    public BrandDTO getBrand() {
        return brand;
    }

    public CategoryDTO getCategory() {
        return category;
    }

    public String getImagePath() {
        return imagePath;
    }

    public String getDescription() {
        return description;
    }

    public String getStatus() {
        return status;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public void setBrand(BrandDTO brand) {
        this.brand = brand;
    }

    public void setCategory(CategoryDTO category) {
        this.category = category;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "ProductDTO{" + "productId=" + productId + ", productName=" + productName + ", brand=" + brand + ", category=" + category + ", imagePath=" + imagePath + ", description=" + description + ", status=" + status + '}';
    }
    
}
