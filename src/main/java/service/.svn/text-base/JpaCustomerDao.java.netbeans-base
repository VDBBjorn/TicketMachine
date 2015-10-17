package service;

import domain.Address;
import domain.Customer;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Bjorn
 */
@Repository("customer")
public class JpaCustomerDao extends GenericDaoJpa<Customer> implements CustomerDao {

    public JpaCustomerDao() {
        super(Customer.class );
    }
    
    @Override
    @Transactional(readOnly=true)
    public Customer getCustomer(long customerId) {
        return this.get(customerId); 
    }

    @Override
    public void saveAddress(Customer customer, Address address) {
        if (customer.getAddress() != address) {
            customer.setAddress(address);
            em.merge(customer);
        }

        
    }
    
}
