package domain;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

@Entity
public class ShoppingList implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;
    
    /*
    @ManyToOne(optional = false)
    @JoinColumn(name = "customer_id")
    protected Customer customer;
    */
    
    @LazyCollection(LazyCollectionOption.FALSE)
    @ManyToMany(cascade = CascadeType.PERSIST/*, fetch = FetchType.EAGER*/)
    private List<ProductPacking> products;

    public ShoppingList() {
        this.products = new ArrayList<>();
    }


    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public List<ProductPacking> getProducts() {
        return products;
    }

    public void setProducts(List<ProductPacking> products) {
        this.products = products;
    }

    public void addProduct(ProductPacking product) {
        products.add(product);
    }

    public void removeProduct(int id) {
        ProductPacking prod = findProductById(id);
        if (prod != null) {
            products.remove(prod);
        }
    }

    public ProductPacking findProductById(int id) {
        for (ProductPacking p : products) {
            if (p.getPackingId() == id) {
                return p;
            }
        }
        return null;
    }

    public void removeAll() {
        products.clear();
    }
}