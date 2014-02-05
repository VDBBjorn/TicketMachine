package domain;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 *
 * @author Kenneth
 */
@Entity
public class Promotion implements Serializable{
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) 
    private int promotionId;
    
    private String promotionDescription;

    public int getPromotionId() {
        return promotionId;
    }

    public String getPromotionDescription() {
        return promotionDescription;
    }
    
    
    
    
}
