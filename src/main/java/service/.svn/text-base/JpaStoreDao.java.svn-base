/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import domain.ProductPacking;
import domain.Store;
import domain.Voucher;
import java.util.List;
import javax.persistence.NoResultException;
import javax.persistence.Query;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Snip
 */
@Repository("store")
public class JpaStoreDao extends GenericDaoJpa<Store> implements StoreDao {

    public JpaStoreDao() {
        super(Store.class);
    }

    @Override
    public List<Store> getStores() {
        Query q = em.createQuery("SELECT s FROM Store s");
        return q.getResultList();
    }

   

}
