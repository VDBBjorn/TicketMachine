package service;

import domain.Customer;
import domain.Receipt;
import java.util.List;
import javax.persistence.Query;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Bjorn
 */
@Repository("receipt")
public class JpaReceiptDao extends GenericDaoJpa<Receipt> implements ReceiptDao {

    public JpaReceiptDao() {
        super(Receipt.class);
    }

    @Override
    public List<Receipt> getReceipts(Customer customer) {
        Query q = em.createQuery("SELECT r FROM Receipt r WHERE r.customer = :customer ");
        q.setParameter("customer", customer);
        return q.getResultList();
    }
    
}
