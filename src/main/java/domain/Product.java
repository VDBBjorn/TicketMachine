package domain;

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.RoundingMode;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

@Entity
public class Product implements Serializable{

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO) 
    private int productId;
    private String name;
    //Always by 1000g/ml
    private double unitPrice;
    private String vatCode;
    
    //Always in 100 g/ml
    private double calories;
    private double carbohydrates;
    private double proteins;
    private double fats;
    
    @OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinColumn(name = "categoryId")
    private Category category;
    
    private String brand;
    
    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public int getProductId() {
        return productId;
    }

    public String getName() {
        return name;
    }

    public double getUnitPrice() {
        return new BigDecimal(unitPrice).setScale(2, RoundingMode.HALF_UP).doubleValue();
    }
    
    public String getVatCode() {
        return vatCode;
    }

    public Category getCategory() {
        return category;
    }

    public double getCalories() {
        return new BigDecimal(calories).setScale(2, RoundingMode.HALF_UP).doubleValue();
    }
    
    public double getCarbohydrates() {
        return new BigDecimal(carbohydrates).setScale(2, RoundingMode.HALF_UP).doubleValue();
    }

    public double getProteins() {
        return new BigDecimal(proteins).setScale(2, RoundingMode.HALF_UP).doubleValue();
    }
        
    public double getFats() {
        return new BigDecimal(fats).setScale(2, RoundingMode.HALF_UP).doubleValue();
    }

}
