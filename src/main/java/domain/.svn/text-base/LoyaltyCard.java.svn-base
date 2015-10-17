package domain;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.GregorianCalendar;
import javax.persistence.Column;
import javax.persistence.DiscriminatorColumn;
import javax.persistence.DiscriminatorType;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Inheritance(strategy=InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name="type",discriminatorType=DiscriminatorType.STRING)
@DiscriminatorValue("LoyaltyCard")
@Table(name = "loyaltyCard")
public abstract class LoyaltyCard implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(nullable = false)
    private Long cardId;
    private int barcode;
    private GregorianCalendar expiryDate;
    private GregorianCalendar creationDate;
    @Column(columnDefinition = "varchar(1000)")
    private String Comments;

    
    
    @OneToOne
    private Customer customer;
    
    @OneToOne
    private Store store;

    public Long getCardId() {
        return cardId;
    }

    public int getBarcode() {
        return barcode;
    }

    public GregorianCalendar getExpiryDate() {
        return expiryDate;
    }

    public GregorianCalendar getCreationDate() {
        return creationDate;
    }

    public Customer getCustomer() {
        return customer;
    }

    public Store getStore() {
        return store;
    }
    
    public String getComments() {
        return Comments;
    }
    
    public abstract String getType();
    
    public String getExpiryDateText()
    {
        SimpleDateFormat fmt = new SimpleDateFormat("dd-MM-yyyy");
        fmt.setCalendar(expiryDate);
        return fmt.format(expiryDate.getTime());
    }
    
    public String getCreationDateText()
    {
        SimpleDateFormat fmt = new SimpleDateFormat("dd-MM-yyyy");
        fmt.setCalendar(creationDate);
        return fmt.format(creationDate.getTime());
    }
}
