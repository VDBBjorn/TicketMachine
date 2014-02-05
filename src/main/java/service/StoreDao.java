/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import domain.ProductPacking;
import domain.Store;
import java.util.List;

/**
 *
 * @author Kenneth
 */
public interface StoreDao extends GenericDao<Store> {
    public List<Store> getStores();
   
}
