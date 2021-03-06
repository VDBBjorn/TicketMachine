/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import domain.Customer;
import domain.ProductPacking;
import java.util.List;
import javax.persistence.Query;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Kenneth
 */
@Repository("productPacking")
public class JpaProductPackingDao extends GenericDaoJpa<ProductPacking> implements ProductPackingDao {

    public JpaProductPackingDao() {
        super(ProductPacking.class);
    }

    @Override
    public List<ProductPacking> getProducts(String searchtext) {
        Query q = em.createQuery("Select p from ProductPacking p where p.description like :searchtext");
        q.setParameter("searchtext", '%' + searchtext + '%');
        return q.getResultList();
    }

    @Override
    public List<ProductPacking> getProductsByCategoryId(int categoryId) {
        Query q = em.createQuery("Select p from ProductPacking p where p.product.category.categoryId = :categoryId ");
        q.setParameter("categoryId", categoryId);
        return q.getResultList();
    }

    @Override
    public ProductPacking getProduct(int productId) {
        Query q = em.createQuery("Select p from ProductPacking p where p.product.productId = :productId ");
        q.setParameter("productId", productId);
        return (ProductPacking) q.getSingleResult();
    }

    @Override
    public List<ProductPacking> getFavoriteProducts(Customer customer) {
        Query q = em.createQuery("select pp from ProductPacking pp "
                + "where pp.product in (select pl.product "
                + "from Receipt r "
                + "inner join r.productLines pl "
                + "where r.customer = :customer "
                + ")").setMaxResults(10);
        q.setParameter("customer", customer);
        return q.getResultList();
    }

     @Override
    public List<ProductPacking> getProductsByStore (Long storeId,String searchText) {
        Query q = em.createQuery("select pp "
                + "from Store s "
                + "inner join s.products pp "
                + "inner join pp.product p "
                + "where s.id= :storeId and (pp.description like :searchText "
                + "or p.name like :searchText) "
                + "order by pp.product.category ");
        q.setParameter("storeId", storeId);
        q.setParameter("searchText", '%' + searchText + '%');
        return q.getResultList();
    }
}
