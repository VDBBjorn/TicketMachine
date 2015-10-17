package domain;

import javax.persistence.CascadeType;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

@Entity
@DiscriminatorValue("category")
public class CategorySavingsCard extends LoyaltyCard {
    
    private int points;
    private int pointsToSave;
    
    @OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinColumn(name = "categoryId")
    private Category category;

    public Category getCategory() {
        return category;
    }

    public int getPointsLeftToSave() {
        return pointsToSave-points;
    }
    
    public int getPoints() {
        return points;
    }
    
    public int getPointsToSave() {
        return pointsToSave;
    }
       
    @Override
    public String getType() {
        return "categorySavingsCard";
    }

}
