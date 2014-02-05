package service;

import domain.Customer;
import domain.Voucher;
import java.util.List;
import javax.persistence.NoResultException;
import javax.persistence.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.TransactionSystemException;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Bjorn
 */
@Repository("voucher")
public class JpaVoucherDao extends GenericDaoJpa<Voucher> implements VoucherDao {

    public JpaVoucherDao() {
        super(Voucher.class);
    }

    @Override
    public List<Voucher> getVouchers(Customer customer) {
        Query q = em.createQuery("SELECT v FROM Voucher v WHERE v.customer = :customer ");
        q.setParameter("customer", customer);
        return q.getResultList();
    }

    @Override
    @Transactional(readOnly = true)
    public Voucher getVoucherByBarcode(String barcode) {
        try {
            Query q = em.createQuery("SELECT v FROM Voucher v WHERE v.barcode = :barcode AND customer=null");
            q.setParameter("barcode", barcode);
            return (Voucher) q.getSingleResult();
        } catch (NoResultException e) {
            return null;
        }  
    }
    
    
}