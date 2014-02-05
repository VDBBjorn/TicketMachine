package domain;

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.SimpleDateFormat;
import java.util.GregorianCalendar;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Receipt implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO) 
    private long ticketId;
    private int barcode;
    private GregorianCalendar date;
    private String cashDesk;
    private String operator;

    @ManyToOne(optional = false)
    @JoinColumn(name = "customer_id")
    protected Customer customer;

    @OneToOne
    private Store store;

    @OneToMany(fetch = FetchType.EAGER)
    @JoinColumn(name = "receiptId")
    //@OneToMany(mappedBy = "ProductLine")
    private List<ProductLine> productLines;

    public long getTicketId() {
        return ticketId;
    }

    public void setTicketId(long ticketId) {
        this.ticketId = ticketId;
    }

    public int getBarcode() {
        return barcode;
    }

    public void setBarcode(int barcode) {
        this.barcode = barcode;
    }
    
    public double getTotalPrice() {
        double total = 0;
        for(ProductLine line : productLines) {
            total += line.getTotalPrice();
        }
        return new BigDecimal(total).setScale(2, RoundingMode.HALF_UP).doubleValue();
    }
    
    public String getDateTime() {
        return formatDateTime(date);
    }
    
    public String getDate() {
        return format(date);
    }   
    
    public GregorianCalendar getRealDate() {
        return date;
    }
    
    public GregorianCalendar getDateCalendar() {
        return date;
    }

    public static String format(GregorianCalendar calendar) {
        SimpleDateFormat fmt = new SimpleDateFormat("dd-MM-yyyy");
        fmt.setCalendar(calendar);
        String dateFormatted = fmt.format(calendar.getTime());
        return dateFormatted;
    }
    
    public static String formatDateTime(GregorianCalendar calendar) {
        SimpleDateFormat fmt = new SimpleDateFormat("dd-MM-yyyy, HH:mm:ss");
        fmt.setCalendar(calendar);
        String dateFormatted = fmt.format(calendar.getTime());
        return dateFormatted;
    }

    public void setDate(GregorianCalendar date) {
        this.date = date;
    }

    public String getCashDesk() {
        return cashDesk;
    }

    public void setCashDesk(String cashDesk) {
        this.cashDesk = cashDesk;
    }

    public String getOperator() {
        return operator;
    }

    public void setOperator(String operator) {
        this.operator = operator;
    }

    public Store getStore() {
        return store;
    }

    public void setStore(Store store) {
        this.store = store;
    }

    public List<ProductLine> getProductLines() {
        return productLines;
    }

    public void setProductLines(List<ProductLine> productLines) {
        this.productLines = productLines;
    }

    public Customer getCustomer() {
        return customer;
    }

}

