package domain;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.GregorianCalendar;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

@Entity
public class Voucher implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long voucherId;
    private String barcode;
    
    @Enumerated(EnumType.STRING)
    private VoucherType voucherType;
    
    private double initialValue;
    private double remainingValue;
    private GregorianCalendar expiryDate;
    private GregorianCalendar creationDate;
    
    @OneToOne(optional = true)
    private Customer customer;
    
    @OneToOne
    private Store store;

    public long getVoucherId() {
        return voucherId;
    }

    public String getBarcode() {
        return barcode;
    }

    public VoucherType getVoucherType() {
        return voucherType;
    }

    public double getInitialValue() {
        return initialValue;
    }

    public double getRemainingValue() {
        return remainingValue;
    }

    public String getExpiryDate() {
        return format(expiryDate);
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
    
    public static String format(GregorianCalendar calendar) {
        SimpleDateFormat fmt = new SimpleDateFormat("dd-MM-yyyy");
        fmt.setCalendar(calendar);
        String dateFormatted = fmt.format(calendar.getTime());
        return dateFormatted;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public int getDaysToExpire() {
        GregorianCalendar today = new GregorianCalendar();
        long diff=expiryDate.getTimeInMillis()-today.getTimeInMillis();
        int days=(int) (diff/(1000*60*60*24)); 
        return days+1; 
    }

}
