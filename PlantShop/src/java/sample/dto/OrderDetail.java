/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.dto;
import java.io.Serializable;

/**
 *
 * @author ASUS
 */
public class OrderDetail {
    private int detailID;
    private int orderID;
    private int FID;
    private String plantName;
    private int price;
    private String imgPath;
    private int quantity;

    public OrderDetail() {
    }

    public OrderDetail(int detailID, int orderID, int FID, String plantName, int price, String imgPath, int quantity) {
        this.detailID = detailID;
        this.orderID = orderID;
        this.FID = FID;
        this.plantName = plantName;
        this.price = price;
        this.imgPath = imgPath;
        this.quantity = quantity;
    }

    public int getDetailID() {
        return detailID;
    }

    public void setDetailID(int detailID) {
        this.detailID = detailID;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getFID() {
        return FID;
    }

    public void setFID(int FID) {
        this.FID = FID;
    }

    public String getPlantName() {
        return plantName;
    }

    public void setPlantName(String plantName) {
        this.plantName = plantName;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getImgPath() {
        return imgPath;
    }

    public void setImgPath(String imgPath) {
        this.imgPath = imgPath;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    
    
    
}
