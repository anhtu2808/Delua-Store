/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DeLuaStore.Brand;

/**
 *
 * @author ADMIN
 */
import java.sql.Date;

public class BrandDTO {
    private int brandId;
    private String brandName;
    private Date createDate;
    private String imagePath;

    // Constructors
    public BrandDTO() {}

    public BrandDTO(int brandId, String brandName, Date createDate, String imagePath) {
        this.brandId = brandId;
        this.brandName = brandName;
        this.createDate = createDate;
        this.imagePath = imagePath;
    }

    // Getters and Setters
    public int getBrandId() {
        return brandId;
    }

    public void setBrandId(int brandId) {
        this.brandId = brandId;
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    @Override
    public String toString() {
        return "BrandDto{" +
                "brandId=" + brandId +
                ", brandName='" + brandName + '\'' +
                ", createDate=" + createDate +
                ", imagePath='" + imagePath + '\'' +
                '}';
    }
}
