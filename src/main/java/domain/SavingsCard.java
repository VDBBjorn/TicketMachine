package domain;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

@Entity
@DiscriminatorValue("general")
public class SavingsCard extends LoyaltyCard {
 
    private double savingPercentage;

    public double getSavingPercentage() {
        return savingPercentage;
    }
    
    @Override
    public String getType() {
        return "generalSavingsCard";
    }
       
}