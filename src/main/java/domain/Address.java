package domain;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
public class Address implements Serializable{

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)       
    @Column(nullable = false)
    private Long addressId;

    @NotEmpty
    @Column(nullable = false)
    private String street;

    @NotNull
    @Column(nullable = false)
    private String houseNumber;

    @Max(9999)
    @Min(1000)
    @NotNull()
    @Column(nullable = false)
    private int postalCode;
    
    @NotEmpty
    @Column(nullable = false)
    private String city;
    
    @NotEmpty
    @Column(nullable = false)
    private String country;

    public Long getId() {
        return addressId;
    }

    public void setId(Long id) {
        this.addressId = id;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getHouseNumber() {
        return houseNumber;
    }

    public void setHouseNumber(String houseNumber) {
        this.houseNumber = houseNumber;
    }

    public int getPostalCode() {
        return postalCode;
    }

    public void setPostalCode(int postalCode) {
        this.postalCode = postalCode;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

        
        
}