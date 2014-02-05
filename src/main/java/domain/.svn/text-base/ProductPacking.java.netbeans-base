package domain;

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

@Entity
public class ProductPacking implements Serializable{

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO) 
    private int packingId;
    private String description;
    private double amount;
    private String unit;
    
    @OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinColumn(name = "productId")
    private Product product;
    
    private String pictureUrl;
    
    @LazyCollection(LazyCollectionOption.FALSE)
    @ManyToMany(cascade = CascadeType.PERSIST)
    private List<Promotion> promotions;

    public String getBrand() {
        return product.getBrand();
    }
    
    public long getProductId(){
        return product.getProductId();
    }
    
    public String getPictureUrl() {
        return pictureUrl;
    }

    public void setPictureUrl(String pictureUrl) {
        this.pictureUrl = pictureUrl;
    }

    public int getPackingId() {
        return packingId;
    }

    public String getName() {
        return product.getName() + " (" + this.getAmountWithUnit() + ")";
    }

    public String getDescription() {
        return description;
    }

    public double getUnitPrice() {
        return new BigDecimal((amount/1000)*product.getUnitPrice()).setScale(2, RoundingMode.HALF_UP).doubleValue();
    }

    public double getAmount() {
        return amount;
    }
    
    public String getVatCode() {
        return product.getVatCode();
    }

    public Category getCategory() {
        return product.getCategory();
    }

    public List<Promotion> getPromotions() {
        return promotions;
    }

    public Product getProduct() {
        return product;
    }
    
    

    public double getCalories() {
        return new BigDecimal((amount/100)*product.getCalories()).setScale(2, RoundingMode.HALF_UP).doubleValue();
    }
    
    public double getCarbohydrates() {
        return new BigDecimal((amount/100)*product.getCarbohydrates()).setScale(2, RoundingMode.HALF_UP).doubleValue();
    }

    public double getProteins() {
        return new BigDecimal((amount/100)*product.getProteins()).setScale(2, RoundingMode.HALF_UP).doubleValue();
    }
        
    public double getFats() {
        return new BigDecimal((amount/100)*product.getFats()).setScale(2, RoundingMode.HALF_UP).doubleValue();
    }

    private String getAmountWithUnit() {
        StringBuilder sb = new StringBuilder();
        switch(unit){
            case "g": 
                if(amount>=1000){
                    double a=amount/1000;
                    sb.append(a).append(" kg");
                } else {
                    sb.append(amount).append(" g");
                }
                break;     
            case "ml":
                if(amount>=1000){
                    double a=amount/1000;
                    sb.append(a).append(" l");
                } else {
                    double a=amount/10;
                    sb.append(a).append(" cl");
                }
                break;
        }
        return sb.toString();
    }

}
