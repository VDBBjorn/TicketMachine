/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package service;


import domain.Category;
import java.util.List;

/**
 *
 * @author Kenneth
 */
public interface CategoryDao extends GenericDao<Category> {
    public List<Category> getAllCategories();
}
