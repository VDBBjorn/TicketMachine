package service;

import domain.Address;
import domain.Customer;

/**
 *
 * @author Bjorn
 */
public interface CustomerDao extends GenericDao<Customer>{
    
    public Customer getCustomer(long customerId);
    public void saveAddress(Customer customer, Address address);
    
}
