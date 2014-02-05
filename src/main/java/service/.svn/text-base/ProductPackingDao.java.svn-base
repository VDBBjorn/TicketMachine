/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import domain.Customer;
import domain.ProductPacking;
import java.util.List;

/**
 *
 * @author Kenneth
 */
public interface ProductPackingDao extends GenericDao<ProductPacking> {
    
    public List<ProductPacking> getProducts(String searchtext);
    public List<ProductPacking> getProductsByCategoryId(int categoryId);
    public ProductPacking getProduct(int productId);

    public List<ProductPacking> getFavoriteProducts(Customer customer);
    public List<ProductPacking> getProductsByStore(Long storeId,String searchText);
    
}
