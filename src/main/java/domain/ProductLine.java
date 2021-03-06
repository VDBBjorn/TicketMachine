package domain;

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.RoundingMode;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

@Entity
public class ProductLine implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private int amount;
    
    private double totalPrice;
    
    @OneToOne()
    @JoinColumn(name = "productId")
    protected ProductPacking product;
    
    
    @ManyToOne(optional = false)
    @JoinColumn(name = "receiptId")
    private Receipt receipt;
    
    public String getDate() {
        return receipt.getDate();
    }
    
    public double getCalories(){
        return new BigDecimal(amount*product.getCalories()).setScale(2, RoundingMode.HALF_UP).doubleValue();
    }
    
    public double getCarbohydrates() {
        return new BigDecimal(amount*product.getCarbohydrates()).setScale(2, RoundingMode.HALF_UP).doubleValue();
    }
    
    public double getProteins(){
        return new BigDecimal(amount*product.getProteins()).setScale(2, RoundingMode.HALF_UP).doubleValue();
    }
    
    public double getFats(){
        return new BigDecimal(amount*product.getFats()).setScale(2, RoundingMode.HALF_UP).doubleValue();
    }
        
    
    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }
    
    public double getTotalPrice() {
        //return totalPrice;
        return new BigDecimal(totalPrice).setScale(2, RoundingMode.HALF_UP).doubleValue();
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }
    
    public ProductPacking getProduct() {
        return product;
    }
    
    public long getPackingId(){
        return product.getPackingId();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
  
}