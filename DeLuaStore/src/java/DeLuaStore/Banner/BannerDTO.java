/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DeLuaStore.Banner;

import java.util.Date;

/**
 *
 * @author ADMIN

 */
public class BannerDTO {
    private int bannerId;
    private String bannerName;
    private Date createDate;
    private String bannerPath;

    // Constructors
    public BannerDTO() {}

    public BannerDTO(int bannerId, String bannerName, Date createDate, String bannerPath) {
        this.bannerId = bannerId;
        this.bannerName = bannerName;
        this.createDate = createDate;
        this.bannerPath = bannerPath;
    }

    // Getters and Setters
    public int getBannerId() {
        return bannerId;
    }

    public void setBannerId(int bannerId) {
        this.bannerId = bannerId;
    }

    public String getBannerName() {
        return bannerName;
    }

    public void setBannerName(String bannerName) {
        this.bannerName = bannerName;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getBannerPath() {
        return bannerPath;
    }

    public void setBannerPath(String bannerPath) {
        this.bannerPath = bannerPath;
    }
}
